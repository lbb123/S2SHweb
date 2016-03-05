<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登陆</title>
<jsp:include page="header.jsp" />


  </head>
  
  <body class="bootstrap-admin-with-small-navbar" style="background:#ccc">
 <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    
                    <form method="post" action="adminlogin" class="bootstrap-admin-login-form">
                        <h1>管理员登陆</h1>
                        ${nologin}<br>
                        <div class="form-group">
                            <input class="form-control" type="text" name="admin.name" placeholder="管理员账户名">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="password" name="admin.password" placeholder="Password">
                        </div>
                        
                        <button class="btn btn-lg btn-primary" type="submit">登陆</button>
                    </form>
                    
                </div>
            </div>
        </div>
  </body>
</html>
