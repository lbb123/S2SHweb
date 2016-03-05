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
		<title>我的信息</title>
		<jsp:include page="header.jsp" />
				<!--=== Breadcrumbs ===-->
		<div class="row-fluid breadcrumbs margin-bottom-20">
			<div class="container">
				<h1 class="pull-left">
					预约情况
				</h1>
				<ul class="pull-right breadcrumb">
				<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
					<li class="active">
						预约情况
					</li>
				</ul>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
		<!--=== Content Part ===-->
		<div class="container">
			<div class="row-fluid">
			<div class="span9">
	            <div class="headline"></div>
                <table class="table">
                    <thead>
                        <tr class="info">
                            <th>医生姓名</th>
                            <th>科室</th>
                            <th>预约时间</th>
                            <th>预约状态</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="#request.Orderdetaillist" status="vs" var="s">
                        <tr class="success">
                            <td>${s.doctor.dname}</td>
                            <td>${s.doctor.catelog}</td>
                            <td>${s.order.odate}</td>
                            <td>${s.order.otype}</td>
                        </tr>
                        </s:iterator>
                    </tbody>
                </table>
                <div class="pagination pagination-centered">
						<ul>
							<s:if test="#request.page.hasPrePage">
								<li>
									<a href="userorderlist?currentPage=${page.currentPage -1 }">上一页</a>
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
									<a href="userorderlist?currentPage=${page.currentPage + 1 }">下一页</a>
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
