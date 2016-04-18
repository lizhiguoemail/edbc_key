<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>注册成功</title>
		<link rel="stylesheet" href="<%=path %>/css/backstage/style.css" type="text/css" />
	</head>
	<body>
	<div align="center" style="padding-top: 150px;">
	注册成功！ <a href="<%=path %>/admin.jsp">点击进入后台登录页面</a>  
	 <a href="<%=path %>/bbs.do?methede=tologin">点击进入论坛登录页面</a>
	</div>
	</body>
</html>

