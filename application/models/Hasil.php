<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
* 
*/
class Hasil extends CI_Model
{

	function operator($id_operator){
		$this->db->where('id_operator',$id_operator);
		$getData = $this->db->get('operator')->row();
		return $getData->nama_operator;
	}

}