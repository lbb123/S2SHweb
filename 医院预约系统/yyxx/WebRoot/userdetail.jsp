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
					个人信息
				</h1>
				<ul class="pull-right breadcrumb">
				<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
					<li class="active">
						个人信息
					</li>
				</ul>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
		<!--=== Content Part ===-->
		<div class="container">
			<div class="row-fluid">
			<div class="span9">
			<form action="userupdate" method="post">
                <table class="table">
                    <thead>
                        <tr class="info">
                            <th>账户名</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="success">
                            <td><input  type="hidden" name="user.id"
										value="${sessionScope.user.id}">
									<input class="span6 border-radius-none"  type="text" name="user.name"
										value="${sessionScope.user.name}"></td>
                            <td><input class="span6 border-radius-none"  type="text" name="user.uname"
										value="${sessionScope.user.uname}"></td></td>
                            <td><input class="span6 border-radius-none"  type="text" name="user.uage"
										value="${sessionScope.user.uage}"></td></td>
                            <td><input class="span6 border-radius-none"  type="text" name="user.sex"
										value="${sessionScope.user.sex}"></td></td>
                        </tr>
                    </tbody>
                </table>
                 <table class="table">
                    <thead>
                        <tr class="info">
                        <th>密码</th>
                            <th>手机号</th>
                            <th>邮箱</th>
                            <th>户籍</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="success">
                         <td><input class="span6 border-radius-none"  type="password" name="user.password"
										value="${sessionScope.user.password}"></td>
                            <td><input class="span6 border-radius-none"  type="text" name="user.phone"
										value="${sessionScope.user.phone}"></td>
                            <td><input class="span6 border-radius-none"  type="text" name="user.email"
										value="${sessionScope.user.email}"></td>
                            <td><input class="span6 border-radius-none"  type="text" name="user.uaddress"
										value="${sessionScope.user.uaddress}"></td>
                        </tr>
                    </tbody>
                </table>
                <button class="btn-u" type="submit">修改</button>
                </form>
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
