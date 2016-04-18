<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script language="javascript" src="<%=path %>/js/front/web/jquery.js"></script>
<script language="javascript" src="<%=path %>/js/front/web/main.js"></script>
<script type="text/javascript" src="<%=path %>/js/tongji.js"></script>

<div class="top">
	<div class="logo">
		<img src="<%=path %>/images/front/web/images/logo.GIF">
		<img src="<%=path %>/images/front/web/images/name.jpg" style="padding-left:10px;">
	</div>
 	<div class="nav">
		<ul id="sddm">
		<c:forEach items="${front_modulelist}" var="md" varStatus="con">
		<c:if test="${md.ishidden eq '否' && md.ismenu eq '是'}">
		<li <c:if test="${con.count eq '1' }">class="first"</c:if> >
		<c:if test="${md.urltype eq '5'}">
			<font class="wenzi">${md.m_name}</font>
		</c:if>
		<c:if test="${md.urltype ne '5'}">
			<a onmouseover="mopen('m${con.count}')" onmouseout="mclosetime()" href="<%=path %>/front.do?methede=toModule&id=${md.id}"   <c:if test="${md.target eq '_blank'}">target="_blank"</c:if> >${md.m_name}</a>
		</c:if>
		<!--下拉菜单开始 -->
		        <c:set var="num" value="0"></c:set>
		        <c:if test="${not empty md.article_columns}">
				<c:forEach items="${md.article_columns}" var="ac" >
				<c:if test="${ac.deletemark ne '1' && ac.ishidden ne '1'&& ac.deep eq '1'}">
				<c:set var="num" value="1"></c:set>
				</c:if>
				</c:forEach>
				</c:if>
		        <c:if test="${num eq '1'}">
				<div class="showhid" id="m${con.count}" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
				<c:forEach items="${md.article_columns}" var="ac" >
				<c:if test="${ac.deletemark ne '1' && ac.ishidden ne '1'&& ac.deep eq '1'}">
				<div class="tmbj" onmouseover="this.className='tmbj2'" onmouseout="this.className='tmbj'">
					<c:if test="${ac.urltype ne '3'}">
					<a href="<%=path %>/front.do?methede=toModule&id=${ac.front_module.id }&menutype=column&columnid=${ac.id }">${ac.name }</a>
					</c:if>
					<c:if test="${ac.urltype eq '3'}">
					<a href="${ac.url }" <c:if test="${ac.target eq 'blank'}">target="_blank"</c:if>>${ac.name }</a>
					</c:if>
				</div>
				</c:if>
				</c:forEach>
				</div>
				</c:if>
			<!--下拉菜单结束 -->
			</li>
			</c:if>
			</c:forEach>
		</ul>     
  </div>
</div>
  
 