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
		<title>管理员中心</title>
		<jsp:include page="header.jsp" />
	</head>
	<body class="bootstrap-admin-with-small-navbar">
		<jsp:include page="left.jsp" />
				<!-- content -->
				<div class="col-md-10">
					<div class="row">
						<div class="col-lg-12">
							<div class="page-header">
								<h1>
									简历列表
								</h1>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
				<div class="panel panel-default" style="height: 500">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title">Table with actions</div>
                                </div>
                                <div class="bootstrap-admin-panel-content">
                                    <table class="table bootstrap-admin-table-with-actions">
                                        <thead>
                                            <tr>
                                                <th>简历名称</th>
                                                <th>姓名</th>
                                                <th>期望的工作</th>
                                                <th>手机</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="#request.resumeList" status="vs" var="s">
                                            <tr>
                                                <td>${s.name}</td>
                                                <td>${s.username}</td>
                                                <td>${s.jobwant}</td>
                                                <td>${s.phone}</td>
                                                <td class="actions">
                                                    <a href="mresumedetail?resume.id=${s.id}">
                                                        <button class="btn btn-sm btn-success">
                                                            <i class="glyphicon glyphicon-ok-sign"></i>
                                                           查看
                                                        </button>
                                                    </a>
                                                    
                                                    <a href="mresumedelete?resume.id=${s.id}">
                                                        <button class="btn btn-sm btn-danger">
                                                            <i class="glyphicon glyphicon-trash"></i>
                                                           删除
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            </s:iterator>
                                           
                                        </tbody>
                                    </table>
                                    <br>
								<span class="btn btn-default">	当前第
							<s:property value="#request.page.currentPage" />
							页，共
							<s:property value="#request.page.totalPage" />
							页
							</span>
							<s:if test="#request.page.hasPrePage">
								<span class="btn btn-default"><a href="mresumelist?currentPage=1">首页</a>
								</span>
								<span class="btn btn-default"><a
									href="mresumelist?currentPage=${page.currentPage -1 }">上一页</a>
								</span>
							</s:if>
							<s:else>
								<span class="btn btn-default">首页</span>
								<span class="btn btn-default">上一页</span>
							</s:else>

							<s:if test="#request.page.hasNextPage">
								<span class="btn btn-default"><a
									href="mresumelist?currentPage=${page.currentPage + 1 }">下一页</a>
								</span>
								<span class="btn btn-default"><a
									href="mresumelist?currentPage=${page.totalPage }">尾页</a>
								</span>
							</s:if>
							<s:else>
								<span class="btn btn-default">下一页</span>
								<span class="btn btn-default">尾页</span>
							</s:else>
                                </div>
                            </div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
		<script type="text/javascript">
            $(function() {
                $('.datepicker').datepicker();
                $('.uniform_on').uniform();
                $('.chzn-select').chosen();
                $('.selectize-select').selectize();
                $('.textarea-wysihtml5').wysihtml5({
                    stylesheets: [
                        'vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/stylesheets/bootstrap-wysihtml5/wysiwyg-color.css'
                    ]
                });

                $('#rootwizard').bootstrapWizard({
                    'nextSelector': '.next',
                    'previousSelector': '.previous',
                    onNext: function(tab, navigation, index) {
                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        var $percent = ($current / $total) * 100;
                        $('#rootwizard').find('.progress-bar').css('width', $percent + '%');
                        // If it's the last tab then hide the last button and show the finish instead
                        if ($current >= $total) {
                            $('#rootwizard').find('.pager .next').hide();
                            $('#rootwizard').find('.pager .finish').show();
                            $('#rootwizard').find('.pager .finish').removeClass('disabled');
                        } else {
                            $('#rootwizard').find('.pager .next').show();
                            $('#rootwizard').find('.pager .finish').hide();
                        }
                    },
                    onPrevious: function(tab, navigation, index) {
                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        var $percent = ($current / $total) * 100;
                        $('#rootwizard').find('.progress-bar').css('width', $percent + '%');
                        // If it's the last tab then hide the last button and show the finish instead
                        if ($current >= $total) {
                            $('#rootwizard').find('.pager .next').hide();
                            $('#rootwizard').find('.pager .finish').show();
                            $('#rootwizard').find('.pager .finish').removeClass('disabled');
                        } else {
                            $('#rootwizard').find('.pager .next').show();
                            $('#rootwizard').find('.pager .finish').hide();
                        }
                    },
                    onTabShow: function(tab, navigation, index) {
                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        var $percent = ($current / $total) * 100;
                        $('#rootwizard').find('.bar').css({width: $percent + '%'});
                    }
                });
                $('#rootwizard .finish').click(function() {
                    alert('Finished!, Starting over!');
                    $('#rootwizard').find('a[href*=\'tab1\']').trigger('click');
                });
            });
        </script>
	</body>
</html>
