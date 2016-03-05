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
		<jsp:include page="header.jsp" />
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
					<div class="clearfix">
					</div>
				</div>
				<div class="top-nav">
					<span class="menu">列表</span>
					<ul class="nav1">
						<li><a href="index.jsp" >首页</a></li>
						<li><a href="muserlist" >用户管理</a></li>
						<li><a href="mphotoslist" class="active">相册管理</a></li>
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
						<br>
						<div class="list-group list-group-alternate">
							<table>
								<s:iterator value="#request.photoList" status="vs" var="s">
									<s:if test="#vs.count%3== 0">
										<tr>
									</s:if>
									<td>
										<a
									class="list-group-item"><span class="badge badge-primary">${s.time}</span>
									<i class="ti ti-email"></i>${s.name}</a>
								<div style="width: 200px; height: 100px ;">
									<img style="width: 200px; height: 100px" id="mainPic"
										src="upload/${s.path}" />
								</div>
								<span class="badge badge-warning"><a
									href="mphotodelete?photo.id=${s.id}">删除</a> </span>
								<span class="badge badge-warning"><a
									href="mphotoToupdate?photo.id=${s.id}">修改</a> </span>
									</td>> 
								<s:elseif test="#vs.count%3==2||#s.last">
										</tr>
									</s:elseif>
								</s:iterator>
							</table>

							<s:iterator value="#request.photosList" var="s">
								<a href="photobylist?photo.photosId=${s.id}"
									class="list-group-item"><span class="badge badge-primary">${s.num}</span>
									<i class="ti ti-email"></i>${s.name}</a>
								<div
									style="width: 200px; height: 100px ;background:'${s.lastimage}'">
									<img style="width: 200px; height: 100px" id="mainPic"
										src="${s.lastimage}" />
								</div>
								<span class="badge badge-warning"><a
									href="photosdelete?photos.id=${s.id}">删除</a> </span>
								<span class="badge badge-warning"><a
									href="photosToupdate?photos.id=${s.id}">修改</a> </span>
								<span class="badge badge-warning"><a
									href="photobylist2?photo.photosId=${s.id}">修改照片</a> </span>
							</s:iterator>
							</br>
						</div>
					</div>
					<div class="clearfix">
					</div>
				</div>
			</div>
			<!-- //container -->
		</div>
		<!-- //contact -->
		<jsp:include page="footer.jsp" />
	</body>
</html>

