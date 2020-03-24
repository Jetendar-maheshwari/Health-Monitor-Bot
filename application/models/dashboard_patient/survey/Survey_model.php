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

	public function saveorupdateSurvey($userId , $data){
        $symId = $data['sym_id'];

     /*   var_dump($data);
         var_dump($data['sym_id']);

        $this->db->select('*');
        $this->db->from('question');
        $this->db->where('sym_id', $symId);
        $qResult  = $this->db->get()->result();
        foreach ($qResult as $item){
            var_dump($data['questionId_'. $item->ques_id]);
                var_dump($data['questionId_'. $item->ques_id].str_split('_'));

        }
        die;*/

        $dt = new DateTime();
        $this->db->set('sym_id', $symId);
        $this->db->set('patient_id', $userId);
        $this->db->set('filled_date', $dt->format('Y-m-d H:i:s'));
        $this->db->insert('patient_survey');


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
				patient_survey.*,
				symptoms.name As Sym_name
			FROM 
				patient_survey
			INNER JOIN 
				symptoms ON symptoms.sym_id = patient_survey.sym_id
			
			WHERE 
				patient_survey.patient_id = $id
			
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



	public function delete($id = null)
	{
		return $this->db->where('id', $id)
			->delete($this->table);
	}

}

