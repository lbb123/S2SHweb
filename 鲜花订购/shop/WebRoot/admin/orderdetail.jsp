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
							订单详情
						</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default bootstrap-admin-no-table-panel">
						<div class="panel-heading">
							<div class="text-muted bootstrap-admin-box-title">
								订单
							</div>
						</div>
						<div
							class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
							<div class="page_content_offset">
								<div class="container">
									<div class="row clearfix">
										<!--left content column-->
										<section class="col-lg-9 col-md-9 col-sm-9">
										<div id="tab-1">
											<table
												class="table table-striped">
												<thead>
													<tr class="f_size_large">
														<th>
															鲜花名称
														</th>
														<th>
															鲜花单价
														</th>
														<th>
															鲜花个数
														</th>
														<th>
															鲜花总价
														</th>
													</tr>
												</thead>
												<tbody>
													<s:iterator value="#request.itemList" status="vs" var="s">
														<tr>
															<td data-title="Product Name">
																<a href="goodsTodetail?goods.gid=${s.goods.gid}"
																	class="color_dark d_inline_b m_bottom_5">${s.goods.gname}</a>
																<br>
															</td>
															<td data-title="Qty">
																￥${s.goods.gprice}
															</td>
															<td data-title="Product Status">
																${s.orderitem.gnum}
															</td>
															<td data-title="Total">
																<p class="color_dark f_size_large">
																	￥${s.toprice}
																</p>
															</td>
														</tr>
													</s:iterator>
												</tbody>
											</table>
										</div>
										<!--order info tables-->
										<table
											class="table table-striped">
											<tr>
												<td class="f_size_large d_xs_none">
													收件人姓名
												</td>
												<td data-title="Order Number">
													${order.oname}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													收件地址
												</td>
												<td data-title="Order Date">
													${order.oaddress}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													订单状态
												</td>
												<td data-title="Order Status">
													${order.otype}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													订单号
												</td>
												<td data-title="Last Update">
													${order.obiaohao}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													付款方式
												</td>
												<td data-title="Shipment">
													${order.ofukuang}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													送货方式
												</td>
												<td data-title="Payment">
													${order.ofasong}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													订单生成时间
												</td>
												<td data-title="Payment">
													${order.odate}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													联系电话
												</td>
												<td data-title="Payment">
													${order.ophone}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													联系邮箱
												</td>
												<td data-title="Payment">
													${order.oemail}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													备注
												</td>
												<td data-title="Comment">
													${order.obeizhu}
												</td>
											</tr>
											<tr>
												<td class="f_size_large d_xs_none">
													总价
												</td>
												<td data-title="Total">
													<p class="fw_medium f_size_large scheme_color">
														￥${order.ozongjia}
													</p>
												</td>
											</tr>
										</table>

										</section>
									</div>
								</div>
							</div>
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
