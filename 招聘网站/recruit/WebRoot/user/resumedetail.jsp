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
		<title>个人中心</title>
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
							简历
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
								简历
							</div>
						</div>
						<div
							class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<form class="form-horizontal">
								<fieldset>
									<legend>
										简历名称：${resume.name}
									</legend>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											姓名
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.username}
										</label>
										<label class="col-lg-2 control-label" for="select01">
											性别
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.sex}
										</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											出生年月
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.birthday}
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											现居地
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.address}
										</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											手机
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.phone}
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											邮箱
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.email}
										</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											学历
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.education}
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											期望的工作
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${resume.jobwant}
										</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="textarea-wysihtml5">
											工作经历
										</label>
										<label class="col-lg-2 control-label" for="textarea-wysihtml5" >
											${resume.experience}
										</label>
									</div>
									<br/>
									
									
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
		<script type="text/javascript">
$(function() {
	$('.datepicker').datepicker();
	$('.uniform_on').uniform();
	$('.chzn-select').chosen();
	$('.selectize-select').selectize();
	$('.textarea-wysihtml5')
			.wysihtml5(
					{
						stylesheets : [ 'vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/stylesheets/bootstrap-wysihtml5/wysiwyg-color.css' ]
					});

	$('#rootwizard').bootstrapWizard(
			{
				'nextSelector' : '.next',
				'previousSelector' : '.previous',
				onNext : function(tab, navigation, index) {
					var $total = navigation.find('li').length;
					var $current = index + 1;
					var $percent = ($current / $total) * 100;
					$('#rootwizard').find('.progress-bar').css('width',
							$percent + '%');
					// If it's the last tab then hide the last button and show the finish instead
					if ($current >= $total) {
						$('#rootwizard').find('.pager .next').hide();
						$('#rootwizard').find('.pager .finish').show();
						$('#rootwizard').find('.pager .finish').removeClass(
								'disabled');
					} else {
						$('#rootwizard').find('.pager .next').show();
						$('#rootwizard').find('.pager .finish').hide();
					}
				},
				onPrevious : function(tab, navigation, index) {
					var $total = navigation.find('li').length;
					var $current = index + 1;
					var $percent = ($current / $total) * 100;
					$('#rootwizard').find('.progress-bar').css('width',
							$percent + '%');
					// If it's the last tab then hide the last button and show the finish instead
					if ($current >= $total) {
						$('#rootwizard').find('.pager .next').hide();
						$('#rootwizard').find('.pager .finish').show();
						$('#rootwizard').find('.pager .finish').removeClass(
								'disabled');
					} else {
						$('#rootwizard').find('.pager .next').show();
						$('#rootwizard').find('.pager .finish').hide();
					}
				},
				onTabShow : function(tab, navigation, index) {
					var $total = navigation.find('li').length;
					var $current = index + 1;
					var $percent = ($current / $total) * 100;
					$('#rootwizard').find('.bar').css( {
						width : $percent + '%'
					});
				}
			});
	$('#rootwizard .finish').click(function() {
		alert('Finished!, Starting over!');
		$('#rootwizard').find('a[href*=\'tab1\']').trigger('click');
	});
});
</script>
	</body>
</html>
