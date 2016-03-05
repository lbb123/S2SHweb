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
						<li><a href="index.jsp" >首页</a></li>
						<li><a href="register.jsp">注册</a></li>
						<li><a href="login.jsp" >登录</a></li>
						<li><a href="photoslist" class="active">我的相册</a></li>
						<li><a href="photoadd.jsp">上传照片</a></li>
						<li><a href="out">退出</a></li>
					</ul>
			</div>
		</div>
		<!-- //container -->
	</div>	
	<!-- //banner -->
	<!-- contact -->
	<div class="contact-top">
		<!-- container -->
		<div class="container">
			
			<div class="mail-grids">
			
				<div class="col-md-6">
				<a href="">修改相册</a><br><br>
					<div class="col-md-6 contact-form"> 
							<form action="photosupdate" method="post">
							<input type="hidden" name="photos.id" placeholder="" required="" value="${photos.id}"><br>
							<input type="text" name="photos.name" placeholder="" value="${photos.name}">
							<input type="hidden" name="photos.userId" value="${photos.userId}">
							<input type="hidden" name="photos.lastimage" value="${photos.lastimage}">
							<input type="submit" value="修改">
						</form>
					</div>
			   </div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //contact -->
	<jsp:include page="footer.jsp"/> 
</body>
</html>

