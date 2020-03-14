<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Question_model extends CI_Model {

	private $table = 'question';

	public function create($data = [])
	{	 
	    $this->db->insert($this->table,$data);
        return  $this->db->insert_id();

	}
 
	public function read($symid)
	{
		return $this->db->select("*")
			->from($this->table)
            ->where('sym_id', $symid)
			->order_by('ques_id','desc')
			->get()
			->result();
	} 
 
	public function read_by_id($ques_id = null)
	{
        $question = $this->db->select("*")
			->from($this->table)
			->where('ques_id',$ques_id)
			->get()
			->row();

        $option = $this->db->select("*")
            ->from('opttion')
            ->where('ques_id',$ques_id)
            ->get()->result();
        return array($question, $option);

	} 
 
	public function update($data = [])
	{
		return $this->db->where('ques_id',$data['ques_id'])
			->update($this->table,$data); 
	} 
 
	public function delete($sym_id = null, $ques_id = null)
	{
		$this->db->where('ques_id',$ques_id)->where('sym_id', $sym_id)->delete($this->table);
		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}
	} 

	public function question_list()
	{
		$result = $this->db->select("*")
			->from($this->table)
			->where('status',1)
			->get()
			->result();

		$list[''] = display('select_question');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->ques_id] = $value->ques_detail;
			}
			return $list;
		} else {
			return false;
		}
	}
	
 }
