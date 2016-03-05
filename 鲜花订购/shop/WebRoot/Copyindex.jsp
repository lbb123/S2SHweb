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

		<title>首页</title>
		
		<jsp:include page="header.jsp" />
			<!--search form-->
			<div class="searchform_wrap tf_xs_none tr_all_hover">
				<div class="container vc_child h_inherit relative">
					<form role="search" class="d_inline_middle full_width">
						<input type="text" name="search"
							placeholder="Type text and hit enter" class="f_size_large">
					</form>
					<button class="close_search_form tr_all_hover d_xs_none color_dark">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			</section>
			</header>
			<!--slider-->
			<div class="camera_wrap m_bottom_0">
				<div data-src="images/s2.jpg"
					data-custom-thumb="images/s1.jpg">
					<div class="camera_caption_1 fadeFromTop t_align_c d_xs_none">
						<div
							class="f_size_large color_light tt_uppercase slider_title_3 m_bottom_5">
							Meet New Theme
						</div>
						<hr class="slider_divider d_inline_b m_bottom_5">
						<div
							class="color_light slider_title tt_uppercase t_align_c m_bottom_45 m_sm_bottom_20">
							<b>Attractive &amp; Elegant<br>HTML Theme</b>
						</div>
						<div class="color_light slider_title_2 m_bottom_45">
							$
							<b>15.00</b>
						</div>
						<a href="#" role="button"
							class="tr_all_hover button_type_4 bg_scheme_color color_light r_corners tt_uppercase">Buy
							Now</a>
					</div>
				</div>
				<div data-src="images/s1.jpg"
					data-custom-thumb="images/slide_01.jpg">
					<div class="camera_caption_2 fadeIn t_align_c d_xs_none">
						<div class="f_size_large tt_uppercase slider_title_3 scheme_color">
							New arrivals
						</div>
						<hr class="slider_divider type_2 m_bottom_5 d_inline_b">
						<div
							class="color_light slider_title tt_uppercase t_align_c m_bottom_65 m_sm_bottom_20">
							<b><span class="scheme_color">Spring/Summer 2014</span>
							<br>
								<span class="color_dark">Ready-To-Wear</span>
							</b>
						</div>
						<a href="#" role="button"
							class="d_sm_inline_b button_type_4 bg_scheme_color color_light r_corners tt_uppercase tr_all_hover">View
							Collection</a>
					</div>
				</div>
				<div data-src="images/s3.jpg"
					data-custom-thumb="images/slide_03.jpg">
					<div class="camera_caption_3 fadeFromTop t_align_c d_xs_none">
						<img src="images/slider_layer_img.png" alt="" class="m_bottom_5">
						<div
							class="color_light slider_title tt_uppercase t_align_c m_bottom_60 m_sm_bottom_20">
							<b class="color_dark">up to 70% off</b>
						</div>
						<a href="#" role="button"
							class="d_sm_inline_b button_type_4 bg_scheme_color color_light r_corners tt_uppercase tr_all_hover">Shop
							Now</a>
					</div>
				</div>
			</div>
			<div class="copyrights">
				Collect from
				<a href="#"></a>
			</div>
			<!--content-->
			<div class="page_content_offset">
				<div class="container">
					<h2
						class="tt_uppercase m_bottom_20 color_dark heading1 animate_ftr">
						商品推荐
					</h2>
					<!--filter navigation of products-->
					<ul
						class="horizontal_list clearfix tt_uppercase isotope_menu f_size_ex_large">
						<li class="active m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr">
							<button
								class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none"
								data-filter="*">
								展示
							</button>
						</li>
					</ul>
					<!--products-->
					<section
						class="products_container clearfix m_bottom_25 m_sm_bottom_15">
					<!--product item-->
					<div class="product_item" id="div00">
					</div>
					<div class="product_item" id="div01">
					</div>
					</section>

					<!--banners-->
					<div class="row clearfix">
					</div>
				</div>
			</div>
			<!--markup footer-->
			<footer id="footer">
			<div class="footer_top_part">
				<div class="container">
					<div class="row clearfix">
						<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
							<h3 class="color_light_2 m_bottom_20">
								联系我们
							</h3>
							<p class="m_bottom_25">
								全国订购热线:100-100-1000(免长途费)
								<br>
								7x24小时在线订购
								<br>
								客服工作时间：8:30-21:00
								<br>
								E-mail: flowers@163.com
							</p>
							<!--social icons-->
							<ul class="clearfix horizontal_list social_icons">
								<li class="facebook m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Facebook</span>
									<a href="#"
										class="r_corners t_align_c tr_delay_hover f_size_ex_large">
										<i class="fa fa-facebook"></i> </a>
								</li>
								<li class="twitter m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Twitter</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-twitter"></i> </a>
								</li>
								<li class="google_plus m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Google
										Plus</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-google-plus"></i> </a>
								</li>
								<li class="rss m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Rss</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-rss"></i> </a>
								</li>
								<li class="pinterest m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Pinterest</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-pinterest"></i> </a>
								</li>
								<li class="instagram m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Instagram</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-instagram"></i> </a>
								</li>
								<li class="linkedin m_bottom_5 m_sm_left_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">LinkedIn</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-linkedin"></i> </a>
								</li>
								<li class="vimeo m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Vimeo</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-vimeo-square"></i> </a>
								</li>
								<li class="youtube m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Youtube</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-youtube-play"></i> </a>
								</li>
								<li class="flickr m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Flickr</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-flickr"></i> </a>
								</li>
								<li class="envelope m_left_5 m_bottom_5 relative">
									<span
										class="tooltip tr_all_hover r_corners color_dark f_size_small">Contact
										Us</span>
									<a href="#"
										class="r_corners f_size_ex_large t_align_c tr_delay_hover">
										<i class="fa fa-envelope-o"></i> </a>
								</li>
							</ul>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
							<h3 class="color_light_2 m_bottom_20">
								客户服务
							</h3>
							<ul class="vertical_list">
								<li>
									<a class="color_light tr_delay_hover" href="#">服务声明<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">支付说明<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">配送说明<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">隐私条款<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">安全条款<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
							<h3 class="color_light_2 m_bottom_20">
								热门咨询
							</h3>
							<ul class="vertical_list">
								<li>
									<a class="color_light tr_delay_hover" href="#">购物流程<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">订购演示<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">配送城市<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">售后服务<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
								<li>
									<a class="color_light tr_delay_hover" href="#">预订鲜花<i
										class="fa fa-angle-right"></i>
									</a>
								</li>
							</ul>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3">
							<h3 class="color_light_2 m_bottom_20">
								支持服务
							</h3>
							<p class="f_size_medium m_bottom_15">
								支付合作企业公司
							</p>
							<ul class="clearfix horizontal_list social_icons">
								<li class="m_left_5">
									<img src="images/payment_img_1.png" alt="">
								</li>
								<li class="m_left_5">
									<img src="images/payment_img_2.png" alt="">
								</li>
								<li class="m_left_5">
									<img src="images/payment_img_3.png" alt="">
								</li>
								<li class="m_left_5">
									<img src="images/payment_img_4.png" alt="">
								</li>
								<li class="m_left_5">
									<img src="images/payment_img_5.png" alt="">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--copyright part-->
			<div class="footer_bottom_part">
				<div class="container clearfix t_mxs_align_c">
					<p class="f_left f_mxs_none m_mxs_bottom_10">
						&copy; 2016
						<span class="color_light">Flowers</span>.
						<a href="admin/login.jsp" target="_blank" title="中北大学软件学院">中北大学软件学院</a>
					</p>

				</div>
			</div>
			</footer>
		</div>
		
		</div>
		<button class="t_align_c r_corners tr_all_hover animate_ftl"
			id="go_to_top">
			<i class="fa fa-angle-up"></i>
		</button>
		<!--scripts include-->
	
		<script src="js/jquery-2.1.0.min.js">
