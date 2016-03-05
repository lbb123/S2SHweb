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
						<li>
							<a href="index.jsp">首页</a>
						</li>
						<li>
							<a href="register.jsp">注册</a>
						</li>
						<li>
							<a href="login.jsp">登录</a>
						</li>
						<li>
							<a href="photoslist" class="active">我的相册</a>
						</li>
						<li>
							<a href="photoadd.jsp">上传照片</a>
						</li>
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
						<a href="photos.jsp">创建相册</a>&nbsp;&nbsp;
						<a href="photoadd.jsp">上传照片</a>
						<br>
						<br>
						<div class="list-group list-group-alternate">
							<s:iterator value="#request.photosList" var="s">
								<a href="photobylist?photo.photosId=${s.id}"
									class="list-group-item"><span class="badge badge-primary">${s.num}</span>
									<i class="ti ti-email"></i>${s.name}</a>
								<div style="width: 200px; height: 100px ;background:'${s.lastimage}'">
									<img style="width: 200px; height: 100px" id="mainPic"
										src="${s.lastimage}" />
								</div>
								<span class="badge badge-warning"><a
									href="photosdelete?photos.id=${s.id}">删除</a> </span>
								<span class="badge badge-warning"><a
									href="photosToupdate?photos.id=${s.id}">修改</a> </span>
									<span class="badge badge-warning"><a
									href="photobylist3?photo.photosId=${s.id}">修改照片</a> </span>
							</s:iterator>
							</br>
							当前第
							<s:property value="#request.page.currentPage" />
							页，共
							<s:property value="#request.page.totalPage" />
							页,每页显示
							<s:property value="#request.page.everyPage" />
							条记录
							<s:if test="#request.page.hasPrePage">
								<span class="badge"><a href="photoslist?currentPage=1">首页</a>
								</span>
								<span class="badge"><a
									href="photoslist?currentPage=${page.currentPage -1 }">上一页</a>
								</span>
							</s:if>
							<s:else>
								<span class="badge">首页</span>
								<span class="badge">上一页</span>
							</s:else>

							<s:if test="#request.page.hasNextPage">
								<span class="badge"><a
									href="photoslist?currentPage=${page.currentPage + 1 }">下一页</a>
								</span>
								<span class="badge"><a
									href="photoslist?currentPage=${page.totalPage }">尾页</a>
								</span>
							</s:if>
							<s:else>
								<span class="badge">下一页</span>
								<span class="badge">尾页</span>
							</s:else>
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

