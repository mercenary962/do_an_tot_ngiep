@extends('backend.layouts.master')

@section('title','Chi tiết đơn hàng')

@section('main-content')
<div class="card">
  <h5 class="card-header">Chỉnh sửa đơn hàng</h5>
  <div class="card-body">
    <form action="{{route('order.update',$order->id)}}" method="POST">
      @csrf
      @method('PATCH')
      <div class="form-group">
        <label for="status">Status :</label>
        <select name="status" id="" class="form-control">
          <option value="">--Lựa chọn trạng thái--</option>
          <option value="new" {{(($order->status=='new')? 'selected' : '')}}>Đang chờ xử lý</option>
          <option value="process" {{(($order->status=='process')? 'selected' : '')}}>Đang giao hàng</option>
          <option value="delivered" {{(($order->status=='delivered')? 'selected' : '')}}>Đã nhận</option>
          <option value="cancel" {{(($order->status=='cancel')? 'selected' : '')}}>Hủy</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
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