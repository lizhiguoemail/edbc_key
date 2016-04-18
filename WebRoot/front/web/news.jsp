<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>艺术考古数字博物馆-博物馆概况</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=path %>/css/front/web/css.css" rel="stylesheet" type="text/css" />
   <SCRIPT LANGUAGE="JavaScript" src="<%=path %>/js/front/web/index.js"></SCRIPT>

  </head>
  
  <body>

<jsp:include page="common/top.jsp"/> 

<!--搜索-->
<div class="containt">
  <div class="main">
    <div class="search">
      <form action="" method="post">
        <input type="text" name="textfield" />
        <input name="image" type="image" class="search_button" src="<%=path %>/images/front/web/images/search.gif" />
      </form>
    </div>
  </div>
</div>
<!--主体-->
<div class="containt">
	<div class="main">
	<!--框架左体部分-->
		<div class="left_side">
				<!--1.博物馆介绍-->
			<div class="nobg_frame notice_listframe">
					<div class="nobg_frametop notice_listtop">
						新闻咨询
					</div>
					<div class="nobg_framecontent">
						<div class="notice_list">
						<c:forEach items="${article_columnlist}" var="article_column">
						<li><img src="<%=path %>/images/front/web/images/dian.gif"><a href="#">${article_column.name }</a></li>
						</c:forEach>
						</div>
					</div>
		  </div>
		  
		
	  </div>
		
	<!--框架右体部分-->
	<div class="right_side">
		<div class="list_kj">
				<div class="list_kjtop"><img src="<%=path %>/images/front/web/images/news.gif"></div>
				<c:forEach items="${articlelist}" var="article">
				<div class="list_kjcontent">
						<div style="height: 30px;padding-top: 10px;" align="center">${article.title}</div>
					<div class="list">
				${article.content}
					</div>
				</div>
	</c:forEach>
		
		</div>
	
	</div>
	
	</div>
</div>


<div class="containt">
	<div class="bottom">
		<img src="<%=path %>/images/front/web/images/bottom.gif" border="0"  />
  </div>
</div>

</body>
</html>
