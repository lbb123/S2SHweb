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
							修改鲜花信息
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
								商品
							</div>
						</div>
						<div
							class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal" method="post" action="goodsupdate">
								<fieldset>
									<legend></legend>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											鲜花类型名称
										</label>
										<div class="col-lg-10">
											<input type="text" name="goods.gname" value="${goods.gname}"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
											<input type="hidden" name="goods.gid" value="${goods.gid}" />
											<input type="hidden" name="goods.gpic" value="${goods.gpic}" />
											<input type="hidden" name="goods.gtype" value="${goods.gtype}" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											类别选择
										</label>
										<div class="col-lg-10">
											<select id="select02" name="goods.cid" class="form-control"
												style="width: 150px;">
												<option value="" id="000">
													--请选择--
												</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											鲜花介绍
										</label>
										<div class="col-lg-10">
											<textarea id="textarea-wysihtml5" name="goods.gdetail"
												
												style="width: 100%; height: 200px">${goods.gdetail}</textarea>
										</div>

									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											鲜花价格
										</label>
										<div class="col-lg-10">
											<input type="text" name="goods.gprice" value="${goods.gprice}"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											鲜花库存
										</label>
										<div class="col-lg-10">
											<input type="text" name="goods.gkucun" value="${goods.gkucun}"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											<button type="submit" class="btn btn-primary">
												添加
											</button>
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											<button type="reset" class="btn btn-default">
												重置
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
