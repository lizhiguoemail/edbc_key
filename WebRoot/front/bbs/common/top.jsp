<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-color: #E8F4FF;">
   <table height="100px;" width="100%;" style="font-size: 14px;">
   <tr><td align="left" colspan="11" style="padding-left: 50px;"><font style="font-size: 16px;FILTER: Shadow(color=#4A7AC9,direction=135); HEIGHT: 19pt;" face="Verdana" color="#ffffff">${bbs_params.bbs_name }</font></td></tr>
   <tr>
   <td style="width: 60%;padding-left: 10px;" align="left">
    <a href="<%=path %>/bbs.do?methede=toBbs" style="color: #6587A1;text-decoration: none;font-weight: bold;">论坛首页</a>
    <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
    <a href="<%=path %>/bbs.do?methede=toSearchPost" style="color: #6587A1;text-decoration: none;font-weight: bold;">搜索</a>
   <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
    <a href="<%=path %>/index.jsp" style="color: #6587A1;text-decoration: none;font-weight: bold;">离开</a> 
   <c:if test="${userinfo.bbs_admin eq '1'}"> 
   <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
    <a href="<%=path %>/front/bbs/manage/Default.jsp" style="color: #6587A1;text-decoration: none;font-weight: bold;">管理中心</a>
    </c:if>
    </td>
     <td style="width: 40%;padding-right: 10px;font-size: 12px;" align="right" valign="bottom">
   <c:if test="${empty userinfo}">
   欢迎您 ：<font color="#DF30ED">客人</font> 
    <a href="<%=path %>/bbs.do?methede=tologin" style="color: #6587A1;text-decoration: none;">登录</a>
   | <a href="<%=path %>/user.do?methede=toregEXT" target="_blank" style="color: #6587A1;text-decoration: none;">注册</a>
   </c:if>
   <c:if test="${not empty userinfo}">
   欢迎您 ：<font color="#DF30ED">${userinfo.nickname}</font>
   &nbsp;&nbsp;IP：<font color="#DF30ED">${userinfo.loginIp }</font>
    【<a href="<%=path %>/bbs.do?methede=tologin" style="color: red;">重新登录</a>
     <b>|</b>
     <a href="<%=path %>/bbs.do?methede=loginout" style="color: red;">注消</a>】
   </c:if>
   </tr>
   </table>
  </body>
  <script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>
