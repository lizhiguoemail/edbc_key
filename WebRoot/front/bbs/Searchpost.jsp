<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>${bbs_params.bbs_name }-搜索</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=path %>/js/PopupCalendar.js"></script>
	<script>
	var oCalendarEn=new PopupCalendar("oCalendarEn");	//初始化控件时,请给出实例名称如:oCalendarEn
	oCalendarEn.Init();
	var oCalendarChs=new PopupCalendar("oCalendarChs");	//初始化控件时,请给出实例名称:oCalendarChs
	oCalendarChs.weekDaySting=new Array("日","一","二","三","四","五","六");
	oCalendarChs.monthSting=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
	oCalendarChs.oBtnTodayTitle="今天";
	oCalendarChs.oBtnCancelTitle="取消";
	oCalendarChs.Init();
	</script>
    
    <script type="text/javascript">
    function tj()
    {
    document.getElementById('doing').style.display='block';
    document.forms[0].submit();
    }
    </script>
  </head>
  
  <body >
  <jsp:include page="/common/doing.jsp" /> 
  <form method="post" action="<%=path %>/bbs.do?methede=searchPost" >
  <input type="hidden" name="forumid" value="${forum.id }">
  <input type="hidden" name="userid" value="${userinfo.id }">
  <input type="hidden" name="posttype" value="1">
   <table border="1" width="100%" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;font-size: 12px;color: gray;">
   <a href="<%=path %>/bbs.do?methede=toBbs" style="color: gray;">DBC论坛</a> →  搜索</td>
   </tr>
   <tr><td width="100%" align="center" style="padding-left: 10px;">
    <table border="1" width="50%" style="font-size: 12px;" bordercolor="#8EBEF7">
    <tr><td width="120px;" align="right">搜索关键字：</td><td align="left">
    &nbsp;<input type="text" name="keyword" id="keyword" value="${keyword }" style="width: 400px;">
    </td></tr>
    <tr><td width="120px;" align="right" style="padding-top: 8px;">条件：</td>
    <td style="padding-top: 8px;" align="left">
    
    &nbsp;<input type="radio" name="search1" value="1" <c:if test="${search1 eq '1'}">checked="checked"</c:if>>按作者搜索&nbsp;<input type="radio" name="search1" value="2">按帖子标题搜索&nbsp;<input type="radio" name="search1" value="0">两者都搜索 
    </td></tr>
    <tr><td width="120px;" align="right" style="padding-top: 8px;">条件：</td>
    <td style="padding-top: 8px;" align="left">
   &nbsp;<input type="radio" name="search2" value="1">搜索文章帖&nbsp;<input type="radio" name="search2" value="2">搜索投票帖&nbsp;<input type="radio" name="search2" value="0">两者都搜索 
    </td></tr>
    <tr><td width="120px;" align="right" style="padding-top: 8px;">条件：</td>
    <td style="padding-top: 8px;" align="left">
    &nbsp;<input type="radio" name="search3" value="1">只搜索精华帖&nbsp;<input type="radio" name="search3" value="2">只搜索推荐帖&nbsp;<input type="radio" name="search3" value="0">两者都搜索 
    </td></tr>
    <tr><td width="120px;" align="right" style="padding-top: 8px;" nowrap="nowrap">帖子时间范围：</td>
    <td style="padding-top: 8px;" align="left">
    &nbsp; 从 <input type="text" name="begindate" id="begindate" value="${begindate }" onClick="getDateString(this,oCalendarChs)" onfocus="onf('begindate')"/>
    到  <input type="text" name="enddate" id="enddate" value="${enddate }" onClick="getDateString(this,oCalendarChs)" onfocus="onf('enddate')"/>
    </td></tr>
     <tr><td width="120px;" align="right" style="padding-top: 8px;">论坛类别：</td>
    <td style="padding-top: 8px;" align="left">
   &nbsp;<select name="search5">
   <option value="0">不限</option>
   <c:forEach items="${listcategory}" var="category">
   <option value="${category.id }">${category.categoryname }</option>
   </c:forEach>
   </select>
    </td></tr>
    <tr><td width="120px;" align="right" style="padding-top: 8px;">论坛主题：</td>
    <td style="padding-top: 8px;" align="left">
   &nbsp;<select name="search4">
   <option value="0">不限</option>
   <c:forEach items="${forumlist}" var="forum">
   <option value="${forum.id }">【${forum.category.categoryname }】${forum.forumname }</option>
   </c:forEach>
   </select>
    </td></tr>
    <tr>
    <td style="padding-top: 8px;padding-bottom: 10px;" align="center" colspan="2">
    <input type="button" value="开始搜索" onclick="tj()"/>  
    </td></tr>
    </table>
   </td></tr>
   </table>
   </form>
  </body>
</html>
