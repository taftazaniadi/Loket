
	<div class="row">
		<div class="col-md-2 "></div>
		<div class="col-md-4">
			<div class="box">
				<div class="loket">
					Pelayanan DAAK
				</div>
				<center>
					<h2 style="font-size: 18px;">Nomer Antrian Anda</h2>
				</center>
				<div class="agenda">
					<h1 id="nomer"><?php echo ($antrian->row('no_antrian') != null ? $antrian->row('no_antrian') : '-'); 
					if($antrian->row('no_antrian') < 1){
						$antri=0;
					}
					else{
						$antri=$antrian->row('no_antrian');
					}
					?>
					</h1>
						<center>
							<a href="<?php echo site_url('welcome/tambah_antrian/'.$antri."/DAAK"); ?>" class="btn btn-primary"><i class="glyphicon glyphicon-save"></i> &nbsp;Dapatkan Nomer Antrian</a>
						</center>
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
						$antri2=0;
					}
					else{
						$antri2=$antrianDPK->row('no_antrian');
					}
					?>
					</h1>
						<center>
							<a href="<?php echo site_url('welcome/tambah_antrian/'.$antri2."/DPK"); ?>" class="btn btn-primary"><i class="glyphicon glyphicon-save"></i> &nbsp;Dapatkan Nomer Antrian</a>
						</center>
					<br>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function nomer(){
		var antri = parseInt(document.getElementById('nomer').innerHTML)+1;
		document.getElementById("nomer").innerHTML=antri;
	}
</script>