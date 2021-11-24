@extends('frontend.layouts.master')

@section('title','Giới thiệu')

@section('main-content')

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">Trang chủ<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">Chính sách đổi trả</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	
	<!-- About Us -->
	<section class="about-us section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-12">
						<div class="about-content">
							<h2 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">I. Quy định đổi trả</h2>
                            <h3 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">1. Những trường hợp được đổi trả:</h3>
                            <ul style="list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Hàng bị lỗi kỹ thuật và lỗi do nhà sản xuất</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Hàng bị hư hỏng do quá trình vận chuyển hàng cho khách của&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span></li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Hàng giao không đúng mẫu mã, loại mà khách đã đặt</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Hàng giao bị thiếu linh phụ kiện đi kèm</li>
                            </ul>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">Nếu phát hiện những trường hợp trên, quý khách vui lòng không nhận hàng và yêu cầu nhân viên giao nhận của chúng tôi xác nhận tình trạng máy ngay tại chỗ và yêu cầu đổi trả. Còn không khách hàng phải báo ngay tình trạng hàng bị lỗi về cho chúng tôi trong vòng 3 ngày kể từ ngày nhận hàng để được hỗ trợ đổi mới, quá 3 ngày chúng tôi sẽ không hỗ trợ giải quyết vì mặc định khách hàng đã đồng ý với sản phẩm được giao.</p>
                            <h3 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">2. Điều kiện và quy định đổi trả chung:</h3>
                            <ul style="list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;"><em>“Một đổi một”&nbsp;</em>đối với những thiết bị bán ra trong vòng 7 ngày nếu có vấn đề trục trặc.</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Thiết bị bán ra sau 7 ngày: phòng bảo hành sẽ bảo hành có thể lên đến 30 ngày, nếu không có sản phẩm bảo hành đó, bạn sẽ được công ty chúng tôi cho mượn thiết bị khác để sử dụng tạm thời và thương lượng với bạn việc trao đổi thiết bị khác, nếu như sản phẩm bảo hành của bạn đã hết trên thị trường.</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Sản phẩm bị lỗi kỹ thuật được Phòng kỹ thuật công ty chúng tôi xác định và nhìn nhận là lỗi do nhà sản xuất.</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Còn đầy đủ bao bì, vỏ hộp, không bị trầy xước, móp méo, hỏng hóc bên ngoài, đổ vỡ..</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Còn đầy đủ linh kiện, phụ kiện</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Còn đầy đủ hóa đơn bán lẻ của cửa hàng</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Thời gian đổi hàng không quá 30 ngày kể từ khi nhận hàng (căn cứ theo hóa đơn mua hàng hoặc biên lai ký nhận của bên giao hàng).</li>
                                <li style="margin-bottom: 0.6em; margin-left: 1.3em;">Tuy nhiên đối với một số sản phẩm chúng tôi sẽ không áp dụng những điều kiện đổi trả giống như trên, trong quá trình tư vấn bán hàng chúng tôi sẽ tư vấn cụ thể về thời hạn cũng như hình thức đổi trả cho từng sản phẩm để khách hàng tham khảo khi có nhu cầu mua sản phẩm đó.</li>
                            </ul>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">CHỈ NHẬN HÀNG CÒN MỚI NGUYÊN SEAL CHƯA QUA SỬ DỤNG</p>
                            <h2 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.6em; line-height: 1.3; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">II. Quy Định Hoàn tiền</h2>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;"><span style="font-weight: bolder;">Lệ phí hoàn trả:</span>&nbsp;phí hoàn trả sẽ hoàn toàn do&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;chi trả hoàn toàn nếu lỗi đó thuộc về công ty.</p>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;"><span style="font-weight: bolder;">Hình thức hoàn trả:&nbsp;</span>Sẽ đổi mới sản phẩm cho khách hàng, trường hợp không còn sản phẩm hàng hóa đó trong kho, công ty cam kết hoàn trả 100% phí mà khách hàng đã thanh toán cho chúng tôi thông qua các hình thức như: tiền mặt tại công ty hoặc chuyển khoản cho khách hàng. Thời gian hoàn lại trong vòng 10 ngày làm việc.</p>
                            <h3 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">1. Điều kiện áp dụng</h3>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">Theo các điều khoản và điều kiện được quy định trong Chính sách Trả hàng và Hoàn tiền này và tạo thành một phần của Điều khoản dịch vụ,&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;đảm bảo quyền lợi của Người mua bằng cách cho phép gửi yêu cầu hoàn trả sản phẩm và/hoặc hoàn tiền trước khi hết hạn. Thời hạn&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;Đảm Bảo đã được qui định trong Điều khoản Dịch vụ.</p>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;"><span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;Đảm bảo là một dịch vụ cung cấp bởi&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>, theo yêu cầu của Người dùng, để hỗ trợ Người dùng trong việc giải quyết các xung đột có thể phát sinh trong quá trình giao dịch. Người dùng có thể liên hệ với nhau để thỏa thuận về việc giải quyết tranh chấp của họ hoặc báo cáo lên chính quyền địa phương có liên quan nhờ hỗ trợ họ trong việc giải quyết bất kỳ tranh chấp xảy ra trước, trong hoặc sau khi sử dụng&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;đảm bảo.</p>
                            <h3 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">2. Điều kiện trả hàng</h3>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">Người mua đồng ý rằng cô ấy/anh ấy chỉ có thể yêu cầu trả hàng và hoàn tiền trong các trường hợp sau:<br>• Người mua đã thanh toán nhưng không nhận được sản phẩm;<br>• Sản phẩm bị lỗi hoặc bị hư hại trong quá trình vận chuyển;<br>• Người bán giao sai sản phẩm cho Người mua (VD: sai kích cỡ, sai màu sắc, v.vv…);</p>
                            <h3 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">3. Không thay đổi ý định mua hàng</h3>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">Trừ khi được đề cập trong Chính sách Trả hàng và Hoàn tiền này, các trường hợp trả hàng do Người mua thay đổi ý định mua hàng sẽ không được chấp nhận.&nbsp;</p>
                            <h3 style="color: rgb(34, 34, 34); width: 1050px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Arial, Tahoma, sans-serif; font-weight: 700;">4. Hoàn tiền cho Hàng trả lại</h3>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;"><span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;sẽ chỉ hoàn tiền cho Người mua khi&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;xác nhận đã nhận được Hàng trả lại. Trong trường hợp Người mua không phản hồi trong khoảng thời gian đã được quy định trước,&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;sẽ tự động hoàn tiền cho Người mua mà không thông báo gì thêm. Tùy từng trường hợp, tiền hoàn trả sẽ được chuyển vào thẻ tín dụng/tài khoản ngân hàng được chỉ định của Người mua.</p>
                            <p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">Lưu ý: Với đơn hàng COD, Người mua có trách nhiệm phải cung cấp thông tin tài khoản ngân hàng để nhận tiền hoàn trả.</p><p style="margin-bottom: 1.3em; color: rgb(57, 57, 58); font-family: Arial, Tahoma, sans-serif;">Người mua đồng ý bồi thường và giữ cho&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;không bị thiệt hại, hoặc chống lại bất kỳ việc khiếu nại, kiện tụng, hoặc các nghĩa vụ/trách nhiệm, thiệt hại, tuyên bố, hình phạt, tiền phạt, các chi phí và phí tổn (bao gồm, nhưng không giới hạn bất kỳ chi phí giải quyết tranh chấp nào khác) có liên quan phát sinh từ hoặc có liên quan đến bất kỳ hành động nào của&nbsp;<span style="font-weight: bolder;">SmartDevice Shop</span>&nbsp;theo Chính sách Trả hàng và Hoàn tiền này.</p>
						</div>
					</div>

				</div>
			</div>
	</section>
	<!-- End About Us -->
	
	
	
@endsection