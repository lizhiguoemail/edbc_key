<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.dbc.pojo.Article"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
</head>
  
 <body>
 <div class="top">
	<div class="logo">
		<img src="<%=path %>/images/front/web/images/logo.GIF"/>
		<img src="<%=path %>/images/front/web/images/name.jpg" style="padding-left:10px;"/>
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
<div class="main" >
<div align="left" style="padding: 20px;">如果无法正常显示pdf文件，请<a href="<%=path %>/software/AdbeRdr940_zh_CN.exe" target="_blank">点击下载</a>安装相关软件 </div>
<object classid="clsid:CA8A9780-280D-11CF-A24D-444553540000" type="application/pdf" width="1000px" height="600px" border=1 name="pdf">    
<param name="toolbar" value="true" />   
<param name="_Version" value="65539" />   
<param name="_ExtentX" value="20108" />   
<param name="_ExtentY" value="10866" />   
<param name="_StockProps" value="1" />   
<param name="SRC" value="<%=path %>/upload/pdf/1.pdf" />   
</object>  
		<div class="m5" style="padding-top:20px;">
		<div class="ms">
		  <font style="font-size: 14px;font-family: 黑体;">地址：杭州市余杭塘路866号浙江大学紫金港校区西三A教学楼</font>
		</div>
		<div class="ms">  
		 <font style="font-size: 14px;font-family: 黑体;">电话：</font><font style="font-size: 14px;font-family: arial;">（86571）88981179</font>
		 </div>
		 <div class="ms">
		 <font style="font-size: 14px;font-family: 黑体;">传真：</font><font style="font-size: 14px;font-family: arial;">（86571）88981149</font>
		 </div>
		 <div class="ms">
		 <font style="font-size: 14px;font-family: arial;">zumaa@zju.edu.cn</font>
		 </div>
	</div>
</div>   
</body>
</html>

