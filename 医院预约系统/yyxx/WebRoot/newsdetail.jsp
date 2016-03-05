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
		<title>新闻中心</title>
		<jsp:include page="header.jsp" />
		<!--=== Breadcrumbs ===-->
		<div class="row-fluid breadcrumbs margin-bottom-20">
			<div class="container">
				<h1 class="pull-left">
					新闻中心
				</h1>
				<ul class="pull-right breadcrumb">
					<li>
						<a href="index.jsp">首页</a>
						<span class="divider">/</span>
					</li>
					<li class="active">
						新闻中心
					</li>
				</ul>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
		<!--=== Content Part ===-->
		<!--=== Content Part ===-->
		<div class="container">
			<div class="row-fluid">
				<div class="row-fluid margin-bottom-20">
					<div class="headline">
						<h4>
							${news.ntitle}
						</h4>
					</div>
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">
							&times;
						</button>
						<h4>
							${news.ntitle}-${news.ndate}-${news.nauthor}
						</h4>
						${news.ncontent}
					</div>
				</div>
				<!--/row-fluid-->
			</div>
		</div>
		<!--=== End Content Part ===-->

		<jsp:include page="footer.jsp" />
		</body>
</html>
