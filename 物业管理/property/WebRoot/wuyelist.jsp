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

		<jsp:include page="header.jsp" />
		<!--content-->
		<div class="container">
		<div class="page">
			<!--alerts-->
			<div class="page-header">
				<h1>
					物业费信息
				</h1>
			</div>
			<s:iterator value="#request.wuyeList" status="vs" var="s">
			<div class="alert alert-info" role="alert">
				<strong>缴费状态:</strong>${s.wtype} &nbsp;&nbsp;<strong>应缴费:</strong>${s.wprice}&nbsp;&nbsp;<strong>账单详情:</strong>${s.wdetail}&nbsp;&nbsp;<strong>通知时间:</strong>${s.wdate}&nbsp;&nbsp;<strong>操作：<a href="userwuyeupdate?wuye.wid=${s.wid}">缴费</a></strong>
			</div>
			</s:iterator>
			<h3 class="grid2">
				<span class="label label-warning">上一页</span>
				<span class="label label-primary">共页</span>
				<span class="label label-success">下一页</span>
			</h3>
		</div>
		</div>
		</div>

		<!--//content-->
		<!--footer-->
		<jsp:include page="footer.jsp" />
	</body>
</html>
