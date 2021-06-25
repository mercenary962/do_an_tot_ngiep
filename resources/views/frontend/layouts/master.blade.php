<!DOCTYPE html>
<html lang="zxx">
<head>
	@include('frontend.layouts.head')	
</head>
<body class="js">
	
	{{-- <!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div id="progressive">
				<div>
					<h1 class="loadFont text-center">Đang tải...</h1>
				</div>
				<div class="progress" id="shadow" >
					<div class="progress-bar progress-bar-danger six-sec-ease-in-out" role="progressbar" data-transitiongoal="100"></div>
				</div>
			 </div>
		</div>
	</div>
	<!-- End Preloader --> --}}
	
	@include('frontend.layouts.notification')
	<!-- Header -->
	@include('frontend.layouts.header')
	<!--/ End Header -->
	@yield('main-content')
	
	@include('frontend.layouts.footer')

</body>
</html>


	