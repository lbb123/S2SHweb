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
		<jsp:include page="header.jsp" />
				<!--=== Breadcrumbs ===-->
		<div class="row-fluid breadcrumbs margin-bottom-20">
			<div class="container">
				<h1 class="pull-left">
					民意信息
				</h1>
				<ul class="pull-right breadcrumb">
				<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
					<li class="active">
						民意信息
					</li>
				</ul>
			</div>
		</div>
		<!--=== End Breadcrumbs ===-->
		<!--=== Content Part ===-->
		<div class="container">
			<div class="margin-bottom-30">
					<div class="row">
						<div class="span6">
							<div class="span6">
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>标题：</strong> ${message.mtitle}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>上报单位：</strong> ${message.msendname}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>反映人：</strong> ${message.mauthor}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>批复人：</strong> ${message.mpifu}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>处理状态：</strong> ${message.mtype}
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="span6">
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>民意分类：</strong>${message.mcatelog}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>信息来源：</strong>${message.utype}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>民意价值评分：</strong>${message.mfenshu}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>备注：</strong>${message.mbeizhu}
								</div>
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>采用时间：</strong>${message.mfenshudate}
								</div>
							</div>
						</div>
						<div class="span12">
							<div class="span12">
								<div class="alert alert-success alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">×</span>
									</button>
									<strong>内容：</strong> ${message.mnewcontent}
								</div>
							</div>
						</div>
					</div>
				</div>
			<!--/row-fluid-->
			<!--//Default Tables styles -->
		</div>
		<!--/container-->
		<!--=== End Content Part ===-->

		<jsp:include page="footer.jsp" />
	</body>
</html>
