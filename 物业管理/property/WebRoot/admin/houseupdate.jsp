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
						修改房产信息
					</li>
				</ol>
				<div class="margin-bottom-30">
					<div class="row">
						<div class="col-md-12">
							<form action="ahouseupdate" method="post" role="form" id="templatemo-preferences-form">
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="firstName" class="control-label">
											房屋面积
										</label>
										<input type="hidden" name="user.id" class="form-control" id="firstName"
											value="${user.id}">
										<input type="hidden" name="user.name" class="form-control" id="firstName"
											value="${user.name}">
											<input type="text" name="user.housearea" class="form-control" id="password_2"
											value="${user.housearea}">
									</div>
									<div class="col-md-6 margin-bottom-15">
										<label for="lastName" class="control-label">
											房屋户型
										</label>
										<input type="hidden" name="user.password" class="form-control" id="lastName"
											value="${user.password}">
												
											<input type="text" name="user.housetype" class="form-control" id="password_2"
											value="${user.housetype}">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="password_1">
											户主名称
										</label>
										<input type="text" name="user.uname" class="form-control" id="password_1"
											value="${user.uname}">
									</div>
									<div class="col-md-6 margin-bottom-15">
										<label for="password_2">
											房屋位置
										</label>
										<input type="text" name="user.uaddress" class="form-control" id="password_2"
											value="${user.uaddress}">
										<input type="hidden" name="user.utype" class="form-control" id="password_2"
											value="${user.utype}">
											<input type="hidden" name="user.uphone" class="form-control" id="password_1"
											value="${user.uphone}">
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
