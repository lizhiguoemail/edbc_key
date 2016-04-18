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
<script type="text/javascript">
function tj()
{
  document.forms[0].action="<%=path %>/bbs_params.do?methede=updateParams";
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}
</script>
</head>
<body>
 <jsp:include page="/common/doing.jsp" /> 
<form name="form1" method="post" >
<input type="hidden" name="id" value="${bbs_params.id }" />
  <table width="1052" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799ae1" class=tableborder>
    <tbody>
      <tr>
        <th align=center colspan=16 style="height: 23px">论坛参数设置</th>
      </tr>
      <tr bgcolor="#dee5fa">
        <td colspan="16" align="center" class=txlrow><font color="green">${msg }</font></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>论坛名称：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="bbs_name" name="bbs_name" value="${bbs_params.bbs_name }"></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>货币名称：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="gold_name" name="gold_name" value="${bbs_params.gold_name }"></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>新用户注册分配的货币：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="gold_reg" name="gold_reg" value="${bbs_params.gold_reg }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>发表新主题增加的货币：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="gold_addpost" name="gold_addpost" value="${bbs_params.gold_addpost }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>发表新回复增加的货币：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="gold_replypost" name="gold_replypost" value="${bbs_params.gold_replypost }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>加精帖子增加的货币：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="gold_digest" name="gold_digest" value="${bbs_params.gold_digest }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>推荐帖子增加的货币：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="gold_recommend" name="gold_recommend" value="${bbs_params.gold_recommend }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>被删除贴子减少的货币：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="gold_deletepost" name="gold_deletepost" value="${bbs_params.gold_deletepost }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>新用户注册分配的魅力：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="charm_reg" name="charm_reg" value="${bbs_params.charm_reg }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
     <tr>
        <td align="right" style="padding-top: 10px;"><b>发表新主题增加的魅力：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="charm_addpost" name="charm_addpost" value="${bbs_params.charm_addpost }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>发表新回复增加的魅力：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="charm_replypost" name="charm_replypost" value="${bbs_params.charm_replypost }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>加精帖子增加的魅力：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="charm_digest" name="charm_digest" value="${bbs_params.charm_digest }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
       <tr>
        <td align="right" style="padding-top: 10px;"><b>推荐帖子增加的魅力：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="charm_recommend" name="charm_recommend" value="${bbs_params.charm_recommend }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
      <tr>
        <td align="right" style="padding-top: 10px;"><b>被删除贴子减少的魅力：</b></td><td align="left" style="padding-top: 10px;"><input type="text" id="charm_deletepost" name="charm_deletepost" value="${bbs_params.charm_deletepost }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData"></td>
      </tr>
       <tr>
        <td align="center" colspan="16" style="padding-top: 10px;">
        <input type="button" value="提交" onclick="tj()">  
        </td>
      </tr>
      </table>
     
</form>
</body>
 </html>