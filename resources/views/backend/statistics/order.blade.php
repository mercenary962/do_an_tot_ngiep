@extends('backend.layouts.master')

@section('main-content')

	<div class="row clearfix page_header">
		<div class="col-md-4">
			<h2> Thống kê doanh thu </h2>		
		</div>
		<div class="col-md-8 text-right">
			{!! Form::open([ 'route' => ['statistics.order'], 'method' => 'get' ]) !!}
			<div class="form-row align-items-center">
			    <div class="col-auto">
			      	<label class="sr-only" for="inlineFormInput">Từ</label>
			      	{{ Form::date('start_date', $start_date, [ 'class'=>'form-control', 'id' => 'date', 'placeholder' => 'Start Date' ]) }}
			    </div>
			    <div class="col-auto">
			      	<label class="sr-only" for="inlineFormInputGroup">Đến</label>
			      	<div class="input-group mb-2">
			        	{{ Form::date('end_date', $end_date, [ 'class'=>'form-control', 'id' => 'date', 'placeholder' => 'End Date' ]) }}
			      	</div>
			    </div>			    
			    <div class="col-auto">
			      	<button type="submit" class="btn btn-primary mb-2">Tìm</button>
			    </div>
			</div>
			{!! Form::close() !!}
		</div>
	</div>

    <!-- DataTales Example -->
	  <div class="card shadow mb-4">
	    <div class="card-header py-3">
	      <h6 class="m-0 font-weight-bold">Thống kê doanh thu <br/> <strong>{{ $start_date }}</strong> - <strong>{{ $end_date }}</strong> </h6>
	    </div>
	    <div class="card-body">
	      <div class="table-responsive">
	        <table class="table table-striped table-borderless table-sm" cellspacing="0">
	          <thead>
	            <tr>
	            	<th>Ngày</th>
	              	<th>Mã sản phẩm</th>
	              	<th class="text-right d-none d-sm-table-cell">Số lượng</th>
	              	<th class="text-right d-none d-sm-table-cell">Giá</th>
	              	<th class="text-right">Thành tiền</th>
	            </tr>
	          </thead>
	          
	          <tbody>
	          	@foreach ($orders as $order)
		            <tr>
		            	<td> {{ $order->created_at }} </td>
			            <td> {{ $order->order_number }} </td>
			            <td class="text-right d-none d-sm-table-cell"> {{ $order->quantity }} </td>
			            <td class="text-right d-none d-sm-table-cell"> {{ $order->price }} </td>
			            <td class="text-right"> {{ $order->total_amount }} </td>
		            </tr>
	            @endforeach
	          </tbody>

	          <tfoot>
	            <tr>
	            	<th></th>
	              	<th class="text-right d-none d-sm-table-cell">Tổng sản phẩm:</th>
	              	<th class="text-right d-none d-sm-table-cell"> {{ $orders->sum('quantity') }} </th>
	              	<th class="text-right">Tổng tiền:</th>
	              	<th class="text-right"> {{ $orders->sum('total_amount') }} </th>
	            </tr>
	          </tfoot>

	        </table>
	      </div>
	    </div>
	  </div>


@stop