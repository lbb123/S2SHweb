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
					<a href="#" class="default_t_color">购物车</a>
				</li>
			</ul>
		</div>
		</section>
		<!--content-->
		<div class="page_content_offset">
			<div class="container">
				<div class="row clearfix">
					<!--left content column-->
					<section class="col-lg-9 col-md-9 col-sm-9 m_xs_bottom_30">
					<h2 class="tt_uppercase color_dark m_bottom_25">
						我的购物车
					</h2>
					<!--cart table-->
					<table id="tab1"
						class="table_type_4 responsive_table full_width r_corners wraper shadow t_align_l t_xs_align_c m_bottom_30">
						<thead>
							<tr class="f_size_large">
								<!--titles for td-->
								<th>
									物品名称
								</th>
								<th>
									鲜花名
								</th>
								<th>
									价格
								</th>
								<th>
									数量
								</th>
								<th>
									总价
								</th>
							</tr>
						</thead>
						<tbody>
							<s:set name="items" value="#session.cart.items" />
							<s:iterator value="#items" id="entry">
								<tr>
									<!--Product name and image-->
									<td data-title="Product Image &amp; name" class="t_md_align_c">
										<img style="width: 110px; height: 110px"
											src="upload/${value.goods.gpic}" alt=""
											class="m_md_bottom_5 d_xs_block d_xs_centered">
										<a href="#" class="d_inline_b m_left_5 color_dark"></a>
									</td>
									<!--product key-->
									<td data-title="SKU">
										${value.goods.gname}
									</td>
									<!--product price-->
									<td data-title="Price">
										<p class="f_size_large color_dark" id="txt_price">
											￥${value.goods.gprice}
										</p>
									</td>
									<!--quanity-->
									<td data-title="Quantity">
										<div>
											${value.orderitem.gnum}
										</div>
										<div>
											<a href="cartupdate.jsp?goodsgid=${value.goods.gid}" class="color_dark">更新</a>
											<br>
											<a href="cartdelete?orderitem.gid=${value.goods.gid}" class="color_dark">移除</a>
											<br>
										</div>
									</td>
									<!--subtotal-->
									<td data-title="Subtotal">
										<p class="f_size_large fw_medium scheme_color">
											￥${value.toprice}
										</p>
									</td>
								</tr>
							</s:iterator>
							<!--total-->
							<tr>
								<td colspan="4" class="v_align_m d_ib_offset_large t_xs_align_l">
									<p
										class="fw_medium f_size_large t_align_r scheme_color p_xs_hr_0 d_inline_middle half_column d_ib_offset_normal d_xs_block w_xs_full t_xs_align_c">
										总价:
									</p>
								</td>
								<td colspan="1" class="v_align_m">
									<p class="fw_medium f_size_large scheme_color m_xs_bottom_10">
										￥${totalprice}
									</p>
								</td>
							</tr>
							<tr>
								<td colspan="1" class="v_align_m d_ib_offset_large t_xs_align_l">
									<a href="cartclear">
										<button
											class="button_type_6 bg_scheme_color f_size_large r_corners tr_all_hover color_light m_bottom_20">
											清空购物车
										</button>
									</a>
								</td>
								<td colspan="4" class="v_align_m">
									<a href="orderadd.jsp">
										<button
											class="button_type_6 bg_scheme_color f_size_large r_corners tr_all_hover color_light m_bottom_20">
											结算
										</button>
									</a>
								</td>
								</td>
							</tr>
						</tbody>
					</table>

					<!--tabs-->
					<div class="tabs m_bottom_45">
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
