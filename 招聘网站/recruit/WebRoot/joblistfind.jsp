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
		<title>职位列表</title>
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
						<form class="navbar-form navbar-left" role="search" method="post" action="jobfind">
							<div class="form-group">
								<input class="form-control" type="text" name="job.name" placeholder="职位" />
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="job.cname" placeholder="公司" />
							</div>
							<button type="submit" class="btn btn-default">
								搜索
							</button>
						</form>
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
									当前可提供的职位
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
												<th>
													职位名称
												</th>
												<th>
													工作地址
												</th>
												<th>
													薪资
												</th>
												<th>
													公司
												</th>
												<th>
													发布时间
												</th>
												<th>
													详情
												</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="#request.joblist" status="vs" var="s">
												<tr>
													<td>
														${s.name}
													</td>
													<td>
														${s.address}
													</td>
													<td>
														${s.salary}
													</td>
													<td>
														${s.cname}
													</td>
													<td>
														${s.sendtime}
													</td>
													<td class="actions">

														<a href="jobdetail?job.id=${s.id}">
															<button class="btn btn-sm btn-success">
																<i class="glyphicon glyphicon-ok-sign"></i> 查看详情
															</button> </a>
															<a href="userTocompany?job.id=${s.id}">
															<button class="btn btn-sm btn-success">
																<i class="glyphicon glyphicon-ok-sign"></i> 投递简历
															</button> </a>
													</td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<jsp:include page="user/footer.jsp" />
	</body>
</html>
