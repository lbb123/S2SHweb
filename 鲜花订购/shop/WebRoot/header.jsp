<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
   <meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!--meta info-->
		<meta name="author" content="">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="icon" type="image/ico" href="images/fav.ico">
		<!--stylesheet include-->
		<link rel="stylesheet" type="text/css" media="all"
			href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="css/camera.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="css/owl.carousel.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="css/owl.transitions.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="css/jquery.custom-scrollbar.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="css/style.css">
		<!--font include-->
		<link href="css/font-awesome.min.css" rel="stylesheet">
	</head>

	<body>
		<!--boxed layout-->
		<div class="boxed_layout relative w_xs_auto">
			<!--markup header-->
			<header role="banner">
			<!--header top part-->
			<section class="h_top_part">
			<div class="container">
				<div class="row clearfix">
					<div class="col-lg-4 col-md-4 col-sm-5 t_xs_align_c">
						<p class="f_size_small">
							欢迎您&nbsp;${sessionScope.user.name}
							<a href="login.jsp" >登录</a>或
							<a href="register.jsp">注册</a>
						</p>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-2 t_align_c t_xs_align_c">
						<p class="f_size_small">
							<b class="color_dark"></b>
						</p>
					</div>
					<nav class="col-lg-4 col-md-4 col-sm-5 t_align_r t_xs_align_c">
					<ul
						class="d_inline_b horizontal_list clearfix f_size_small users_nav">
						<li>
							<a href="userdetail.jsp" class="default_t_color">我的信息</a>
						</li>
						<li>
							<a href="mycart" class="default_t_color">我的购物车</a>
						</li>
						<li>
							<a href="orderlist" class="default_t_color">我的订单</a>
						</li>
						<li>
							<a href="mymessage" class="default_t_color">我的留言</a>
						</li>
						<li>
							<a href="out" class="default_t_color">退出</a>
						</li>
					</ul>
					</nav>
				</div>
			</div>
			</section>
				<!--header bottom part-->
			<section class="h_bot_part container">
			<div class="clearfix row">
				<div class="col-lg-6 col-md-6 col-sm-4 t_xs_align_c">
					<a href="index.jsp" class="logo m_xs_bottom_15 d_xs_inline_b">
						<img src="images/logo.png" alt=""> </a>
				</div>
				<form method="post" action="querygoodslist">
					<input type="text" name="goods.gname" placeholder="请输入你想要的鲜花"
						class="f_size_small">
					&nbsp;&nbsp;&nbsp;<input type="submit" value="搜索" class="f_size_large" style="color: red">
				</form>
				<div class="col-lg-6 col-md-6 col-sm-8 t_align_r t_xs_align_c">
					<ul
						class="d_inline_b horizontal_list clearfix t_align_l site_settings">

					</ul>
				</div>
			</div>
			</section>
				<!--main menu container-->
			<section class="menu_wrap relative">
			<div class="container clearfix">
				<!--button for responsive menu-->
				<button id="menu_button"
					class="r_corners centered_db d_none tr_all_hover d_xs_block m_bottom_10">
					<span class="centered_db r_corners"></span>
					<span class="centered_db r_corners"></span>
					<span class="centered_db r_corners"></span>
				</button>
				<!--main menu-->
				<nav role="navigation" class="f_left f_xs_none d_xs_none">
				<ul class="horizontal_list main_menu clearfix">
					<li class="relative f_xs_none m_xs_bottom_5">
						<a href="index.jsp"
							class="tr_delay_hover color_light tt_uppercase"><b>首页</b>
						</a>
					</li>
					<li class="relative f_xs_none m_xs_bottom_5">
						<a href="allgoodslist"
							class="tr_delay_hover color_light tt_uppercase"><b>全部商品</b>
						</a>
					</li>
					<li class="relative f_xs_none m_xs_bottom_5">
						<a href="querygoodslist?goods.gtype=1"
							class="tr_delay_hover color_light tt_uppercase"><b>特价商品</b>
						</a>
					</li>
					<li class="relative f_xs_none m_xs_bottom_5">
						<a href="querygoodslist?goods.gtype=0" class="tr_delay_hover color_light tt_uppercase"><b>畅销商品</b>
						</a>
					</li>
					<li class="relative f_xs_none m_xs_bottom_5">
						<a href="mycart"
							class="tr_delay_hover color_light tt_uppercase"><b>购物车</b>
						</a>
					</li>
				</ul>
				</nav>
			</div>
			</header>