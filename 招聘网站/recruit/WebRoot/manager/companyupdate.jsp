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
		<title>管理员中心</title>
		<jsp:include page="header.jsp" />
	</head>

	<body class="bootstrap-admin-with-small-navbar">
		<jsp:include page="left.jsp" />

		<!-- content -->
		<div class="col-md-10">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<h1>
							修改密码
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel"
						style="height: 900">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">

							</div>
						</div>
						<div
							class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">

							<form role="form" method="post" action="mcompanyupdate">

								<label for="exampleInputPassword1">
									公司账户名 (数字/字母)
								</label>
								<div class="form-group">
									<input class="form-control" type="text" name="company.name"
										value="${company.name}">
								</div>
								<label for="exampleInputPassword1">
									密码
								</label>
								<div class="form-group">
									<input class="form-control" type="password"
										name="company.password" value="${company.password}">
								</div>
								<label for="exampleInputPassword1">
									企业名称
								</label>
								<div class="form-group">
									<input class="form-control" type="text"
										name="company.companyname" value="${company.companyname}"
										placeholder="">
								</div>
								<label for="exampleInputPassword1">
									企业电话
								</label>
								<div class="form-group">
									<input class="form-control" type="text" name="company.phone"
										value="${company.phone}" placeholder="">
								</div>
								<label for="exampleInputPassword1">
									企业邮箱
								</label>
								<div class="form-group">
									<input class="form-control" type="text" name="company.email"
										value="${company.email}">
								</div>
								<label for="exampleInputPassword1">
									企业地址
								</label>
								<div class="form-group">
									<input class="form-control" type="text" name="company.address"
										value="${company.address}">
								</div>
								<label for="exampleInputPassword1">
									企业简介
								</label>
								<div class="form-group">
									<input type="hidden" name="company.id" value="${company.id}" />
									<textarea class="form-control" type="text"
										name="company.introduction" >${company.introduction}</textarea>
								</div>
								<button type="submit" class="btn btn-primary">
									提交
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
		</div>
		</div>
		<jsp:include page="footer.jsp" />
	</body>
</html>
