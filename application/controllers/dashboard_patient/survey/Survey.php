<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Survey extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'dashboard_patient/survey/survey_model',
            'symptoms_model'
		));
	}

	public function index()
	{ 
		$data['title'] = display('survey_list');
		$data['surveys'] = $this->survey_model->read($this->session->userdata('user_id'));
		$data['content'] = $this->load->view('dashboard_patient/survey/survey', $data, true);
		$this->load->view('dashboard_patient/main_wrapper',$data);
	} 

    public function form()
    {
        $data['title'] = display('add_document');

        /*----------VALIDATION RULES----------*/
        $this->form_validation->set_rules('description', display('description'),'trim');
        $this->form_validation->set_rules('hidden_attach_file', display('attach_file'),'required|max_length[255]');

        /*-------------STORE DATA------------*/
        $urole = $this->session->userdata('user_role');
        $data['survey'] = (object)$postData = array(
            'sym_id'  => $this->session->userdata('sym_id')
        );

        /*-----------CREATE A NEW RECORD-----------*/
        if ($this->form_validation->run() === true) { 
 
            if ($this->document_model->create($postData)) {
                #set success message
                $this->session->set_flashdata('message', display('save_successfully'));
            } else {
                #set exception message
                $this->session->set_flashdata('exception',display('please_try_again'));
            }
            redirect('dashboard_patient/survey/survey/form');
        } else {
            $data['symptoms_list'] = $this->survey_model->symptoms_list();

            $data['content'] = $this->load->view('dashboard_patient/survey/form',$data,true);
            $this->load->view('dashboard_patient/main_wrapper',$data);
        }  
    }

    public function submitSurvey(){
        $points = $_POST['total_score'];
        $data = null;

        $range_object = null;
        // Range logic
        $ranges = $this->symptoms_model->read_by_sym_id($_POST['sym_id']);
        foreach ($ranges as $range) {
            if($points >= $range->range_from && $points <= $range->range_to){
                $range_object = $range;
            }
        }

        $data['sym_id'] =  $_POST['sym_id'];
        $userId = $this->session->userdata('user_id');
        $data['patient_id'] = $userId;
        $data['range_id'] = $range_object->range_id;
        $data['filled_date'] = Date('Y-m-d');
        $data['total_score'] = $_POST['total_score'];
        $data['remarks'] = $range_object->remarks;
        $this->survey_model->create($data);

        $this->session->set_flashdata('message', display('save_successfully'));
        redirect('dashboard_patient/survey/survey/form');

    }

    public function getSymptomsDetail(){
        $sym_id = $this->input->get('sympId');
        $response = $this->survey_model->symptoms_detail($sym_id);
        echo json_encode($response);
    }

    public function delete($id = null)
    {
    	if ($this->document_model->delete($id)) {

	    	$file = $this->input->get('file');
	    	if (file_exists($file)) {
	    		@unlink($file);
	    	}
    		$this->session->set_flashdata('message', display('save_successfully'));

    	} else {
    		$this->session->set_flashdata('exception', display('please_try_again'));
    	}

    	redirect($_SERVER['HTTP_REFERER']);
    }

}