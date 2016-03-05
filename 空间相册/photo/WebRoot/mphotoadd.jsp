<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>相册</title>
		<base href="<%=basePath%>">
		<jsp:include page="header.jsp" />
	</head>
	<body>
		<div class="banner">
			<!-- container -->
			<div class="container">
				<div class="header">
					<div class="logo">
						<a href="index.jsp">WelcomePhoto</a>
					</div>
					<div class="icons">
						<ul>

						</ul>
					</div>
					<div class="clearfix">
					</div>
				</div>
				<div class="top-nav">
					<span class="menu">列表</span>
					<ul class="nav1">
						<li><a href="index.jsp" >首页</a></li>
						<li><a href="muserlist" >用户管理</a></li>
						<li><a href="mphotoslist" class="active">相册管理</a></li>
						<li><a href="out">退出</a></li>
					</ul>
				</div>
			</div>
			<!-- //container -->
		</div>
		<!-- //banner -->
		<!-- contact -->
		<div class="contact-top">
			<!-- container -->
			<div class="container">

				<div class="mail-grids">

					<div class="col-md-6">
						<a href="">上传照片</a>
						<br>
						<br>
						<div class="col-md-6 contact-form">
							<form action="mphotoadd" method="post" enctype="multipart/form-data">
							<span class="badge badge-warning">选择相册</span>
								<select name="photo.photosId" id="sel"
									style="width: 100%; color: #919191; background: none; outline: none; font-size: .9em; padding: .5em; margin-bottom: 1em; border: solid 1px #919191; -webkit-appearance: none;">
									<option value="" id="000">
										--请选择--
									</option>
								</select>
									<span class="badge badge-warning">上传图片</span>
								<div id="uploadDiv">
								
								<input type="file" name="image" multiple  style="width: 100%; color: #919191; background: none; outline: none; font-size: .9em; padding: .5em; margin-bottom: 1em; border: solid 1px #919191; -webkit-appearance: none;">
								<span class="badge badge-warning"><a href="javascript:void(0);" onclick="createFileButton()">新增文件不能过大</a></span>
								</div>
								<input type="submit" value="上传照片">
							</form>
						</div>
					</div>
					<div class="clearfix">
					</div>
				</div>
			</div>
			<!-- //container -->
		</div>
		<!-- //contact -->
		<jsp:include page="footer.jsp" />
		<script>
$(document).ready(function(){
	var url = "photoslist2";
	$.ajax({
	type:'get',
	url:url,
	dataType: 'json',
	error:function(status){  
		  alert(status); 
        alert("error");  
    },  
	success:function(date){
    	$.each(date, function(i, item) {
         var t="<option value='"+item.id+"'>"+item.name+"</option>";
        	$("#000").after(t);  
    });
	},
	});
})
</script>
<script>
    function createFileButton(){
        var div=document.getElementById("uploadDiv");
        var fileButton=document.createElement("input");
        fileButton.type="file";
        fileButton.name="image";
        var removeButton=document.createElement("input");
        var br=document.createElement("br");
        removeButton.type="button";
        removeButton.value="删除";
        removeButton.onclick=function(){
            div.removeChild(fileButton);
            div.removeChild(removeButton);
            div.removeChild(br);
        }
        div.appendChild(fileButton);
        div.appendChild(removeButton);
        div.appendChild(br);
    }
    </script>
	</body>
</html>

