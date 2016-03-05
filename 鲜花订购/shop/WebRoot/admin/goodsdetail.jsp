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
							鲜花详情
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
							<form class="form-horizontal">
								<fieldset>
									<legend>
										鲜花名称：${goods.gname}
									</legend>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
										<img style="width: 240px; height: 240px" 
										src="upload/${goods.gpic}" />
										</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
										鲜花介绍
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${goods.gdetail}
										</label>
										<label class="col-lg-2 control-label" for="select01">
											鲜花价格
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${goods.gprice}
										</label>
									</div>
									<div class="form-group">
									<label class="col-lg-2 control-label" for="typeahead">
											鲜花类别
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${catelogname}
										</label>
										
										<label class="col-lg-2 control-label" for="typeahead">
											库存数量
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${goods.gkucun}
										</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											上架时间
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${goods.gdate}
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											销售状态
										</label>
										<label class="col-lg-2 control-label" for="typeahead">
											${goods.gtype}
										</label>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label" for="typeahead">
											<a href="goodslist"  class="btn btn-primary">返回</a>
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
