<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>DBC首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript">
  function goto(str)
  {
    window.location.href=str;
  }
  </script>
  </head>
  
  <body onload="goto('<%=path %>/front.do?methede=toIndex')"><!--
   <table border="1" width="100%">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <a href="<%=path %>/bbs.do?methede=toBbs">进入论坛</a>
   </td>
   </tr>
   
   </table>
  --></body>
  <script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>
