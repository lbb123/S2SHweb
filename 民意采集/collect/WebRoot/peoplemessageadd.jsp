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
		<jsp:include page="header.jsp" />
		<!--=== Breadcrumbs ===-->
		<div class="row-fluid breadcrumbs margin-bottom-20">
			<div class="container">
				<h1 class="pull-left">
					民意信息填写
				</h1>
				<ul class="pull-right breadcrumb">
					<li>
						<a href="index.jsp">首页</a>
						<span class="divider">/</span>
					</li>
					<li class="active">
						民意信息填写
					</li>
				</ul>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
		<!--=== Content Part ===-->
		<!--=== Content Part ===-->
		<div class="container">
			<div class="row-fluid">
				<div class="row-fluid margin-bottom-20">
					<div class="span6">
						<div class="headline">
						</div>
						<form action="peoplemessageadd" method="post">
							<label>
								标题
							</label>
							<input class="span6 border-radius-none" 
								type="text" name="message.mtitle">
							<label>
								民意分类
							</label>
							<select name="message.cid" class="span6">
								<option id="000">
									---请选择---
								</option>
							</select>
							<label>
								紧急程度
							</label>
							<select name="message.mlevel" class="span6">
								<option>
									紧急
								</option>
								<option>
									急
								</option>
								<option>
									普通
								</option>
							</select>	
							<label>
								备注
							</label>
							<input class="span6 border-radius-none" 
								type="text" name="message.mbeizhu" >	
								<label>
								内容
							</label>
							<textarea name="message.mcontent"
								class="span12 border-radius-none" rows="8"></textarea>
								<input type="hidden" name="message.uid"
								value="5">
									<input type="hidden" name="message.utype"
								value="群众建议">
									<input type="hidden" name="message.mauthor"
								value="某直报点">
								<input type="hidden" name="message.uname"
								value="某直报点">
								<input type="hidden" name="message.mbianji"
								value="某直报点">
							<button type="submit" class="btn-u pull-right">
								提交
							</button>
						</form>
					</div>
				</div>
				<!--/row-fluid-->
			</div>
		</div>
		<!--=== End Content Part ===-->

		<jsp:include page="footer.jsp" />
			<script>
$(document).ready(function(){
	var url = "catelogajaxlist";
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
         var t="<option value='"+item.cid+"'>"+item.cname+"</option>";
        	$("#000").after(t);  
    });
	},
	});
})
</script>
		</body>
</html>
