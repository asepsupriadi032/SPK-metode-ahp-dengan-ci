<?php $this->load->view ("user/header") ?>
<!--banner-->
  <!-- Header -->
  <style type="text/css">
    li{
      size:1000px !important;
    }
  </style>
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
          <h2>Pilih Kriteria dan Kuota</h2>
          <p class="lead mb-5"></p>
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
            <select name="id_kuota" id="id_kuota" class="form-control">
              <?php foreach ($kuota as $key) {
              ?>
                <option value="<?php echo $key->id_kuota ?>"><?php echo $key->jml_kuota ?></option>
              <?php
              } ?>
            </select><p></p>
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
        <h3 class="text-secondary mb-0"></h3>
        <h2 class="mb-5">Tata Cara</h2>
      </div>
      <div class="row">
        <div class="col-lg-10 text-justify">
          <ol>
            <li><h5> User memilih parameter kriteria :</h5><ul>
              <li><h5> Promo </h5></li>
              <li><h5> Harga </h5></li>
              <li><h5> Kecepatan </h5></li>
              </li>
            </ul>
            </li>
            <li><h5> User memilih kuota yang sudah tersedia </h5></li>
            <li><h5> Kemudian klik Proses </h5></li>
            <li><h5> Akan muncul hasil sistem penunjang keputusan yang telah user pilih </h5></li>
          </ol>
        </div>
      </div>
    </div>
  </section>

 
<?php $this->load->view ("user/footer")?>