<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Symptoms_model extends CI_Model {

	private $table = 'symptoms';

	public function create($data = [])
	{	 
		$this->db->insert($this->table,$data);
        return  $this->db->insert_id();
	}
 
	public function read()
	{
		return $this->db->select("*")
			->from($this->table)
			->order_by('sym_id','desc')
			->get()
			->result();
	}

    public function read_by_sym_id($sym_id = null)
    {
        $ranges = $this->db->select("*")
            ->from('sym_ranges')
            ->where('symptoms_id',$sym_id)
            ->get()->result();
        return $ranges;
    }
 
	public function read_by_id($sym_id = null)
	{
	    $sym = $this->db->select("*")
			->from($this->table)
			->where('sym_id',$sym_id)
			->get()
			->row();

	    $ranges = $this->db->select("*")
            ->from('sym_ranges')
            ->where('symptoms_id',$sym_id)
            ->get()->result();
	    return array($sym, $ranges);
	} 
 
	public function update($data = [])
	{
		return $this->db->where('sym_id',$data['sym_id'])
			->update($this->table,$data); 
	} 
 
	public function delete($sym_id = null)
	{
		$this->db->where('sym_id',$sym_id)
			->delete($this->table);
        //$instance = new Ranges_model();
        //$instance->deleteAllBySympId($sym_id);
        //$this->deletesurveyBySym($sym_id);
		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}

	}

	private function  deletesurveyBySym($sym_id){
        $this->db->where('sym_id',$sym_id)
            ->delete("patient_survey");
    }

	public function department_list()
	{
		$result = $this->db->select("*")
			->from($this->table)
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
	
 }
