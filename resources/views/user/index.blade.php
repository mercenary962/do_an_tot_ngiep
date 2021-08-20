@extends('user.layouts.master')

@section('main-content')
<div class="container-fluid">
    @include('user.layouts.notification')
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

   
    <!-- Content Row -->

    <div class="row">
      @php
          $orders=DB::table('orders')->where('user_id',auth()->user()->id)->paginate(10);
      @endphp
      <!-- Order -->
      <div class="col-xl-12 col-lg-12">
        <table class="table table-bordered" id="order-dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>STT</th>
              <th>Mã đơn hàng</th>
              <th>Họ tên</th>
              <th>Email</th>
              <th>Số lượng</th>
              <th>Tổng tiền</th>
              <th>Trạng thái</th>
              <th>Tùy chọn</th>
            </tr>
          </thead>
          <tbody>
            @if(count($orders)>0)
              @foreach($orders as $order) 
              @php
                $users=DB::table('users')->where('id',$order->user_id)->get(); 
              @endphp  
                <tr>
                    <td>{{$order->id}}</td>
                    <td>{{$order->order_number}}</td>
                    @foreach($users as $user)
                      <td>{{$user->name}}</td>
                      <td>{{$user->email}}</td>
                    @endforeach
                    <td>{{$order->quantity}}</td>
                    <td>{{number_format($order->total_amount)}} đ</td>
                    <td>
                        @if($order->status=='new')
                          <span class="badge badge-primary">{{$order->status}}</span>
                        @elseif($order->status=='process')
                          <span class="badge badge-warning">{{$order->status}}</span>
                        @elseif($order->status=='delivered')
                          <span class="badge badge-success">{{$order->status}}</span>
                        @else
                          <span class="badge badge-danger">{{$order->status}}</span>
                        @endif
                    </td>
                    <td>
                        <a href="{{route('user.order.show',$order->id)}}" class="btn btn-warning btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="view" data-placement="bottom"><i class="fas fa-eye"></i></a>
                        <form method="POST" action="{{route('user.order.delete',[$order->id])}}">
                          @csrf 
                          @method('delete')
                              <button class="btn btn-danger btn-sm dltBtn" data-id={{$order->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                        </form>
                    </td>
                </tr>  
              @endforeach
              @else
                <td colspan="8" class="text-center"><h4 class="my-4">Không có đơn đặt hàng nào</h4></td>
              @endif
          </tbody>
        </table>

        {{$orders->links()}}
      </div>
    </div>

  </div>
@endsection

@push('scripts')
<script type="text/javascript">
  const url = "{{route('product.order.income')}}";

// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

  </script>
@endpush