<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>艺术考古数字博物馆</title>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
  
  <body>
  <div class="middleside">
  <div class="content">
  <div align="center" >如果无法正常显示pdf文件，请<a href="<%=path %>/software/AdbeRdr940_zh_CN.exe" style="color: red;">点击下载</a>安装相关软件 </div>
  <object classid="clsid:CA8A9780-280D-11CF-A24D-444553540000" type="application/pdf" width="800" height="700" border=0 name="pdf">    
<param name="toolbar" value="false" />   
<param name="_Version" value="65539" />   
<param name="_ExtentX" value="20108" />   
<param name="_ExtentY" value="10866" />   
<param name="_StockProps" value="0" />   
<param name="SRC" value="<%=path %>/upload/publications/${fn:replace(publication.attachment,'\\','/') }" />   
</object>   
</div>
</div>
  </body>
</html>