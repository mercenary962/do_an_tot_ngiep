@extends('layouts.app')
@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Xác thực địa chỉ Email của bạn') }}</div>
                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ __('Một đường dẫn xác thực mới đã được gửi tới Email của bạn.') }}
                        </div>
                    @endif

                    {{ __('Trước khi thực hiện các thao tác khác, hãy kiểm tra đườn dẫn xác thực tài khoản trong email của bạn.') }}
                    {{ __('Nếu bạn không nhận được email xác thực') }},
                    <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ __('click tại đây để nhận đường dẫn mới') }}</button>.
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
 