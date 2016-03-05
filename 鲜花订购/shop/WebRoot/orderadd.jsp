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

		<title>购物车</title>
		<jsp:include page="header.jsp" />
		<!--breadcrumbs-->
		<section class="breadcrumbs">
		<div class="container">
			<ul class="horizontal_list clearfix bc_list f_size_medium">
				<li class="m_right_10 current">
					<a href="#" class="default_t_color">首页<i
						class="fa fa-angle-right d_inline_middle m_left_10"></i> </a>
				</li>
				<li>
					<a href="#" class="default_t_color">结算</a>
				</li>
			</ul>
		</div>
		</section>
		<!--content-->
		<div class="page_content_offset">
			<div class="container">
				<div class="row clearfix">

					<!--tabs-->
					<h2 class="color_dark tt_uppercase m_bottom_25">
						订单信息
					</h2>
					<div
						class="bs_inner_offsets bg_light_color_3 shadow r_corners m_bottom_45">
						<div class="row clearfix">
							<form method="post" action="orderadd">
								<div class="col-lg-6 col-md-6 col-sm-6 m_xs_bottom_30">
									<h5 class="fw_medium m_bottom_15">
									</h5>

									<ul>
										<li class="m_bottom_15">
											<label for="f_name_1" class="d_inline_b m_bottom_5 required">
												收货人姓名
											</label>
											<input type="text" id="c_name_1" name="order.oname" value="${sessionScope.user.name}"
												class="r_corners full_width">
										</li>
										<li class="m_bottom_15">
											<label for="f_name_1" class="d_inline_b m_bottom_5 required">
												收货地址
											</label>
											<input type="text" id="f_name_1" name="order.oaddress" value="${sessionScope.user.uaddress}"
												class="r_corners full_width">
										</li>
										<li class="m_bottom_15">
											<label for="m_name_1" class="d_inline_b m_bottom_5 required">
												联系电话
											</label>
											<input type="text" id="m_name_1" name="order.ophone" value="${sessionScope.user.phone}"
												class="r_corners full_width">
										</li>
										<li class="m_bottom_15">
											<label for="l_name_1" class="d_inline_b m_bottom_5 ">
												联系邮箱
											</label>
											<input type="text" id="l_name_1" name="order.oemail" value="${sessionScope.user.email}"
												class="r_corners full_width">
										</li>
									</ul>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<h5 class="fw_medium m_bottom_15">
									</h5>
									<ul>
										<li class="m_bottom_15">
											<label class="d_inline_b m_bottom_5 required">
												付款方式
											</label>
											<!--product name select-->
											<div class="select_title type_2 r_corners relative color_dark mw_0">
												<select name="order.ofukuang" class="r_corners full_width">
													<option value="货到付款">
														货到付款
													</option>
													<option value="在线支付">
														在线支付
													</option>
												</select>
											</div>
										</li>
										<li class="m_bottom_15">
											<label class="d_inline_b m_bottom_5 required">
												送货方式
											</label>
											<!--product name select-->
											<div class="select_title type_2 r_corners relative color_dark mw_0">
												<select name="order.ofasong" class="r_corners full_width">
													<option value="送货上门">
														送货上门
													</option>
													<option value="店面自取">
														店面自取
													</option>
												</select>
											</div>
										</li>
										<li class="m_bottom_15">
											<label for="f_name_2" class="d_inline_b m_bottom_5">
												备注
											</label>
											<input type="text" id="f_name_2" name="order.obeizhu"
												class="r_corners full_width">
											<input type="hidden" name="order.uid"
												value="${sessionScope.user.id}">
											<input type="hidden" name="orderitem.oid" value="1">
										</li>
										<li class="m_bottom_15">
											<label for="f_name_2" class="d_inline_b m_bottom_5">
											</label>
											<br>
											<br>
											<button type="submit"
												class="button_type_6 bg_scheme_color f_size_large r_corners tr_all_hover color_light m_bottom_20">
												确认结算
											</button>
										</li>
									</ul>
								</div>
							</form>
						</div>
					</div>

					</section>
					<!--right column-->
					<aside class="col-lg-3 col-md-3 col-sm-3">
					</aside>
				</div>
			</div>
		</div>
		<!--markup footer-->

		<jsp:include page="footer.jsp" />
		</body>
</html>
