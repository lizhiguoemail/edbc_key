<%@ page language="java"  pageEncoding="utf-8"%>
<%@page import="org.dbc.util.PageParm"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<link rel="stylesheet" href="<%=path %>/css/front/bbs/manage/css.css" type="text/css" />
<script type="text/JavaScript">
   function tj()
    {
	var rankname=document.getElementById("rankname");
	var ranknum=document.getElementById("ranknum");
	var mincharm=document.getElementById("mincharm");
	var maxcharm=document.getElementById("maxcharm");
	if(rankname.value=='')
	{
	 alert('等级名称不能为空');
	 return;
	}
	if(ranknum.value=='')
	{
	 alert('等级不能为空');
	 return;
	}
	if(mincharm.value=='')
	{
	 alert('魅力下限不能为空');
	 return;
	}
	if(maxcharm.value=='')
	{
	 alert('魅力上限不能为空');
	 return;
	}
	document.forms[0].action="<%=path %>/bbs_rank.do?methede=addRank";
	 document.getElementById('doing').style.display='block';
	document.forms[0].submit();
	}
	
	function gotoupdate(str,oid)
	{
	if(confirm('是否确认修改当前等级'))
	  {
	  var rankname=document.getElementById("rankname"+oid);
	  var ranknum=document.getElementById("ranknum"+oid);
	  var mincharm=document.getElementById("mincharm"+oid);
	  var maxcharm=document.getElementById("maxcharm"+oid);
	  if(rankname.value==''||rankname.value==null)
	  {
	      alert('等级名称不能为空');
	     return;
	  }
	  if(ranknum.value=='')
		{
		 alert('等级不能为空');
		 return;
		}
	  if(mincharm.value=='')
		{
		 alert('魅力下限不能为空');
		 return;
		}
	 if(maxcharm.value=='')
		{
		 alert('魅力上限不能为空');
		 return;
		}
	  document.forms[0].action=str;
	   document.getElementById('doing').style.display='block';
	  document.forms[0].submit();
	  }
	}
	
	function gotodelete(str)
	{
	if(confirm('确认删除该等级吗'))
	  {
		  document.forms[0].action=str;
		  document.getElementById('doing').style.display='block';
		  document.forms[0].submit();
	  }
	}
	
	function goto(str)
	{
	  document.forms[0].action=str;
	  document.getElementById('doing').style.display='block';
	  document.forms[0].submit();
	}
	
</script>

</head>
<body>
 <jsp:include page="/common/doing.jsp" /> 
<form name="form1" method="post" action="">
<input type="hidden"  name="userarr">
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799ae1" class=tableborder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">用户等级管理</th>
      </tr>
      <tr bgcolor="#dee5fa">
        <td colspan="16" align="center" class=txlrow>&nbsp;</td>
      </tr>
       <tr align="center" bgcolor="#799AE1">
        <td align="center" class="txlHeaderBackgroundAlternate">序号</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>等级</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>级别名称</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>魅力值下限</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>魅力值上限</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>操作</td>
      </tr>
       <%
									int i = 0;
									PageParm pageparm=(PageParm)request.getAttribute("pageParm");
									int currentPage = 1;
									int pageRecorders = 10;
									if(pageparm!=null)
									{
									  currentPage=Integer.parseInt(pageparm.getNowpage());
									}
							%>
							 <c:forEach items="${listrank}" var="rank">
   		                    <% i++; %>
      <tr>
      <td nowrap="nowrap" align="center" width="40px;" class="txlrow"><%=(currentPage - 1) * pageRecorders + i %></td>
      <td nowrap="nowrap" align="center" class="txlrow"><input type="text" id="ranknum${rank[0] }" name="ranknum${rank[0] }" value="${rank[4] }"></td>
      <td nowrap="nowrap" align="center" class="txlrow"><input type="text" id="rankname${rank[0] }" name="rankname${rank[0] }" value="${rank[1] }"></td>
      <td nowrap="nowrap" align="center" class="txlrow"><input type="text" id="mincharm${rank[0] }" name="mincharm${rank[0] }" value="${rank[2] }"></td>
      <td nowrap="nowrap" align="center" class="txlrow"><input type="text" id="maxcharm${rank[0] }" name="maxcharm${rank[0] }" value="${rank[3] }"></td>
     <td nowrap="nowrap" align="center" class="txlrow">
		<input type="button" value="修改" onclick="gotoupdate('<%=path %>/bbs_rank.do?methede=updateRank&oid=${rank[0] }','${rank[0] }')" class="button"/>
		<input type="button" value="删除" onclick="gotodelete('<%=path %>/bbs_rank.do?methede=deleteRank&oid=${rank[0] }')"  class="button"/>
		</td>
      </tr>
      </c:forEach>
      </table>
      <div style="padding-top: 15px;width: 100%;" align="center" ><font color="green">${msg }</font></div>
       <div style="padding-top: 15px;">
       <table cellpadding="0" cellspacing="0" style="background-color: pink;width: 70%" align="center">
       <tr><td align="center" style="font-size: 14px;color: red;padding: 10px;">添加级别</td></tr>
       <tr><td align="center" style="padding: 10px;font-size: 12px;">
       级别名称：<input type="text" style="vertical-align: middle;" id="rankname" name="rankname"><font color="red"> *</font> 
       &nbsp;&nbsp;&nbsp;&nbsp;等级：<input type="text" style="vertical-align: middle;width: 50px;" id="ranknum" name="ranknum"  onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" ><font color="red"> *</font> 
       &nbsp;&nbsp;&nbsp;&nbsp;魅力下限：<input type="text" style="vertical-align: middle;width: 50px;" id="mincharm" name="mincharm"  onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" ><font color="red"> *</font> 
       &nbsp;&nbsp;&nbsp;&nbsp;魅力上限：<input type="text" style="vertical-align: middle;width: 50px;" id="maxcharm" name="maxcharm"  onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" ><font color="red"> *</font> 
       &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="添加" style="vertical-align: middle;" onclick="tj()"></td></tr>
      </table>
      </div>
</form>
</body>
 </html>