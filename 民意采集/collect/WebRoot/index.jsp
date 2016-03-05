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
    
<jsp:include page="header.jsp" />

<!--=== Slider ===-->
<div class="slider-inner">
    <div id="da-slider" class="da-slider">
        <div class="da-slide">
            <h2><i>社情民意研究室</i> <br /> </h2>
            <p><i>收集整理反馈有关重要信息和动态</i> <br /> <i>向省政协信息中心及市委、市政府和相关职能部门</i> <br /> <i>反映委员意见和建议</i></p>
            <div class="da-img"></div>
        </div>
        <div class="da-slide">
            <h2><i>研究室职责</i> <br /> </h2>
            <p><i>负责新时期人民政协理论和统战理论的研究、探讨</i> <br /> <i>负责政协信息网络和通讯工作，负责全国地市政协信息资料工作，编辑领导参阅。</i></p>
            <div class="da-img span6">
            </div>
        </div>
        <div class="da-slide">
            <h2><i>努力进取</i> <br /> <i>开拓创新</i> <br /> <i>为人民服务</i></h2>
            <p><i>听取社会意见</i> <br /> <i>谱写辉煌的篇章</i> <br /> <i>为百姓保健康、为人民谋福利 </i></p>
            <div class="da-img"><img src="assets/plugins/parallax-slider/img/html5andcss3.png" alt="image01" /></div>
        </div>
        <nav class="da-arrows">
            <span class="da-arrows-prev"></span>
            <span class="da-arrows-next"></span>		
        </nav>
    </div><!--/da-slider-->
</div><!--/slider-->
<!--=== End Slider ===-->
	<jsp:include page="footer.jsp" />
	</body>
</html>
