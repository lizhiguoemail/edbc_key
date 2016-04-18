<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>艺术考古数字博物馆</title>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function showjianjie()
{
   var liuland=document.getElementById("liuland");
   var jianjied=document.getElementById("jianjied");
   var liulan=document.getElementById("liulan");
   var jianjie=document.getElementById("jianjie");
   jianjie.style.display="block";
   liulan.style.display="none";
   jianjied.style.backgroundColor="#968A6F";
   liuland.style.backgroundColor="gray";
   
}

function showliulan()
{
   var liuland=document.getElementById("liuland");
   var jianjied=document.getElementById("jianjied");
   var liulan=document.getElementById("liulan");
   var jianjie=document.getElementById("jianjie");
   jianjie.style.display="none";
   liulan.style.display="block";
   jianjied.style.backgroundColor="gray";
   liuland.style.backgroundColor="#968A6F";
   
}

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
document.forms[0].action='${pageContext.request.contextPath }/museum.do?methede=showExhibition&showtype=1';
document.forms[0].submit();
}
</script>

</head>
  <body style="height: 600px;">
  <form action="<%=path %>/museum.do?methede=showExhibition&showtype=1" method="post">
 <input type="hidden" name="nowpage" id="nowpage" value="${pageParm.nowpage }"/>
 <input type="hidden" name="gotopagetype" id="gotopagetype"/>
 <input type="hidden" name="gotopageString" id="gotopageString"/>
 <input  type="hidden" id="totalpage" value="${pageParm.totalpage}"/>
 <input  type="hidden" id="id"  name="id" value="${exhibition.id}"/>

  <div class="middleside" style="overflow: visible;">
  <div class="content" style="overflow: visible;min-height: 600px;">
  <div style="width: 100%;font-size: 14px;font-family: 宋体;font-weight: bold;" align="center"> ${exhibition.name }</div>
  <table ><tr>
  <td style="<c:if test="${showtype ne '1'}">background-color: #968A6F;</c:if><c:if test="${showtype eq '1'}">background-color: gray;</c:if>width: 100px;color: #ffffff;cursor: hand;" align="center" onclick="showjianjie()" id="jianjied">展览简介</td>
  <td style="<c:if test="${showtype ne '1'}">background-color: gray;</c:if><c:if test="${showtype eq '1'}">background-color: #968A6F;</c:if>width: 100px;color: #ffffff;cursor: hand;" align="center" onclick="showliulan()" id="liuland">展品浏览</td>
  </tr></table>
  <div id="jianjie" <c:if test="${showtype eq '1'}">style="display:none;"</c:if>>
  ${exhibition.content }
  </div>
  <div id="liulan" <c:if test="${showtype ne '1'}">style="display:none;"</c:if>>
  <div style="height: 450px;">
  <table style="width: 98%;">
 <tr><td ></td>
 </tr>
 </table>
  <c:forEach items="${glist}" var="good">
 <table style="float: left;width: 150px;height: 200px;padding-right: 30px;">
 <tr>
 <td width="200px;" style="height: 150px;">
 <a href="<%=path %>/museum.do?methede=showArt_good&id=${good.id }" style="text-decoration: none;"><img src="<%=path %>/upload/art_goods/${good.pic }" style="width: 150px;height: 150px;"/></a>
 </td></tr>
 <tr>
 <td align="center" valign="top" width="150px;"><a href="<%=path %>/museum.do?methede=showArt_good&id=${good.id }"  style="text-decoration: none;">${good.name }</a></td>
 </tr>
 </table>
 </c:forEach>
 </div>
 
 <c:if test="${not empty glist}">
  <div align="center" >
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
</div>
  </form>
  </body>
</html>
