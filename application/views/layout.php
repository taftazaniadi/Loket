<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if($this->session->userdata('level') == 'Penjaga'){
	$site="penjaga/";
}
else if($this->session->userdata('level') == 'Admin'){
	$site="admin/";
}
else{
	$site="welcome/";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Loket <?php echo $instansi->instansi; ?></title>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap.css'); ?>">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/loket.css'); ?>">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.bootstrap.min.css">
	<link rel="icon" type="icon" href="<?php echo base_url('media/amikom.png'); ?>">

	<style>
      html{
        position: relative;
        min-height: 100%;
      }
	</style>

	<script type="text/javascript" src="<?php echo base_url('assets/js/jquery.min.js'); ?>"></script>
	<script type="text/javascript" src="<?php echo base_url('assets/js/bootstrap.js'); ?>"></script>

</head>
<body>
	<header>
		<div class="row">
			<div class="col-md-2 col-sm-4 col-xs-4">
				<div id="logo">
					<img src="<?php echo base_url('media/'.$instansi->logo); ?>" style="width: 100%;" class="img" onclick="window.location='<?php echo site_url($site); ?>'">
				</div>
			</div>
			<div class="col-md-8">
				<div class="instansi">
					<h3 onclick="window.location='<?php echo site_url($site); ?>'"><?php echo $instansi->instansi; ?></h3>
					<!-- <h5 class="hidden-xs">No. Telp <?php echo $instansi->telp; ?></h5> -->
					<h5 id="alamat" class="hidden-xs"><?php echo $instansi->alamat; ?></h5>
				</div>
			</div>
		</div>
	</header>
	<nav>
		<div class="row">
			<div class="col-md-12">	
				<div class="menu">
					<h4><?php $this->load->view($menu); ?></h4>
				</div>
			</div>
		</div>
	</nav>

	<section>
		<div class="container"  style="background-color : white; margin-bottom : 50px;">
			<?php $this->load->view($content); ?>
		</div>
	</section>


	<footer style="position : absolute; bottom : 0; width: 100%; overflow: hidden;">
		<div class="row">
			<div class="col-md-8">
				<marquee class="footer" onmouseover="stop();" onmouseout="start()">
			<?php
				foreach($text_jalan AS $text)
				{ ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="<?php echo base_url('media/agenda/'.$text->img); ?>"  height="20">&nbsp;&nbsp;<?php echo $text->text; 
				} ?>
				</marquee>
			</div>
			<div class="col-md-4">
				<?php
				if(empty($this->session->userdata('level'))){ ?>
					<a class="footer" href="<?php echo site_url('welcome/login/'); ?>">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ? '</strong>' : '' ?></a>
					<a class="footer" href="<?php echo site_url('welcome/antrian/'); ?>">Nomer Antrian</a>
				<?php }
				else{ ?>
					<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ? '</strong>' : '' ?></p>
				<?php }
				?>
			</div>
		</div>
	</footer>

	<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

	<!-- for export data -->
	<script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.colVis.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
				$('.example').DataTable();
		} );

		$(document).ready(function() {
			$('#example_laporan').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print',
						{
							text: 'Show All',
                action: function ( e, dt, node, config ) {
                    // alert( 'Button activated' );
										$('#example_laporan').DataTable().search('').draw();
                }
						},
						{
							text: 'Only DAAK',
                action: function ( e, dt, node, config ) {
                    // alert( 'Button activated' );
										$('#example_laporan').DataTable().search('DAAK').draw();
                }
						},
						{
							text: 'Only DPK',
                action: function ( e, dt, node, config ) {
                    // alert( 'Button activated' );
										$('#example_laporan').DataTable().search('DPK').draw();
                }
						},
						
        ]
			} );
		} );
	</script>

</body>
</html>