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
    
    <title>${bbs_params.bbs_name }-发布帖子</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<%=path %>/FCKeditor/fckeditor.js"></script>
    <script type="text/javascript">
    function tj()
    {
    document.getElementById('doing').style.display='block';
    document.forms[0].submit();
    }
    </script>
  </head>
  
  <body>
  <jsp:include page="/common/doing.jsp" /> 
  <form method="post" action="<%=path %>/bbs_post.do?methede=addRePost" enctype="multipart/form-data">
  <input type="hidden" name="forumid" value="${forum.id }">
  <input type="hidden" name="userid" value="${userinfo.id }">
  <input type="hidden" name="ptype" value="${repost.ptype }">
  <input type="hidden" name="postname" value="re:${repost.postname }">
  <input type="hidden" name="posttype" value="${repost.posttype }">
  <input type="hidden" name="repostid" value="${repost.id }">
  <input type="hidden" name="replycontent" value="${replypost.postcontent }">
  <input type="hidden" name="replydate" value="${replypost.createdate }">
  <input type="hidden" name="replynickname" value="${replypost.user.nickname }">
   <table border="1" width="100%" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
    <td width="100%" align="left" style="padding-left: 20px;font-size: 12px;color: gray;">
   <a href="<%=path %>/bbs.do?methede=toBbs" style="color: gray;">DBC论坛</a> 
   →  <a href="<%=path %>/bbs.do?methede=listForum&categoryid=${forum.category.id }" style="color: gray;">${forum.category.categoryname }</a>
   →  <a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${forum.id }" style="color: gray;">${forum.forumname }</a>
   <c:if test="${repost.posttype eq '1'}">
   →  <a href="<%=path %>/bbs_post.do?methede=showPost&oid=${repost.id }" style="color: gray;">${repost.postname }</a>
   </c:if>
   <c:if test="${repost.posttype eq '2'}">
   →  <a href="<%=path %>/bbs_post.do?methede=showVote&oid=${repost.id }" style="color: gray;">${repost.postname }</a>
   </c:if>
   → 回复帖子</td>
   </tr>
   <tr><td width="100%" align="center" style="padding-left: 10px;">
    <table border="1" width="100%" bordercolor="#8EBEF7">
    <c:if test="${not empty replypost}">
     <tr><td width="100px;" align="right" style="padding-top: 8px;">引用：</td>
    <td style="padding-top: 8px;" align="left"><div style="font-size: 12px;font-weight: 宋体;">下面引用由 【<font color="red">${replypost.user.nickname }</font>】 ${replypost.createdate } <b>发表内容:</b></div> <p>${replypost.postcontent }</p></td></tr>
   </c:if>
    <tr><td width="100px;" align="right" style="padding-top: 8px;">内容：</td>
    <td style="padding-top: 8px;" align="left">
    &nbsp;<textarea name="postcontent" style="height: 300px;" cols="50" rows="4" id="postcontent">${copypost.postcontent }</textarea>
					<script type="text/javascript">
				    					var editor = new FCKeditor("postcontent");
				    					editor.BasePath='<%=path%>/FCKeditor/';
				    					editor.Heigth=300;
				    					editor.ToolbarSet='Default';
				    					editor.ReplaceTextarea();
			    		</script>
    </td></tr><!--
    <tr><td width="100px;" align="right" style="padding-top: 8px;">帖子选项：</td>
    <td style="padding-top: 8px;" align="left">
     <select name="postpermit">
    <option value="这个帖子所有用户都可以查看">这个帖子所有用户都可以查看</option>
    <option value="这个帖子只有注册用户才可以查看">这个帖子只有注册用户才可以查看</option>
    <option value="这个帖子需要回复才可以查看">这个帖子需要回复才可以查看</option>
    <option value="这个帖子只有版主才可以查看">这个帖子只有版主才可以查看</option>
    <option value="这个帖子只有登录用户才可以查看">这个帖子只有登录用户才可以查看</option>
    </select>
    </td></tr>
    --><tr><td width="100px;" align="right" style="padding-top: 8px;">签名：</td>
    <td style="padding-top: 8px;" align="left">
    <input type="checkbox" name="isshowsignature" value="1" checked="checked">是否显示签名
    </td></tr>
    <tr><td width="100px;" align="right" style="padding-top: 8px;">附件：</td>
    <td style="padding-top: 8px;" align="left">
    <input type="file"  id="myfile" name="myfile" size="60" />
    </td></tr>
    <tr>
    <td style="padding-top: 8px;padding-bottom: 10px;" align="center" colspan="2">
    <input type="button" value="提交" onclick="tj()"/> <input type="button" value="返回" onclick="window.history.go(-1)"/>  
    </td></tr>
    </table>
   </td></tr>
   </table>
   </form>
  </body>
</html>
