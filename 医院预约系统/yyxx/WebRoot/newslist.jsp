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
						<h3>
							最新新闻
						</h3>
					</div>
					<s:iterator value="#request.newsList" status="vs" var="s">
					<div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">
							&times;
						</button>
						<a href="newsdetail?news.nid=${s.nid}"><strong>${s.ntitle}&nbsp;--</strong>${s.ndate}- ${s.nauthor}</a>
					</div>
					</s:iterator>
					<div class="pagination pagination-centered">
						<ul>
							<s:if test="#request.page.hasPrePage">
								<li>
									<a href="newslist?currentPage=${page.currentPage -1 }">上一页</a>
								</li>
							</s:if>
							<s:else>
								<li class="disabled">
									<a href="#" data-toggle="dropdown">上一页</a>
								</li>
							</s:else>
							<li class="disabled">
								<a href="#" data-toggle="dropdown">共</a>
							</li>
							<li class="disabled">
								<a href="#" data-toggle="dropdown">${page.totalPage}</a>
							</li>
							<li class="disabled">
								<a href="#" data-toggle="dropdown">页</a>
							</li>
							<s:if test="#request.page.hasNextPage">
								<li>
									<a href="newslist?currentPage=${page.currentPage + 1 }">下一页</a>
								</li>
							</s:if>
							<s:else>
								<li class="disabled">
									<a href="#" data-toggle="dropdown">下一页</a>
								</li>
							</s:else>
						</ul>
					</div>
				</div>
				<!--/row-fluid-->
			</div>
		</div>
		<!--=== End Content Part ===-->

		<jsp:include page="footer.jsp" />
	</body>
</html>
