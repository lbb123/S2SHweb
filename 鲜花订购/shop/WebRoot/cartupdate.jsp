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

		<title>修改</title>
		<link rel="icon" type="image/ico" href="images/fav.ico">
		<jsp:include page="admin/header.jsp" />
	</head>
	<body class="bootstrap-admin-with-small-navbar"
		style="background: #ccc">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<form method="post" action="cartupdate"
						class="bootstrap-admin-login-form">
						<h1>
							修改商品数量
						</h1>
						<br>
						<div class="form-group">
						<input class="form-control" type="hidden" name="orderitem.gid"
								value="<s:property value="#parameters.goodsgid" />">
							<input class="form-control" type="text" name="orderitem.gnum"
								>
						</div>
						<button class="btn btn-lg btn-primary" type="submit">
							修改
						</button>
					</form>

				</div>
			</div>
		</div>
	</body>
</html>
