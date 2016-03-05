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

		<title>修改</title>
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
					<a href="#" class="default_t_color">修改我的信息</a>
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
					<form action="userupdate" method="post">
						<table
							class="table_type_6 responsive_table full_width r_corners shadow m_bottom_45 t_align_l">
							<tr>
								<td class="f_size_large d_xs_none">
									用户名
								</td>
								<td data-title="Order Number">
								<input class="form-control" type="hidden" name="user.id"
										value="${sessionScope.user.id}">
									<input class="form-control" type="text" name="user.name"
										value="${sessionScope.user.name}">
								</td>
							</tr>
							<tr>
								<td class="f_size_large d_xs_none">
									密码
								</td>
								<td data-title="Order Date">
									<input class="form-control" type="password" name="user.password"
										value="${sessionScope.user.password}">
								</td>
							</tr>
							<tr>
								<td class="f_size_large d_xs_none">
									邮箱
								</td>
								<td data-title="Order Date">
									<input class="form-control" type="text" name="user.email"
										value="${sessionScope.user.email}">
								</td>
							</tr>
							<tr>
								<td class="f_size_large d_xs_none">
									真实姓名
								</td>
								<td data-title="Order Status">
								<input class="form-control" type="text" name="user.uname"
										value="${sessionScope.user.uname}">
								</td>
							</tr>
							<tr>
								<td class="f_size_large d_xs_none">
									性别
								</td>
								<td data-title="Last Update">
									<input  type="radio" name="user.sex"
								value="男" checked="checked">
							男
							<input  type="radio" name="user.sex"
								value="女" placeholder="女">
							女
								</td>
							</tr>
							<tr>
								<td class="f_size_large d_xs_none">
									手机号
								</td>
								<td data-title="Shipment">
								<input class="form-control" type="text" name="user.phone"
										value="${sessionScope.user.phone}">
								</td>
							</tr>
							<tr>
								<td class="f_size_large d_xs_none">
									身份证号
								</td>
								<td data-title="Payment">
								<input class="form-control" type="text" name="user.idcard"
										value="${sessionScope.user.idcard}">
								</td>
							</tr>
							<tr>
								<td class="f_size_large d_xs_none">
									地址
								</td>
								<td data-title="Comment">
								<input class="form-control" type="text" name="user.uaddress"
										value="${sessionScope.user.uaddress}">
								</td>
							</tr>
						</table>
						<input class="tr_delay_hover r_corners button_type_14 bg_scheme_color color_light" type="submit" 
										value="提交修改">
					</form>
					</section>
				</div>
			</div>
		</div>
		<!--markup footer-->
		<jsp:include page="footer.jsp" />
		</body>
</html>
