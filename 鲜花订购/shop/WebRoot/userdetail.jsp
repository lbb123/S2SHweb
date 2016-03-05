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

		<title>我的信息</title>
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
					<a href="#" class="default_t_color">我的信息</a>
				</li>
			</ul>
		</div>
		</section>
		<!--content-->
		<div class="page_content_offset">
			<div class="container">
				<div class="row clearfix">
					<!--left content column-->
					<section class="col-lg-9 col-md-9 col-sm-9">
					<h2 class="tt_uppercase color_dark m_bottom_25">
						我的信息
					</h2>
					<!--order info tables-->
					<table
						class="table_type_6 responsive_table full_width r_corners shadow m_bottom_45 t_align_l">
						<tr>
							<td class="f_size_large d_xs_none">
								用户名
							</td>
							<td data-title="Order Number">
								${sessionScope.user.name}
							</td>
						</tr>
						<tr>
							<td class="f_size_large d_xs_none">
								邮箱
							</td>
							<td data-title="Order Date">
								${sessionScope.user.email}
							</td>
						</tr>
						<tr>
							<td class="f_size_large d_xs_none">
								真实姓名
							</td>
							<td data-title="Order Status">
								${sessionScope.user.uname}
							</td>
						</tr>
						<tr>
							<td class="f_size_large d_xs_none">
								性别
							</td>
							<td data-title="Last Update">
								${sessionScope.user.sex}
							</td>
						</tr>
						<tr>
							<td class="f_size_large d_xs_none">
								手机号
							</td>
							<td data-title="Shipment">
								${sessionScope.user.phone}
							</td>
						</tr>
						<tr>
							<td class="f_size_large d_xs_none">
								身份证号
							</td>
							<td data-title="Payment">
								${sessionScope.user.idcard}
							</td>
						</tr>
						<tr>
							<td class="f_size_large d_xs_none">
								地址
							</td>
							<td data-title="Comment">
								${sessionScope.user.uaddress}
							</td>
						</tr>
						<tr>
							<td class="f_size_large d_xs_none">
								最后修改时间
							</td>
							<td data-title="Total">
									${sessionScope.user.udate}
							</td>
						</tr>
					</table>
					<a href="userupdate.jsp" ><button class="tr_delay_hover r_corners button_type_14 bg_scheme_color color_light">修改</button></a>
					</section>
				</div>
			</div>
		</div>
		<!--markup footer-->
		<jsp:include page="footer.jsp" />
		</body>
</html>
