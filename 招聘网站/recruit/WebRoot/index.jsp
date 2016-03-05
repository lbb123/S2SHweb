<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>招聘网</title>
		<link href="home/css/bootstrap.css" rel="stylesheet" type="text/css"
			media="all">
		<link href="home/css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords"
			content="Seen Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}</script>

		<link rel="stylesheet" href="home/css/flexslider.css" type="text/css"
			media="screen" />
		<script src="home/js/jquery-1.8.3.min.js">
</script>
		<script src="home/js/responsiveslides.min.js">
</script>
		<script>
$(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
	
  </script>

		<!---- start-smoth-scrolling---->
		<script type="text/javascript" src="home/js/move-top.js">
</script>
		<script type="text/javascript" src="home/js/easing.js">
</script>
		<script type="text/javascript">
jQuery(document).ready(function($) {
	$(".scroll").click(function(event) {
		event.preventDefault();
		$('html,body').animate( {
			scrollTop : $(this.hash).offset().top
		}, 1200);
	});
});
</script>
		<!---End-smoth-scrolling---->

	</head>
	<body>
		<!-- header -->
		<div class="header" id="home">

			<div class="header-top">
				<div class="container">
					<div class="social-icons">
                     <a href="user/index.jsp">${sessionScope.username}</a>
					</div>
					
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="container">
				<div class="header-bottom">
					<div class="logo">
						<h1>
							<a href="index.jsp">招聘网</a>
						</h1>
					</div>
					<div class="top-menu">
						<span class="menu"><img src="home/images/nav-icon.png"
								alt="" /> </span>
						<ul>
							<nav class="cl-effect-5">
							<li>
								<a href="index.jsp" ><span data-hover="首页">首页</span>
								</a>
							</li>
							<li>
								<a href="findjoblist"><span data-hover="寻找职位">寻找职位</span>
								</a>
							</li>
							<li>
								<a href="user/register.jsp"><span data-hover="个人注册">个人注册</span> </a>
							</li>
							<li>
								<a href="company/register.jsp"><span data-hover="公司注册">公司注册</span> </a>
							</li>
							<li>
								<a href="user/login.jsp"><span data-hover="个人登录">个人登录</span>
								</a>
							</li>
							<li>
								<a href="company/login.jsp"><span data-hover="公司登录">公司登录</span>
								</a>
							</li>
							</nav>
						</ul>
						<div class="clearfix"></div>
					</div>
					<!--script-nav-->
					<script>
$("span.menu").click(function() {
	$(".top-menu ul").slideToggle("slow", function() {
	});
});
</script>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<!-- header-section-ends -->
		<div class="header-slider">
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides" id="slider">
						<li>
							<img src="home/images/banner.jpg" alt="">


						</li>
						<li>
							<img src="home/images/banner1.jpg" alt="">

						</li>
					</ul>
				</div>
			</div>
		</div>
		</div>
		<div class="beautifull">
			<div class="container">
				<div class="beautifull-header">
					<h4>
						公司介绍
					</h4>
					<p>
						招聘面向大型公司和快速发展的中小企业，提供一站式专业人力资源服务，包括网络招聘、报纸招聘、校园招聘、猎头服务、招聘外包、企业培训以及人才测评等等
					</p>
				</div>

			</div>
		</div>
		<div class="checkout-section">
			<div class="container">

			</div>


			<script type="text/javascript">
jQuery(document).ready(function($) {
	$(".scroll").click(function(event) {
		event.preventDefault();
		$('html,body').animate( {
			scrollTop : $(this.hash).offset().top
		}, 1200);
	});
});
</script>
			<!-- Script for gallery Here -->
			<script type="text/javascript" src="home/js/jquery.mixitup.min.js">
</script>
			<script type="text/javascript">
$(function() {

	var filterList = {

		init : function() {

			// MixItUp plugin
		// http://mixitup.io
		$('#portfoliolist').mixitup( {
			targetSelector : '.portfolio',
			filterSelector : '.filter',
			effects : [ 'fade' ],
			easing : 'snap',
			// call the hover effect
			onMixEnd : filterList.hoverEffect()
		});

	},

	hoverEffect : function() {

		// Simple parallax effect
		$('#portfoliolist .portfolio').hover(function() {
			$(this).find('.label').stop().animate( {
				bottom : 0
			}, 200, 'easeOutQuad');
			$(this).find('img').stop().animate( {
				top : -30
			}, 500, 'easeOutQuad');
		}, function() {
			$(this).find('.label').stop().animate( {
				bottom : -40
			}, 200, 'easeInQuad');
			$(this).find('img').stop().animate( {
				top : 0
			}, 300, 'easeOutQuad');
		});

	}

	};

	// Run the show!
	filterList.init();

});
</script>

			<script>
$(document).ready(function() {
	$('.popup-with-zoom-anim').magnificPopup( {
		type : 'inline',
		fixedContentPos : false,
		fixedBgPos : true,
		overflowY : 'auto',
		closeBtnInside : true,
		preloader : false,
		midClick : true,
		removalDelay : 300,
		mainClass : 'my-mfp-zoom-in'
	});

});
</script>
			<!-- Work Ends Here -->



			<!-- requried-jsfiles-for owl -->
			<link href="home/css/owl.carousel.css" rel="stylesheet">
			<script src="home/js/owl.carousel.js">
</script>
			<script>
$(document).ready(function() {
							      $("#owl-demo").owlCarousel({
							        items :4,
							        lazyLoad : true,
							        autoPlay : true,
							        navigation : false,
							        navigationText :  false,
							        pagination : true,
							      });
							    });
							    </script>
			<!-- //requried-jsfiles-for owl -->

		</div>
		</div>



		<div class="footer-section">
			<div class="container">
				<div class="footer-left">
					<p>
						@中北大学软件学院<a href="manager/login.jsp" >&copy;&nbsp;管理员入口</a>
					</p>
					
				</div>
			</div>
	</body>
</html>
