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
				<style type="text/css">
<!--
	#newPreview
{
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
}
-->
</style>
<script type="text/JavaScript">
   function PreviewImg(imgFile)
	       {
	           //新的预览代码，支持 IE6、IE7。
	           var newPreview = document.getElementById("newPreview");
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value;
	           newPreview.style.width = "80px";
	           newPreview.style.height = "60px";
	       }
	       
	       function tj()
	       {
	       var forumname=document.getElementById("forumname");
	       if(forumname.value=='')
	       {
	          alert('请输入论坛名称');
	          return;
	       }
	       document.forms[0].action="<%=path %>/bbs_forum.do?methede=updateForum";
	       document.getElementById('doing').style.display='block';
	       document.forms[0].submit();
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
<form name="form1" method="post" action="" enctype="multipart/form-data">
<input type="hidden"  name="oid" value="${forum.id }">
<input type="hidden"  name="id" value="${forum.id }">
<input type="hidden"  name="rank" value="${forum.rank }">
<input type="hidden"  name="categoryid" value="${forum.categoryid }">
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799ae1" class=tableborder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">修改论坛</th>
      </tr>
      <tr bgcolor="#dee5fa">
        <td colspan="16" align="center" class=txlrow><font color="green">${msg }</font></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛分类：</b></td>
        <td align="left">
        <select name="categoryid">
        <c:forEach items="${listcategory}" var="category">
        <option value="${category }" <c:if test="${forum.categoryid eq category.id}">selected="selected"</c:if>>${category.categoryname }</option>
        </c:forEach>
        </select>
        </td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛名称：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="forumname" name="forumname" value=${forum.forumname }><font color="red"> *</font></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛说明：</b></td>
        <td align="left" style="padding-top: 10px;">
         <textarea  name="description" rows="5" cols="50">${forum.description }</textarea>
        </td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>排序码：</b></td><td align="left" style="padding-top: 10px;"><input type="text" name="sortcode" value=${forum.sortcode }></td>
      </tr>
      <!--<tr>
        <td align="right" style="padding-top: 10px;"><b>HTML标签：</b></td><td align="left" style="padding-top: 10px;"><select name="isallowhtml"><option value="禁止" <c:if test="${forum.isallowhtml eq '禁止'}">selected="selected"</c:if>>禁止</option><option value="允许" <c:if test="${forum.isallowhtml eq '允许'}">selected="selected"</c:if>>允许</option></select> </td>
      </tr>
     <tr>
        <td align="right" style="padding-top: 10px;"><b>保密论坛：</b></td><td align="left" style="padding-top: 10px;"><select name="issecret"><option value="否" <c:if test="${forum.issecret eq '否'}">selected="selected"</c:if>>否</option><option value="是" <c:if test="${forum.issecret eq '是'}">selected="selected"</c:if>>是</option></select> </td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛密码：</b>
        </td><td align="left" style="padding-top: 10px;"><input type="text" name="password" value=${forum.password }> ( 普通用户需要保密密码或者被允许访问保密论坛才能够进入。)</td>
      </tr>
       -->
       <tr>
        <td align="right"><b>是否打开该论坛：</b></td><td align="left" style="padding-top: 10px;"><select name="isopen"><option value="是" <c:if test="${forum.isopen eq '是'}">selected="selected"</c:if>>是</option><option value="否" <c:if test="${forum.isopen eq '否'}">selected="selected"</c:if>>否</option></select>  
           可以暂时关闭这个论坛，此时只允许管理员和版主访问！</td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛类型：</b></td><td align="left" style="padding-top: 10px;"><select name="ptype"><!--
        <option value="开放论坛" <c:if test="${forum.ptype eq '开放论坛'}">selected="selected"</c:if>>开放论坛  【允许所有人发言】</option>
        --><option value="正规论坛" <c:if test="${forum.ptype eq '正规论坛'}">selected="selected"</c:if>>正规论坛  【允许注册会员发言】</option>
        <option value="评论论坛" <c:if test="${forum.ptype eq '评论论坛'}">selected="selected"</c:if>>评论论坛  【坛主和版主允许发言，其他注册用户只能回复】</option><!--
        <option value="精华区" <c:if test="${forum.ptype eq '精华区'}">selected="selected"</c:if>>精华区  【只允许版主和坛主发言和操作】</option>
        <option value="认证论坛" <c:if test="${forum.ptype eq '认证论坛'}">selected="selected"</c:if>>认证论坛  【除坛主和版主外，其他注册用户发言需要认证】</option>
        --></select> </td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>允许对此论坛中帖子评分？</b></td><td align="left" style="padding-top: 10px;"><select name="isallowscore"><option value="允许" <c:if test="${forum.isallowscore eq '允许'}">selected="selected"</c:if>>允许</option><option value="禁止" <c:if test="${forum.isallowscore eq '禁止'}">selected="selected"</c:if>>禁止</option></select>
        可以在其它参数设置中进行评分设置，如鲜花、鸡蛋等。 </td>
      </tr>
      <!--
      <tr>
        <td align="right" style="padding-top: 10px;"><b>允许在此论坛发帖？</b></td><td align="left" style="padding-top: 10px;"><select name="isallowadd"><option value="允许" <c:if test="${forum.isallowadd eq '允许'}">selected="selected"</c:if>>允许</option><option value="禁止" <c:if test="${forum.isallowadd eq '禁止'}">selected="selected"</c:if>>禁止</option></select>
        可以禁止在此论坛发帖。
         </td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>此论坛发帖是否需要审核？</b></td><td align="left" style="padding-top: 10px;"><select name="isaudit"><option value="否" <c:if test="${forum.isaudit eq '否'}">selected="selected"</c:if>>否</option><option value="是" <c:if test="${forum.isaudit eq '是'}">selected="selected"</c:if>>是</option></select>
        如果需要审核，则必须由管理员审核后才可以显示。 </td>
      </tr>
       --><tr>
        <td align="right" style="padding-top: 10px;"><b>概述图片：</b></td>
        <td align="left" style="padding-top: 10px;">
       	<input type="hidden" name="picture" value="${forum.picture }">
		<div id="newPreview">
		<c:if test="${forum.picture==null}">
		&nbsp;&nbsp;<font color="red">暂无照片</font>
		</c:if>
		<c:if test="${forum.picture!=null}">
		&nbsp;&nbsp;<img src="<%=path%>/bbs/forum/${forum.picture }" height="80" width="100">
		</c:if>
		</div>
		&nbsp;&nbsp;<input type="file" onChange="JavaScript:PreviewImg(this);" size="60" id="myfile" name="myfile">
        </td>
      </tr>
       <tr>
        <td align="center" colspan="16" style="padding-top: 10px;">
        <input type="button" value="提交" onclick="tj()">  <input type="button" value="返回" onclick="goto('<%=path %>/bbs_forum.do?methede=listFirstForum')">
        </td>
      </tr>
      </table>
     
</form>
</body>
 </html>