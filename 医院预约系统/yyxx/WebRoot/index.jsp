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
    
    <title>首页</title>
<jsp:include page="header.jsp" />

<!--=== Slider ===-->
<div class="slider-inner">
    <div id="da-slider" class="da-slider">
        <div class="da-slide">
            <h2><i>用心 &amp; 呵护</i> <br /> <i>保障您的生命安全</i> <br /> </h2>
            <p><i>先做人后做事。</i> <br /> <i>真才实学才是幸福的本钱。</i> <br /> <i>人生最大之幸福即心地善良。</i></p>
            <div class="da-img"></div>
        </div>
        <div class="da-slide">
            <h2><i>以文化为引领</i> <br /> <i>以医疗为根本</i> <br /> <i>以教学为中心</i></h2>
            <p><i>回归人文、回归临床、回归基本功</i> <br /> <i>推进医、教、研、防、管五位一体的办院理念</i></p>
            <div class="da-img span6">
            </div>
        </div>
        <div class="da-slide">
            <h2><i>努力进取</i> <br /> <i>开拓创新</i> <br /> <i>为人民的健康服务</i></h2>
            <p><i>争创国内一流品牌医院</i> <br /> <i>谱写辉煌的篇章</i> <br /> <i>为百姓保健康、为职工谋福利 </i></p>
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
