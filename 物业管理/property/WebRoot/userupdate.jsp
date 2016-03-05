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

		<jsp:include page="header.jsp" />
		<!--content-->
		<div class="container">
			<div class="page">
				<!--button-->
				<div class="grid_3 grid_4">
					<div class="page-header">
						<h3>
							我的信息
						</h3>
					</div>

					<div class="bs-example">
						<form action="myuserupdate" method="post">
							<table class="table">
								<tbody>
									<tr>
										<td>
											<h3 id="h3-bootstrap-heading">
												账户名：${sessionScope.user.name}
											</h3>
										</td>
									</tr>
									<tr>
										<td>
											<h3 id="h3-bootstrap-heading">
												密码：<input name="user.password" type="password" value="${sessionScope.user.password}">
											</h3>
										</td>
									</tr>
									<tr>
										<td>
											<h3 id="h3-bootstrap-heading">
												户主名称：<input name="user.uname" type="text" value="${sessionScope.user.uname}">
											</h3>
										</td>
									</tr>
									<tr>
										<td>
											<h3 id="h3-bootstrap-heading">
												我的住址：${sessionScope.user.uaddress}
											</h3>
										</td>
									</tr>
									<tr>
										<td>
											<h3 id="h3-bootstrap-heading">
												手机号：<input name="user.uphone" type="text" value="${sessionScope.user.uphone}">
												<input name="user.id" type="hidden" value="${sessionScope.user.id}">
											</h3>
										</td>
									</tr>
									<tr>
										<td>
											<h3 id="h3-bootstrap-heading">
												我的房屋类型：${sessionScope.user.housetype}
											</h3>
										</td>
									</tr>
									<tr>
										<td>
											<h3 id="h3-bootstrap-heading">
												我的房屋面积：${sessionScope.user.housearea}
											</h3>
										</td>
									</tr>

								</tbody>
							</table>
							<button type="submit" class="btn btn-1 btn-success">
								修改
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--//content-->
		<!--footer-->
		<jsp:include page="footer.jsp" />
		</body>
</html>
