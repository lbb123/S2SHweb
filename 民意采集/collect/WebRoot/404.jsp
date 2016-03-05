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
		<title>错误</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width">
		<link rel="stylesheet" href="css/templatemo_main.css">
		<link rel="icon" type="image/ico" href="assets/img/favicon.ico">
	</head>
	<body>
		<div id="main-wrapper">
			<div class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">
					<div class="logo">
						<h1>
							<a href="index.jsp">社情民意采集与管理系统</a>
						</h1>
					</div>
				</div>
			</div>
			<div class="template-page-wrapper">
				<div class="templatemo-content-wrapper">
					<div class="form-horizontal templatemo-signin-form">

						<ol class="breadcrumb">
							<li>
								<h1>
									404:错误
								</h1>
							</li>
						</ol>
						<ol class="breadcrumb">
							<li>
								<h1>
									页面出错了，找不到访问页面
								</h1>
							</li>
						</ol>

						<ol class="breadcrumb">
							<li>
								<a href="index.jsp">首页</a>
							</li>
							<li class="active">
								<a onclick="javascript:history.go(-1);">返回上一页</a>
							</li>
						</ol>
					</div>
				</div>
	</body>
</html>
