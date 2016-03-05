<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<title>社情民意采集与管理系统</title>
 <!-- Meta -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- CSS Global Compulsory-->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/headers/header1.css" />
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="assets/css/style_responsive.css" />
    <link rel="shortcut icon" href="assets/img/favicon.ico" />        
    <!-- CSS Implementing Plugins -->    
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="assets/plugins/flexslider/flexslider.css" type="text/css" media="screen" />    	
    <link rel="stylesheet" href="assets/plugins/parallax-slider/css/parallax-slider.css" type="text/css" />
    <!-- CSS Theme -->    
    <link rel="stylesheet" href="assets/css/themes/default.css" id="style_color" />
    <link rel="stylesheet" href="assets/css/themes/headers/default.css" id="style_color-header-1" />    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>	

<body>

<!--=== Top ===-->    
<div class="top">
    <div class="container">         
        <ul class="loginbar pull-right">
            <li><i class="icon-globe"></i><a href="javascript:void(0);" class="login-btn">${sessionScope.user.uname}</a>&nbsp;<a href="login.jsp" class="login-btn">登录</a>
            </li>   
            <li class="devider">&nbsp;</li>
            <li><a href="out" class="login-btn">退出</a></li>   
        </ul>
    </div>      
</div><!--/top-->
<!--=== End Top ===-->    

<!--=== Header ===-->
<div class="header">               
    <div class="container"> 
        <!-- Logo -->       
        <div class="logo">                                             
            <a href="index.jsp"><img id="logo-header" src="assets/img/logo1-default.png" alt="Logo" /></a>
        </div><!-- /logo -->        
                                    
        <!-- Menu -->       
        <div class="navbar">                                
            <div class="navbar-inner">                                  
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a><!-- /nav-collapse -->                                  
                <div class="nav-collapse collapse">                                     
                    <ul class="nav top-2">
                        <li >
                            <a href="index.jsp" class="dropdown-toggle" >首页
                            </a>
                            <b class="caret-out"></b>                        
                        </li>
                        <li>
                            <a href="peoplemessageadd.jsp" class="dropdown-toggle">群众民意填写
                            </a>
                            <b class="caret-out"></b>                        
                        </li>
                        <li>
                            <a href="querymessageadd" class="dropdown-toggle">单位民意填写
                            </a>
                            <b class="caret-out"></b>                        
                        </li>
                        <li>
                            <a href="allmessagelist" class="dropdown-toggle" >采纳民意展示 
                            </a>
                            <b class="caret-out"></b>                        
                        </li>
                          <li>
                            <a href="messagelist" class="dropdown-toggle" >我的民意信息
                            </a>
                            <b class="caret-out"></b>                        
                        </li>
                    </ul>
                </div><!-- /nav-collapse -->                                
            </div><!-- /navbar-inner -->
        </div><!-- /navbar -->                          
    </div><!-- /container -->               
</div><!--/header -->      
<!--=== End Header ===-->