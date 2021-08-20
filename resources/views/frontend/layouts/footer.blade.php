
	<!-- Start Footer Area -->
	<footer class="footer">
		<!-- Footer Top -->
		<div class="footer-top section">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer about">
							<div class="logo">
								<img src="{{asset('backend/img/logo.gif')}}" alt="#">
							</div>
							@php
								$settings=DB::table('settings')->get();
							@endphp
							<p class="text">@foreach($settings as $data) {{$data->summary}} @endforeach</p>
							<p class="call">Xin vui lòng liên hệ để được giải đáp thắc mắc:<span><a href="tel:0377592469">@foreach($settings as $data) {{$data->phone}} @endforeach</a></span></p>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-2 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer links">
							<h4>Thông tin</h4>
							<ul>
								<li><a href="{{route('about-us')}}">Giới thiệu</a></li>
								<li><a href="#">Các câu hỏi thường gặp</a></li>
								<li><a href="#">Điều khoản và Điều kiện</a></li>
								<li><a href="{{route('contact')}}">Liên hệ</a></li>
								<li><a href="#">Trợ giúp</a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-2 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer links">
							<h4>Dịch vụ chăm sóc khách hàng</h4>
							<ul>
								<li><a href="#">Phương thức thanh toán</a></li>
								<li><a href="#">Chính sách hoàn tiền</a></li>
								<li><a href="#">Chính sách đổi trả</a></li>
								<li><a href="#">Vận chuyển</a></li>
								<li><a href="#">Chính sách bảo mật</a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer social">
							<h4>Liên hệ</h4>
							<!-- Single Widget -->
							<div class="contact">
								<ul>
									<li>@foreach($settings as $data) {{$data->address}} @endforeach</li>
									<li>@foreach($settings as $data) {{$data->email}} @endforeach</li>
									<li>@foreach($settings as $data) {{$data->phone}} @endforeach</li>
								</ul>
							</div>
							<!-- End Single Widget -->
							<div class="sharethis-inline-follow-buttons"></div>
						</div>
						<!-- End Single Widget -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Top -->
		<div class="copyright">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="left">
								<p>Bản quyền thuộc về © {{date('Y')}} <a href="https://github.com/mercenary962" target="_blank">HennryJones</a></p>
							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="right">
								<img src="{{asset('backend/img/payments.png')}}" alt="#">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Messenger Plugin chat Code -->
		<div id="fb-root"></div>

		<!-- Your Plugin chat code -->
		<div id="fb-customer-chat" class="fb-customerchat">
		</div>
	
		
	</footer>
	<!-- /End Footer Area -->
 
	<!-- Jquery -->
    <script src="{{asset('frontend/js/jquery.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery-migrate-3.0.0.js')}}"></script>
	<script src="{{asset('frontend/js/jquery-ui.min.js')}}"></script>
	<!-- Popper JS -->
	<script src="{{asset('frontend/js/popper.min.js')}}"></script>
	<!-- Bootstrap JS -->
	<script src="{{asset('frontend/js/bootstrap.min.js')}}"></script>
	<!-- Color JS -->
	<script src="{{asset('frontend/js/colors.js')}}"></script>
	<!-- Slicknav JS -->
	<script src="{{asset('frontend/js/slicknav.min.js')}}"></script>
	<!-- Owl Carousel JS -->
	<script src="{{asset('frontend/js/owl-carousel.js')}}"></script>
	<!-- Magnific Popup JS -->
	<script src="{{asset('frontend/js/magnific-popup.js')}}"></script>
	<!-- Waypoints JS -->
	<script src="{{asset('frontend/js/waypoints.min.js')}}"></script>
	<!-- Countdown JS -->
	<script src="{{asset('frontend/js/finalcountdown.min.js')}}"></script>
	<!-- Nice Select JS -->
	<script src="{{asset('frontend/js/nicesellect.js')}}"></script>
	<!-- Flex Slider JS -->
	<script src="{{asset('frontend/js/flex-slider.js')}}"></script>
	<!-- ScrollUp JS -->
	{{-- <script src="{{asset('frontend/js/scrollup.js')}}"></script> --}}
	<!-- Onepage Nav JS -->
	<script src="{{asset('frontend/js/onepage-nav.min.js')}}"></script>
	{{-- Isotope --}}
	<script src="{{asset('frontend/js/isotope/isotope.pkgd.min.js')}}"></script>
	<!-- Easing JS -->
	<script src="{{asset('frontend/js/easing.js')}}"></script>

	<!-- Active JS -->
	<script src="{{asset('frontend/js/active.js')}}"></script>
	<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=60c80794bd79e90012d61b61&product=inline-follow-buttons" async="async"></script>

	
	@stack('scripts')
	<script>
		setTimeout(function(){
		  $('.alert').slideUp();
		},5000);
		$(function() {
		// ------------------------------------------------------- //
		// Multi Level dropdowns
		// ------------------------------------------------------ //
			$("ul.dropdown-menu [data-toggle='dropdown']").on("click", function(event) {
				event.preventDefault();
				event.stopPropagation();

				$(this).siblings().toggleClass("show");


				if (!$(this).next().hasClass('show')) {
				$(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
				}
				$(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
				$('.dropdown-submenu .show').removeClass("show");
				});

			});
		});
	  </script>

<script>
	var chatbox = document.getElementById('fb-customer-chat');
	chatbox.setAttribute("page_id", "100322862315531");
	chatbox.setAttribute("attribution", "biz_inbox");
	window.fbAsyncInit = function() {
	  FB.init({
		xfbml            : true,
		version          : 'v11.0'
	  });
	};

	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
  </script>