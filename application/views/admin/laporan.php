	<div class="row">
		<div class="col-md-12">
			<?php
				//echo $this->session->flashdata('pesan');
			?>
			<div class="box">
				<div class="loket">
					Laporan
				</div>
				<div>
					<div class="col-md-2"></div>
					<div class="row">
						<div class="col-md-8">
							<br>
							<div class="table-responsive">
								<table class="table table-bordered" id="example_laporan" style="width:100%">
									<thead>
										<tr>
											<th width="3px">No</th>
											<th style="text-align: center;">Waktu</th>
											<th style="text-align: center;">Layanan</th>
											<th width="130px">Jumlah Antrian</th>
										</tr>
									</thead>
									<tbody>
										<?php
										$bulan=array("01" => "Januari", "02" => "Februari", "03" => "Maret",
										"04" => "April", "05" => "Mei", "06" => "Juni",
										"07" => "Juli", "08" => "Agustus", "09" => "September",
										"10" => "Oktober", "11" => "November", "12" => "Desember");
										$no=0;
										foreach ($report as $row) { 
											$no++;
											$b=$bulan[substr($row->tgl, 2,2)];
											$waktu=substr($row->tgl, 0,2)." ".$b." ".substr($row->tgl, -4);
											?>
											<tr>
												<td><?php echo $no; ?></td>
												<td><?php echo $waktu; ?></td>
												<td><?php echo $row->jenis_pelayanan; ?></td>
												<td style="text-align: center;"><?=$row->jml?></td>
											</tr>
										<?php } ?>
									</tbody>
								</table>
							</div>
						</div>	
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- <script type="text/javascript" src="<?php echo base_url('assets/js/Chart.min.js'); ?>"></script>
<script type="text/javascript">
	      // Bar chart
      var ctx = document.getElementById("mybarChart");
      var mybarChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July", "Agustus", "September", "Oktober", "November", "Desember"],
          datasets: [{
            label: 'Pengantri',
            backgroundColor: "#26B99A",
            data: [51, 30, 40, 28, 92, 50, 250]
          // }, {
          //   label: '# of Votes',
          //   backgroundColor: "#03586A",
          //   data: [41, 56, 25, 48, 72, 34, 12]
           }]
        },

        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
</script> -->