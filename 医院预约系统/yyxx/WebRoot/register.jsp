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

		<title>注册</title>
		<link rel="icon" type="image/ico" href="images/fav.ico">
		<jsp:include page="admin/header.jsp" />
	</head>
	<body class="bootstrap-admin-with-small-navbar"
		style="background: #ccc">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<form method="post" action="useradd"
						class="bootstrap-admin-login-form">
						<h1>
							注册
						</h1>
						${nologin}
						<br>
						<div class="form-group">
							账户(必填)
							<input class="form-control" type="text" name="user.name"
								placeholder="用户名">
						</div>
						<div class="form-group">
							密码(必填)
							<input class="form-control" type="password" name="user.password"
								placeholder="Password">
						</div>
						<div class="form-group">
							邮箱(必填)
							<input class="form-control" type="text" name="user.email"
								placeholder="email">
						</div>
						<div class="form-group">
							性别(必填)<br>
							<input  type="radio" name="user.sex"
								value="男" placeholder="男">
							男
							<input  type="radio" name="user.sex"
								value="女" placeholder="女">
							女
						</div>
						<div class="form-group">
							手机(必填)
							<input class="form-control" type="text" name="user.phone"
								placeholder="手机">
						</div>
						<div class="form-group">
							年龄(必填)
							<input class="form-control" type="text" name="user.uage"
								placeholder="年龄">
						</div>
						<div class="form-group">
							姓名(必填)
							<input class="form-control" type="text" name="user.uname"
								placeholder="姓名">
						</div>
						<div class="form-group">
							户籍(可选)
							<input class="form-control" type="text" name="user.uaddress"
								placeholder="户籍">
						</div>

						<button class="btn btn-lg btn-primary" type="submit">
							注册
						</button>
					</form>

				</div>
			</div>
		</div>
	</body>
</html>
