<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<div class="header header-top">
	<div class="container">
		<!---->
			<div class="header-logo">
				<div class="logo">
				<a href="index.jsp"><img src="home/images/logo.png" alt="" ></a>
				</div>
				<div class="top-nav">
					<span class="icon"><img src="home/images/menu.png" alt=""> </span>
					<ul>
						<li>
								<a href="index.jsp">首页 </a>
							</li>
							<li>
								<a href="login.jsp">登录</a>
							</li>
							<li>
								<a href="userupdate.jsp">我的信息</a>
							</li>
					</ul>
					<!--script-->
				<script>
					$("span.icon").click(function(){
						$(".top-nav ul").slideToggle(500, function(){
						});
					});
			</script>				
		</div>
		<div class="clearfix"> </div>
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
		</div>		
</div>
<!--//header-->
