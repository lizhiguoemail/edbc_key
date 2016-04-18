<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
	<head>
    <title>DBC后台管理系统模板</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
      <script language="javascript"> 
function changeColor(){ 
var color="red|blue"; 
color=color.split("|"); 
document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)]; 
} 
setInterval("changeColor()",200); 

function tuichu()
{
if(confirm('是否退出后台管理系统')){

window.location.href="<%=path %>/user.do?methede=loginout";
}
}

function updatepwd()
{
   var str='<%=path %>/user.do?methede=toUpdateUserpwd&oid=${userinfo.id }&ismy=1';
   var arr=window.showModalDialog(encodeURI(str),"new","dialogHeight:200px;dialogWidth:450px;edge:Raised;center:Yes;help:no;resizable:Yes;status:no;"); 
}
</script> 
     <script type="text/javascript">
     Ext.onReady(function(){
	 var viewport=new Ext.Viewport({
	     layout:'border',
		 frame:'true',
		 items:[
			   {region:'center',
			    layout:'fit',
			    title:'<table style="font-family: cursive;font-size: 12px;width:100%;"><tr><td><span style="color: green;padding-right: 1px;font-weight: bold;">${userinfo.nickname } 您好，欢迎登录EDBC系统  <c:if test="${not empty userinfo.lastvisit}">您上传登录时间为：${userinfo.lastvisit}</c:if> </span> </td><td><a href="<%=path %>/interactive.do?methede=listunread" target="mainFrame" class="left-font03" style="padding-left: 2px;font-size: 12px;color: green;" title="未读消息${userinfo.unreadsize }条"><div id="blink"><c:if test="${userinfo.unreadsize ne '0'}">未读消息(${userinfo.unreadsize }) </c:if></div></td><td align="right" style="padding-right:20px;font-weight: bold;"> <a href="javascript:updatepwd()" style="color:#FE1B8D;font-family: cursive;">修改密码</a> | <a href="javascript:tuichu()" style="color:#FE1B8D;font-family: cursive;">退出</a></td></tr></table></a>',
			    items:[
					   contentPanel=new Ext.TabPanel({
													 id:'centerP',
													 enableTabScroll:true,//能够滚动收缩
													 activeTab:0,//激活第一个标签
													 items:[{
															id:'homePage',
															title:'首页',
															autoScroll:true,
															html:'<iframe src="<%=path %>/backstage/mainFra.jsp" scrolling="auto" name="mainFrame" width="100%" height="100%" id="mainFrame"></iframe>'
													 }]
					   })
				]
			   },
			   {region:'west',
			    collapsible:true,
			     title:'<b>欢迎使用</b>',
			     width:213,
			    html:'<iframe src="<%=path %>/backstage/left.jsp" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" width="100%" height="100%"></iframe>'
			    },
			   {region:'south',
			  // title:'<center><font color="red"  style="padding-top:5px;font-size:12px;">版权所有：蔡华军 联系QQ：390989627</font>&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size:12px;">如您想购买此系统</font>&nbsp;&nbsp;<a href="http://item.taobao.com/item.htm?id=13329996098" target="_blank" style="font-size:12px;color:green;">（点此淘宝购买edbc系统非源码版）</a><a href="http://item.taobao.com/item.htm?id=13287600166" target="_blank" style="font-size:12px;color:green;">（点此淘宝购买edbc系统源码版</a>）</center>'
			   title:'<center><font color="red"  style="padding-top:5px;font-size:12px;">版权所有：蔡华军 联系QQ：390989627</font>&nbsp;&nbsp;&nbsp;&nbsp;</center>'
			   }
			  ]
	});
	
});
     </script>
    </head>
    <body>
    <div id="tree"></div>
    <input type="hidden" value="0" id="gb" name="gb">
    </body>
    <script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>
