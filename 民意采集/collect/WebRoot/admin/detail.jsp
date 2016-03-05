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
						民意信息列表
					</li>
				</ol>
				<div class="margin-bottom-30">
					<div class="row">
						<div class="col-md-12">
							<div class="alert alert-success alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<strong>标题：</strong> Maecenas non lorem sed elit molestie
								tincidunt.
							</div>
							<div class="alert alert-success alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<strong>内容：</strong> Maecenas non lorem sed elit molestie
								tincidunt.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/admin/footer.jsp" />
	</body>
</html>
