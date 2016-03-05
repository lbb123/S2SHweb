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
							添加医生信息
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
								医生
							</div>
						</div>
						<div
							class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal" method="post" action="doctoradd">
								<fieldset>
									<legend></legend>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											账户名
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.name"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											密码
										</label>
										<div class="col-lg-10">
											<input type="password" name="doctor.password"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											姓名
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.dname"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											性别
										</label>
										<div class="col-lg-10">
											<input type="radio" name="doctor.sex" value="男" placeholder="男">
											男
											<input type="radio" name="doctor.sex" value="女" placeholder="女">
											女
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											邮箱
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.email"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
										手机号
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.phone"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											户籍
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.daddress"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											年纪
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.age"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											科室
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.catelog"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											级别职务
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.dlevel"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											擅长项目
										</label>
										<div class="col-lg-10">
											<input type="text" name="doctor.dskill"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>

									<button type="submit" class="btn btn-primary">
										添加
									</button>
									<button type="reset" class="btn btn-default">
										重置
									</button>
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
	</body>
</html>
