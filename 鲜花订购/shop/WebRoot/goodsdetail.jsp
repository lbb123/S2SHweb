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

		<title>商品详情</title>
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
					<a href="javascript:volid(0);" class="default_t_color">商品详情</a>
				</li>
			</ul>
		</div>
		</section>
		<!--content-->
		<div class="page_content_offset">
			<div class="container">
				<div class="clearfix m_bottom_30 t_xs_align_c">
					<div
						class="photoframe type_2 shadow r_corners f_left f_sm_none d_xs_inline_b product_single_preview relative m_right_30 m_bottom_5 m_sm_bottom_20 m_xs_right_0 w_mxs_full">
						<span class="hot_stripe"><img src="images/hot_product.png"
								alt=""> </span>
						<div class="relative d_inline_b m_bottom_10 qv_preview d_xs_block">
							<img id="zoom_image" src="upload/${goods.gpic}"
								class="tr_all_hover" alt=""
								style="width: 438px; height: 438px>
							</div>
							<!--carousel-->
							<div class="relative qv_carousel_wrap">
							</div>
						</div>
						<div class="p_top_10 t_xs_align_l">
							<!--description-->
							<h2 class="color_dark fw_medium m_bottom_10">${goods.gname}</h2>
							<div class="m_bottom_10">
								<!--rating-->
								<ul class="horizontal_list d_inline_middle type_2 clearfix rating_list tr_all_hover">
									<li class="active">
										<i class="fa fa-star-o empty tr_all_hover"></i>
										<i class="fa fa-star active tr_all_hover"></i>
									</li>
									<li class="active">
										<i class="fa fa-star-o empty tr_all_hover"></i>
										<i class="fa fa-star active tr_all_hover"></i>
									</li>
									<li class="active">
										<i class="fa fa-star-o empty tr_all_hover"></i>
										<i class="fa fa-star active tr_all_hover"></i>
									</li>
									<li class="active">
										<i class="fa fa-star-o empty tr_all_hover"></i>
										<i class="fa fa-star active tr_all_hover"></i>
									</li>
									<li class="active">
										<i class="fa fa-star-o empty tr_all_hover"></i>
										<i class="fa fa-star active tr_all_hover"></i>
									</li>
								</ul>
								<a href="javascript:volid(0);" class="d_inline_middle default_t_color f_size_small m_left_5">好评</a>
							</div>
							<hr class="m_bottom_10 divider_type_3">
							<table class="description_table m_bottom_10">
								<tr>
									<td>鲜花类别：</td>
									<td><a href="javascript:volid(0);" class="color_dark">${catelogname}</a></td>
								</tr>
								<tr>
									<td>库存：</td>
									<td><span class="color_green">${goods.gkucun}</span>个</td>
								</tr>
								<tr>
									<td>上架时间：</td>
									<td>${goods.gdate}</td>
								</tr>
							</table>
							<hr class="divider_type_3 m_bottom_10">
							<p class="m_bottom_10">鲜花介绍：${goods.gdetail}</p>
							<hr class="divider_type_3 m_bottom_15">
							<div class="m_bottom_15">
								<s class="v_align_b f_size_ex_large"></s>价格：<span class="v_align_b f_size_big m_left_5 scheme_color fw_medium">￥${goods.gprice}</span>
							</div>
							 <form  method="post" action="cartadd">
							<table class="description_table type_2 m_bottom_15">
								<tr>
									<td class="v_align_m">数量:</td>
									<td class="v_align_m">
										<div class="clearfix quantity r_corners d_inline_middle f_size_medium color_dark">
											<input type="text" name="orderitem.gnum"  value="1" class="f_left">
											<input  type="hidden" name="orderitem.gid" value="${goods.gid}">
										</div>
									</td>
								</tr>
							</table>
							<div class="d_ib_offset_0 m_bottom_20">
							 <input type="submit" class="button_type_12 r_corners bg_scheme_color color_light tr_delay_hover d_inline_b f_size_large" value="加入购物车"/>
							</div>
							 </form>
							<p class="d_inline_middle"></p>
							<div class="d_inline_middle m_left_5 addthis_widget_container">
								<!-- AddThis Button BEGIN -->
								<div class="addthis_toolbox addthis_default_style addthis_32x32_style">
								<a class="addthis_button_preferred_1"></a>
								<a class="addthis_button_preferred_2"></a>
								<a class="addthis_button_preferred_3"></a>
								<a class="addthis_button_preferred_4"></a>
								<a class="addthis_button_compact"></a>
								<a class="addthis_counter addthis_bubble_style"></a>
								</div>
								<!-- AddThis Button END -->
							</div>
						</div>
					</div>
				</div>
			</div>
				<div class="container">
					<div class="clearfix m_bottom_30 t_xs_align_c">
					<div class="mini_post_content">
									<h4 class="m_bottom_5"><a href="#" class="color_dark fw_medium">评论</a></h4>
									<s:iterator value="#request.messageList" status="vs" var="s">
									<hr class="m_bottom_15">
									<p class="f_size_medium m_bottom_10">${s.mdate}<a href="javascript:volid(0);" class="color_dark"></a>, on <a href="#" class="color_dark">匿名用户</a></p>
									<hr>
									<hr class="m_bottom_15">
									<p class="m_bottom_10">${s.mcontent}</p>
									</s:iterator>
								</div>
							<form method="post" action="messageadd" class="bs_inner_offsets full_width bg_light_color_3 r_corners shadow m_xs_bottom_30">
								<ul>
									<li class="m_bottom_15">
										<label for="comments" class="d_inline_b m_bottom_5">评论</label><br>
										  <input type="hidden" name="message.uid" value="${sessionScope.user.id}"/>
										    <input type="hidden" name="message.gid" value="${goods.gid}"/>
										<textarea id="comments" name="message.mcontent" class="r_corners full_width"></textarea>
									</li>
									<li class="m_bottom_10">
										<button type="submit" class="r_corners button_type_4 bg_light_color_2 mw_0 color_dark tr_all_hover">提交评论</button>
									</li>
								</ul>
							</form>
					</div>
				</div>
				</div>	
			<!--markup footer-->
<jsp:include page="footer.jsp" />
	</body>
</html>
