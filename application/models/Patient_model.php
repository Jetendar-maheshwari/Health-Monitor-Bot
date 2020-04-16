<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Patient_model extends CI_Model {

	private $table = "patient";
 
	public function create($data = [])
	{	 
		return $this->db->insert($this->table,$data);
	}
 
	public function read()
	{
		return $this->db->select("*")
			->from($this->table)
			->order_by('id','desc')
			->get()
			->result();
	} 
 
	public function read_by_id($id = null)
	{
		return $this->db->select("*")
			->from($this->table)
			->where('id',$id)
			->get()
			->row();
	} 
 
	public function update($data = [])
	{
		return $this->db->where('id',$data['id'])
			->update($this->table,$data); 
	} 
 
	public function delete($id = null)
	{
		$this->db->where('id',$id)
			->delete($this->table);

		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}
	}

    public function survey()
    {
        return $this->db->query("
			SELECT 
				patient_survey.*,
				symptoms.name As Sym_name,
				concat(patient.firstname, ' ' ,  patient.patient_id)  AS Patient_name
				
			FROM 
				patient_survey
			INNER JOIN 
				symptoms ON symptoms.sym_id = patient_survey.sym_id
			INNER JOIN 
				patient ON patient.id = patient_survey.patient_id
			
		
			
			")
            ->result();
    }

    public function questionDetail($id = null){
        return $this->db->query("
			
			SELECT *, question.ques_detail as questionname , opttion.opt_descr as optionname 
			
			FROM  patient_survey_child
            Join question on question.ques_id =  patient_survey_child.ques_id
            join opttion on opttion.opt_id  = patient_survey_child.opt_id
            			
			WHERE 
				survey_id = $id
			
			")
            ->result();
    }

    public function surveyDetail($id = null)
    {
        return $this->db->query("
			SELECT 
				patient_survey.*,
				symptoms.name As Sym_name
			FROM 
				patient_survey
			INNER JOIN 
				symptoms ON symptoms.sym_id = patient_survey.sym_id
			
			WHERE 
				patient_survey.survey_id = $id
			
			")
            ->row();
    }

    public function updateSurveyStatus($data = [])
    {
        return $this->db->where('survey_id',$data['survey_id'])
            ->update("patient_survey",$data);
    }

    public function checkpreviousstatus($id){
        return $this->db->select("status")
            ->from($this->table)
            ->where('id',$id)
            ->get()
            ->row()->status;
    }


}
