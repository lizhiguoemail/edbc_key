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
	var categoryname=document.getElementById("categoryname");
	var sortcode=document.getElementById("sortcode");
	if(categoryname.value=='')
	{
	 alert('分类名不能为空');
	 return;
	}
	if(sortcode.value=='')
	{
	 alert('分类名不能为空');
	 return;
	}
	document.forms[0].action="<%=path %>/bbs_category.do?methede=addCategory";
	document.forms[0].submit();
	}
	
	function gotoupdate(str,oid)
	{
	if(confirm('是否确认修改当前类别'))
	  {
	  var categoryname=document.getElementById("categoryname"+oid);
	  var sortcode=document.getElementById("sortcode"+oid);
	  if(categoryname.value==''||categoryname.value==null)
	  {
	     alert('类别名不能为空');
	     return;
	  }
	   if(sortcode.value==''||sortcode.value==null)
	  {
	     alert('排序码不能为空');
	     return;
	  }
	  document.forms[0].action=str;
	  document.forms[0].submit();
	  }
	}
	
	function gotodelete(str)
	{
	if(confirm('确认删除该类别吗'))
	  {
		  document.forms[0].action=str;
		  document.forms[0].submit();
	  }
	}
	
	function goto(str)
	{
	  document.forms[0].action=str;
	  document.getElementById('doing').style.display='block';
	  document.forms[0].submit();
	}
	
	function addman(oid)
	{
	 var userarr=document.getElementById("userarr");
	 document.getElementById('doing').style.display='block';
     var arr=window.showModalDialog(encodeURI("<%=path %>/bbs_category.do?methede=selmoderator&oid="+oid,"new","dialogHeight:800px;dialogWidth:900px;edge:Raised;center:Yes;help:no;resizable:Yes;status:no;"));
     document.getElementById('doing').style.display='none'; 
     userarr.value=arr[0];
     document.forms[0].action="<%=path %>/bbs_category.do?methede=addmoderator&oid="+oid;
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
        <th align=center colspan=16 style="height: 23px">分类管理</th>
      </tr>
      <tr bgcolor="#dee5fa">
        <td colspan="16" align="center" class=txlrow>&nbsp;</td>
      </tr>
       <tr align="center" bgcolor="#799AE1">
        <td align="center" class="txlHeaderBackgroundAlternate">序号</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>分类名称</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>排序码</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>创建日期</td>
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
							 <c:forEach items="${listcategory}" var="category">
   		                    <% i++; %>
      <tr>
      <td nowrap="nowrap" align="center" width="40px;" class="txlrow"><%=(currentPage - 1) * pageRecorders + i %></td>
      <td nowrap="nowrap" align="center" class="txlrow"><input type="text" id="categoryname${category.id }" name="categoryname${category.id }" value="${category.categoryname }"></td>
      <td nowrap="nowrap" align="center" class="txlrow"><input type="text" id="sortcode${category.id }" name="sortcode${category.id }" value="${category.sortcode }"></td>
      <td nowrap="nowrap" align="center" class="txlrow">${category.createdate }</td>
     <td nowrap="nowrap" align="center" class="txlrow"><!--
        <input type="button" value="设置版主" onclick="addman('${category.id }')" class="button"/>
		--><input type="button" value="修改" onclick="gotoupdate('<%=path %>/bbs_category.do?methede=updateCategory&oid=${category.id }','${category.id }')" class="button"/>
		<input type="button" value="删除" onclick="gotodelete('<%=path %>/bbs_category.do?methede=deleteCategory&oid=${category.id }')"  class="button"/>
		<input type="button" value="添加论坛到此分类中" onclick="goto('<%=path %>/bbs_forum.do?methede=toaddForum&categoryid=${category.id }')"  class="button"/>
		</td>
      </tr>
      </c:forEach>
      </table>
      <div style="padding-top: 15px;width: 100%;" align="center" ><font color="green">${msg }</font></div>
       <div style="padding-top: 15px;">
       <table cellpadding="0" cellspacing="0" style="background-color: pink;width: 70%" align="center">
       <tr><td align="center" style="font-size: 14px;color: red;padding: 10px;">添加分类</td></tr>
       <tr><td align="center" style="padding: 10px;font-size: 12px;">分类名：<input type="text" style="vertical-align: middle;" id="categoryname" name="categoryname"><font color="red"> *</font> &nbsp;&nbsp;&nbsp;&nbsp;排序码：<input type="text" style="vertical-align: middle;width: 50px;" id="sortcode" name="sortcode" value="0" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" maxlength="5"><font color="red"> *</font> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="添加" style="vertical-align: middle;" onclick="tj()"></td></tr>
      </table>
      </div>
</form>
</body>
 </html>