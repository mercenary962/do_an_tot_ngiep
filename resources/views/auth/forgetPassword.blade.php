@extends('frontend.layouts.master')

@section('title','Khôi phục mật khẩu')

@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{route('home')}}">Trang chủ<i class="ti-arrow-right"></i></a></li>
                            <li class="active"><a href="javascript:void(0);">Khôi phục mật khẩu</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
            
    <!-- Shop Login -->
    <section class="shop login section">
        <div class="container">
            <div class="row"> 
                <div class="col-lg-6 offset-lg-3 col-12">
                    <div class="login-form">
                        <h2>Khôi phục mật khẩu</h2>
                        <div class="card-body">

                            @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">
                                {{ Session::get('message') }}
                            </div>
                            @endif

                            <!-- Form -->
                            <form action="{{ route('forget.password.post') }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Địa chỉ Email<span>*</span></label>
                                            <div class="col-md-6">
                                                <input type="email" name="email" placeholder="Nhập Email" required="required">
                                                {{-- <input type="text" id="email_address" class="form-control" name="email" required autofocus> --}}
                                                @if ($errors->has('email'))
                                                    <span class="text-danger">{{ $errors->first('email') }}</span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group login-btn">
                                                <button class="btn" type="submit">Gửi đường dẫn khôi phục mật khẩu</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--/ End Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ End Login -->
@endsection
