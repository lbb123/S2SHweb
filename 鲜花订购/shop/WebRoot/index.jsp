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
							浪漫邂逅
						</div>
						<hr class="slider_divider d_inline_b m_bottom_5">
						<div
							class="color_light slider_title tt_uppercase t_align_c m_bottom_45 m_sm_bottom_20">
							<b>一生一世 &amp; 长长久久<br>热卖</b>
						</div>
						<div class="color_light slider_title_2 m_bottom_45">
						</div>
						<a href="querygoodslist?goods.gtype=0" role="button"
							class="tr_all_hover button_type_4 bg_scheme_color color_light r_corners tt_uppercase">立即购买</a>
					</div>
				</div>
				<div data-src="images/s1.jpg"
					data-custom-thumb="images/slide_01.jpg">
					<div class="camera_caption_2 fadeIn t_align_c d_xs_none">
						<div class="f_size_large tt_uppercase slider_title_3 scheme_color">
						</div>
						<hr class="slider_divider type_2 m_bottom_5 d_inline_b">
						<div
							class="color_light slider_title tt_uppercase t_align_c m_bottom_65 m_sm_bottom_20">
							<b><span class="scheme_color">新花上市</span>
							<br>
								<span class="color_dark">抢购中</span>
							</b>
						</div>
						<a href="allgoodslist" role="button"
							class="d_sm_inline_b button_type_4 bg_scheme_color color_light r_corners tt_uppercase tr_all_hover">点击查看</a>
					</div>
				</div>
				<div data-src="images/s3.jpg"
					data-custom-thumb="images/slide_03.jpg">
					<div class="camera_caption_3 fadeFromTop t_align_c d_xs_none">
						<img src="images/slider_layer_img.png" alt="" class="m_bottom_5">
						<div
							class="color_light slider_title tt_uppercase t_align_c m_bottom_60 m_sm_bottom_20">
							<b class="color_dark">特价专场</b>
						</div>
						<a href="querygoodslist?goods.gtype=1" role="button"
							class="d_sm_inline_b button_type_4 bg_scheme_color color_light r_corners tt_uppercase tr_all_hover">尽情抢购</a>
					</div>
				</div>
			</div>
			<div class="copyrights">
				Collect from
				<a href="#"></a>
			</div>
			<!--content-->
			<div class="page_content_offset">
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
	</body>
</html>
