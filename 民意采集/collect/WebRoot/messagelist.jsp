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
		<!--=== Breadcrumbs ===-->
		<div class="row-fluid breadcrumbs margin-bottom-20">
			<div class="container">
				<h1 class="pull-left">
					我的民意信息
				</h1>
				<ul class="pull-right breadcrumb">
					<li>
						<a href="index.jsp">首页</a>
						<span class="divider">/</span>
					</li>
					<li class="active">
						我的民意信息
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
									民意标题
								</th>
								<th>
									民意分类
								</th>
								<th>
									民意状态
								</th>
								<th>
									查看
								</th>
								<th>
									上报
								</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.messageList" status="vs" var="s">
								<tr class="success">
									<td>
										${s.mtitle}
									</td>
									<td>
										${s.mcatelog}
									</td>
									<td>
										${s.mtype}
									</td>
									<td>
										<a href="messageToupdate?message.mid=${s.mid}"><span class="badge badge-success">查看</span> </a>
									</td>
									<td>
										<a href="shangbaoadmin?message.mid=${s.mid}"><span class="badge badge-success">上报</span> </a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<div class="pagination pagination-centered">
						<ul>
							<s:if test="#request.page.hasPrePage">
								<li>
									<a href="messagelist?currentPage=${page.currentPage -1 }">上一页</a>
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
									<a href="messagelist?currentPage=${page.currentPage + 1 }">下一页</a>
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
			</div>
			<!--/row-fluid-->
			<!--//Default Tables styles -->
		</div>
		<!--/container-->
		<!--=== End Content Part ===-->

		<jsp:include page="footer.jsp" />
		</body>
</html>
