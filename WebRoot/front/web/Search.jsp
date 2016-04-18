<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>艺术考古数字博物馆</title>
    
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="<%=path %>/js/iframe.js" type="text/javascript"></script>
  <script type="text/javascript">
function gotopage(gototype,page)
{
var gotopagetype=document.getElementById("gotopagetype");
var gotopageString=document.getElementById("gotopageString");
var yeshu=document.getElementById("yeshu").value;
if(gototype=='first')
{
gotopagetype.value='first';
}
if(gototype=='last')
{
gotopagetype.value='last';
}
if(gototype=='previous')
{
gotopagetype.value='previous';
}
if(gototype=='next')
{
gotopagetype.value='next';
}
if(gototype=='gotopage')
{
gotopagetype.value='gotopage';
gotopageString.value='page';
}
if(gototype=='tiaozhuan')
{
if(yeshu=='')
{
alert("请输入页数");
return;
}
else
{
gotopagetype.value='gotopage';
gotopageString.value=yeshu;
}
}
document.forms["searchlist"].action='${pageContext.request.contextPath }/front.do?methede=search';
document.forms["searchlist"].submit();
}

  </script>
  </head>
  
 <body>
 <jsp:include page="common/top.jsp"/> 
 <form action="${pageContext.request.contextPath }/front.do?methede=search" method="post" name="searchlist">
  <input type="hidden" name="nowpage" id="nowpage" value="${pageParm.nowpage }"/>
 <input type="hidden" name="gotopagetype" id="gotopagetype"/>
 <input type="hidden" name="gotopageString" id="gotopageString"/>
 <input  type="hidden" id="totalpage" value="${pageParm.totalpage}"/>
 <input  type="hidden" name="content" value="${content}"/>
<div class="main" >
	<div class="centerside" style="width: 745px;overflow: hidden;margin-left:0px;">
  <div class="content">
  <table width="100%" cellpadding="0" cellspacing="0" >
 <c:forEach items="${articlelist}" var="article">
 <tr><td align="left" height="45px;" valign="middle" style="padding-top: 5px;background-color: #9F8F80;font-size: 16px;font-weight: bold;font-family: 黑体;">
 <a href="<%=path %>/front.do?methede=toArticle&articleid=${article.id }&type=4" style="float:left;color:#000000;text-decoration: none;padding-left: 20px;line-height: 25px;">${article.title}</a>
 <font style="padding-right: 20px;color: #000000;font-size: 12px;float: right;font-family: arial;line-height: 25px;">${article.createdate }</font>
  </td></tr>
  <tr><td height="120px;" style="padding-top: 5px;" valign="top">
  <c:if test="${not empty article.summary}">
 <div style="color: #000000;font-size: 14px;font-family: 黑体;line-height: 25px;">${article.summary}</div>
  </c:if>
  <c:if test="${empty article.summary}">
 暂无摘要
 </c:if>
  </td></tr>
 </c:forEach>
 </table>
  <c:if test="${not empty articlelist && not empty pageParm}">
  <div align="center">
  <a id="LtotalSY" href="javascript:gotopage('first','0')" class="right-font08">首页</a>&nbsp;&nbsp;
  <a id="LtotalSYY" href="javascript:gotopage('previous','0')" class="right-font08">上一页</a>&nbsp;&nbsp;
  <a id="LtotalXYY" href="javascript:gotopage('next','0')" class="right-font08">下一页</a>&nbsp;&nbsp;
  <a id="LtotalMY" href="javascript:gotopage('last','0')" class="right-font08">末页</a>&nbsp;&nbsp;
  <input type="text" name="yeshu" id="yeshu" maxlength="5" style="width: 45px;" value="${pageParm.nowpage }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" />页&nbsp;&nbsp;
  <input type="button" class="button" style="width: 35px;" value="GO" onclick="gotopage('tiaozhuan','0')"/></div>
                <div align="center">
                  <p>共${pageParm.total }条 ${pageParm.nowpage }/${pageParm.totalpage }页</p>
                  
            </div>
   </c:if>
</div>
</div>
<div class="rightside">
		<iframe src="<%=path %>/front/web/right.jsp" style="border: 0;"  width="100%;" height="1" name="rframe"  id="rframe" onload="Javascript:SetCwinHeight('rframe')" scrolling="no" frameborder="0"></iframe>
	</div>
<jsp:include page="common/bottom.jsp"/>
</div>
</form>

</body>
</html>

