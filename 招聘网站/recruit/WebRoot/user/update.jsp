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
		<title>个人中心</title>
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

							<form role="form" method="post" action="userupdate">

								<div class="form-group">
									<label for="exampleInputPassword1">
										新密码
									</label>
									<input class="form-control" id="exampleInputPassword1"
										type="password" name="user.password" />
										<input type="hidden" name="user.name" value="${user.name}"/>
										<input type="hidden" name="user.id" value="${user.id}"/>
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
