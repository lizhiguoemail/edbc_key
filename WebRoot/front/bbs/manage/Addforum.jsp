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
	       document.forms[0].action="<%=path %>/bbs_forum.do?methede=addForum";
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
<input type="hidden"  name="rank" value="${rank }">
<input type="hidden"  name="categoryid" value="${category.id }">
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799ae1" class=tableborder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">添加论坛</th>
      </tr>
      <tr bgcolor="#dee5fa">
        <td colspan="16" align="center" class=txlrow>&nbsp;</td>
      </tr>
       <tr>
        <td align="right" width="30%"><b>所属论坛分类：</b></td><td align="left">${category.categoryname }</td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛名称：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="forumname" name="forumname" value=${forum.postname }><font color="red"> *</font></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛说明：</b></td>
        <td align="left" style="padding-top: 10px;">
        <textarea  name="description" rows="5" cols="50">${forum.description }</textarea>
        </td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>排序码：</b></td><td align="left" style="padding-top: 10px;"><input type="text" name="sortcode" value=${forum.sortcode }></td>
      </tr><!--
      <tr>
        <td align="right" style="padding-top: 10px;"><b>HTML标签：</b></td><td align="left" style="padding-top: 10px;"><select name="isallowhtml"><option value="禁止">禁止</option><option value="允许">允许</option></select> </td>
      </tr>
     <tr>
        <td align="right" style="padding-top: 10px;"><b>保密论坛：</b></td><td align="left" style="padding-top: 10px;"><select name="issecret"><option value="否">否</option><option value="是">是</option></select> </td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛密码：</b>
        </td><td align="left" style="padding-top: 10px;"><input type="text" name="password" value=${forum.password }> ( 普通用户需要保密密码或者被允许访问保密论坛才能够进入。)</td>
      </tr>
       -->
       <tr>
        <td align="right"><b>是否打开该论坛：</b></td><td align="left" style="padding-top: 10px;"><select name="isopen"><option value="是">是</option><option value="否">否</option></select>  
           可以暂时关闭这个论坛，此时只允许管理员和版主访问！</td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛类型：</b></td><td align="left" style="padding-top: 10px;"><select name="ptype"><!--
        <option value="开放论坛">开放论坛  【允许所有人发言】</option>
        --><option value="正规论坛">正规论坛  【允许注册会员发言】</option>
        <option value="评论论坛">评论论坛  【坛主和版主允许发言，其他注册用户只能回复】</option><!--
        <option value="精华区">精华区  【只允许版主和坛主发言和操作】</option>
        <option value="认证论坛">认证论坛  【除坛主和版主外，其他注册用户发言需要认证】</option>
        --></select> </td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>允许对此论坛中帖子评分？</b></td><td align="left" style="padding-top: 10px;"><select name="isallowscore"><option value="允许">允许</option><option value="禁止">禁止</option></select>
        可以在其它参数设置中进行评分设置，如鲜花、鸡蛋等。 </td>
      </tr>
      <!--
      <tr>
        <td align="right" style="padding-top: 10px;"><b>允许在此论坛发帖？</b></td><td align="left" style="padding-top: 10px;"><select name="isallowadd"><option value="允许">允许</option><option value="禁止">禁止</option></select>
        可以禁止在此论坛发帖。
         </td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>此论坛发帖是否需要审核？</b></td><td align="left" style="padding-top: 10px;"><select name="isaudit"><option value="否">否</option><option value="是">是</option></select>
        如果需要审核，则必须由管理员审核后才可以显示。 </td>
      </tr>
       --><tr>
        <td align="right" style="padding-top: 10px;"><b>概述图片：</b></td>
        <td align="left" style="padding-top: 10px;">
        <div id="newPreview"></div>
        <input type="file" onChange="javaScripte:PreviewImg(this);" id="myfile" name="myfile" size="60" />
        </td>
      </tr>
       <tr>
        <td align="center" colspan="16" style="padding-top: 10px;">
        <input type="button" value="提交" onclick="tj()">  <input type="button" value="返回" onclick="goto('<%=path %>/bbs_category.do?methede=listCategory')">
        </td>
      </tr>
      </table>
     
</form>
</body>
 </html>