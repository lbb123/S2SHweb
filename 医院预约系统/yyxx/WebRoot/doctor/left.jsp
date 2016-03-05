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
								<a href="#"></a>
							</li>
							<li>
								<a href="/doctor/login.jsp">医生登录</a>
							</li>
							<li>
								<a href="index.jsp">医院信息网</a>
							</li>

							<li>
								<a href="doctor/index.jsp" class="dropdown-toggle" data-hover="dropdown"> <i
									class="glyphicon glyphicon-user"></i>${sessionScope.doctor.name}</a>

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
		<div class="container" >
			<div class="row" >
				<div class="col-lg-12" style="background-color: #D9D9D9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".main-navbar-collapse">
							<span class="sr-only"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="admin/index.jsp" >医院信息交互平台后台管理</a>
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
							<a href="doctordetail?doctor.did=${sessionScope.doctor.did}"><i
								class="glyphicon glyphicon-chevron-right"></i>我的信息</a>
						</li>
						<li>
							<a href="doctororderlist"><i
								class="glyphicon glyphicon-chevron-right"></i>预约情况</a>
						</li>
						<li>
							<a href="doctormessagelist"><i
								class="glyphicon glyphicon-chevron-right"></i>咨询信息</a>
						</li>

					</ul>
				</div>