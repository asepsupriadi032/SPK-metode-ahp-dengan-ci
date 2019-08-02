<?php $this->load->view ("user/header") ?>
<!--banner-->
  <!-- Header -->
  <header class="masthead d-flex">
    <div class="container text-center my-auto">
      <h1 class="mb-1">S E L A M A T D A T A N G</h1>
      <h3 class="mb-5" style="font-style:  ">
        <em>Sistem Penunjang Keputusan Paket Data  Metode AHP</em>
      </h3>
     	
    </div>
    <div class="overlay"></div>
  </header>

  <!-- About -->
  <section class="content-section bg-light" id="sao">
    <div class="container text-center">
      <div class="row">
        <div class="col-lg-5 mx-auto">
          <h2>Judul</h2>
          <p class="lead mb-5">Pilih salah satu kriteria</p>
          <form action="#" method="post" id="formProses">
          <!-- <form action="<?php //echo base_url('Index/proses')?>" method="post"> -->
	          <select name="id_kriteria" id="id_kriteria" class="form-control">
	          	<?php foreach ($kriteria as $key) {
	          	?>
	          		<option value="<?php echo $key->id_kriteria ?>"><?php echo $key->kriteria ?></option>
	          	<?php
	          	} ?>
	          </select>
	          <p></p>
	          <!-- <input type="submit" name="proses" id="proses" value="Proses" class="btn btn-dark btn-xs js-scroll-trigger"> -->
            <button type="button" class="btn btn-dark btn-xs js-scroll-trigger" onclick="proses()">Proses</button>
	        </form>
          <!-- <a class="btn btn-dark btn-xl js-scroll-trigger" href="#services">What We Offer</a> -->
        </div>
      </div>
    </div>
  </section>

  <!-- Services -->
  <section class="content-section bg-primary text-white text-center" id="services">
    <div class="container">
      <div class="content-section-heading">
        <h3 class="text-secondary mb-0">Services</h3>
        <h2 class="mb-5">What We Offer</h2>
      </div>
      <div class="row">
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <h4>
            <strong>Survey</strong>
          </h4>
          <?php foreach ($kuisioner as $row) { ?>
          <p class="text-faded mb-0"><?php echo $row->pertanyaan; ?></p>
          	<?php 
          		$this->db->where('id_kuisioner',$row->id_kuisioner);
          		$row_data = $this->db->get('pg_kuisioner')->result();

          		foreach ($row_data as $pg) {
          		?>
          			<input type="radio" name="voting" value="<?php echo $pg->id_pg_kuisioner ?>"> <?php echo $pg->pg_kuisioner ?><br>
          		<?php
          		}
          	?>
          <?php } ?>
        </div>
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <h4>
            <strong>Hasil Polling</strong>
          </h4>
          <p class="text-faded mb-0">Hasil</p>
        </div>
      </div>
    </div>
  </section>

 
<?php $this->load->view ("user/footer")?>