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
    
    <title>${bbs_params.bbs_name }-发布投票</title>
    
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
     function additemL1(s1){
         var div = document.createElement("div"); 
         div.innerHTML='<input type="text" name="votes">&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"removeMe(this);\"><img src=\"<%=path %>/images/front/bbs/a_delete.gif\" border=\"0\" /></a>';
         document.getElementById(s1).appendChild(div);
         }
          function removeMe(va){//删除模版
    		var tr=va.parentNode.parentNode;
    		tr.removeChild(va.parentNode);
    	}
    </script>
  </head>
  
  <body>
  <jsp:include page="/common/doing.jsp" /> 
  <form method="post" action="<%=path %>/bbs_post.do?methede=addVote" enctype="multipart/form-data">
  <input type="hidden" name="forumid" value="${forum.id }">
  <input type="hidden" name="userid" value="${userinfo.id }">
  <input type="hidden" name="posttype" value="2">
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
   → 新投票</td>
   </tr>
   <tr><td width="100%" align="center" style="padding-left: 10px;">
    <table border="1" width="100%" bordercolor="#8EBEF7">
    <tr><td width="100px;" align="right">选择话题：</td><td align="left">
    &nbsp;<select name="ptype">
    <option value="原创">【原创】</option>
    <option value="转帖">【转帖】</option>
    <option value="灌水">【灌水】</option>
    <option value="讨论">【讨论】</option>
    <option value="求助">【求助】</option>
    <option value="推荐">【推荐】</option>
    <option value="公告">【公告】</option>
    <option value="注意">【注意】</option>
    <option value="贴图">【贴图】</option>
    <option value="建议">【建议】</option>
    <option value="下载">【下载】</option>
    <option value="分享">【分享】</option>
    </select>
    </td></tr>
    <tr><td width="100px;" align="right" style="padding-top: 8px;">标题：</td>
    <td style="padding-top: 8px;" align="left">
    &nbsp;<input type="text" name="postname" value="${bbspost.postname }" maxlength="40" style="width: 250px;"></td></tr>
    <tr><td width="100px;" align="right" style="padding-top: 8px;">投票选项：</td>
    <td style="padding-top: 8px;padding-left: 5px;" align="left" >
    <div id="model1"><input type="text" name="votes"></div>
    <br/>
    <a href="javascript:additemL1('model1')"><img src="<%=path %>/images/front/bbs/a_add.gif " border="0"/></a>
    </td></tr>
    <tr><td width="100px;" align="right" style="padding-top: 8px;">内容：</td>
    <td style="padding-top: 8px;" align="left">
    &nbsp;<textarea name="postcontent" style="height: 300px;" cols="50" rows="4" id="postcontent">${bbspost.postcontent }</textarea>
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
