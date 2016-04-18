<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${bbs_params.bbs_name }-标题颜色</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function changecolor(sInitColor)
{
var titlecolor=document.getElementById("titlecolor");
var cvalue=document.getElementById("cvalue");
if (sInitColor == null)
 //display color dialog box
 var sColor = dlgHelper.ChooseColorDlg();
else
 var sColor = dlgHelper.ChooseColorDlg(sInitColor);
 //change decimal to hex
 sColor = sColor.toString(16);
 //add extra zeroes if hex number is less than 6 digits
if (sColor.length < 6) {
  var sTempString = "000000".substring(0,6-sColor.length);
  sColor = sTempString.concat(sColor);
}
 //change color of the text in the div

 titlecolor.style.backgroundColor= sColor;
 sInitColor = sColor;
 cvalue.value=sColor;
 }
	function goto(str)
{
  document.forms[0].action=str;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}
function closeme(){
	this.window.close();
	}
	
function queren(){
	var arr=new Array(1);
	var str=document.getElementById("cvalue").value;  
	arr[0]=str;
	window.returnValue=arr;
	closeme();
	}
	</script>

  </head>
  
  <body >
  <input type="hidden" id="cvalue" name="cvalue" value="${bbs_post.titlecolor }"/>
  <object id="dlgHelper" classid="clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b" width="0px" height="0px"></object>
  <table align="center" ><tr>
  <td align="right" style="padding-top: 60px;">
 标题颜色：
 </td>
 <td align="left" style="padding-top: 60px;">
 <div id="titlecolor" align="center" style="cursor: pointer;width: 100px;background-color: ${bbs_post.titlecolor }" onclick="javascript:changecolor(this.style.backgroundColor)"><font face="楷体_GB2312">点此选色</font></div>
  </td>
  </tr>
  <tr><td colspan="2" align="center" style="padding-top: 10px;"><input type="button" value="提交" onclick="queren()" /> <input type="button" value="返回" onclick="closeme()" /> </td></tr>
  </table>
  </body>
</html>
