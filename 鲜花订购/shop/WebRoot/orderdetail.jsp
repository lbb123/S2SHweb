<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详情</title>
<jsp:include page="header.jsp" />
			<!--breadcrumbs-->
			<section class="breadcrumbs">
				<div class="container">
					<ul class="horizontal_list clearfix bc_list f_size_medium">
						<li class="m_right_10 current"><a href="#" class="default_t_color">首页<i class="fa fa-angle-right d_inline_middle m_left_10"></i></a></li>
						<li><a href="#" class="default_t_color">订单详情</a></li>
					</ul>
				</div>
			</section>
			<!--content-->
			<div class="page_content_offset">
				<div class="container">
					<div class="row clearfix">
						<!--left content column-->
						<section class="col-lg-9 col-md-9 col-sm-9">
							<div id="tab-1">
							<ul class="tabs_nav horizontal_list clearfix">
										<li class="f_xs_none"><a href="#" class="bg_light_color_1 color_dark tr_delay_hover r_corners d_block">订单信息</a></li>
									</ul>
										<table class="table_type_7 responsive_table full_width t_align_l">
											<thead>
												<tr class="f_size_large">
													<th>鲜花名称</th>
													<th>鲜花单价</th>
													<th>鲜花个数</th>
													<th>鲜花总价</th>
												</tr>
											</thead>
											<tbody>
											<s:iterator value="#request.itemList" status="vs" var="s">
												<tr>
													<td data-title="Product Name">
														<a href="allgoodsTodetail?orderitem.gid=${s.goods.gid}" class="color_dark d_inline_b m_bottom_5">${s.goods.gname}</a><br>
													</td>
													<td data-title="Qty">￥${s.goods.gprice}</td>
													<td data-title="Product Status">${s.orderitem.gnum}</td>
													<td data-title="Total"><p class="color_dark f_size_large">￥${s.toprice}</p></td>
												</tr>
											</s:iterator>	
											</tbody>
										</table>
									</div>
							<!--order info tables-->
							<table class="table_type_6 responsive_table full_width r_corners shadow m_bottom_45 t_align_l">
								<tr>
									<td class="f_size_large d_xs_none">收件人姓名</td>
									<td data-title="Order Number">${order.oname}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">收件地址</td>
									<td data-title="Order Date">${order.oaddress}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">订单状态</td>
									<td data-title="Order Status">${order.otype}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">订单号</td>
									<td data-title="Last Update">${order.obiaohao}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">付款方式</td>
									<td data-title="Shipment">${order.ofukuang}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">送货方式</td>
									<td data-title="Payment">${order.ofasong}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">订单生成时间</td>
									<td data-title="Payment">${order.odate}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">联系电话</td>
									<td data-title="Payment">${order.ophone}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">联系邮箱</td>
									<td data-title="Payment">${order.oemail}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">备注</td>
									<td data-title="Comment">${order.obeizhu}</td>
								</tr>
								<tr>
									<td class="f_size_large d_xs_none">总价</td>
									<td data-title="Total"><p class="fw_medium f_size_large scheme_color">￥${order.ozongjia}</p></td>
								</tr>
							</table>
							
						</section>
					</div>
				</div>
			</div>
			<!--markup footer-->
<jsp:include page="footer.jsp" />
	</body>
</html>
