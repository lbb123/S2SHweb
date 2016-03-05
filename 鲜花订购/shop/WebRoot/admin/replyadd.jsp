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
		<title>管理</title>
		<jsp:include page="header.jsp" />
	</head>

	<body class="bootstrap-admin-with-small-navbar">
		<jsp:include page="left.jsp" />



		<!-- content -->
		<div class="col-md-10">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<h1>
							回复留言
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
								回复
							</div>
						</div>
						<div
							class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal" method="post" action="replyadd">
								<fieldset>
									<legend></legend>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											回复内容
										</label>
										<div class="col-lg-10">
										<input type="hidden" name="reply.mid" value="${message.mid}" />
											<textarea id="textarea-wysihtml5" name="reply.rcontent"
												
												style="width: 100%; height: 200px"></textarea>
										</div>

									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											<button type="submit" class="btn btn-primary">
												回复
											</button>
										</label>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
		</div>
		</div>
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
