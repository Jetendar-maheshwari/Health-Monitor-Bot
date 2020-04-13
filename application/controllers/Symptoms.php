<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Symptoms extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->model(array(
			'symptoms_model',
            'ranges_model'
		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1
		)
		redirect('login');

	}

	public function index()
	{
		$data['title'] = display('symptoms_list');
		#-------------------------------#
		$data['symptoms'] = $this->symptoms_model->read();

		$data['content'] = $this->load->view('symptoms',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}

 	public function create()
	{
		$data['title'] = display('add_symptoms');

		#-------------------------------#
		$this->form_validation->set_rules('name', display('name') ,'required|max_length[100]');
		$this->form_validation->set_rules('description', display('description'),'trim');
		//$this->form_validation->set_rules('status', display('status') ,'required');
		#-------------------------------#
		$data['symptoms'] = (object)$postData = [
			'sym_id' 	  => $this->input->post('sym_id',true),
			'name' 		  => $this->input->post('name',true),
			'description' => $this->input->post('description',true),
			'status'      => 1
		];

		#-------------------------------#
		if ($this->form_validation->run() === true) {
			#if empty $dprt_id then insert data
			if (empty($postData['sym_id'])) {
                $result = $this->symptoms_model->create($postData);
				if ($result != null) {

                    $length = $this->input->post('length',true);
                    $ranges = null;
                    for ($i = 0 ; $i < $length ; $i++){
                        $ranges[] = [
                            'range_from' => $this->input->post('from'.$i),
                            'range_to'  => $this->input->post('to'.$i),
                            'remarks' =>$this->input->post('remarks'.$i),
                            'symptoms_id' => $result
                        ];
                    }

				    // Save Ranges
                    if($ranges != null){
                        $this->ranges_model->createBatch($ranges);
                    }
					$this->session->set_flashdata('message', display('save_successfully'));
				}
				else {
					#set exception message
					$this->session->set_flashdata('exception',display('please_try_again'));
				}
				redirect('symptoms/create');
			} else {
				if ($this->symptoms_model->update($postData)) {
				    #set success message
                    $updateRecords = null;
                    $insertRecords = null;
                    $length = $this->input->post('length',true);
                    for ($i = 0 ; $i < $length ; $i++){
                        if($this->input->post('range_id'.$i)){
                            $updateRecords[] = array(
                                'range_id' => $this->input->post('range_id'.$i),
                                'range_from' => $this->input->post('from'.$i),
                                'range_to'  => $this->input->post('to'.$i),
                                'remarks' =>$this->input->post('remarks'.$i),
                                'symptoms_id' =>$this->input->post('symptoms_id'.$i),
                            );


                        } else {
                            $insertRecords[] = array(
                                'range_from' => $this->input->post('from'.$i),
                                'range_to'  => $this->input->post('to'.$i),
                                'remarks' =>$this->input->post('remarks'.$i),
                                'symptoms_id' =>$this->input->post('symptoms_id'.$i),
                            );
                        }
                    }



                    if($updateRecords != null && count($updateRecords) > 0){
                        $this->ranges_model->updateBatch($updateRecords);
                    }

                    if ($insertRecords != null && count($insertRecords) > 0){
                        $this->ranges_model->createBatch($insertRecords);
                    }

					$this->session->set_flashdata('message', display('update_successfully'));
				} else {
					#set exception message
					$this->session->set_flashdata('exception',display('please_try_again'));
				}
				redirect('symptoms/edit/'.$postData['sym_id']);
			}

		} else {
			$data['content'] = $this->load->view('symptoms_form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		}
	}

	public function edit($sym_id = null)
	{
		$data['title'] = display('symptoms_edit');
		#-------------------------------#
        $result = $this->symptoms_model->read_by_id($sym_id);
		$data['symptoms'] = $result[0];
        $data['ranges'] = $result[1];

		$data['content'] = $this->load->view('symptoms_form',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}


	public function delete($sym_id = null)
	{
		if ($this->symptoms_model->delete($sym_id)) {
			#set success message
			$this->session->set_flashdata('message', display('delete_successfully'));
		} else {
			#set exception message
			$this->session->set_flashdata('exception', display('please_try_again'));
		}
		redirect('symptoms');
	}

}
