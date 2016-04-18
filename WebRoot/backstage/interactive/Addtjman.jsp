<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.dbc.util.PageParm"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<base target="view">
<title>用户列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
	function closeme(){
	this.window.close();
	}
	function queren(){
	var f = document.forms[0];
	var arr=new Array(1);
	var str="";  
	var j=0;
	 for (i=0;i<f.elements.length;i++)
   {
    if ((f.elements[i].name=="tjmanid")&&(f.elements[i].checked))
    { 
      if(j==0)
      {
        str=f.elements[i].value;
      }
      else
      {      
      str+=','+f.elements[i].value;
      }
      j++;
     }
     }
	arr[0]=str;
	window.returnValue=arr;
	closeme();
	}
	</script>
<script type="text/JavaScript">

</script>
<link href="<%=path %>/css/backstage/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
window.name='view';
function selectfan(){
  var f = document.forms[0];
  for (i=0;i<f.elements.length;i++)
    if (f.elements[i].name=="tjmanid")
      {
        if(f.elements[i].checked){
          f.elements[i].checked=false;
        }else{
         f.elements[i].checked=true;
        }
     }
}
function selectall(v){
  var f = document.forms[0];
  for (i=0;i<f.elements.length;i++)
    if (f.elements[i].name=="tjmanid")
    {
     f.elements[i].checked = v;
     }
  document.forms[0].elements["clickall"].checked = v;
}
function sousuo(){
var neirong=document.getElementById("neirong");
var reg=/^\s+$/;
	if(neirong.value==""||reg.test(neirong.value)){
	neirong.focus();
	}else{
     document.form1.submit();
     }
}
function goto()
{
var nickname=document.getElementById("nickname");
document.getElementById("form11").target = "view";    
var ff=document.getElementById("form11");
ff.action="<%=path %>/interactive.do?methede=seltjman";
document.getElementById('doing').style.display='block';
ff.submit();
}
</SCRIPT>
  
<body style="background-color: pink;">
  <jsp:include page="/common/doing.jsp" />
<form id="form11" name="form11" action="<%=path %>/user.do?methede=seltjman" method="post" >
<input type="hidden" name="notreceiver" value="${notreceiver }">
  <table width="100%;" border="1" bordercolor="black;" align="center">
  <tr><td align="center" style="height: 25px;">用户呢称：<input type="text" name="nickname" id="nickname" value="${nickname }"/> <input type="button" onclick="goto()" class="button" value="查询"></td></tr>
  <tr><td style="padding: 10px;"><ul>
  <li style="float: left;width: 150px;padding-top: 5px;"><input type="checkbox"  name="clickall" id="clickall" onClick="selectall(this.checked)">全选</li>
     <c:forEach items="${listuser}" var="user">
  <li style="float: left;width: 150px;padding-top: 5px;"><input type="checkbox"  name="tjmanid" id="${user.id }" value="${user.nickname }"><label for="${user.id }">${user.nickname }</label></li>
 </c:forEach>
  </ul></td></tr>
  <tr><td align="center" style="height: 40px;"> <input type="button"  class="button" value="确认" onclick="queren()" style="width: 35px;height: 25px;vertical-align: middle">&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button"  class="button" value="关闭" onclick="closeme()" style="width: 35px;height: 25px;vertical-align: middle;"></td></tr>
  </table>
        </form>  
</body>
</html>