</script>
		<script src="js/jquery-migrate-1.2.1.min.js">
</script>
		<script src="js/retina.js">
</script>
		<script src="js/camera.min.js">
</script>
		<script src="js/jquery.easing.1.3.js">
</script>
		<script src="js/waypoints.min.js">
</script>
		<script src="js/jquery.isotope.min.js">
</script>
		<script src="js/owl.carousel.min.js">
</script>
		<script src="js/jquery.tweet.min.js">
</script>
		<script src="js/jquery.custom-scrollbar.js">
</script>
		<script src="js/scripts.js">
</script>
	<script>
$(document).ready(function(){
	var url = "goodsajaxlist";
	$.ajax({
	type:'get',
	url:url,
	dataType: 'json',
	error:function(status){  
		  alert(status); 
        alert("error");  
    },  
	success:function(date){
    	$.each(date, function(i, item) {
        var text1='<figure	class="r_corners photoframe shadow relative animate_ftb long">	' +
        '<!--product preview-->' +
						'<a href="#" class="d_block relative wrapper pp_wrap"> <img' +
						'		src="images/product_img_6.jpg" class="tr_all_hover" alt="">' +
						'	<span data-popup="#quick_view_product"' +
						'	class="box_s_none button_type_5 color_light r_corners tr_all_hover d_xs_none">Quick' +
						'		View</span> <span class="clearfix p_buttons d_block tr_all_hover">' +
						'		<span' +
						'		class="box_s_none button_type_5 tr_delay_hover f_left r_corners color_light p_hr_0"><i' +
						'			class="fa fa-heart-o"></i>' +
						'	</span> <span' +
						'		class="box_s_none button_type_5 tr_delay_hover f_left r_corners color_light m_left_5 p_hr_0"><i' +
						'			class="fa fa-files-o"></i>' +
						'	</span> </span> </a>' +
						'<!--description and price of product-->' +
						'<figcaption>' +
						'<h5 class="m_bottom_10">' +
						'	<a href="#" class="color_dark">Ut tellus dolor dapibus</a>' +
						'</h5>' +
						'<div class="clearfix m_bottom_15">' +
						'	<p class="scheme_color f_size_large f_left">' +
						'		$57.00' +
						'	</p>' +
						'	<!--rating-->' +
						'	<ul' +
						'		class="horizontal_list f_right clearfix rating_list tr_all_hover">' +
						'		<li class="active">' +
						'			<i class="fa fa-star-o empty tr_all_hover"></i>' +
						'			<i class="fa fa-star active tr_all_hover"></i>' +
						'		</li>' +
						'		<li class="active">' +
						'			<i class="fa fa-star-o empty tr_all_hover"></i>' +
						'			<i class="fa fa-star active tr_all_hover"></i>' +
						'		</li>' +
						'		<li class="active">' +
						'			<i class="fa fa-star-o empty tr_all_hover"></i>' +
						'			<i class="fa fa-star active tr_all_hover"></i>' +
						'		</li>' +
						'		<li class="active">' +
						'			<i class="fa fa-star-o empty tr_all_hover"></i>' +
						'			<i class="fa fa-star active tr_all_hover"></i>' +
						'		</li>' +
						'		<li>' +
						'			<i class="fa fa-star-o empty tr_all_hover"></i>' +
						'			<i class="fa fa-star active tr_all_hover"></i>' +
						'		</li>' +
						'	</ul>' +
						'</div>' +
						'<button' +
						'	class="button_type_4 bg_scheme_color r_corners tr_all_hover color_light mw_0">' +
						'	Add to Cart22' +
						'</button>' +
						'</figcaption>' +
						'</figure>';
        document.getElementById("div0"+i+"").innerHTML =text1;
    });
	},
	});
})
</script>
	</body>
</html>
