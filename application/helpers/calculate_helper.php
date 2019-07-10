<?php  

	 function cobaHitung($formula){
		$evalMath = new EvalMath;
			// $evalMath->suppress_errors = true;
			$value = number_format($evalMath->evaluate($formula), 2, '.', '');

			return $value;
	}

	 function tes($id){
		if($id < 2){
			$hasil = "oke";
		}else{
			$hasil = "tidak";
		}

		return $hasil;
	}
