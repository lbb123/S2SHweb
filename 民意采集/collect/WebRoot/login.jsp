<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>登录</title>
		<!-- Meta -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="" />
		<meta name="author" content="" />

		<!-- CSS Global Compulsory-->
		<link rel="stylesheet"
			href="assets/plugins/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/css/style.css" />
		<link rel="stylesheet" href="assets/css/headers/header1.css" />
		<link rel="stylesheet"
			href="assets/plugins/bootstrap/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="assets/css/style_responsive.css" />
		<link rel="shortcut icon" href="assets/img/favicon.ico" />
		<!-- CSS Implementing Plugins -->
		<link rel="stylesheet"
			href="assets/plugins/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/plugins/flexslider/flexslider.css"
			type="text/css" media="screen" />
		<link rel="stylesheet"
			href="assets/plugins/parallax-slider/css/parallax-slider.css"
			type="text/css" />
		<!-- CSS Theme -->
		<link rel="stylesheet" href="assets/css/themes/default.css"
			id="style_color" />
		<link rel="stylesheet" href="assets/css/themes/headers/default.css"
			id="style_color-header-1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>

	<body style="background: #ccc">

		<!--=== Top ===-->
		<div class="top">
			<div class="container">
				<ul class="loginbar pull-right">
					<li>
						<a href="index.jsp" class="login-btn">社情民意采集与管理系统首页</a>
					</li>
				</ul>
			</div>
		</div>
		<!--/top-->
		<!--=== End Top ===-->


		<!--=== Content Part ===-->
		<div class="container">
			<div class="row-fluid">
				<form class="log-page" method="post" action="userlogin" />
					<h3>
						登录
					</h3>
					${nologin}
					<div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i>
						</span>
						<input class="span12 border-radius-none" name="user.name"
							type="text" placeholder="账户名" />
					</div>
					<div class="input-prepend">
						<span class="add-on"><i class="icon-lock"></i>
						</span>
						<input class="span12 border-radius-none" name="user.password"
							type="password" placeholder="密码" />
					</div>
					<div class="controls form-inline">
						<button class="btn-u pull-left" type="submit">
							登录
						</button>
					</div>
					<hr />
				</form>
			</div>
			<!--/row-fluid-->
		</div>
		<!--/container-->
		<!--=== End Content Part ===-->
	</body>
</html>
