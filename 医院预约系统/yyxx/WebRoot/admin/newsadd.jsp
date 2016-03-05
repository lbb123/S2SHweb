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
							添加新闻
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
								新闻
							</div>
						</div>
						<div
							class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal" method="post" action="newsadd">
								<fieldset>
									<legend></legend>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											新闻标题
										</label>
										<div class="col-lg-10">
											<input type="text" name="news.ntitle"
												class="form-control col-md-6" id="typeahead"
												autocomplete="off" data-provide="typeahead" data-items="4"
												data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											新闻内容
										</label>
										<div class="col-lg-10">
										<textarea id="textarea-wysihtml5" name="news.ncontent"
												placeholder="Enter text..."
												style="width: 100%; height: 200px"></textarea>
										<input type="hidden" name="news.ntype" value="最新新闻"/>
										<input type="hidden" name="news.naid" value="${sessionScope.admin.id}"/>
										<input type="hidden" name="news.nauthor" value="${sessionScope.admin.name}"/>
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
