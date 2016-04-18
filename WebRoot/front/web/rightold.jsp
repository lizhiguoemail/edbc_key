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

function isok()
{
   var isok=document.getElementById("isok");
   if(isok.value=='1')
   {
     alert('邮件提交成功！');
   }
   else if(isok.value=='2')
   {
     alert('该邮件地址已为订阅邮件，无需重复提交！');
   }
}

function tijiao()
{
var email=document.getElementById("email");
  if(email.value!="")
	 	{
	 	 var filter=/^.+@.+\..{2,3}$/ 
	 	 if (!filter.test(email.value))
	 	  {
	 		alert("请输入正确的email用户名");
	 		email.focus();
	 		return;
	       }
       }
  if(confirm('确认使用该邮箱地址为订阅邮箱吗？')){
  document.forms[0].submit();
  }
}
</script>
  </head>
  <body onload="isok()">
  <input type="hidden" value="${isok }" id="isok"/>
 <div class="rightside">
		<div class="email">
		<form action="<%=path %>/museum.do?methede=addemail" method="post" >
			<span class="title">邮件订阅</span>
			<span class="text" >我想获得博物馆更多咨询</span>	
			<span class="text" >电子邮件:</span>
				<input type="text" class="input_text" id="email" name="email" value="${email }"/><br />
				<img src="<%=path %>/images/front/web/images/tj.jpg" onclick="tijiao()" class="button" style="cursor: hand;"/>
				<!--<input type="button" value="提交" class="button" onclick="tijiao()"/>
		--></form>
		</div>
		<div class="pic"><img src="<%=path %>/images/front/web/images/dzb.gif" /></div>
		<div class="pic"><img src="<%=path %>/images/front/web/images/zm.gif" /></div>
		<div class="date">
			<span class="title">活动日历</span>
			<div class="Calendar"> 
			<div id="idCalendarPre"><<</div> 
			<div id="idCalendarNext">>></div> 
			<span id="idCalendarYear">2008</span>年 <span id="idCalendarMonth">8</span>月 
			<table cellspacing="0"> 
			<thead> 
			<tr> 
			<td>日</td> 
			<td>一</td> 
			<td>二</td> 
			<td>三</td> 
			<td>四</td> 
			<td>五</td> 
			<td>六</td> 
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
	</div></div>
  </body>
</html>
