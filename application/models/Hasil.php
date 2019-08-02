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

	function kuota($id_kuota,$id_operator){
		$this->db->where('kuota.id_kuota',$id_kuota);
		$this->db->where('detail_operator.id_operator',$id_operator);
		$this->db->join('kuota','kuota.id_kuota=detail_operator.id_kuota');
		$getData = $this->db->get('detail_operator')->row();

		if($getData){

			$hasil = $getData->jml_kuota;
		}else{
			$hasil = "-";
		}
		return $hasil;
	}

	function keterangan($id_kuota,$id_operator){
		$this->db->where('kuota.id_kuota',$id_kuota);
		$this->db->where('detail_operator.id_operator',$id_operator);
		$this->db->join('kuota','kuota.id_kuota=detail_operator.id_kuota');
		$getData = $this->db->get('detail_operator')->row();

		if($getData){

			$hasil = $getData->ket_operator;
		}else{
			$hasil = "-";
		}
		return $hasil;
	}

	function harga($id_kuota,$id_operator){
		$this->db->where('kuota.id_kuota',$id_kuota);
		$this->db->where('detail_operator.id_operator',$id_operator);
		$this->db->join('kuota','kuota.id_kuota=detail_operator.id_kuota');
		$getData = $this->db->get('detail_operator')->row();

		if($getData){

			$hasil = $getData->harga;
		}else{
			$hasil = "-";
		}
		return $hasil;
	}

}