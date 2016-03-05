<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>
<title>相册</title>
<base href="<%=basePath%>">
<jsp:include page="header.jsp"/> 		
</head>
<body>
	<!-- banner -->
	<div class="banner">
		<!-- container -->
		<div class="container">
			<div class="header">
				<div class="logo">
					<a href="index.jsp">WelcomePhoto</a>
				</div>
				<div class="icons">
					<ul>
						
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="top-nav">
					<span class="menu">列表</span>
					<ul class="nav1">
						<li><a href="index.jsp" class="active">首页</a></li>
						<li><a href="muserlist">用户管理</a></li>
						<li><a href="mphotoslist" >相册管理</a></li>
						<li><a href="login.jsp">退出</a></li>
						<li><a href="out">退出</a></li>
					</ul>
			</div>
		</div>
		<!-- //container -->
		<div class="banner-text">
			<!-- container -->
			<div class="container">
				<ul>
					<li>网上相册</li>
					<li><a href="mailto:example@email.com">E-mail :NUC@nuc.com</a></li>
				</ul>
			</div>
			<!-- //container -->
		</div>
	</div>	
	<!-- //banner -->
	<!-- banner-bottom -->
	<div class="banner-top-slide">
		<div class="banner-bottom-top">
			<h4>欢迎您</h4>
			<p>${sessionScope.mname}</p>
		</div>
		<div class="banner-bottom-bottom">
			<div class="banner-top-slide-grids">
				<script src="js/responsiveslides.min.js"></script>
					<script>
						// You can also use "$(window).load(function() {"
						$(function () {
						  // Slideshow 4
						  $("#slider3").responsiveSlides({
							auto: true,
							pager: true,
							nav: false,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
						  });
					
						});
					</script>
					<div  id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li>
								<div class="banner-slid">
									<h3>新闻1</h3>
									<p>新闻内容1
									</p>
								</div>
							</li>
							<li>
								<div class="banner-slid">
									<h3>新闻2</h3>
									<p>新闻内容2
									</p>
								</div>
							</li>
						</ul>
					</div>
			</div>
		</div>
	</div>
	<!-- //news -->
	<jsp:include page="footer.jsp"/> 
</body>
</html>

