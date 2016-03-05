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
		<title>预约</title>
		<jsp:include page="header.jsp" />
		<!--=== Breadcrumbs ===-->
		<div class="row-fluid breadcrumbs margin-bottom-20">
			<div class="container">
				<h1 class="pull-left">
					在线预约
				</h1>
				<ul class="pull-right breadcrumb">
					<li>
						<a href="index.jsp">首页</a>
						<span class="divider">/</span>
					</li>
					<li class="active">
						在线预约
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
						<h3>
							在线预约
						</h3>
					</div>
					<table class="table">
						<thead>
							<tr class="info">
								<th>
									医生姓名
								</th>
								<th>
									年龄
								</th>
								<th>
									性别
								</th>
								<th>
									主治科目
								</th>
								<th>
									预约时间(x月x日上/下午)
								</th>
								<th>
									预约
								</th>
								<th>
									咨询
								</th>
								<th>
									详情
								</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.doctorList" status="vs" var="s">
								<tr class="success">
									<td>
										${s.dname}
									</td>
									<td>
										${s.age}
									</td>
									<td>
										${s.sex}
									</td>
									<td>
										${s.catelog}
									</td>
									<form action="orderadd" method="post">
									<td>
										<input type="hidden" name="order.did" value="${s.did}">
										<input type="hidden" name="order.uid"
											value="${sessionScope.user.id}">
										<input  type="text" name="order.odate" class="span6 border-radius-none">
									</td>
									<td>
										<button class="btn-u" type="submit">
											预约
										</button>
									</td>
									</form>
									<td>
										<a href="messageadd.jsp?doctorid=${s.did}"><span class="badge badge-success">咨询</span> </a>
									</td>
									<td>
										<a href="discussdoctordetail?doctor.did=${s.did}"><span class="badge badge-success">评价</span> </a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<div class="pagination pagination-centered">
						<ul>
							<s:if test="#request.page.hasPrePage">
								<li>
									<a href="alldoctorlist?currentPage=${page.currentPage -1 }">上一页</a>
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
									<a href="alldoctorlist?currentPage=${page.currentPage + 1 }">下一页</a>
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
