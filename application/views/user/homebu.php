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

	        <?php if(!empty($this->session->flashdata('hasil_ahp'))){?>
            <table>
              <thead>
                <tr>
                  <th>No</th>
                  <th>Operator</th>
                  <th>Kuota</th>
                  <th>Kisaran Harga</th>
                </tr>
              </thead>
              <tbody>
              <?php $no=1; foreach ($hasil as $key) { ?>
                <tr>
                  <td><?php echo $no ?></td>
                  <td><?php echo $key['id_operator']; ?></td>
                  <td></td>
                  <td></td>
                </tr>
              <?php $no++; } ?>
              </tbody>
            </table>
          <?php } ?>
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

  <!-- Callout -->
  <!-- <section class="callout">
    <div class="container text-center">
      <h2 class="mx-auto mb-5">Welcome to
        <em>your</em>
        next website!</h2>
      <a class="btn btn-primary btn-xl" href="https://startbootstrap.com/template-overviews/stylish-portfolio/">Download Now!</a>
    </div>
  </section> -->

  <!-- Portfolio -->
  <!-- <section class="content-section" id="portfolio">
    <div class="container">
      <div class="content-section-heading text-center">
        <h3 class="text-secondary mb-0">Portfolio</h3>
        <h2 class="mb-5">Recent Projects</h2>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Stationary</h2>
                <p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-1.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Ice Cream</h2>
                <p class="mb-0">A dark blue background with a colored pencil, a clip, and a tiny ice cream cone!</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-2.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Strawberries</h2>
                <p class="mb-0">Strawberries are such a tasty snack, especially with a little sugar on top!</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-3.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="#">
            <span class="caption">
              <span class="caption-content">
                <h2>Workspace</h2>
                <p class="mb-0">A yellow workspace with some scissors, pencils, and other objects.</p>
              </span>
            </span>
            <img class="img-fluid" src="img/portfolio-4.jpg" alt="">
          </a>
        </div>
      </div>
    </div>
  </section> -->

  <!-- Call to Action -->
<!--   <section class="content-section bg-primary text-white">
    <div class="container text-center">
      <h2 class="mb-4">The buttons below are impossible to resist...</h2>
      <a href="#" class="btn btn-xl btn-light mr-4">Click Me!</a>
      <a href="#" class="btn btn-xl btn-dark">Look at Me!</a>
    </div>
  </section> -->

  <!-- Map -->
  <!-- <section id="contact" class="map">
    <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
    <br />
    <small>
      <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
    </small>
  </section> -->
<?php $this->load->view ("user/footer")?>