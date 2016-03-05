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

		<title>管理</title>
		<jsp:include page="/admin/header.jsp" />

		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">
				<ol class="breadcrumb">
					<li>
						<a href="admin/index.jsp">首页</a>
					</li>
					<li class="active">
						添加用户
					</li>
				</ol>
				<div class="margin-bottom-30">
					<div class="row">
						<div class="col-md-12">
							<form action="useradd" method="post" role="form" id="templatemo-preferences-form">
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="firstName" class="control-label">
											用户账户名
										</label>
										<input type="text" name="user.name" class="form-control" id="firstName"
											placeholder="账户名">
									</div>
									<div class="col-md-6 margin-bottom-15">
										<label for="lastName" class="control-label">
											密码
										</label>
										<input type="password" name="user.password" class="form-control" id="lastName"
											placeholder="Password">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="password_1">
											户主名称
										</label>
										<input type="text" name="user.uname" class="form-control" id="password_1"
											placeholder="户主名称">
									</div>
									<div class="col-md-6 margin-bottom-15">
										<label for="password_2">
											户主地址
										</label>
										<input type="text" name="user.uaddress" class="form-control" id="password_2"
											placeholder="户主地址">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="password_1">
											户主手机
										</label>
										<input type="text" name="user.uphone" class="form-control" id="password_1"
											placeholder="户主手机">
									</div>
									<div class="col-md-6 margin-bottom-15">
										<label for="password_1">
											房屋面积
										</label>
										<input type="text" name="user.housearea" class="form-control" id="password_1"
											placeholder="房屋面积">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="password_2">
											房屋户型
										</label>
										<input type="text" name="user.housetype" class="form-control" id="password_2"
											placeholder="房屋户型">
											<input type="hidden" name="user.utype" class="form-control" id="password_2"
											value="备用字段">
									</div>
								</div>

								<div class="row templatemo-form-buttons">
									<div class="col-md-12">
										<button type="submit" class="btn btn-primary">
											提交
										</button>
										<button type="reset" class="btn btn-default">
											重置
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
		<jsp:include page="/admin/footer.jsp" />
		</body>
</html>
