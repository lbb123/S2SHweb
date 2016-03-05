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
				<div class="span12">
					<form action="queryallmessage" method="post">
						<div class="span12">
							标题：
							<input class="span2 border-radius-none" type="text"
								name="message.mtitle">
							上报单位：<input class="span2 border-radius-none" type="text"
								name="message.msendname">
							类别:<input class="span2 border-radius-none" type="text"
								name="message.mcatelog">
							时间:<input class="span2 border-radius-none" type="text"
								name="message.mfenshudate">
								<button type="submit" class="btn-u pull-right">
								查询
							</button>
						</div>
					</form>
					<table class="table">
						<thead>
							<tr class="info">
								<th>
									民意标题
								</th>
								<th>
									上报单位
								</th>
								<th>
									类别
								</th>
								<th>
									采用状态
								</th>
								<th>
									采用时间
								</th>
								<th>
									查看
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
										${s.msendname}
									</td>
									<td>
										${s.mcatelog}
									</td>
									<td>
										${s.mtype}
									</td>
									<td>
										${s.mfenshudate}
									</td>
									<td>
										<a href="allmessagedetail?message.mid=${s.mid}"><span
											class="badge badge-success">查看</span> </a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<div class="pagination pagination-centered">
						<ul>
							<s:if test="#request.page.hasPrePage">
								<li>
									<a href="allmessagelist?currentPage=${page.currentPage -1 }">上一页</a>
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
									<a href="allmessagelist?currentPage=${page.currentPage + 1 }">下一页</a>
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
