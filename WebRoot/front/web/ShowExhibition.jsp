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
    
    <title>艺术考古数字博物馆-展览</title>
    
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="<%=path %>/js/iframe.js" type="text/javascript"></script>
  </head>
  
 <body>
<jsp:include page="common/top.jsp"/> 

<div class="mid">
 
	<div class="middleside" style="width: 740px;overflow: hidden;">
  <div class="content">
  <div style="width: 100%;font-weight: bold;font-size: 14px;" align="center"> ${article.title }</div>
  <div align="center" style="padding-right: 20px;color: red;font-size: 12px;font-weight: normal;"><font style="padding-right: 20px;">开始时间：${article.begindate }</font>结束时间：${article.enddate }</div>
  ${article.content }
</div>
</div>
	<div class="rightside">
		<iframe src="<%=path %>/front/web/right.jsp" style="border: 0;"  width="100%;" height="1" name="rframe"  id="rframe" onload="Javascript:SetCwinHeight('rframe')" scrolling="no" frameborder="0"></iframe>
	</div>
	
</div>
<jsp:include page="common/bottom.jsp"/>
</body>
</html>

