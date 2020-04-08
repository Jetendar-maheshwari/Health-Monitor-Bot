<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'report_model',
			'doctor_model',
			'representative_model',
		));
 
		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1) 
			redirect('login'); 
		
	}

	public function assign_to_all_doctor()
	{   
		$data['title'] = display('appointment_assign_to_all_doctor');
		#-------------------------------#
		$data['user'] = (object)$getData = [
			'start_date' => $this->input->get('start_date',true),
			'end_date'	 => $this->input->get('end_date',true),	
			'user_id'	 => $this->input->get('user_id',true)
		];
		#-------------------------------#
    	$data['user_list'] = $this->doctor_model->doctor_list();
    	$data['appointments'] = $this->report_model->assign_to_user($getData);
		$data['content'] = $this->load->view('report_assign_to_all_doctor',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}

}
