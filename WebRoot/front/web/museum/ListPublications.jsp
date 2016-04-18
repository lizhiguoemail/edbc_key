<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.dbc.util.PageParm"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>艺术考古数字博物馆-专家名录</title>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
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
document.forms[0].action='${pageContext.request.contextPath }/front.do?methede=toPublications';
document.forms[0].submit();
}

  </script>
  </head>
  <body>
  <form action="${pageContext.request.contextPath }/front.do?methede=toPublications" method="post">
  <input type="hidden" name="nowpage" id="nowpage" value="${pageParm.nowpage }"/>
 <input type="hidden" name="gotopagetype" id="gotopagetype"/>
 <input type="hidden" name="gotopageString" id="gotopageString"/>
 <input  type="hidden" id="totalpage" value="${pageParm.totalpage}"/>
 <input  type="hidden" id="moduleid" value="${module.id}"/>
 <input  type="hidden" id="columnid" value="${column.id}"/>
 <input  type="hidden" id="type" value="${type}"/>
  <div class="middleside">
  <div class="content">
  <table width="100%" cellpadding="0" cellspacing="0" >
 <c:forEach items="${publicationslist}" var="publication">
 <tr><td><div style="border-top:1px solid #EEEAE1;height: 5px;">&nbsp;</div></td></tr>
  <tr><td height="30px;" style="padding-top: 5px;padding-left:10px;background-color:#EDEBE8;" valign="middle">
  ${publication.title}
  </td>
  </tr>
  <tr>
  <td align="right" valign="top" style="padding-top: 5px;padding-right: 20px;">
   <a  href="<%=path %>/upload/publications/${publication.attachment }" style="text-decoration: none;color: #A49A82;" target="_blank">阅读</a>
  </td>
  </tr>
 </c:forEach>
  <tr><td><div style="border-top:1px solid #EEEAE1">&nbsp;</div></td></tr>
 </table>
  <c:if test="${not empty publicationslist}">
  <div align="center">
  <a id="LtotalSY" href="javascript:gotopage('first','0')" class="right-font08">首页</a>&nbsp;&nbsp;
  <a id="LtotalSYY" href="javascript:gotopage('previous','0')" class="right-font08">上一页</a>&nbsp;&nbsp;
  <a id="LtotalXYY" href="javascript:gotopage('next','0')" class="right-font08">下一页</a>&nbsp;&nbsp;
  <a id="LtotalMY" href="javascript:gotopage('last','0')" class="right-font08">末页</a>&nbsp;&nbsp;
  <input type="text" name="yeshu" id="yeshu" maxlength="5" style="width: 45px;" value="${pageParm.nowpage }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" />页&nbsp;&nbsp;
  <input type="button" class="button" style="width: 35px;" value="GO" onclick="gotopage('tiaozhuan','0')"></div>
                <div align="center">
                  <p>共${pageParm.total }条 ${pageParm.nowpage }/${pageParm.totalpage }页</p>
                  
            </div>
   </c:if>
</div>
</div>
</form>
  </body>
</html>
