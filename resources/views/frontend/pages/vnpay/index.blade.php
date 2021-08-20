<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="{{asset('/vnpay_php/assets/bootstrap.min.css')}}" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="{{asset('/vnpay_php/assets/jumbotron-narrow.css')}}" rel="stylesheet">  
        <script src="{{asset('/vnpay_php/assets/jquery-1.11.3.min.js')}}"></script>
    </head>

    <body>

        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY DEMO</h3>
            </div>
            <h3>Tạo mới đơn hàng</h3>
            <div class="table-responsive">
                <form action="{{ route('payment') }}" method="POST">       
                    @csrf
                    <div class="form-group">
                        <label for="language">Loại hàng hóa </label>
                        <select name="order_type" id="order_type" class="form-control">
                            <option value="topup">Nạp tiền điện thoại</option>
                            <option value="billpayment">Thanh toán hóa đơn</option>
                            <option value="fashion">Thời trang</option>
                            <option value="other">Khác - Xem thêm tại VNPAY</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="amount">Số tiền</label>
                        <input class="form-control" id="amount" name="amount" type="number" value="{{ $total_amount }}"/>
                    </div>


                    <div class="form-group">
                        <label for="name">Họ:</label>
                        <input class="form-control" id="name"
                               name="name" type="text" value="{{ auth()->user()->name }}"/>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input class="form-control" id="email"
                               name="email" type="text" value="{{ auth()->user()->email }}"/>
                    </div>

                    <div class="form-group">
                        <label for="address">Địa chỉ:</label>
                        <input class="form-control" id="address"
                               name="address" type="text" value="{{ auth()->user()->address }}"/>
                    </div>

                    <div class="form-group">
                        <label for="phone">Số điện thoại:</label>
                        <input class="form-control" id="phone"
                               name="phone" type="text" value="{{ auth()->user()->phone }}"/>
                    </div>

                    {{-- <div class="form-group">
                        <label for="shipping">Vận chuyển:</label>
                        <input class="form-control" id="shipping"
                               name="shipping" type="text" value="{{ $shipping }}"/>
                        {{-- @if(count(Helper::shipping())>0 && Helper::cartCount()>0)
                            <select name="shipping" class="form-control">
                                <option value="">Chọn đơn vị chuyển phát</option>
                                @foreach(Helper::shipping() as $shipping)
                                <option value="{{$shipping->id}}" class="shippingOption" data-price="{{$shipping->price}}">{{$shipping->type}}: {{$shipping->price}} đ</option>
                                @endforeach
                            </select>
                        @endif --}}
                    {{-- </div> --}}


                    <div class="form-group">
                        <label for="order_desc">Nội dung thanh toán</label>
                        <textarea class="form-control" cols="20" id="order_desc" name="order_desc" rows="2" placeholder="Noi dung thanh toan"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="bank_code">Ngân hàng</label>
                        <select name="bank_code" id="bank_code" class="form-control">
                            <option value="">Không chọn</option>
                            <option value="NCB"> Ngan hang NCB</option>
                            <option value="AGRIBANK"> Ngan hang Agribank</option>
                            <option value="SCB"> Ngan hang SCB</option>
                            <option value="SACOMBANK">Ngan hang SacomBank</option>
                            <option value="EXIMBANK"> Ngan hang EximBank</option>
                            <option value="MSBANK"> Ngan hang MSBANK</option>
                            <option value="NAMABANK"> Ngan hang NamABank</option>
                            <option value="VNMART"> Vi dien tu VnMart</option>
                            <option value="VIETINBANK">Ngan hang Vietinbank</option>
                            <option value="VIETCOMBANK"> Ngan hang VCB</option>
                            <option value="HDBANK">Ngan hang HDBank</option>
                            <option value="DONGABANK"> Ngan hang Dong A</option>
                            <option value="TPBANK"> Ngân hàng TPBank</option>
                            <option value="OJB"> Ngân hàng OceanBank</option>
                            <option value="BIDV"> Ngân hàng BIDV</option>
                            <option value="TECHCOMBANK"> Ngân hàng Techcombank</option>
                            <option value="VPBANK"> Ngan hang VPBank</option>
                            <option value="MBBANK"> Ngan hang MBBank</option>
                            <option value="ACB"> Ngan hang ACB</option>
                            <option value="OCB"> Ngan hang OCB</option>
                            <option value="IVB"> Ngan hang IVB</option>
                            <option value="VISA"> Thanh toan qua VISA/MASTER</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="language">Ngôn ngữ</label>
                        <select name="language" id="language" class="form-control">
                            <option value="vn">Tiếng Việt</option>
                            <option value="en">English</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary" id="btnPopup">Xác nhận thanh toán</button>
                    <button type="submit" class="btn btn-default" onclick="history.back()">Quay trở lại</button>

                </form>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2021</p>
            </footer>
        </div>  
        <link href="https://sandbox.vnpayment.vn/paymentv2/lib/vnpay/vnpay.css" rel="stylesheet"/>
        <script src="https://sandbox.vnpayment.vn/paymentv2/lib/vnpay/vnpay.js"></script>
    </body>
</html>
