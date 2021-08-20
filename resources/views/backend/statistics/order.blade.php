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


@stop