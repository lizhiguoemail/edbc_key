<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户头像</title>
<script type="text/javascript">
function closeme(){
	this.window.close();
	}
function setpic(pic)
{
  var arr=new Array(1);
  arr[0]=pic;
  window.returnValue=arr;
   closeme();
}
</script>
  </head>

  <body>
  <div style="background-color:#FFFFFF;overflow-y:scroll;overflow-x:auto;width:100%;height:100%">
    <ul>
    <% for(int i=1;i<45;i++){ %>
    <li style="width: 100px;float: left;"><img src="<%=path %>/userpic/kopf<%=i %>.gif" border="0" onclick="setpic('kopf<%=i %>')" style="cursor: hand;"/></li>
    <%} %>
    </ul>
</div> 
  </body>
</html>
