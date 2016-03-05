<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>企业注册</title>
<jsp:include page="header.jsp" />


  </head>
  
  <body class="bootstrap-admin-with-small-navbar" style="background:#ccc">
 <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    
                    <form method="post" action="companyadd" class="bootstrap-admin-login-form">
                        <h1>公司注册</h1>
                        <div class="form-group">
                            <input class="form-control" type="text" name="company.name" placeholder="公司账户名 (数字/字母)">
                        </div>
                        
                        <div class="form-group">
                            <input class="form-control" type="password" name="company.password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" name="company.companyname" placeholder="企业名称">
                        </div>
                         <div class="form-group">
                            <input class="form-control" type="text" name="company.phone" placeholder="企业电话">
                        </div>
                         <div class="form-group">
                            <input class="form-control" type="text" name="company.email" placeholder="企业邮箱">
                        </div>
                       
                         <div class="form-group">
                            <input class="form-control" type="text" name="company.address" placeholder="企业地址">
                        </div>
                          <div class="form-group">
                            <textarea class="form-control" type="text" name="company.introduction" placeholder="企业简介"></textarea>
                        </div>
                        
                        <button class="btn btn-lg btn-primary" type="submit">注册</button>
                    </form>
                </div>
            </div>
        </div>
  </body>
</html>
