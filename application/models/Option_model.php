<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Option_model extends CI_Model {

	private $table = 'opttion';

	public function createBatch($data = [])
	{	 
		return $this->db->insert_batch($this->table,$data);
	}

    public function updateBatch($data = [])
    {
        $this->db->trans_start();
        $this->db->update_batch('opttion',$data, 'opt_id');
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

	public function deleteAllBySympId($id){
        $this->db->where('symptoms_id',$id)->delete($this->table);
        if ($this->db->affected_rows()) {
            return true;
        } else {
            return false;
        }
    }

	// TODO update
	public function read()
	{
		return $this->db->select("*")
			->from($this->table)
			->order_by('sym_id','desc')
			->get()
			->result();
	} 
 
	public function read_by_id($sym_id = null)
	{
		return $this->db->select("*")
			->from($this->table)
			->where('sym_id',$sym_id)
			->get()
			->row();
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

		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}
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
