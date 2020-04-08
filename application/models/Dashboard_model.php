<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_model extends CI_Model {

	private $table = "user";
 
	public function check_user($data = [])
	{


		return  $this->db->select("*")
			->from($this->table)
			->where('email',$data['email'])
			->where('password',$data['password'])
			->where('user_role',$data['user_role'])
            ->where('status',1)
			->get();
    }
 
	public function check_patient($data = [])
	{
		return $this->db->select("*")
			->from("patient")
			->where('email',$data['email'])
			->where('password',$data['password'])
			->where('status',1)
			->get();
	}  

	public function read_by_id($user_id = null)
	{
		return $this->db->select("user.*, department.name AS department")
			->from('user')
			->join('department', 'department.dprt_id = user.department_id', 'left')
			->where('user.user_id',$user_id)
			->get()
			->row();
	} 

	public function profile($user_id = null)
	{
		return $this->db->select("*")
			->from("user") 
			->where('user_id', $user_id)
			->get()
			->row();
	} 

	public function notify()
	{
		return $this->db->query('
			SELECT COUNT(*) AS total_app,
				(SELECT COUNT(*) FROM patient) AS total_patient,
				(SELECT COUNT(*) FROM user WHERE user_role = 2) AS total_doctor,
				(SELECT COUNT(*) FROM patient_survey ) AS total_survey
			FROM appointment
		')
		->row();
	}

	public function surveys()
	{
		/*return $this->db->select('enquiry_id, name, email, enquiry')
			->from('enquiry')
			->limit(4)
			->order_by('checked','asc')
			->order_by('created_date','desc')
			->order_by('enquiry_id','desc')
			->get()
			->result();*/


        return $this->db->query("
			SELECT 
				patient_survey.*,
				symptoms.name As Sym_name,
				concat(patient.firstname, ' ' ,  patient.patient_id) AS Patient_name
			FROM 
				patient_survey
			INNER JOIN 
				symptoms ON symptoms.sym_id = patient_survey.sym_id
				
			INNER JOIN 
				patient ON patient.id = patient_survey.patient_id  
				
		    ORDER  BY patient_survey.survey_id DESC 
		    
		    
		    Limit 3
		      
			
			")
            ->result();
	}

 
	public function update($data = [])
	{
		return $this->db->where('user_id',$data['user_id'])
			->update("user" ,$data); 
	} 


	public function chart()
	{
        $query1 =  $this->db->query('
            SELECT  
                create_date AS date,
                EXTRACT(MONTH FROM create_date) AS month,
                COUNT(patient_id) AS patient
            FROM patient
            WHERE create_date >= DATE_SUB(NOW(),INTERVAL 1 YEAR)
            GROUP BY EXTRACT(YEAR_MONTH FROM create_date)
        ')
        ->result(); 

		$query2 = $this->db->query('
            SELECT 
                create_date AS date,
                EXTRACT(MONTH FROM create_date) AS month,
                COUNT(appointment_id) AS appointment
            FROM appointment
            WHERE create_date >= DATE_SUB(NOW(),INTERVAL 1 YEAR)
            GROUP BY EXTRACT(YEAR_MONTH FROM create_date)
        ')
        ->result(); 

        return [$query1,$query2]; 
	}

  
}
