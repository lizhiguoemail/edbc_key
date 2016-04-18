<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.dbc.util.PageParm"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${bbs_params.bbs_name }-${category.categoryname }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
.right-font08 {
	font-family: "宋体";
	font-size: 12px;
	color: #555555;
	text-decoration: none;
}
</style>
   <script type="text/javascript">

function goto(str)
{
  document.forms[0].action=str;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}

   </script>
  </head>
  <%      
  response.setHeader("Cache-Control",   "Public");      
  response.setHeader("Pragma",   "no-cache");      
  response.setDateHeader("Expires",   0);      
%>
  <body>
  <jsp:include page="/common/doing.jsp" /> 
  <form method="post">
<input  type="hidden" id="totalpage" value="${pageParm.totalpage}"/>
 <table border="1" width="100%" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;font-size: 12px;color: gray;">
   <a href="<%=path %>/bbs.do?methede=toBbs" style="color: gray;">DBC论坛</a>
    → ${category.categoryname }
   </tr>
   </table>
    <div style="padding-top: 10px;width: 100%;">
    <table style="width: 100%">
   <tr><td>
   <table width="100%" border="1" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 10px;" bgcolor="#8EBEF7">
   <a href="<%=path %>/bbs.do?methede=searchPost&search5=${category.id }" style="text-decoration: none;">
   <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">${category.categoryname }</font>
   </a>
   </td>
   </tr>
   <c:forEach items="${listforum}" var="forum">
   <c:if test="${forum.isopen ne '否'|| userinfo.bbs_admin eq '1'|| fn:contains(forum.moderator,str)}">
   <table width="100%" border="1" bordercolor="#8EBEF7">
   <tr>
   <td style="height: 50px;width: 30px;" align="center" bgcolor="#E8F4FF">
   <c:if test="${forum.ptype eq '正规论坛'}">
    <img src="<%=path %>/images/front/bbs/folder.gif" border="0" style="vertical-align: middle;" alt="正规论坛">
   </c:if>
   <c:if test="${forum.ptype eq '评论论坛'}">
    <img src="<%=path %>/images/front/bbs/follow.gif" border="0" style="vertical-align: middle;" alt="评论论坛">
   </c:if>
   </td>
   <td>
   <table width="100%" border="1" bordercolor="#8EBEF7">
   <tr>
   <td style="width: 15%" align="center">
   <a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${forum.id }">
   <img width="80px"  style="vertical-align: middle;" src="<%=path%>/bbs/forum/${forum.picture }"  onerror="this.src='<%=path %>/images/front/bbs/team_077.gif';"  border="0">
   </a>
   </td>
   <td align="left" >
   <table style="width: 100%;">
   <tr>
   <td style="padding-left: 10px;"><font style="font-size: 14px;"><a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${forum.id }" style="text-decoration: none;">
   <font style="FONT-SIZE: 13px; FILTER: Glow(color=#FF0080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;cursor: hand;">
    ﹂${forum.forumname }﹁
   </font>
   </a></font></td>
   <td align="right" style="padding-right: 5px;">
   <c:if test="${empty userinfo}">
     <a href="javascript:alert('请先登录')" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
     <a href="javascript:alert('请先登录')" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
   </c:if>
   <c:if test="${not empty userinfo}">
   <c:if test="${forum.ptype eq '正规论坛'}">
   <a href="<%=path %>/bbs_post.do?methede=toaddPost&forumid=${forum.id }" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
   <a href="<%=path %>/bbs_post.do?methede=toaddVote&forumid=${forum.id }" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
   </c:if>
    <c:if test="${forum.ptype eq '评论论坛'}">
    <c:if test="${userinfo.bbs_admin eq '1' || fn:contains(forum.moderator,str)}">
     <a href="<%=path %>/bbs_post.do?methede=toaddPost&forumid=${forum.id }" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
     <a href="<%=path %>/bbs_post.do?methede=toaddVote&forumid=${forum.id }" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
    </c:if>
    <c:if test="${userinfo.bbs_admin ne '1' && fn:contains(forum.moderator,str)==false}">
     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主发帖，您无此权限')" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主添加投票，您无此权限')" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
    </c:if>
   </c:if>
   </c:if>
   <a href="<%=path %>/bbs.do?methede=searchPost&search5=${forum.id }&search3=1" title="查看此论坛的精华帖子" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost3.gif"  border="0"></a>
   <a href="<%=path %>/bbs.do?methede=searchPost&search5=${forum.id }&search3=2" title="查看此论坛的推荐帖子" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost3.gif"  border="0"></a>
   </td>
   </tr>
   <c:if test="${not empty forum.description }">
   <tr><td style="padding-left: 10px;" colspan="2">
   <pre><font style="font-size: 12px;color: gray;">
   论坛说明：${forum.description }
   </font></pre></td></tr>
   </c:if>
   </table>
   </td>
   </tr>
   <tr>
   <td  style="padding-left: 8px;font-size: 12px;color: red;" bgcolor="#E8F4FF" nowrap="nowrap">
    <font style="FONT-SIZE: 12px; FILTER: Glow(color=#000000,strength=0); COLOR: #ffffff; HEIGHT: 12px;">
   <c:if test="${empty forum.moderator}"> 版主：暂时空缺</c:if> 
   <c:if test="${not empty forum.moderator}"> 版主：${fn:substring(forum.moderator, 1, fn:length(forum.moderator)-1)}</c:if>
   </font>
   </td>
   <td  style="padding-right: 20px;font-size: 12px;" bgcolor="#E8F4FF" align="right">
    <%int a=0;int b=0;int c=0; int d=0;%>
    
   <c:forEach items="${forum.posts}" var="post">
  <c:if test="${post.deletemark ne '1' && post.floor==0}">
  <%a=a+1; %>
  </c:if>
  <c:if test="${post.deletemark ne '1' && post.floor>0}">
  <%b=b+1; %>
  </c:if>
  <c:if test="${fn:contains(post.createdate,nowdate) && post.deletemark ne '1' && post.floor==0}">
  <%c=c+1; %>
  </c:if>
  <c:if test="${fn:contains(post.createdate,nowdate) && post.deletemark ne '1' && post.floor>0}">
  <%d=d+1; %>
  </c:if>
   </c:forEach>
    <font style="FONT-SIZE: 10px; FILTER: Glow(color=#000000,strength=0); COLOR: #ffffff; HEIGHT: 10px;">
   主题数【<%=a %>】
   &nbsp;&nbsp;&nbsp;&nbsp;回复数【<%=b %>】
   &nbsp;&nbsp;&nbsp;&nbsp;今日主题数【<%=c %>】
   &nbsp;&nbsp;&nbsp;&nbsp;今日回复数【<%=d %>】
   </font>
   </td>
   </tr>
   </table>
   </td>
   </tr></table>
   </c:if>
   </c:forEach>
   </table>
   </td></tr>
   </table>
   </div>
   </form>
  </body>
</html>
