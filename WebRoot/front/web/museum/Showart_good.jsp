<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>艺术考古数字博物馆</title>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />

</head>
  <body style="height: 600px;">
  <div class="middleside">
  <div class="content">
  <div style="width: 100%;font-size: 14px;font-family: 宋体;font-weight: bold;" align="center"> ${art_good.name }</div>
  <div style="float: left;padding-right: 10px;"><a href="<%=path %>/museum.do?methede=showpic&id=${art_good.id }" target="_blank"><img src="<%=path %>/upload/art_goods/${art_good.pic }" width="300px;" alt="点击查看大图"/></a></div>
  <div style="float: left;">
  ${art_good.content }
  </div>
</div>
</div>
  </body>
</html>
