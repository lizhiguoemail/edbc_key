<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html;" />
  <title>欢迎进入dbc管理后台</title>
  <style type="text/css">
  body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
  #headert{
	height:118px;
}
  .maint{
	width:100%;
	font-size:12px;
	margin:0 auto;
	padding:0;
	background:#FFF;
	overflow:hidden;
}

.navt{
	height:40px;
	background:url(<%=path%>/images/backstage/nav.gif) repeat-x 0 0;
	padding-bottom:1px;
	border-bottom:1px solid #ececec;
}

.navt ul{
	padding-right:40px;
}
.navt ul li{
	float:right;
	list-style:none;
	color:#000;
	line-height:40px;
}
.navt ul li a{
	color:#000;
	line-height:40px;
	font-size: 12px;
}
.navt ul li.over{
	padding:0 10px;
}
  </style>
  <script language="javascript"> 
function changeColor(){ 
var color="red|blue"; 
color=color.split("|"); 
document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)]; 
} 
setInterval("changeColor()",200); 
</script> 

<script type="text/javascript">
function tuichu()
{
if(confirm('是否退出后台管理系统')){

window.parent.window.location.href="<%=path %>/user.do?methede=loginout";
}
}

function updatepwd(str)
{
   var arr=window.showModalDialog(encodeURI(str),"new","dialogHeight:200px;dialogWidth:450px;edge:Raised;center:Yes;help:no;resizable:Yes;status:no;"); 
}
</script>
</head>
  <body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td >
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%"><img src="<%=path %>/images/backstage/header.jpg" width="100%" height="80" /></td>
      </tr>
      <tr>
      <td width="100%">
      <div class="maint">
     <div class="navt">
      <table style="width: 100%" cellpadding="0" cellspacing="0">
      <tr>
      <td align="right" >
      <span style="color: green;font-family: cursive;font-size: 12px;padding-right: 1px;">
       用户名：<a href="<%=path %>/user.do?methede=ShowUser&oid=${userinfo.id }&ismy=1" target="mainFrame">${userinfo.nickname }</a> 
      </span></td>
      <td align="right" style="width: 90px;" nowrap="nowrap">
        <span style="color: green;font-family: cursive;font-size: 12px;padding-right: 1px;">
        <a href="<%=path %>/interactive.do?methede=listunread" target="mainFrame" class="left-font03" style="padding-left: 2px;font-size: 12px;color: green;" title="未读消息${userinfo.unreadsize }条">
        <div id="blink"><c:if test="${userinfo.unreadsize ne '0'}">未读消息(${userinfo.unreadsize }) </c:if></div>
        </a>
        </span>
        </td>
      <td style="width: 150px;" nowrap="nowrap">
		<ul>
            <li><a href="javascript:tuichu()" >退出</a></li>             
            <li class="over">|</li>
            <li><a href="javascript:updatepwd('<%=path %>/user.do?methede=toUpdateUserpwd&oid=${userinfo.id }&ismy=1')" >修改密码</a></li>
        </ul>
        </td>
        </tr></table>
        </div>
        </div>
      </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
<script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>
