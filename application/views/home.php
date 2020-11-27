<!-- <div class="col-md-1"></div> -->
<div class="col-md-12">
	<div class="row">
		<div class="col-md-6">         
			<div class="box">
				<div class="loket">
					Agenda
				</div>
				<div id="carousel-example-captions" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner" id="slide">
						<div class="item active">
							<img class="img-responsive" data-src="holder.js/900x500/auto/#777:#777" alt="900x500" src="<?php echo base_url('media/agenda/'.$agenda->row('file')); ?>">
							<div class="carousel-caption">
								<h3><?php echo $agenda->row('agenda'); ?></h3>
							</div>
						</div>
						<?php foreach ($agenda1->result() as $ag) { ?>
						<div class="item">
							<img class="img-responsive" data-src="holder.js/900x500/auto/#777:#777" alt="900x500" src="<?php echo base_url('media/agenda/'.$ag->file); ?>">
							<div class="carousel-caption">
								<h3><?php echo $ag->agenda; ?></h3>
							</div>
						</div>
						<?php } ?>
					</div>
					<a class="left carousel-control" href="#carousel-example-captions" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#carousel-example-captions" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>

		<!-- loket -->

		<div class="col-md-6">
			<div class="box">
				<div class="loket" id="loket">
					Antrian
				</div>
				<div class="antrian" id="antrian_new">
					<?php $antri = $this->M_crud->get_max_id_new('transaksi', 'no_antrian', array('tgl' => date('dmY')))->row('no_antrian');
					?>
					<script type="text/javascript">
						setInterval(function(){
								$.ajax({
								type:"POST",
								url: "<?php echo site_url('welcome/get_antri_new/'); ?>",
								success:function(data){	
									document.getElementById("antrian_new").innerHTML = data;
									}
							})
							}, 1000);
					</script>
				</div>
				<hr class="new5">
				<div class="antrian" id="namaLoket">
					<?php $antri = $this->M_crud->get_loket_new('transaksi', 'loket', array('tgl' => date('dmY')))->row('loket');
					?>
					<script type="text/javascript">
						setInterval(function(){
								$.ajax({
								type:"POST",
								url: "<?php echo site_url('welcome/get_antri_loket/'); ?>",
								success:function(data){	
									document.getElementById("namaLoket").innerHTML = "Loket "+data;
									}
							})
							}, 1000);
					</script>
				</div>

			</div>
		</div>

	</div>
</div>

<div class="col-md-12">
	<div class="row">
		<?php
			foreach ($loket as $row) { ?>
			<div class="col-md-3">
				<div class="box">
					<div class="loket" id="loket">
						Loket <?php echo $row->loket." - ".$row->jenis_loket; ?>
					</div>
					<center>
						<b><h2 style="font-size : 18px;">No Antrian</h2></b>
					</center>
					<div class="antrian" id="antrian<?php echo $row->id_loket; ?>">
						<?php $antri = $this->M_crud->get_max_id('transaksi', 'no_antrian', array('id_loket' => $row->id_loket, 'tgl' => date('dmY')))->row('no_antrian');
						?>
						<script type="text/javascript">
							setInterval(function(){
							var lok= <?php echo $row->id_loket; ?>;
									$.ajax({
									type:"POST",
									url: "<?php echo site_url('welcome/get_antri/'); ?>",
									data: "id_loket="+lok,
									success:function(data){	
										document.getElementById("antrian<?php echo $row->id_loket ?>").innerHTML = data;
										}
								})
								}, 1000);
						</script>
					</div>
				</div>
			</div>
			<?php } ?>
	</div>
</div>