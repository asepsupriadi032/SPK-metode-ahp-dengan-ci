<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Index extends CI_Controller {


	function __construct(){
		parent::__construct();
		$this->load->helper("evalmath.class");
		$this->load->helper('calculate');
		$this->load->model('hasil');
	}

	public function index()
	{
		$data['kuisioner']=$this->db->get('kuisioner')->result();

		$data['kriteria'] = $this->db->get('kriteria')->result();
		$data['kuota'] = $this->db->get('kuota')->result();
		//var_dump($data['kuota']);die();

		$data['hasil'] = "";

		
		$this -> load -> view ('user/home',$data);
	}

	public function proses($id_kriteria, $id_kuota){

		$data['kuisioner']=$this->db->get('kuisioner')->result();
		$data['kriteria'] = $this->db->get('kriteria')->result();
		// $data['hasil'] =  $this->input->post('id_kriteria');
		// $id_kriteria = $this->input->post('id_kriteria');

		$hasilKriteria = $this->hitungKriteria();

		//menghitung hasil eiginvector provider berdasarkan kriteria
		$hasilKriteriaHarga = $this->hitungKriteriaHarga($id_kriteria);
		$hasilKriteriaPromo = $this->hitungKriteriaPromo($id_kriteria);
		$hasilKriteriaKecepatan = $this->hitungKriteriaKecepatan($id_kriteria);
		// hasil langkah 2

		$arr = $id_kriteria - 1;
		$kriteriaBobot = $hasilKriteria[$arr];
		
		if($arr == 0){
			$totalRow=count($hasilKriteriaPromo['hasil']);
			$getData = $hasilKriteriaPromo;
		}elseif($arr==1){
			$totalRow=count($hasilKriteriaHarga['hasil']);
			$getData = $hasilKriteriaHarga;
		}elseif($arr==2){
			$totalRow=count($hasilKriteriaKecepatan['hasil']);
			$getData = $hasilKriteriaKecepatan;
		}

		//kalkulasi

		for ($i=0; $i < $totalRow; $i++) { 
			$hasilSementara = round($kriteriaBobot*$getData['hasil'][$i],2);
			$urutanSementara[$i] = array('hasilSementara'=>$hasilSementara,'id_operator'=>$getData['id_operator'][$i]);
		}
		arsort($urutanSementara);
		$data['hasil'] = $urutanSementara;
		$data['id_kuota'] = $id_kuota;

		// foreach ($data3 as $key) {
		// 	echo $key['id_operator']."<br>";
		// }
		// print_r($data3); exit();

		$this->db->where('id_kriteria',$id_kriteria);
		$rowKriteria = $this->db->get('kriteria')->row();
		$data['kriteria'] = $rowKriteria->kriteria;
		$this->session->set_flashdata('hasil_ahp',true);

		$this ->load->view ('user/hasil',$data);
	}

	public function hitungKriteria(){
		$this->db->order_by('urutan','ASC');
		$getKriteria = $this->db->get('kriteria');
		$countKriteria = $getKriteria->num_rows();
		$dataKriteria = $getKriteria->result();

		$no = 0;
		foreach ($dataKriteria as $key) {
			
			// for($j=1; $j<=$countKriteria; $j++){
				$nilaiBobotKriteria[$no] = $key->bobot;
				$kriteriaName[$no] = $key->kriteria;
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
			$eiginvectorKriteria[$p] =round($jml1[$p]/$hasil2,2);
		} 

		return $eiginvectorKriteria;
	}
	
	public function hitungKriteriaHarga($id_kriteria){
		// $getKriteria = $this->db->get('kriteria');

		$this->db->order_by('urutan','ASC');
		$this->db->where('id_kriteria',$id_kriteria);
		$this->db->join('operator','operator.id_operator=kriteria_provider.id_operator');
		$getKriteria = $this->db->get('kriteria_provider');
		$countKriteria = $getKriteria->num_rows();
		$dataKriteria = $getKriteria->result();

		// var_dump($dataKriteria); die();

		$no = 0;
		foreach ($dataKriteria as $key) {
			
			// for($j=1; $j<=$countKriteria; $j++){
				$nilaiBobotKriteria[$no] = $key->bobot;
				$provider[$no] = $key->nama_operator;
				$id_operator[$no] = $key->id_operator;

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
			// $eiginvectorKriteria[$p] = $provider[$p].":".round($jml1[$p]/$hasil2,2);
		} 

		return array('hasil'=>$eiginvectorKriteria, 'id_operator'=>$id_operator);
	}

	public function hitungKriteriaPromo($id_kriteria){
		// $getKriteria = $this->db->get('kriteria');

		$this->db->order_by('urutan','ASC');
		$this->db->where('id_kriteria',$id_kriteria);
		$this->db->join('operator','operator.id_operator=kriteria_provider.id_operator');
		$getKriteria = $this->db->get('kriteria_provider');
		$countKriteria = $getKriteria->num_rows();
		$dataKriteria = $getKriteria->result();

		// var_dump($dataKriteria); die();

		$no = 0;
		foreach ($dataKriteria as $key) {
			
			// for($j=1; $j<=$countKriteria; $j++){
				$nilaiBobotKriteria[$no] = $key->bobot;
				$provider[$no] = $key->nama_operator;
				$id_operator[$no] = $key->id_operator;
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
			// $eiginvectorKriteria[$p] = $provider[$p].":".round($jml1[$p]/$hasil2,2);
		} 

		return array('hasil'=>$eiginvectorKriteria, 'id_operator'=>$id_operator);
	}

	public function hitungKriteriaKecepatan($id_kriteria){
		// $getKriteria = $this->db->get('kriteria');

		$this->db->where('id_kriteria',$id_kriteria);
		$this->db->join('operator','operator.id_operator=kriteria_provider.id_operator');
		$getKriteria = $this->db->get('kriteria_provider');
		$countKriteria = $getKriteria->num_rows();
		$dataKriteria = $getKriteria->result();

		// var_dump($dataKriteria); die();

		$no = 0;
		foreach ($dataKriteria as $key) {
			
			// for($j=1; $j<=$countKriteria; $j++){
				$nilaiBobotKriteria[$no] = $key->bobot;
				$provider[$no] = $key->nama_operator;
				$id_operator[$no] = $key->id_operator;
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
			// $eiginvectorKriteria[$p] = $provider[$p].":".round($jml1[$p]/$hasil2,2);
		} 

		return array('hasil'=>$eiginvectorKriteria, 'id_operator'=>$id_operator);
	}


	

	
		
}