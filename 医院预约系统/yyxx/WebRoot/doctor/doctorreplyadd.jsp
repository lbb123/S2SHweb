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
	</head>

	<body class="bootstrap-admin-with-small-navbar">
		<jsp:include page="/doctor/left.jsp" />



		<!-- content -->
		<div class="col-md-10">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<h1>
							回复
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
								信息
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
											<input type="hidden" name="reply.mid"
												value='<s:property value="#parameters.messageid" />' />
											<textarea id="textarea-wysihtml5" name="reply.rcontent"
												placeholder="Enter text..."
												style="width: 100%; height: 200px"></textarea>
												</div>
									</div>
									<button type="submit" class="btn btn-primary">
										回复
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
		<jsp:include page="/admin/footer.jsp" />
	</body>
</html>
