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
					咨询内容
				</h1>
				<ul class="pull-right breadcrumb">
					<li>
						<a href="index.jsp">首页</a>
						<span class="divider">/</span>
					</li>
					<li class="active">
						咨询内容
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
					<div class="span6">
						<div class="headline">
						</div>
						<form action="messageadd" method="post">
							<label>
								请写下你想咨询的内容
							</label>
							<input  type="hidden" name="message.did"
								value="<s:property value="#parameters.doctorid" />">
								<input  type="hidden" name="message.uid"
								value="${sessionScope.user.id}">
							<textarea name="message.mcontent" class="span12 border-radius-none" rows="8"></textarea>
							<button type="submit" class="btn-u pull-right">
								提交
							</button>
						</form>
					</div>
				</div>
				<!--/row-fluid-->
			</div>
		</div>
		<!--=== End Content Part ===-->

		<jsp:include page="footer.jsp" />
		</body>
</html>
