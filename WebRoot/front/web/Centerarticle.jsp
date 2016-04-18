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
    
    <title>艺术考古数字博物馆</title>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
	  <div style="width: 100%;font-size: 18px;font-family: 黑体;font-weight: bold;margin-bottom: 20px;" align="left"> 
	  ${article.title }
	  </div>
	 <div style="width: 100%"> 
	  ${article.content }
	</div>
  </body>
</html>
