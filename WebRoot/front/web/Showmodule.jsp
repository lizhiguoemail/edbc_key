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
<script language="javascript"  type="text/javascript">
function showdd(did)
{
did.style.background="#CFCBB8";

}
function showdd2(did)
{
 did.style.background="#BBB499";
}
</script>
  </head>
  
 <body>
<jsp:include page="common/top.jsp"/> 
<div class="main" >
<div class="leftside">
   <c:forEach items="${article_columnlist}" var="article_column">
	   <c:if test="${'1' ne article_column[6]}">
		   <c:if test="${'1' eq article_column[2]}">
			   <c:if test="${('博物馆之友动态' ne article_column[1])||('博物馆之友动态' eq article_column[1]&& not empty userinfo )}">
				   <c:if test="${'4' eq article_column[4]}">
						<div class="bj1" onmousemove="this.className='bj2'" onmouseout="this.className='bj1'">
							<font class="yijiwz">${article_column[1] }</font>
						</div>
				   </c:if>
				   <c:if test="${'4' ne article_column[4]}">
				  		<div class="bj1" onmousemove="this.className='bj2'" onmouseout="this.className='bj1'">
				  			<a class="yijia"  href="<%=path %>/front.do?methede=toArticle_column&id=${article_column[0] }" <c:if test="${'blank' eq article_column[5]}">target="_blank"</c:if><c:if test="${'blank' ne article_column[5]}">target="gframe"</c:if>>${article_column[1] }</a>
				  		</div>
				   </c:if>
			   </c:if>
		   </c:if>
		   <c:if test="${'2' eq article_column[2]}">
		   	<div class="bj1" onmousemove="this.className='bj2'" onmouseout="this.className='bj1'">
			   <c:if test="${'4' eq article_column[4]}">
			   	<font class="erjiwz">${article_column[1] }</font>
			   </c:if>
			   <c:if test="${'4' ne article_column[4]}">
			   		<a class="erjia"  href="<%=path %>/front.do?methede=toArticle_column&id=${article_column[0] }" <c:if test="${'blank' eq article_column[5]}">target="_blank"</c:if><c:if test="${'blank' ne article_column[5]}">target="gframe"</c:if>>${article_column[1] }</a>
			   </c:if>
			</div>
		   </c:if>
		   <c:if test="${'3' eq article_column[2]}">
		   	<div class="bj1" onmousemove="this.className='bj2'" onmouseout="this.className='bj1'">
				  <c:if test="${'4' eq article_column[4]}">
				  		<font class="sanjiwz">${article_column[1] }</font>
				  </c:if>
				  <c:if test="${'4' ne article_column[4]}">
				  		<a class="sanjia" href="<%=path %>/front.do?methede=toArticle_column&id=${article_column[0] }" <c:if test="${'blank' eq article_column[5]}">target="_blank"</c:if><c:if test="${'blank' ne article_column[5]}">target="gframe"</c:if>>${article_column[1] }</a>
				  </c:if>
			 </div>
		   </c:if>
	   </c:if>
   </c:forEach>
</div>
<div class="centerside">
	<iframe src="<%=path %>/front.do?methede=toArticle&moduleid=${front_module.id }&type=1&menutype=${menutype}&columnid=${columnid }" style="border: 0;"  width="100%;" height="1" name="gframe"  id="gframe" onload="Javascript:SetCwinHeight('gframe')" scrolling="no" frameborder="0" ></iframe>
</div>
<div class="rightside">
	<iframe src="<%=path %>/front/web/right.jsp" style="border: 0;"  width="100%;" height="1" name="rframe"  id="rframe" onload="Javascript:SetCwinHeight('rframe')" scrolling="no" frameborder="0"></iframe>
</div>
<jsp:include page="common/bottom2.jsp"/>			
</div>
</body>
</html>

