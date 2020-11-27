
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-4">
			<div class="box">
				<div class="loket">
					Pelayanan DAAK
				</div>
				<center>
					<h2 style="font-size: 18px;">Nomer Antrian Anda</h2>
				</center>
				<div class="agenda">
					<h1 id="nomer"><?php echo $antrian->row('no_antrian'); 
					if($antrian->row('no_antrian') < 1){
						$antri=1;
					}
					else{
						$antri=$antrian->row('no_antrian')+1;
					}
					?>
					</h1>
					<br>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="box">
				<div class="loket">
					Pelayanan DPK
				</div>
				<center>
					<h2 style="font-size: 18px;">Nomer Antrian Anda</h2>
				</center>
				<div class="agenda">
					<h1 id="nomer"><?php echo ($antrianDPK->row('no_antrian') != null ? $antrianDPK->row('no_antrian') : '-'); 
					if($antrianDPK->row('no_antrian') < 1){
						$antri2=1;
					}
					else{
						$antri2=$antrianDPK->row('no_antrian')+1;
					}
					?>
					</h1>
					<br>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">print(); location="<?php echo base_url('welcome/antrian/'); ?>"</script>