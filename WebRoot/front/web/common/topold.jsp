<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function search()
{
  document.forms[0].submit();
}

function noat()
{
}
</script>
  </head>
  
  <body>
  <form action="<%=path %>/front.do?methede=search" method="post">
  <div class="top">
  <div class="top_logo">
<ul>
<li class="top_logo_img"><img src="<%=path %>/images/front/web/images/logo.GIF" width="66" height="66" /><img src="<%=path %>/images/front/web/images/name.GIF" width="338" height="66" /></li>
             <li style="float:right">
               <div style="padding-right: 80px;">
                  <ul>
                   <li class="web_link"><a href="javascript:noat();" class="ee" style="color: gray;">English</a>&nbsp;&nbsp;&nbsp;<a href="javascript:noat();" class="jj">简体中文</a>&nbsp;&nbsp;&nbsp;<a href="javascript:noat();" class="ff"  style="color: gray;">繁体中文</a></li>
                   <li class="web_search"><input name="content" type="text" value="${content }" maxlength="17"  class="search_text" /><a href="javascript:search();"><img src="<%=path %>/images/front/web/images/search_img.GIF" style="vertical-align: middle;height: 18px;"/></a></li>
                  </ul> 
               </div> 
</li>
          </ul>
      </div> 
      
  <div class="nav">
	<ul id="sddm">
	<c:forEach items="${front_modulelist}" var="md" varStatus="con">
	<c:if test="${md.ishidden eq '否' && md.ismenu eq '是'}">
	<li>
	<c:if test="${md.urltype eq '5'}">
	<table style="margin: 0;padding: 0;height: 23px;" cellpadding="0" cellspacing="0">
		<tr>
			<td style="height: 23px;" valign="bottom">
				<font class="shuxian">|</font>
			<td>
			<td>
				<font class="wenzi">${md.m_name}</font>
			</td>
		</tr>
	</table> 
	</c:if>
	<c:if test="${md.urltype ne '5'}">
	<table style="margin: 0;padding: 0;height: 23px;" cellpadding="0" cellspacing="0">
		<tr>
			<td style="height: 23px;" valign="bottom">
				<font class="shuxian">|</font>
			<td>
			<td nowrap="nowrap">
				<a href="<%=path %>/front.do?methede=toModule&id=${md.id}"   <c:if test="${md.target eq '2'}">target="_blank"</c:if> >${md.m_name}</a>
			</td>
		</tr>
	</table> 
	</c:if><!--
	        <c:set var="num" value="0"></c:set>
	        <c:if test="${not empty md.article_columns}">
			<c:forEach items="${md.article_columns}" var="ac" >
			<c:if test="${ac.deletemark ne '1' && ac.ishidden ne '1'&& ac.deep eq '1'}">
			<c:set var="num" value="1"></c:set>
			</c:if>
			</c:forEach>
			</c:if>
	        <c:if test="${num eq '1'}">
			<div id="m${con.count}" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
			<c:forEach items="${md.article_columns}" var="ac" >
			<c:if test="${ac.deletemark ne '1' && ac.ishidden ne '1'&& ac.deep eq '1'}">
			<a href="<%=path %>/front.do?methede=toModule&id=${ac.front_module.id }&menutype=column&columnid=${ac.id }">${ac.name }</a>
			</c:if>
			</c:forEach>
			</div>
			</c:if>
		--></li>
		</c:if>
		</c:forEach>
	<li>
	<table style="margin: 0;padding: 0;height: 23px;" cellpadding="0" cellspacing="0">
	<tr>
		<td style="height: 23px;" valign="bottom"><font class="shuxian">|</font><td>
	</tr>
	</table>
	</li>
	</ul>     
  </div>
</div>
</form>
  </body>
</html>
