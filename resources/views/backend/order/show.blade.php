@extends('backend.layouts.master')

@section('title','Chi tiết đặt hàng')

@section('main-content')
<div class="card">
<h5 class="card-header">Đặt hàng       <a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Tạo file PDF</a>
  </h5>
  <div class="card-body">
    @if($order)
    <table class="table table-striped table-hover">
      <thead>
        <tr>
            <th>STT</th>
            <th>Mã đơn hàng</th>
            <th>Họ tên</th>
            <th>Email</th>
            {{-- <th>Tên sản phẩm</th> --}}
            <th>Số lượng</th>
            <th>Phí vận chuyển</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Tùy chọn</th>
        </tr>
      </thead>
      <tbody>
        
          {{-- @foreach($order->cart_info as $cart)
          @php 
            $product=DB::table('products')->select('title')->where('id',$cart->product_id)->get();
          @endphp --}}
          <tr>
            @php
              $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
            @endphp
            <td>{{$order->id}}</td>
            <td>{{$order->order_number}}</td>
            <td>{{$order->first_name}} {{$order->last_name}}</td>
            <td>{{$order->email}}</td>
           
                {{-- <td>
                  @foreach($product as $pro)
                    {{$pro->title}}
                  @endforeach
                </td> --}}
            
            <td>{{$order->quantity}}</td>
            <td>@foreach($shipping_charge as $data) {{number_format($data)}} đ @endforeach</td>
            <td>{{number_format($order->total_amount)}} đ</td>
            <td>
                @if($order->status=='new')
                  <span class="badge badge-primary">Đang xử lý</span>
                @elseif($order->status=='process')
                  <span class="badge badge-warning">Đang giao hàng</span>
                @elseif($order->status=='delivered')
                  <span class="badge badge-success">Giao hàng thành công</span>
                @else
                  <span class="badge badge-danger">Đã hủy</span>
                @endif
            </td>
            <td>
                <a href="{{route('order.edit',$order->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                <form method="POST" action="{{route('order.destroy',[$order->id])}}">
                  @csrf 
                  @method('delete')
                      <button class="btn btn-danger btn-sm dltBtn" data-id={{$order->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                </form>
            </td>
          
        </tr>
        {{-- @endforeach --}}
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">THÔNG TIN ĐƠN ĐẶT HÀNG</h4>
              <table class="table">
                    @php
                        $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
                    @endphp
                    <tr class="">
                        <td>Mã đơn hàng</td>
                        <td> : {{$order->order_number}}</td>
                    </tr>
                    <tr>
                        <td>Ngày đặt</td>
                        <td> : {{$order->created_at->diffForHumans()}}</td>
                    </tr>
                    {{-- <tr>
                      <td>Tên sản phẩm</td>
                      @foreach($order->cart_info as $cart)
                          @php 
                            $product=DB::table('products')->select('title')->where('id',$cart->product_id)->get();
                          @endphp
                          <td>
                            @foreach($product as $pro)
                              : {{$pro->title}}
                            @endforeach
                          </td>
                      @endforeach
                    </tr> --}}
                    <tr>
                        <td>Số lượng</td>
                        <td> : {{$order->quantity}}</td>
                    </tr>
                    <tr>
                        <td>Trạng thái đơn hàng</td>
                        @if($order->status=='new')
                          <td> : Đang xử lý</td>
                        @elseif($order->status=='process')
                          <td> : Đang giao hàng</td>
                        @elseif($order->status=='delivered')
                          <td> : Giao hàng thành công</td>
                        @else
                          <td> : Đã hủy</td>
                        @endif</td>
                    </tr>
                    <tr>
                        <td>Phí vận chuyển</td>
                        <td> : @foreach($shipping_charge as $data) {{number_format($data)}} đ @endforeach</td>
                    </tr>
                    <tr>
                        <td>Tổng tiền</td>
                        <td> : {{number_format($order->total_amount)}} đ</td>
                    </tr>
                    <tr>
                        <td>Phương thức thanh toán</td>
                        <td> : {{$order->payment_method}}</td>
                    </tr>
                    <tr>
                        <td>Trạng thái thanh toán</td>
                        <td> : {{$order->payment_status}}</td>
                    </tr>
              </table>
            </div>
          </div>

          <div class="col-lg-6 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">THÔNG TIN VẬN CHUYỂN</h4>
              <table class="table">
                    <tr class="">
                        <td>Họ và tên</td>
                        <td> : {{$order->first_name}} {{$order->last_name}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : {{$order->email}}</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td> : {{$order->phone}}</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td> : {{$order->address}}</td>
                    </tr>
                    <tr>
                        <td>Ghi chú</td>
                        <td> : {{$order->notes}}</td>
                    </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    @endif

  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }

</style>
@endpush