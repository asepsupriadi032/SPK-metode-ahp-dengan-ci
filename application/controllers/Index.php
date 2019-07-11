<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Index extends CI_Controller {


	function __construct(){
		parent::__construct();
		$this->load->helper("evalmath.class");
		$this->load->helper('calculate');
	}

	public function index()
	{
		$data['kuisioner']=$this->db->get('kuisioner')->result();

		$data['kriteria'] = $this->db->get('kriteria')->result();

		$data['hasil'] = "";

		
		$this -> load -> view ('user/home',$data);
	}

	public function proses(){

		$data['kuisioner']=$this->db->get('kuisioner')->result();

		$data['kriteria'] = $this->db->get('kriteria')->result();
		$data['hasil'] =  $this->input->post('id_kriteria');

		$hasilKriteria = $this->hitungKriteria();
		// hasil langkah 2
		var_dump($hasilKriteria); exit();
		$this -> load -> view ('user/home',$data);
	}

	public function hitungKriteria(){
		$getKriteria = $this->db->get('kriteria');
		$countKriteria = $getKriteria->num_rows();
		$dataKriteria = $getKriteria->result();

		$no = 0;
		foreach ($dataKriteria as $key) {
			
			// for($j=1; $j<=$countKriteria; $j++){
				$nilaiBobotKriteria[$no] = $key->bobot;
			// }

			$no++;
		}

		//proses hasil desimal

		$hasilDesimal = [];
		for($m=0; $m < $countKriteria; $m++){
			for($n=0; $n < $countKriteria; $n++){
				$hasilDesimal[$m][$n] = $nilaiBobotKriteria[$m] / $nilaiBobotKriteria[$n]; 
			}
		}

		//tahap 1 :kuadratkan matrik berpasangan
		
		$variabelMatrikBerpasangan = [];
		for($a=0; $a < $countKriteria; $a++){

			for($b=0; $b < $countKriteria; $b++){
				$variabelMatrikBerpasangan[$a][$b] = $hasilDesimal[$b][$a];
				
			}
		}


		$matrikBerpasangan = [];
		for ($i=0; $i < $countKriteria; $i++) { 
			for ($j=0; $j < $countKriteria; $j++) { 
				$data= "";
				for ($k=0; $k < $countKriteria; $k++) { 
					for ($l=0; $l < $countKriteria; $l++) { 
						if($k == $j){
							$data .= "(".$hasilDesimal[$i][$l]."*".$variabelMatrikBerpasangan[$j][$l].")";
							if($l == ($countKriteria - 1)){
								$data .= " ";
							}else{
								$data .= " + ";
							}
						}
					}
				}
				$hasil =  cobaHitung($data); 
				$matrikBerpasangan[$i][$j] = $hasil;
			}
		}


		//tahap ke 2 hitung eiginvector
		//1. jumlahkan baris yg ada
		//2. jumlahkan jumlah baris yg ada
		//3. normalisasi nilai dari masing
		for ($m=0; $m < $countKriteria; $m++) {
			$data2="";
			for ($n=0; $n < $countKriteria; $n++) { 
				$data2 .= $matrikBerpasangan[$m][$n] ;
				if($n == ($countKriteria - 1)){
					$data2 .= " ";
				}else{
					$data2 .= " + ";
				}
			}

			$jml1[$m] = cobaHitung($data2); //hasil langkah 1
		}

		$jml2="";
		for ($o=0; $o < $countKriteria; $o++) { 
			$jml2 .= $jml1[$o];

			if($o == ($countKriteria - 1)){
				$jml2 .= " ";
			}else{
				$jml2 .= "+";
			}
		}

		$hasil2 = cobaHitung($jml2);

		for ($p=0; $p < $countKriteria; $p++) { 
			$eiginvectorKriteria[$p] = round($jml1[$p]/$hasil2,2);
		} 

		return $eiginvectorKriteria;
	}
	
	

	
		
}