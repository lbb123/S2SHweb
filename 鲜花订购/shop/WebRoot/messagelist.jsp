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

		<title>留言列表</title>
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
					<a href="#" class="default_t_color">留言列表</a>
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
					<h2 class="tt_uppercase color_dark m_bottom_30">
						我的留言列表
					</h2>
					<!--orders list table-->
					<table
						class="table_type_3 responsive_table full_width r_corners wrapper shadow bg_light_color_1 m_bottom_30 t_align_l">
						<thead>
							<tr class="f_size_large">
								<!--titles for td-->
								<th>
									留言内容
								</th>
								<th>
									留言时间
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.messageList" status="vs" var="s">
								<tr>
									<!--order number-->
									<td data-title="Order Date">
										${s.mcontent}
									</td>
									<!--order status-->
									<td data-title="Order Status">
										${s.mdate}
									</td>
									<td data-title="Order Status">
										<a href="replylist?message.mid=${s.mid}"><button
												class="button_type_6 bg_scheme_color f_size_large r_corners tr_all_hover color_light m_bottom_20">
												查看回复
											</button>
										</a>
										<a href="messagedelete?message.mid=${s.mid}"><button
												class="button_type_6 bg_scheme_color f_size_large r_corners tr_all_hover color_light m_bottom_20">
												删除留言
											</button>
										</a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<div
						class="col-lg-5 col-md-5 col-sm-4 col-xs-12 t_align_r t_xs_align_l">
						<!--pagination-->
						<p class="d_inline_middle f_size_medium d_xs_block m_xs_bottom_5">
							每页5个/共${page.totalPage}页
						</p>
						<s:if test="#request.page.hasPrePage">
							<a role="button"
								href="mymessage?currentPage=${page.currentPage -1 }"
								class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
								class="fa fa-angle-left"></i> </a>
						</s:if>
						<s:else>
							<a role="button" href="javascript:volid(0);"
								class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
								class="fa fa-angle-left"></i> </a>
						</s:else>
						<ul
							class="horizontal_list clearfix d_inline_middle f_size_medium m_left_10">
							<li class="m_right_10">
								<a class="color_dark" href="javascript:volid(0);">第${page.currentPage}页</a>
							</li>
						</ul>
						<s:if test="#request.page.hasNextPage">
							<a role="button"
								href="mymessage?currentPage=${page.currentPage + 1 }"
								class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
								class="fa fa-angle-right"></i> </a>
						</s:if>
						<s:else>
							<a role="button" href="javascript:volid(0);"
								class="button_type_10 color_dark d_inline_middle bg_cs_hover bg_light_color_1 t_align_c tr_delay_hover r_corners box_s_none"><i
								class="fa fa-angle-right"></i> </a>
						</s:else>
					</div>
					</section>
				</div>
			</div>
		</div>
		<!--markup footer-->
		<jsp:include page="footer.jsp" />
		</body>
</html>
