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
						<li><a href="muserlist" >用户管理</a></li>
						<li><a href="mphotoslist" class="active" >相册管理</a></li>
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
				<a href="">创建相册</a><br><br>
					<div class="col-md-6 contact-form"> 
							<form action="mphotosadd" method="post">
							<input type="text" name="photos.name" placeholder="相册名" required=""><br>
							<input type="hidden" name="photos.userId" value="777">
							<input type="submit" value="创建">
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

