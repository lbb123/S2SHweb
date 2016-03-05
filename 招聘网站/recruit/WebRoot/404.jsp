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
		<title>页面找不到</title>
		<jsp:include page="user/header.jsp" />
	</head>

	<!-- small navbar -->
	<nav
		class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar-sm"
		role="navigation">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="collapse navbar-collapse">
					<ul
						class="nav navbar-nav navbar-left bootstrap-admin-theme-change-size">
					</ul>
				</div>
			</div>
		</div>
	</div>
	</nav>

	<!-- content -->
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-lg-12">
				<div class="centering text-center">
					<div class="text-center">
						<h2 class="without-margin">
							Don't worry. It's
							<span class="text-success"><big>404</big>
							</span> error only.
						</h2>
						<h4 class="text-success">
							Page not found
						</h4>
					</div>
					<div class="text-center">
						<h3>
							<small>页面错误未找到</small>
						</h3>
					</div>
					<hr>
					<ul class="pager">
						<li>
							<a href="index.jsp">首页</a>
						</li>
						<li>
							<a href="#" target=main onclick="javascript:history.go(-1);">&larr;返回上一页</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div class="navbar navbar-footer navbar-fixed-bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<footer role="contentinfo">
					<p class="left"></p>
					<p class="right">
						&copy; 2016
						<a href="" target="_blank">中北大学软件学院</a>
						<a href="" target="_blank">&copy;&nbsp;管理员入口</a>
					</p>
					</footer>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-2.0.3.min.js">
</script>
	<script type="text/javascript" src="js/bootstrap.min.js">
</script>
	<script type="text/javascript"
		src="js/twitter-bootstrap-hover-dropdown.min.js">
</script>
	<script type="text/javascript"
		src="js/bootstrap-admin-theme-change-size.js">
</script>
	<script type="text/javascript"
		src="vendors/uniform/jquery.uniform.min.js">
</script>
	<script type="text/javascript" src="vendors/chosen.jquery.min.js">
</script>
	<script type="text/javascript"
		src="vendors/selectize/dist/js/standalone/selectize.min.js">
</script>
	<script type="text/javascript"
		src="vendors/bootstrap-datepicker/js/bootstrap-datepicker.js">
</script>
	<script type="text/javascript"
		src="vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/javascripts/bootstrap-wysihtml5/wysihtml5.js">
</script>
	<script type="text/javascript"
		src="vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/javascripts/bootstrap-wysihtml5/core-b3.js">
</script>
	<script type="text/javascript"
		src="vendors/twitter-bootstrap-wizard/jquery.bootstrap.wizard-for.bootstrap3.js">
</script>
	<script type="text/javascript"
		src="vendors/boostrap3-typeahead/bootstrap3-typeahead.min.js">
</script>
	</body>
</html>
