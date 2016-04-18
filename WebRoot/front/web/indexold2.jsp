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
<style type="text/css">
.mid2{
width: 984px;
margin: 0 auto;
padding:0px;
border: #b5b78c solid 1px;
}
.mid_top {
padding: 0px;
width: 984px;
margin:0;
float:left;
}
.dashijian{
float:left;
padding-left:10px; 
width:690px; 
height:200px;
border-right:#b5b78c solid 1px; 
}
.dashijian ul li{ 
float: left;
}
.dibu{
width:984px;
height:200px;
}
.dibu ul li a{ 
color:#968a6f; 
font-family:"宋体"; 
}
.zhaopin{ 
float:left;
padding-left:22px;
width:260px; 
}
.zhaopin ul li{ 
float: left;
}
.zhaopin ul li a{ 
color:#968a6f; 
font-family:"宋体"; 
}
.lm{ 
color:#785A3F;
font-family:"宋体"; 
font-size:16px; 
}
.lm img{
vertical-align: middle;
padding-top:10px;
padding-bottom:10px;
}
.dashijianli{
float: left;
width: 330px;
overflow:hidden;
padding-top: 8px;
padding-left:10px;
line-height: 18px;
}
.zhaopinli {
float: left;
width: 249px;
padding-top: 8px;
line-height: 15px;
}
.dibu ul li{
float: left;
}
</style>

  </head>
  
 <body>
<jsp:include page="common/top.jsp"/> 
<div class="mid2" >
    <div class="mid_top">
        <ul>
          <li>
		 
			<div id="banner">	
				<div id="banner_bg"></div>  <!--标题背景-->
				<div id="banner_info"></div> <!--标题-->
				<ul></ul>
				<div id="banner_list">
				<c:forEach items="${indexfoucelist}" var="fou1"> 
				<a href="<%=path %>/front.do?methede=toArticle&articleid=${fou1.id }&type=4"  target="_blank"><img src="<%=path %>/upload/article/${fou1.title_pic}" width="984" height="387" alt="${fou1.title}" /></a>
				</c:forEach>
				</div>
			</div>
			
		  </li>
          <li style="height:10px;width: 984px;"></li>
          <li>
            <div class="dibu">
                <div class="dashijian">
                      <div class="lm"><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">大事件</font></div>
			           <div>
			              <ul>
			                  <c:forEach items="${biglist}" var="big">
			                  <li class="dashijianli" ><a  href="<%=path %>/front.do?methede=toArticle&articleid=${big.id }&type=4">${big.title } ${fn:substring(big.createdate, 0, 10)}</a></li>
			                  </c:forEach>
			              </ul>
			            </div>  
			    </div>
			     <div class="zhaopin">
	                    <div class="lm"><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">招聘信息</font></div>
	                    <div>
	                    <ul>
		                    <c:forEach items="${xueshulist}" var="xueshu">
		                    <li class="zhaopinli"><a  href="<%=path %>/front.do?methede=toArticle&articleid=${xueshu.id }&type=4">${xueshu.title } ${fn:substring(xueshu.createdate, 0, 10)}</a></li>
		                    </c:forEach>
	                    </ul>
						</div>
				 </div>                
          </div>
         </li>
		</ul>
	</div>
</div>
<jsp:include page="common/bottom.jsp"/>
</body>
</html>

