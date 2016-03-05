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

		<title>物业管理系统</title>
		<link rel="shortcut icon" href="home/fav2.ico" />
		<link href="home/css/bootstrap.css" rel="stylesheet" type="text/css"
			media="all" />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="home/js/jquery.min.js">
</script>
		<!-- Custom Theme files -->
		<!--theme-style-->
		<link href="home/css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<!--//theme-style-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords"
			content="Decoline Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}</script>
		<!--flexslider-->
		<link rel="stylesheet" href="home/css/flexslider.css" type="text/css"
			media="screen" />
		<!--//flexslider-->
	</head>
	<body>
		<!--header-->
		<div class="header">
			<div class="container">
				<!---->
				<div class="header-logo">
					<div class="logo">
						<a href="index.jsp"><img src="home/images/logo.png" alt="">
						</a>
					</div>
					<div class="top-nav">
						<span class="icon"><img src="home/images/menu.png" alt="">
						</span>
						<ul>
							<li>
								<a href="index.jsp">首页${sessionScope.user.name} </a>
							</li>
							<li>
								<a href="login.jsp">登录</a>
							</li>
							<li>
								<a href="userdatail.jsp">我的信息</a>
							</li>
						</ul>
						<!--script-->
						<script>
$("span.icon").click(function() {
	$(".top-nav ul").slideToggle(200, function() {
	});
});
</script>
					</div>
					<div class="clearfix">
					</div>
				</div>
				<!---->
				<div class="top-menu">
					<ul>
						<li>
							<a href="login.jsp" data-hover="${sessionScope.user.name}登录">${sessionScope.user.name}登录</a>
						</li>
						<li>
							<a href="userupdate.jsp" data-hover="我的信息">我的信息</a>
						</li>
						<li>
							<a href="index.jsp"><img src="home/images/logo.png" alt="">
							</a>
						</li>
						
						<li>
							<a href="mywuyelist" data-hover="缴费情况">缴费情况</a>
						</li>
						<li>
							<a href="out" data-hover="退出">退出</a>
						</li>
					</ul>
				</div>
				<!--script-->
				<div class="banner">
					<div class="slider">
						<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<div class="banner-matter">
										<h3>
											用心做更好的服务
										</h3>
										<a href="index.jsp" class="hvr-rectangle-out">更好</a>
									</div>
								</li>
								<li>
									<div class="banner-matter">
										<h3>
											用心做更好的服务
										</h3>
										<a href="index.jsp" class="hvr-rectangle-out">更好</a>
									</div>
								</li>
								<li>
									<div class="banner-matter">
										<h3>
											用心做更好的服务
										</h3>
										<a href="index.jsp" class="hvr-rectangle-out">更好</a>
									</div>
								</li>
							</ul>
						</div>

						</section>
						<script>
window.jQuery
		|| document
				.write('<script src="home/js/libs/jquery-1.7.min.js">\x3C/script>')</script>
						<!--FlexSlider-->
						<script defer src="home/js/jquery.flexslider.js">
</script>
						<script type="text/javascript">
$(function() {
	SyntaxHighlighter.all();
});
$(window).load(function() {
	$('.flexslider').flexslider( {
		animation : "slide",
		start : function(slider) {
			$('body').removeClass('loading');
		}
	});
});
</script>
					</div>
				</div>

			</div>

		</div>
		<!--//header-->

		<!--content-->
		<div class="content">
			<div class="container">
			</div>
			<!--content-mid-->
			<div class="content-mid">
				<div class="container">
					<div class="content-mid-top">
						<h2>
							物业管理系统
						</h2>
						<p>
							物业管理系统欢迎您使用
						</p>

					</div>
				</div>
			</div>
			<!--//content-mid-->
		</div>
		<!--//content-->
		<!--footer-->
		<div class="footer">
			<div class="container">
				<div class="footer-top">
				</div>
				<p class="footer-class">
					物业管理系统 &copy;  2016.中北大学软件学院.<a target="_blank" href="admin/login.jsp">管理员入口</a>
				</p>
			</div>
		</div>
		<!--//footer-->
	</body>
</html>
