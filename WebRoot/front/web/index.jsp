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
<jsp:include page="common/top.jsp"/> 
<div class="main" >
	<div class="m1">
		<c:forEach items="${indexfoucelist}" var="fou1"> 
			<div class="t1">
				<a href="<%=path %>/front.do?methede=toArticle&articleid=${fou1.id }&type=4"  target="_blank">
					<img src="<%=path %>/upload/article/${fou1.title_pic}"  title="${fou1.title}" />
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="m2">
		<div class="left">
			<div class="title"><img src="<%=path %>/images/front/web/images/block.gif" /> 新闻动态</div>
			<div class="newmain">
				<c:forEach items="${biglist}" var="big">
					<div class="newlist">
						<a  href="<%=path %>/front.do?methede=toArticle&articleid=${big.id }&type=4">${big.title } <font style="font-family: arial">${fn:substring(big.createdate, 0, 10)}</font></a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="right">
			<div class="title"><img src="<%=path %>/images/front/web/images/block.gif" /> 招聘信息</div>
			<div class="newmain">
				 <c:forEach items="${xueshulist}" var="xueshu">
				 <div class="newlist">
			        <a  href="<%=path %>/front.do?methede=toArticle&articleid=${xueshu.id }&type=4">${xueshu.title } <font style="font-family: arial">${fn:substring(xueshu.createdate, 0, 10)}</font></a>
			     </div>
			     </c:forEach>
		    </div> 
		</div>  
	</div>
	<jsp:include page="common/bottom.jsp"/>			
</div>   
</body>
<script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>

