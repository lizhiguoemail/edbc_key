<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
%>

<html> 
	<head>
		<title>用户登录</title>
		<link href="css/css.css" rel="stylesheet" type="text/css" />
		 <script type="text/javascript">
		 function gotologin()
		 {
		 window.location.href='<%=path%>/user.do?methede=tologin';
		 }
		 function weihu()
		 {
		 window.location.href='<%=path%>/weihu.jsp';
		 }
		 </script>
	</head>
	<body onload="gotologin()">
	
	</body>
<script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
	
</html>