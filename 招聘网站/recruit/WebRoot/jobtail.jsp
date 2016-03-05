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
		<title>职位详情</title>
		<jsp:include page="user/header.jsp" />
	</head>

	<body class="bootstrap-admin-with-small-navbar">
		<!-- small navbar -->
		<nav
			class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar-sm"
			role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="collapse navbar-collapse">

						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="user/login.jsp">个人登陆</a>
							</li>
							<li>
								<a href="company/login.jsp">公司登陆</a>
							</li>
							<li>
								<a href="index.jsp">招聘网</a>
							</li>

							<li>
								<a href="#" class="dropdown-toggle" data-hover="dropdown"> <i
									class="glyphicon glyphicon-user"></i>${sessionScope.username}</a>

							</li>
							<li>
								<a href="out.jsp">退出</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</nav>

		<!-- main / large navbar -->
		<nav
			class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small"
			role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".main-navbar-collapse">
							<span class="sr-only"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.jsp">职位</a>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input class="form-control" type="text" placeholder="职位/公司" />
							</div>
							<button type="submit" class="btn btn-default">
								搜索
							</button>
						</form>
						<a class="navbar-brand" href="findjoblist">返回职位列表</a>
					</div>
					<div class="collapse navbar-collapse main-navbar-collapse">
						<ul class="nav navbar-nav">

						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
			</div>
		</div>
		<!-- /.container -->
		</nav>

		<div class="container">
			<!-- left, vertical navbar & content -->
			<div class="row">
				<!-- content -->
				<div class="col-md-12" style="height: 900">
					<div class="row">
						<div class="col-lg-12">
							<div class="page-header">
								<h1>
									职位详情
								</h1>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="text-muted bootstrap-admin-box-title"></div>
								</div>
								<div class="bootstrap-admin-panel-content">
									<table class="table">
										<thead>
											<tr>
												 <th >职位名称</th>
                                                <th >需求人数 </th>
                                                <th >要求</th>
											</tr>
										</thead>
										<tbody>
												<tr>
													<td>
														${job.name}
													</td>
													<td>
														${job.num}
													</td>
													<td>
														${job.require}
													</td>
												</tr>
										</tbody>
									</table>
									<table class="table">
										<thead>
											<tr>
                                                <th >工作地址</th>
                                                <th >薪资</th>
                                                <th >发布/修改日期</th>
											</tr>
										</thead>
										<tbody>
												<tr>
													<td>
														${job.address}
													</td>
													<td>
														${job.salary}
													</td>
													<td>
														${job.sendtime}
													</td>
												</tr>
										</tbody>
									</table>
									<table class="table">
										<thead>
											<tr>
                                                <th >公司名称</th>
											</tr>
										</thead>
										<tbody>
												<tr>
													<td>
														${job.cname}
													</td>
												</tr>
										</tbody>
									</table>
									<br/>
									</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
						
							<div class="page-header">
									<span class="btn btn-default"><a href="userTocompany?job.id=${job.id}">投递简历</a></span>
										<span class="btn btn-default"><a href="findjoblist">返回职位列表</a></span>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<jsp:include page="user/footer.jsp" />
	</body>
</html>
