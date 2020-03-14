<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Survey_model extends CI_Model {

	private $table = "patient_survey";
 
	public function create($data = [])
	{	 
		return $this->db->insert($this->table,$data);
	}
  
	public function symptoms_list()
	{
		$result = $this->db->select("*")
			->from("symptoms")
			->where('status',1)
			->get()
			->result();

		$list[''] = display('select_symptoms');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->sym_id] = $value->name;
			}
			return $list;
		} else {
			return false;
		}
	}

	public function symptoms_detail($symptId)
    {
        $symp = null;
        $questions = null;
        $result = null;

        $this->db->select('*');
        $this->db->from('symptoms');
        $this->db->where('sym_id', $symptId);
        $sResult  = $this->db->get()->row();

        $this->db->select('*');
        $this->db->from('sym_ranges');
        $this->db->where('symptoms_id', $symptId);
        $rangeResult  = $this->db->get()->result();
        $ranges = null;
        foreach ($rangeResult as $range){
            $ranges[] = array(
                'range_from'=> $range->range_from,
                'range_to' => $range->range_to,
                'remarks'=> $range->remarks
            );
        }

        $symp = array(
            'sym_id' => $sResult->sym_id,
            'name' => $sResult->name,
            'status'=> $sResult->status,
            'description' => $sResult->description,
            'ranges' => $ranges
        );

        $this->db->select('*');
        $this->db->from('question');
        $this->db->where('sym_id', $symptId);
        $qResult  = $this->db->get()->result();
        foreach ($qResult as $item){
            $this->db->select('*');
            $this->db->from('opttion');
            $this->db->where('ques_id', $item->ques_id);
            $oResult  = $this->db->get()->result();
            $options = null;
            foreach ($oResult as $o){
                $options[] = array(
                    'opt_id' => $o->opt_id,
                    'opt_descr' => $o->opt_descr,
                    'opt_score' => $o->opt_score,
                );
            }
            $questions[] = array(
                'ques_id' => $item->ques_id,
                'ques_detail' => $item->ques_detail,
                'options' => $options
            );
        }
        $symp['questions'] = $questions;
        $result = array('symptoms' => $symp);
        return $result;
    }


    public function read($id = null)
	{
		return $this->db->query("
			SELECT 
				document.*,
				CONCAT_WS(' ',u1.firstname, u1.lastname) AS doctor_name,
				IF (document.upload_by=0,'Patient',CONCAT_WS(' ',u2.firstname, u2.lastname)) AS upload_by
			FROM 
				document
			INNER JOIN 
				patient ON patient.patient_id = document.patient_id
			INNER JOIN 
				cm_patient ON cm_patient.patient_id = document.patient_id
			LEFT JOIN 
				user u1 ON u1.user_id = document.doctor_id
			LEFT JOIN 
				user u2 ON u2.user_id = document.upload_by
			WHERE 
				patient.id = $id
			GROUP BY 
				document.id
			")
			->result(); 
	} 

	public function delete($id = null)
	{
		return $this->db->where('id', $id)
			->delete($this->table);
	}

}

