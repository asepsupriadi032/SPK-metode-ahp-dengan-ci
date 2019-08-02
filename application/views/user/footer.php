 <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <!-- <ul class="list-inline mb-5">
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-facebook"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white" href="#">
            <i class="icon-social-github"></i>
          </a>
        </li>
      </ul> -->
      <p class="text-muted small mb-0">Copyright &copy; Rizsa Noorsita Amelia 2019</p>
    </div>
  </footer>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript -->
  <script src="<?php echo base_url('assets/user') ?>/vendor/jquery/jquery.min.js"></script>
  <script src="<?php echo base_url('assets/user') ?>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="<?php echo base_url('assets/user') ?>/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="<?php echo base_url('assets/user') ?>/js/stylish-portfolio.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url("assets/user")?>/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>

</body>

<script type="text/javascript">
  function proses(){
    // var str = $("#formProses").serialize();
    var id_kriteria = $("#id_kriteria").val();
    // alert(id_kriteria);
      $.fancybox.open({
           href : "Index/proses/"+id_kriteria,
           type : 'iframe',
           helpers : {
               media: true 
           },
           width: "50%",
           height: 400,
           autoSize: false,
           scrolling: false
      });
  }
  
</script>

</html>
