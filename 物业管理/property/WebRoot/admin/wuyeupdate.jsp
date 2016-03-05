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
						修改物业费
					</li>
				</ol>
				<div class="margin-bottom-30">
					<div class="row">
						<div class="col-md-12">
							<form action="adminwuyeupdate" method="post" role="form" id="templatemo-preferences-form">
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="firstName" class="control-label">
											户主：${user.uname}
										</label>
										<input type="hidden" name="wuye.uid" class="form-control" id="firstName"
											value="${user.id}">
											<input type="hidden" name="wuye.wid" class="form-control" id="firstName"
											value="${wuye.wid}">
										<input type="hidden" name="wuye.uname" class="form-control" id="firstName"
											value="${user.uname}">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="lastName" class="control-label">
											位置：${user.uaddress}
										</label>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="notes">
												物业费用账单详情
											</label>
											<textarea name="wuye.wdetail" class="form-control" rows="3" id="notes">${wuye.wdetail}</textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 margin-bottom-15">
										<label for="password_2">
											    应缴纳总费用
										</label>
										<input type="text" name="wuye.wprice" class="form-control" id="password_2"
											value="${wuye.wprice}">
									</div>
								</div>
								<div class="row">
										<div class="col-md-6 margin-bottom-15">
											<label for="lastName" class="control-label">
												缴费状态
											</label>
											<select name="wuye.wtype"
												class="form-control margin-bottom-15" id="singleSelect">
												<option selected="selected">
													${wuye.wtype}
												</option>
												<option>
													未缴费
												</option>
												<option>
													已缴费
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
