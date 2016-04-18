<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.dbc.pojo.Article"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.dbc.util.PageParm"%>
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
 function gotoexhibition(aid)
{
   window.open('<%=path %>/front.do?methede=toArticle&articleid='+aid+'&type=5');
}
</script>
  </head>
  <body>
  <div class="dzb">
  	<div class="dzbwz">最新电子报</div>
  	<div class="dzbyy">NEWSLETTER</div>
  </div>
   <div class="dzb2">
  	<div class="dzbwz">招募</div>
  	<div class="dzbyy">志    愿    者</div>
  </div>
  
  <div class="date">
			<div class="title">活动日历</div>
			<div class="Calendar"> 
			<div id="idCalendarPre"><font style="font-size: 20px;">◀</font></div> 
			<div id="idCalendarNext"><font style="font-size: 20px;">▶</font></div> 
			<span id="idCalendarYear" style="font-size: 16px;font-family: 微软雅黑;font-weight: bolder;">2008</span><font style="font-size: 16px;font-family: 微软雅黑;font-weight: bolder;">年</font> <span id="idCalendarMonth" style="font-size: 16px;font-family: 微软雅黑;font-weight: bolder;">8</span><font style="font-size: 16px;font-family: 微软雅黑;font-weight: bolder;">月</font> 
			<table cellspacing="0"> 
			<thead> 
			<tr> 
			<td style="background-color: #6D482D;font-size: 16px;font-family: 微软雅黑;color:#ffffff;">日</td> 
			<td style="background-color: #6D482D;font-size: 16px;font-family: 微软雅黑;color:#ffffff;">一</td> 
			<td style="background-color: #6D482D;font-size: 16px;font-family: 微软雅黑;color:#ffffff;">二</td> 
			<td style="background-color: #6D482D;font-size: 16px;font-family: 微软雅黑;color:#ffffff;">三</td> 
			<td style="background-color: #6D482D;font-size: 16px;font-family: 微软雅黑;color:#ffffff;">四</td> 
			<td style="background-color: #6D482D;font-size: 16px;font-family: 微软雅黑;color:#ffffff;">五</td> 
			<td style="background-color: #6D482D;font-size: 16px;font-family: 微软雅黑;color:#ffffff;">六</td> 
			</tr> 
			</thead> 
			<tbody id="idCalendar"> 
			</tbody> 
			</table> 
			</div> 
<script language="JavaScript"> 
var cale = new Calendar("idCalendar", { 
//SelectDay: new Date().setDate(10), 
onSelectDay: function(o){ o.className = "onSelect"; }, 
onToday: function(o){ o.className = "onToday"; }, 
onFinish: function(){ 

document.getElementById("idCalendarYear").innerHTML = this.Year; document.getElementById("idCalendarMonth").innerHTML = this.Month; 
<% List list=(List)request.getSession().getServletContext().getAttribute("exhibitionlist");
   if(list.size()>0)
	   for(int i=0;i<list.size();i++)
	   {
		   Article eh=(Article)list.get(i);
%>
if(this.Year=='<%=eh.getBeginyear() %>'&& this.Month=='<%=eh.getBeginmonth() %>'){
this.Days[<%=eh.getBeginday() %>].innerHTML = "<a href='javascript:gotoexhibition(\"<%=eh.getId() %>\");' title='<%=eh.getTitle() %>');return false;\">" + <%=eh.getBeginday() %> + "</a>";
} 
<%  }%>

} 
}); 
document.getElementById("idCalendarPre").onclick = function(){ cale.PreMonth(); } 
document.getElementById("idCalendarNext").onclick = function(){ cale.NextMonth(); } 
</script>
</div>
  </body>
</html>
