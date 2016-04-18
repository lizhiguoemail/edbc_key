<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改部门</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=path %>/css/backstage/css.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/backstage/style.css" rel="stylesheet" type="text/css" />
    
	<script type="text/javascript">
	function closeme(){
	this.window.close();
	}
	function queren(){
	var nodename=document.getElementById("nodename");
	var introduction=document.getElementById("introduction");
	if(nodename.value=='')
	{
	alert('请输入部门名称');
	return;
	}
	var arr=new Array(1);  
	arr[0]=nodename.value;
	arr[1]=introduction.value;
	window.returnValue=arr;
	closeme();
	}
	</script>
	
  </head>
  <body>
  <table align="center">
  <tr align="center"><td height="80px;">
  <font size="2">部门名称：</td><td><input type="text" id="nodename" value="${department.nodename }" style="width: 240px;">
  </td></tr>
  <tr align="center"><td height="80px;">
  <font size="2">部门简介：</td><td><input type="text" id="introduction" value="${department.introduction }" style="width: 240px;">
  </td></tr>
  <tr align="center"><td height="40px;" colspan="2">
  <input type="button"  class="button" value="确认" onclick="queren()">
  <input type="button"  class="button" value="取消" onclick="closeme()">
  </td></tr></table>
  </body>
</html>
