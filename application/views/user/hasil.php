<!-- Bootstrap Core CSS -->
  <link href="<?php echo base_url('assets/user') ?>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="<?php echo base_url('assets/user') ?>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <h1>Pencarian berdasarkan kriteria: <?php echo $kriteria ?></h1>
  <hr>
<table class="table table-bordered">
  <thead>
    <tr>
      <th>No</th>
      <th>Operator</th>
      <th>Kuota</th>
      <th>Keterangan</th>
      <th>Kisaran Harga</th>
    </tr>
  </thead>
  <tbody>
  <?php $no=1; foreach ($hasil as $key) { ?>
    <tr>
      <td><?php echo $no ?></td>
      <td><?php echo $this->hasil->operator($key['id_operator']); ?></td>
      <td><?php echo $this->hasil->kuota($id_kuota,$key['id_operator']); ?></td>
      <td><?php echo strip_tags($this->hasil->keterangan($id_kuota,$key['id_operator'])); ?></td>
      <td>Rp. <?php echo $this->hasil->harga($id_kuota,$key['id_operator']); ?></td>
    </tr>
  <?php $no++; } ?>
  </tbody>
</table>

