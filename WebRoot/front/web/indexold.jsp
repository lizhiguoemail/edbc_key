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
<script language="javascript" src="<%=path %>/js/front/web/jquery.js"></script>
<script language="javascript" src="<%=path %>/js/front/web/main.js"></script>
<script type="text/javascript">

</script>
  </head>
  
 <body>
<jsp:include page="common/top.jsp"/> 
<div class="mid">
    <div class="mid_left">
        <ul>
          <li>
		 
			<div id="banner">	
				<div id="banner_bg"></div>  <!--标题背景-->
				<div id="banner_info"></div> <!--标题-->
				<ul></ul>
				<div id="banner_list">
				<c:forEach items="${indexfoucelist}" var="fou1"> 
				<a href="<%=path %>/front.do?methede=toArticle&articleid=${fou1.id }&type=4"  target="_blank"><img src="<%=path %>/upload/article/${fou1.title_pic}" width="719" height="387" alt="${fou1.title}" /></a>
				</c:forEach>
				</div>
			</div>
			
		  </li>
          <li style="height:15px;"></li>
          <li>
            <div class="new">
               <ul> 
                 <li style="width:221px;">
                      <div class="yq">
                        <ul>
                          <li class="yq_l" ><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">${a1.article_column.name }</font></li>
                          <c:if test="${not empty a1.title_pic }"><li><img src="<%=path %>/upload/article/${a1.title_pic }" width="214" height="170" /></li></c:if> 
                          <li class="yq_2">&nbsp;&nbsp;&nbsp;&nbsp; <a  href="<%=path %>/front.do?methede=toArticle&articleid=${a1.id }&type=4"  target="_blank" style="text-decoration: none;">${fn:substring(a1.summary,0,100)}<c:if test="${fn:length(a1.summary)>100}"><font color="#FF8A23" style="font-size: 14px;">......</font></c:if></a><br /> </li>
                        </ul>
                     </div>
                 </li> 
                 <li  style="width:221px; border-left:#b5b78c solid 1px; padding-right:10px;padding-left:14px;height: 360px;">
                   <div class="zxxx">
                        <ul>
                          <li class="yq_l"><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">${a2.article_column.name }</font></li>
                           <c:if test="${not empty a2.title_pic }"><li><img src="<%=path %>/upload/article/${a2.title_pic }" width="214" height="170" /></li></c:if> 
                          <li class="yq_2">&nbsp;&nbsp;&nbsp;&nbsp; <a  href="<%=path %>/front.do?methede=toArticle&articleid=${a2.id }&type=4"  target="_blank" style="text-decoration: none;">${fn:substring(a2.summary,0,100)}<c:if test="${fn:length(a2.summary)>100}"><font color="#FF8A23" style="font-size: 14px;">......</font></c:if></a></li>
                        </ul>
                   </div>
                 </li>
                  <li  style="width:221px; border-left:#b5b78c solid 1px; padding-right:10px;padding-left:14px;height: 360px;">
                  <div class="gcgh">
                        <ul>
                          <li class="yq_l"><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">${a3.article_column.name }</font></li>
                           <c:if test="${not empty a3.title_pic }"><li><img src="<%=path %>/upload/article/${a3.title_pic }" width="214" height="170" /></li></c:if> 
                          <li class="yq_2">&nbsp;&nbsp;&nbsp;&nbsp; <a  href="<%=path %>/front.do?methede=toArticle&articleid=${a3.id }&type=4"  target="_blank" style="text-decoration: none;">${fn:substring(a3.summary,0,100)}<c:if test="${fn:length(a3.summary)>100}"><font color="#FF8A23" style="font-size: 14px;">......</font></c:if></a> <br />   </li>
                        </ul>
                    </div>
                 </li>
               </ul>
            </div>
          </li>
          <li></li>
        </ul>
  </div>
  <div class="mid_right">
     <ul>
        <li>
           <div class="zl">
                <iframe src="<%=path %>/front/web/login.jsp" scrolling="no" frameborder="0" width="213px;" height="190px;"></iframe>
          </div>
        </li>
        <li>
           <div class="zl">
                <ul>
                    <li class="yq_l"><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">大事件</font></li>
                    <li class="yq_2" style="height:150px;">
                    <ul>
                    <c:forEach items="${biglist}" var="big">
                    <li style="float: left;width: 200px;"><a  href="<%=path %>/front.do?methede=toArticle&articleid=${big.id }&type=4">${big.title }</a></li>
                    </c:forEach>
                    </ul>
                    </li>
                </ul>
          </div>
        </li>
        <li>
          <div class="gcgh">
                <ul>
                    <li class="yq_l"><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">学术动态</font></li>
                    <li class="yq_2" style="height:150px;">
                    <ul>
                    <c:forEach items="${xueshulist}" var="xueshu">
                    <li style="float: left;width: 200px;"><a  href="<%=path %>/front.do?methede=toArticle&articleid=${xueshu.id }&type=4">${xueshu.title }</a></li>
                    </c:forEach>
                    </ul>
                    </li>
                </ul>
          </div>
        </li>
     </ul>
  </div>
</div>
<jsp:include page="common/bottom.jsp"/>
</body>
</html>

