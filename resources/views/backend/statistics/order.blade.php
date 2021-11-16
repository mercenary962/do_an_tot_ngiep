@extends('backend.layouts.master')

@section('main-content')

	<div class="row clearfix page_header">
		<div class="col-md-4">
			<h2> Thống kê đơn hàng </h2>		
		</div>
		<div class="col-md-8 text-right">
			{!! Form::open([ 'route' => ['statistics.order'], 'method' => 'get' ]) !!}
				<div class="form-row align-items-center">
					
				</div>
			{!! Form::close() !!}
		</div>
	</div>

    <!-- DataTales Example -->
	  <div class="card shadow mb-4">
	    <div class="card-header py-3">
	      <h6 class="m-0 font-weight-bold">Thống kê đơn hàng </h6>
	    </div>
	    <div class="card-body">
	      <div class="table-responsive">
	        <table class="table table-striped table-borderless table-sm" cellspacing="0">
	          <thead>
	            <tr>
	              	<th>Mã đơn hàng</th>
	              	<th class="text-right d-none d-sm-table-cell">Số lượng</th>
	              	<th class="text-right d-none d-sm-table-cell">Thành tiền</th>
	              	<th class="text-right">Trạng thái</th>
	            </tr>
	          </thead>
	          
	          <tbody>
	          	@foreach ($orders as $order)
		            <tr>
		            	<td> {{ $order->order_number }} </td>
			            {{-- <td> {{ $order->quantity }} </td> --}}
			            <td class="text-right d-none d-sm-table-cell"> {{ $order->quantity }} </td>
			            <td class="text-right d-none d-sm-table-cell"> {{ $order->price }} </td>
			            <td class="text-right"> {{ $order->status }} </td>
		            </tr>
	            @endforeach
	          </tbody>

	          <tfoot>
	            <tr>
	            	<th></th>
	              	<th class="text-right d-none d-sm-table-cell">Tổng đơn hàng:</th>
	              	<th class="text-right d-none d-sm-table-cell"> {{ $orders->count('order_number') }} </th>
	            </tr>
				<tr>
	            	<th></th>
	              	<th class="text-right d-none d-sm-table-cell">Mới:</th>
	              	<th class="text-right d-none d-sm-table-cell"> {{ $orders->where('status','new')->count('order_number') }} </th>
	            </tr>
				<tr>
	            	<th></th>
	              	<th class="text-right d-none d-sm-table-cell">Đang giao:</th>
	              	<th class="text-right d-none d-sm-table-cell"> {{ $orders->where('status','process')->count('order_number') }} </th>
	            </tr>
				<tr>
	            	<th></th>
	              	<th class="text-right d-none d-sm-table-cell">Đã nhận:</th>
	              	<th class="text-right d-none d-sm-table-cell"> {{ $orders->where('status','delivered')->count('order_number') }} </th>
	            </tr>
				<tr>
	            	<th></th>
	              	<th class="text-right d-none d-sm-table-cell">Đã hủy:</th>
	              	<th class="text-right d-none d-sm-table-cell"> {{ $orders->where('status','cancel')->count('order_number') }} </th>
	            </tr>
	          </tfoot>

	        </table>
	      </div>
	    </div>
	  </div>

	  <div class="row">

		<!-- Bar Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
			  <!-- Card Header - Dropdown -->
			  <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">Doanh số bán hàng</h6>
				
			  </div>
			  <!-- Card Body -->
			  <div class="card-body">
				<div class="chart-area">
				  <canvas id="myBarChart"></canvas>
				</div>
			  </div>
			</div>
		  </div>

		<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Biểu đồ thống kê đơn hàng</h6>
					</div>
					<div class="card-body" style="overflow:hidden">
							<div id="pie_chart" style="width:600px; height:500px;">
					</div>
				</div>
			</div>
		

		
	</div>

		


@endsection

@push('scripts')
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	<!-- Pie Chart -->
    <script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
				['Status', 'Quantity'],

                @php
                foreach($pieChart as $val) {
                    echo "['".$val->status."', ".$val->status_qty."],";
                }
                @endphp
			]);

			var options = {
			title: ''
			};

			var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));

			chart.draw(data, options);
		}
    </script>

	<!-- Bar Chart -->
	<script type="text/javascript">
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#000000';


		// Bar Chart Example
	
		var cData = JSON.parse(`<?php echo $chart_data; ?>`);
		var ctx = document.getElementById("myBarChart");
		var myBarChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: cData.label,
				datasets: [{
					label: "Quantity",
					backgroundColor: "#4e73df",
					hoverBackgroundColor: "#2e59d9",
					borderColor: "#4e73df",
					data: cData.data,
					
				}],
			},
			options: {
				maintainAspectRatio: false,
				layout: {
					padding: {
						left: 5,
						right: 5,
						top: 25,
						bottom: 0
					}
				},
				scales: {
					xAxes: [{
						time: {
							unit: 'status'
						},
						gridLines: {
							display: false,
							drawBorder: false
						},
						ticks: {
							maxTicksLimit: 6
						},
						maxBarThickness: 50,
						// barPercentage: 20.0,
    					// categoryPercentage: 20.0
						
	
					}],
					yAxes: [{
						ticks: {
							min: 0,
							max: 10,
							maxTicksLimit: 10,
							padding: 10,
						// Include a dollar sign in the ticks
						callback: function(value, index, values) {
							return value;
						}
					},
					gridLines: {
						color: "rgb(234, 236, 244)",
						zeroLineColor: "rgb(234, 236, 244)",
						drawBorder: false,
						borderDash: [2],
						zeroLineBorderDash: [2]
					}
					}],
				},
				legend: {
					display: false
				},
				tooltips: {
					titleMarginBottom: 10,
					titleFontColor: '#6e707e',
					titleFontSize: 18,
					backgroundColor: "rgb(255,255,255)",
					bodyFontColor: "#858796",
					borderColor: '#dddfeb',
					borderWidth: 1,
					xPadding: 15,
					yPadding: 15,
					displayColors: false,
					caretPadding: 20,
					callbacks: {
						label: function(tooltipItem, chart) {
						var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
						return datasetLabel + ': ' + tooltipItem.yLabel;
						}
					}
				},
			}
		});

	</script>

	
@endpush