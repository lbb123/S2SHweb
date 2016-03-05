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

		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<table>
			<tr>

				<td align="center">
					用户名
				</td>
				<td align="center">
					密码
				</td>
				<td align="center">
					操作
				</td>
			</tr>
			<s:iterator value="#request.userList" var="s">

				<tr align="center">

					<td>
						${s.username}
					</td>
					<td>
						${s.password}
					</td>
					<td>
						<a href="userdelete?user.userId=${s.userId}">删除</a>
					</td>
					<td>
						<a href="/page/update.jsp?user.userId=${s.userId}">修改</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		当前第
		<s:property value="#request.page.currentPage" />
		页，共
		<s:property value="#request.page.totalPage" />
		页,每页显示
		<s:property value="#request.page.everyPage" />
		条记录
		<s:if test="#request.page.hasPrePage">
			<a href="userlist?currentPage=1">首页</a>
			<a href="userlist?currentPage=${page.currentPage -1 }">上一页</a>
		</s:if>
		<s:else>
				首页
				上一页
			</s:else>

		<s:if test="#request.page.hasNextPage">
			<a href="userlist?currentPage=${page.currentPage + 1 }">下一页</a>
			<a href="userlist?currentPage=${page.totalPage }">尾页</a>
		</s:if>
		<s:else>
				下一页
				尾页
			</s:else>
	</body>
</html>
