<!-- Just craeted for questions -->
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

    class Question extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'question_model',
            'option_model'
		));
		
		if ($this->session->userdata('isLogIn') == false 
			|| $this->session->userdata('user_role') != 1 
		) 
		redirect('login'); 

	}


	public function index($num)
	{
		$data['title'] = display('question_list');
		#-------------------------------#
		$data['questions'] = $this->question_model->read($num);
        $data['symptId'] = $num;
		$data['content'] = $this->load->view('question',$data,true);

		$this->load->view('layout/main_wrapper',$data);
	} 

 	public function create($sym_id)
	{
	    $data['symptId'] = $sym_id;
		$data['title'] = display('add_question');
		#-------------------------------#
		$this->form_validation->set_rules('ques_detail', display('ques_detail') ,'required|max_length[1000]');

		#-------------------------------#
		$data['question'] = (object)$postData = [
			'ques_id' 	  => $this->input->post('ques_id',true),
			'ques_detail'  => $this->input->post('ques_detail',true) ,
            'sym_id' => $sym_id
		];
		#-------------------------------#
		if ($this->form_validation->run() === true) {

			#if empty $depart_id then insert data
			if (empty($postData['ques_id'])) {
                $result = $this->question_model->create($postData);
				if ($result != null) {

                $length = $this->input->post('length',true);

                $options = null;
                for ($i = 0 ; $i < $length ; $i++){
                    $options[] = [
                        'opt_descr' => $this->input->post('option'.$i),
                        'opt_score'  => $this->input->post('to'.$i),
                        'ques_id' => $result
                    ];
                }

                // Save Ranges
                if($options != null){
                    $this->option_model->createBatch($options);
                }

					#set success message
					$this->session->set_flashdata('message', display('save_successfully'));
				} else {
					#set exception message
					$this->session->set_flashdata('exception',display('please_try_again'));
				}

			} else {
				if ($this->question_model->update($postData)) {
                    $updateRecords = null;
                    $insertRecords = null;
                    $length = $this->input->post('length',true);
                    for ($i = 0 ; $i < $length ; $i++){
                        if($this->input->post('option_id'.$i)){
                            $updateRecords[] = array(
                                'opt_id' => $this->input->post('option_id'.$i),
                                'ques_id' => $postData['ques_id'],
                                'opt_descr' => $this->input->post('option'.$i),
                                'opt_score' => $this->input->post('to'.$i)
                            );
                        } else {
                            $insertRecords[] = array(
                                'ques_id' => $postData['ques_id'],
                                'opt_descr' => $this->input->post('option'.$i),
                                'opt_score' => $this->input->post('to'.$i)
                            );
                        }
                    }

                    if($updateRecords != null && count($updateRecords) > 0){
                        $this->option_model->updateBatch($updateRecords);
                    }

                    if ($insertRecords != null && count($insertRecords) > 0){
                        $this->option_model->createBatch($insertRecords);
                    }

					#set success message
					$this->session->set_flashdata('message', display('update_successfully'));
				} else {
					#set exception message
					$this->session->set_flashdata('exception',display('please_try_again'));
				}
			}

            redirect('symptoms/'.$sym_id.'/questions');

		} else {
			$data['content'] = $this->load->view('question_form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		}
	}

	public function edit($sym_id, $ques_id)
	{
        $data['symptId'] = $sym_id;
        $data['ques_id'] = $ques_id;
		$data['title'] = display('question_edit');
        $result = $this->question_model->read_by_id($ques_id);
		$data['content'] = $this->load->view('question_form',$data,true);
        $data['question'] = $result[0];
        $data['options'] = $result[1];
        $data['content'] = $this->load->view('question_form',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}
 

	public function delete($sym_id, $ques_id)
	{
		if ($this->question_model->delete($sym_id, $ques_id)) {
			#set success message
			$this->session->set_flashdata('message', display('delete_successfully'));
		} else {
			#set exception message
			$this->session->set_flashdata('exception', display('please_try_again'));
		}
		redirect('symptoms/'.$sym_id.'/questions');
	}
  
}
