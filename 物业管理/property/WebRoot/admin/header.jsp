<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/templatemo_main.css">
<link rel="icon" type="image/ico" href="home/fav2.ico">
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<div class="navbar-header">
			<div class="logo">
				<a href="index.jsp"><h1>
						物业管理系统系统
					</h1>
				</a>
			</div>
		</div>
		<div style="float: right; text-align: right; margin-top: 15px;">
			<span class="icon-bar"><a href="index.jsp"><i
					class="fa fa-home"></i>首页</a>
			</span> &nbsp;
			<span class="icon-bar"><a href="admin/login.jsp"><i
					class="fa fa-users"></i>${sessionScope.admin.name}登录</a>
			</span> &nbsp;
			<span class="icon-bar"><a href="out"><i
					class="fa fa-sign-out"></i>退出</a>
			</span> &nbsp;
		</div>
	</div>
	<div class="template-page-wrapper">
		<div class="navbar-collapse collapse templatemo-sidebar">
			<ul class="templatemo-sidebar-menu">
			<li>
					<a href="userlist"><i class="fa fa-cog"></i>用户资料管理</a>
				</li>
				<li>
					<a href="houselist"><i class="fa fa-cog"></i>房产资料管理</a>
				</li>
				<li>
					<a href="wuyelist"><i class="fa fa-cog"></i>收费管理</a>
				</li>
				<li>
					<a href="goodslist"><i class="fa fa-cog"></i>物业设备管理</a>
				</li>
				
				<li>
					<a href="out" ><i
						class="fa fa-sign-out"></i>退出</a>
				</li>
			</ul>
		</div>
		<!--/.navbar-collapse -->