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
		<title>咨询</title>
		<jsp:include page="header.jsp" />
		<!--=== Breadcrumbs ===-->
		<div class="row-fluid breadcrumbs margin-bottom-20">
			<div class="container">
				<h1 class="pull-left">
					咨询回复
				</h1>
				<ul class="pull-right breadcrumb">
					<li>
						<a href="index.jsp">首页</a>
						<span class="divider">/</span>
					</li>
					<li class="active">
						咨询回复
					</li>
				</ul>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
		<!--=== Content Part ===-->
		<div class="container">
			<div class="row-fluid">
				<div class="span9">
					<div class="headline">
					</div>
					<table class="table">
						<thead>
							<tr class="info">
								<th>
									回复内容
								</th>
								<th>
									回复时间
								</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.replyList" status="vs" var="s">
								<tr class="success">
									<td>
										${s.rcontent}
									</td>
									<td>
										${s.rdate}
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
			<!--/row-fluid-->
			<!--//Default Tables styles -->
		</div>
		<!--/container-->
		<!--=== End Content Part ===-->

		<jsp:include page="footer.jsp" />
		</body>
</html>
