<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>艺术考古数字博物馆-交流互动</title>
    
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="<%=path %>/js/iframe.js" type="text/javascript"></script>
  </head>
  
 <body>
<jsp:include page="common/top.jsp"/> 
<div class="mid" style="width: 1030px;">
	<div class="middleside" style="width: 690px;">
	<iframe width="100%" height="600"  frameborder="0" scrolling="no" src="http://widget.weibo.com/distribution/comments.php?language=zh_cn&width=0&height=600&skin=1&dpc=1&url=http://www.caicaisoft.com&titlebar=1&border=1&appkey=3877121700&colordiy=0&color=968A6F,968A6F,444444,5093d5,ffffff,f9f7fc&dpc=1"></iframe>
	</div>
	<div style="float: left;padding-top: 10px;">
		<iframe width="100%" height="600"frameborder="0" scrolling="no" src="http://widget.weibo.com/livestream/listlive.php?language=zh_cn&width=0&height=600&uid=2207812160&skin=1&refer=1&pic=1&titlebar=1&border=1&publish=1&atalk=1&recomm=1&at=1&atopic=%E6%B5%99%E6%B1%9F%E5%A4%A7%E5%AD%A6%E8%89%BA%E6%9C%AF%E4%B8%8E%E8%80%83%E5%8F%A4%E5%8D%9A%E7%89%A9%E9%A6%86~%E5%8D%9A%E7%89%A9%E9%A6%86~%E8%89%BA%E6%9C%AF%E4%B8%8E%E8%80%83%E5%8F%A4~%E6%96%87%E7%89%A9~%E4%B9%A6%E7%94%BB&ptopic=%E6%B5%99%E6%B1%9F%E5%A4%A7%E5%AD%A6%E8%89%BA%E6%9C%AF%E4%B8%8E%E8%80%83%E5%8F%A4%E5%8D%9A%E7%89%A9%E9%A6%86&listid=288153580&appkey=3877121700&dpc=1"></iframe>
	</div>
	
</div>
<jsp:include page="common/bottom.jsp"/>
</body>
</html>
