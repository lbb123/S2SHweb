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
		<title>管理</title>
		<jsp:include page="/admin/header.jsp" />
		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">
				<ol class="breadcrumb">
					<li>
						<a href="admin/index.jsp">首页</a>
					</li>
					<li class="active">
						民意信息详情修改
					</li>
				</ol>
				<div class="margin-bottom-30">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-12">
								<form action="adminmessageupdate" method="post" role="form"
									id="templatemo-preferences-form">
									<div class="row">
										<div class="col-md-6 margin-bottom-15">
											<label for="firstName" class="control-label">
												标题
											</label>
											<input type="text" name="message.mtitle" class="form-control"
												id="firstName" value="${message.mtitle}">
										</div>
										<div class="col-md-6 margin-bottom-15">
											<label for="lastName" class="control-label">
												紧急程度
											</label>
											<select name="message.mlevel"
												class="form-control margin-bottom-15" id="singleSelect">
												<option selected="selected">
													${message.mlevel}
												</option>
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
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 margin-bottom-15">
											<label for="lastName" class="control-label">
												民意分类
											</label>
											<select name="message.cid"
												class="form-control margin-bottom-15">
												<option selected="selected" value="${message.cid}" id="000">
													${message.mcatelog}
												</option>
											</select>
										</div>
										<div class="col-md-6 margin-bottom-15">
											<label for="password_2">
												信息来源
											</label>
											<input type="text" name="message.utype" class="form-control"
												id="password_2" value="${message.utype}">
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 margin-bottom-15">
											<label for="singleSelect">
												反映人
											</label>
											<input type="text" name="message.mauthor" class="form-control"
												id="password_2" value="${message.mauthor}">
										</div>
										<div class="col-md-6 margin-bottom-15">
											<label for="singleSelect">
												备注
											</label>
											<input type="text" name="message.mbeizhu" class="form-control"
												id="password_2" value="${message.mbeizhu}">
										</div>
									</div>

									<div class="row">
										<div class="col-md-12 margin-bottom-15">
											<label for="notes">
												内容
											</label>
											<textarea name="message.mnewcontent" class="form-control" rows="3" id="notes">${message.mcontent}</textarea>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 margin-bottom-15">
											<label for="firstName" class="control-label">
												上报单位
											</label>
											<select name="message.msendid"
												class="form-control margin-bottom-15" id="singleSelect">
												<option selected="selected"  value="${message.msendid}" id="001">
												</option>
											</select>
										</div>
										<div class="col-md-6 margin-bottom-15">
											<label for="lastName" class="control-label">
												上报状态
											</label>
											<select name="message.mtype"
												class="form-control margin-bottom-15" id="singleSelect">
												<option selected="selected">
													${message.mtype}
												</option>
												<option>
													上报
												</option>
												<option>
													专报
												</option>
												<option>
													转送
												</option>
											</select>
										</div>
									</div>
									<div class="row templatemo-form-buttons">
										<div class="col-md-12">
											<input type="hidden" name="message.uid"
												value="${message.uid}">
											<input type="hidden" name="message.uname"
												value="${message.uname}">
											<input type="hidden" name="message.mbianji"
												value="${sessionScope.admin.aname}">
											<input type="hidden" name="message.mid"
												value="${message.mid}">
												<input type="hidden" name="message.mcontent"
												value="${message.mcontent}">
												<input type="hidden" name="message.mdate"
												value="${message.mdate}">
											<button type="submit" class="btn btn-primary">
												提交
											</button>
											<button type="reset" class="btn btn-default">
												重置
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/admin/footer.jsp" />
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
<script>
$(document).ready(function(){
	var url = "userajaxlist";
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
         var t="<option value='"+item.id+"'>"+item.uname+"</option>";
        	$("#001").after(t);  
    });
	},
	});
})
</script>
		</body>
</html>
