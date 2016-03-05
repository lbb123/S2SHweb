<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
								<a href="user/index.jsp" class="dropdown-toggle" data-hover="dropdown"> <i
									class="glyphicon glyphicon-user"></i>${sessionScope.username}</a>

							</li>
							<li>
								<a href="out">退出</a>
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
						<a class="navbar-brand" href="user/index.jsp">个人中心</a>
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
				<!-- left, vertical navbar -->
				<div class="col-md-2 bootstrap-admin-col-left">
					<ul
						class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
						<li>
							<a href="user/resumeadd.jsp"><i
								class="glyphicon glyphicon-chevron-right"></i>制作简历</a>
						</li>
						<li>
							<a href="resumelist"><i
								class="glyphicon glyphicon-chevron-right"></i>简历列表</a>
						</li>
						<li>
							<a href="findjoblist"><i
								class="glyphicon glyphicon-chevron-right"></i>投递简历</a>
						</li>
						<li>
							<a href="umessagelist"><i
								class="glyphicon glyphicon-chevron-right"></i>查询公司回复</a>
						</li>
						<li>
							<a href="userToUpdate?user.id=${sessionScope.userId}"><i
								class="glyphicon glyphicon-chevron-right"></i>修改密码</a>
						</li>



					</ul>
				</div>