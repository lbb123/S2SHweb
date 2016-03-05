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
											单位名称/委员名称
										</label>
										<input type="text" name="user.uname" class="form-control" id="password_1"
											placeholder="单位/委员名称">
									</div>
									<div class="col-md-6 margin-bottom-15">
										<label for="password_2">
											用户类别
										</label>
										<input type="text" name="user.utype" class="form-control" id="password_2"
											placeholder="用户类别">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="singleSelect">
											用户权限
										</label>
										<select name="user.urole" class="form-control margin-bottom-15"
											id="singleSelect">
											<option>
												上报信息单位
											</option>
											<option>
												全国政协
											</option>
											<option>
												专报省委省政府相关领导
											</option>
											<option>
												省级部门
											</option>
											<option>
												相关部门
											</option>
											
										</select>
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
