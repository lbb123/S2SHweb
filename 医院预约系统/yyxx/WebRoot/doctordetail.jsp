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
					医生信息
				</h1>
				<ul class="pull-right breadcrumb">
				<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
					<li class="active">
						医生信息
					</li>
				</ul>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
		<!--=== Content Part ===-->
		<div class="container">
			<div class="row-fluid">
			<div class="span9">
                <table class="table">
                    <thead>
                        <tr class="info">
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>户籍</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="success">
                            <td>${doctor.dname}</td>
                            <td>${doctor.age}</td>
                            <td>${doctor.sex}</td>
                            <td>${doctor.daddress}</td>
                        </tr>
                    </tbody>
                </table>
                 <table class="table">
                    <thead>
                        <tr class="info">
                        <th>职务</th>
                            <th>科室</th>
                               <th>邮箱</th>
                            <th>擅长</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="success">
                          <td>${doctor.dlevel}</td>
                            <td>${doctor.catelog}</td>
                            <td>${doctor.email}</td>
                            <td>${doctor.dskill}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="headline">
						<h4>评价</h4>
						</div>
                <s:iterator value="#request.discussList" status="vs" var="s">
					<div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">
							&times;
						</button>
						用户：${s.uname}&nbsp;${s.ddate}<br>
						<strong>${s.dcontent}</strong>
					</div>
					</s:iterator>
					<div class="span6">
						
						<form action="discussadd" method="post">
							<label>
								评价内容
							</label>
							<input  type="hidden" name="discuss.did"
								value="${doctor.did}">
								<input  type="hidden" name="discuss.uid"
								value="${sessionScope.user.id}">
								<input  type="hidden" name="discuss.uname"
								value="${sessionScope.user.uname}">
							<textarea name="discuss.dcontent" class="span12 border-radius-none" rows="8"></textarea>
							<button type="submit" class="btn-u pull-right">
								提交
							</button>
						</form>
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
