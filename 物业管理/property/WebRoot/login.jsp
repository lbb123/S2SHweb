<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<jsp:include page="header.jsp" />
		<!--content-->
		<div class="container">
			<div class="page">
					<div class="comment-bottom">
					<br>
    					<h2>登录&nbsp;${nologin}</h2>
    					<form method="post" action="userlogin">	
						用户名：<input type="text" class="panel-body" name="user.name" >
						密码：<br/>
						<input type="password"  class="panel-body" name="user.password" value="password" >
							<br>
							<input type="submit" value="登录">
						
					</form>
    				</div>
			</div>
		</div>

		<!--//content-->
		<!--footer-->
		<jsp:include page="footer.jsp" />
		</body>
</html>
