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
	function gotodelete(str)
	{
	if(confirm('确认删除该二级论坛吗'))
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
     var arr=window.showModalDialog(encodeURI("<%=path %>/bbs_forum.do?methede=selmoderator&oid="+oid,"new","dialogHeight:800px;dialogWidth:900px;edge:Raised;center:Yes;help:no;resizable:Yes;status:no;"));
     document.getElementById('doing').style.display='none'; 
     userarr.value=arr[0];
     document.forms[0].action="<%=path %>/bbs_forum.do?methede=addmoderator&oid="+oid;
     document.getElementById('doing').style.display='block';
     document.forms[0].submit();
	}
</script>

</head>
<body>
 <jsp:include page="/common/doing.jsp" /> 
<form name="form1" method="post" action="">
<input type="hidden" name="userarr">
<input type="hidden" name="categoryid" value="${firstforum.categoryid }" />
<input type="hidden" name="rank" value="二级论坛" />
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799ae1" class=tableborder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">二级论坛管理</th>
      </tr>
       <tr bgcolor="#dee5fa">
        <td colspan="16" align="left" style="padding-left: 100px;">
         一级论坛：
        <select style="vertical-align: middle;" name="parentid" onchange="goto('<%=path %>/bbs_forum.do?methede=listSecondForum')">
        <c:forEach items="${listfirstforum}" var="fforum">
        <option <c:if test="${fforum.id eq firstforum.id}">selected="selected"</c:if> value="${fforum.id }">${fforum.forumname }</option>
        </c:forEach>
        </select> 
        </td>
      </tr>
      <tr bgcolor="#dee5fa">
        <td colspan="16" align="center" class=txlrow>&nbsp;</td>
      </tr>
       <tr align="center" bgcolor="#799AE1">
        <td align="center" class="txlHeaderBackgroundAlternate">序号</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>所属分类</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>论坛名称</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>论坛级别</td>
        <td  align="center" class=txlHeaderBackgroundAlternate>论坛类型</td>
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
							 <c:forEach items="${listforum}" var="forum">
   		                    <% i++; %>
      <tr>
      <td nowrap="nowrap" align="center" width="40px;" class="txlrow"><%=(currentPage - 1) * pageRecorders + i %></td>
      <td nowrap="nowrap" align="center" class="txlrow">${forum.category.categoryname }</td>
      <td nowrap="nowrap" align="center" class="txlrow">${forum.forumname }</td>
      <td nowrap="nowrap" align="center" class="txlrow">二级论坛</td>
      <td nowrap="nowrap" align="center" class="txlrow">${forum.ptype }</td>
      <td nowrap="nowrap" align="center" class="txlrow">${forum.sortcode }</td>
      <td nowrap="nowrap" align="center" class="txlrow">${forum.createdate }</td>
     <td nowrap="nowrap" align="center" class="txlrow">
        <input type="button" value="设置版主" onclick="addman('${forum.id }')" class="button"/>
		<input type="button" value="修改" onclick="goto('<%=path %>/bbs_forum.do?methede=toupdateSecondForum&oid=${forum.id }')" class="button"/>
		<input type="button" value="删除" onclick="gotodelete('<%=path %>/bbs_forum.do?methede=deleteForum&oid=${forum.id }')"  class="button"/>
		</td>
      </tr>
      </c:forEach>
      </table>
      <div style="width: 100%;padding-top: 15px;" align="center"><font color="green">${msg }</font></div>
</form>
</body>
 </html>