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

		<title>商品列表</title>
		<jsp:include page="header.jsp" />
		<!--breadcrumbs-->
		<section class="breadcrumbs">
		<div class="container">
			<ul class="horizontal_list clearfix bc_list f_size_medium">
				<li class="m_right_10 current">
					<a href="#" class="default_t_color">首页<i
						class="fa fa-angle-right d_inline_middle m_left_10"></i>
					</a>
				</li>
				<li>
					<a href="allgoodslist?currentPage=1" class="default_t_color">商品列表</a>
				</li>
			</ul>
		</div>
		</section>
		<!--content-->
		<div class="page_content_offset">
			<div class="container">
				<div class="row clearfix">
					<section class="col-lg-9 col-md-9 col-sm-9">
					<hr class="m_bottom_10 divider_type_3">
					<div class="row clearfix m_bottom_15">
						<div class="col-lg-7 col-md-7 col-sm-8 col-xs-12 m_xs_bottom_10">
							<p class="d_inline_middle f_size_medium d_xs_block m_xs_bottom_5">
								每页5个/共${page.totalPage}页
							</p>
							<p class="d_inline_middle f_size_medium m_left_20 m_xs_left_0">
								展示:
							</p>
							<p class="d_inline_middle f_size_medium m_left_5">
								所有鲜花
							</p>
						</div>
						<div
							class="col-lg-5 col-md-5 col-sm-4 col-xs-12 t_align_r t_xs_align_l">
							<!--pagination-->
							<s:if test="#request.page.hasPrePage">
								<a role="button"
									href="allgoodslist?currentPage=${page.currentPage -1 }"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-left"></i>
								</a>
							</s:if>
							<s:else>
								<a role="button" href="javascript:volid(0);"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-left"></i>
								</a>
							</s:else>
							<ul
								class="horizontal_list clearfix d_inline_middle f_size_medium m_left_10">
								<li class="m_right_10">
									<a class="color_dark" href="javascript:volid(0);" >第${page.currentPage}页</a>
								</li>
							</ul>
							<s:if test="#request.page.hasNextPage">
								<a role="button"
									href="allgoodslist?currentPage=${page.currentPage + 1 }"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-right"></i>
								</a>
							</s:if>
							<s:else>
								<a role="button" href="javascript:volid(0);"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-right"></i>
								</a>
							</s:else>
						</div>
					</div>
					<!--products list type-->
					<section
						class="products_container list_type clearfix m_bottom_5 m_left_0 m_right_0">
					<s:iterator value="#request.goodsList" status="vs" var="s">
					<!--product item-->
					<div
						class="product_item full_width list_type hit m_left_0 m_right_0">
						<figure
							class="r_corners photoframe tr_all_hover type_2 shadow relative clearfix">
						<!--product preview-->
						<a href="allgoodsTodetail?orderitem.gid=${s.gid}"
							class="d_block f_left relative pp_wrap m_right_30 m_xs_right_25">
							<!--hot product--> <span class="hot_stripe"><img
									src="images/hot_product.png" alt="">
						</span> <img src="upload/${s.gpic}" class="tr_all_hover" alt="">
							<span role="button" data-popup="#quick_view_product"
							class="button_type_5 box_s_none color_light r_corners tr_all_hover d_xs_none">详情</span> </a>
						<!--description and price of product-->
						<figcaption>
						<div class="clearfix">
							<div
								class="f_left p_list_description f_sm_none w_sm_full m_xs_bottom_10">
								<h4 class="fw_medium">
									<a href="javascript:volid(0);" class="color_dark">${s.gname}</a>
								</h4>
								<div class="m_bottom_10">
									<!--rating-->
									<ul
										class="horizontal_list d_inline_middle clearfix rating_list type_2 tr_all_hover">
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
									<a href="javascript:volid(0);"
										class="d_inline_middle default_t_color f_size_medium m_left_10">好评</a>
								</div>
								<hr class="m_bottom_10">
								<p class="d_sm_none d_xs_block">
									${s.gdetail}
								</p>
							</div>
							<div class="f_right f_sm_none t_align_r t_sm_align_l">
								<p class="scheme_color f_size_large m_bottom_15">
									<span class="fw_medium">￥${s.gprice}</span>
								</p>
								<a href="allgoodsTodetail?orderitem.gid=${s.gid}">
								<button
									class="button_type_4 bg_scheme_color r_corners tr_all_hover color_light mw_0 m_bottom_15 m_sm_bottom_0 d_sm_inline_middle">
									购买该商品
								</button></a>
								<br class="d_sm_none">
							</div>
						</div>
						</figcaption>
						</figure>
					</div>
					</s:iterator>
					</section>
					<hr class="m_bottom_10 divider_type_3">
					<div class="row clearfix m_bottom_15 m_xs_bottom_30">
						<div class="col-lg-7 col-md-7 col-sm-8 m_xs_bottom_10">
							<p class="d_inline_middle f_size_medium d_xs_block m_xs_bottom_5">
								每页5个/共${page.totalPage}页
							</p>
							<p class="d_inline_middle f_size_medium m_left_20 m_xs_left_0">
							</p>
							<!--show items per page select-->
							<div
								class="custom_select f_size_medium relative d_inline_middle m_left_5">
							</div>
							<p class="d_inline_middle f_size_medium m_left_5">
							</p>
						</div>
						<div class="col-lg-5 col-md-5 col-sm-4 t_align_r t_xs_align_l">
							<!--pagination-->
							<s:if test="#request.page.hasPrePage">
								<a role="button"
									href="allgoodslist?currentPage=${page.currentPage -1 }"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-left"></i>
								</a>
							</s:if>
							<s:else>
								<a role="button" href="javascript:volid(0);"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-left"></i>
								</a>
							</s:else>
							<ul
								class="horizontal_list clearfix d_inline_middle f_size_medium m_left_10">
								<li class="m_right_10">
									<a class="color_dark" href="javascript:volid(0);" >第${page.currentPage}页</a>
								</li>
							</ul>
							<s:if test="#request.page.hasNextPage">
								<a role="button"
									href="allgoodslist?currentPage=${page.currentPage + 1 }"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-right"></i>
								</a>
							</s:if>
							<s:else>
								<a role="button" href="javascript:volid(0);"
									class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
									class="fa fa-angle-right"></i>
								</a>
							</s:else>
						</div>
					</div>
					</section>
					<!--right column-->
					<aside class="col-lg-3 col-md-3 col-sm-3">
					<figure class="widget shadow r_corners wrapper m_bottom_30">
					<figcaption>
					<h3 class="color_light">
						目录
					</h3>
					</figcaption>
					<div class="widget_content">
						<!--Categories list-->
						<ul class="categories_list">
							<li class="active">
								<a href="javascript:volid(0);" class="f_size_large scheme_color d_block relative">
									<b>鲜花导航</b> 
									<br/><span
									class="bg_light_color_1 r_corners f_right color_dark talign_c"></span>
								</a>
								<!--second level-->
								<ul>
								<li >
										<a href="javascript:volid(0);" class="d_block f_size_large color_dark relative">
										</a>
										<!--third level-->
									</li>
									<li >
										<a href="querygoodslist?goods.cid=1" class="d_block f_size_large color_dark relative">
											浪漫恋情<span
											class="bg_light_color_1 r_corners f_right color_dark talign_c"></span>
										</a>
										<!--third level-->
									</li>
									<li>
										<a href="querygoodslist?goods.cid=2" class="d_block f_size_large color_dark relative">
											生日祝福<span
											class="bg_light_color_1 r_corners f_right color_dark talign_c"></span>
										</a>
									</li>
									<li>
										<a href="querygoodslist?goods.cid=3" class="d_block f_size_large color_dark relative">
											友谊长久<span
											class="bg_light_color_1 r_corners f_right color_dark talign_c"></span>
										</a>
									</li>
									<li>
										<a href="querygoodslist?goods.cid=4" class="d_block f_size_large color_dark relative">
											会议用花<span
											class="bg_light_color_1 r_corners f_right color_dark talign_c"></span>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					</figure>
					</aside>
				</div>
			</div>
		</div>
		<!--markup footer-->
		<jsp:include page="footer.jsp" />
		</body>
</html>
