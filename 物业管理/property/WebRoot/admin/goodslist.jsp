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

		<title>管理</title>
		<jsp:include page="/admin/header.jsp" />

		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">
				<ol class="breadcrumb">
					<li>
						<a href="admin/index.jsp">首页</a>
					</li>
					<li class="active">
						物业设备列表
					</li>
				</ol>
				<div class="margin-bottom-30">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<h4 class="margin-bottom-15">
									<a href="admin/goodsadd.jsp">添加新的设备信息</a>
								</h4>
								<table class="table table-striped table-hover table-bordered">
									<thead>
										<tr>
											<th>
												设备名称
											</th>
											<th>
												价格
											</th>
											<th>
												购买日期
											</th>
											<th>
												使用状态
											</th>
											<th>
												操作
											</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="#request.goodsList" status="vs" var="s">
											<tr>
												<td>
													${s.gname}
												</td>
												<td>
													${s.gprice}
												</td>
												<td>
													${s.gdate}
												</td>
												<td>
													${s.gtype}
												</td>
												<td>
													<a href="goodsToUpdate?goods.gid=${s.gid}"
														class="btn btn-default">修改</a>
												</td>
												<td>
													<a href="goodsdelete?goods.gid=${s.gid}"
														class="btn btn-default">删除</a>
												</td>
											</tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
							<ul class="pagination pull-right">
								<li>
									<a href="javascript:void(0);">共${page.totalPage}页</a>
								</li>
								<s:if test="#request.page.hasPrePage">
									<li>
										<a href="goodslist?currentPage=${page.currentPage -1 }">«</a>
									</li>
								</s:if>
								<s:else>
									<li>
										<a href="javascript:void(0);">«</a>
									</li>
								</s:else>
								<li>
									<a href="javascript:void(0);">第${page.currentPage}页 </a>
								</li>
								<s:if test="#request.page.hasNextPage">
									<li>
										<a href="goodslist?currentPage=${page.currentPage + 1 }">»</a>
									</li>
								</s:if>
								<s:else>
									<li>
										<a href="javascript:void(0);">»</a>
									</li>
								</s:else>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
		<jsp:include page="/admin/footer.jsp" />
		</body>
</html>
