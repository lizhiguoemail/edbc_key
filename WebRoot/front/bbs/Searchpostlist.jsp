<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.dbc.util.PageParm"%>
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
    
    <title>${bbs_params.bbs_name }-搜索结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
.right-font08 {
	font-family: "宋体";
	font-size: 12px;
	color: #555555;
	text-decoration: none;
}
</style>
   <script type="text/javascript">
   function gotopage(gototype,page)
{
var gotopagetype=document.getElementById("gotopagetype");
var gotopageString=document.getElementById("gotopageString");
var yeshu=document.getElementById("yeshu").value;
if(gototype=='first')
{
gotopagetype.value='first';
}
if(gototype=='last')
{
gotopagetype.value='last';
}
if(gototype=='previous')
{
gotopagetype.value='previous';
}
if(gototype=='next')
{
gotopagetype.value='next';
}
if(gototype=='gotopage')
{
gotopagetype.value='gotopage';
gotopageString.value='page';
}
if(gototype=='tiaozhuan')
{
if(yeshu=='')
{
alert("请输入页数");
return;
}
else
{
gotopagetype.value='gotopage';
gotopageString.value=yeshu;
}
}
document.forms[0].action="<%=path %>/bbs.do?methede=searchPost";
document.getElementById('doing').style.display='block';
document.forms[0].submit();
}

function goto(str)
{
  document.forms[0].action=str;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}

    function setcolor(oid)
	{
	 document.getElementById('doing').style.display='block';
     var arr=window.showModalDialog(encodeURI("<%=path %>/bbs.do?methede=setcolor&oid="+oid,"new","dialogHeight:200px;dialogWidth:500px;edge:Raised;center:Yes;help:no;resizable:Yes;status:no;"));
     document.getElementById('doing').style.display='none'; 
     var c=arr[0];
     document.forms[0].action="<%=path %>/bbs_post.do?methede=setPost&setfield=titlecolor&setvalue="+c+"&oid="+oid;
     document.getElementById('doing').style.display='block';
     document.forms[0].submit();
     
	}
	
	function deletepost(str)
	{
	  if(confirm("确认删除此帖？"))
	  {
	     document.forms[0].action=str;
   		 document.getElementById('doing').style.display='block';
    	 document.forms[0].submit();
	  }
	}
   </script>
  </head>
  
  <body>
  <jsp:include page="/common/doing.jsp" /> 
  <form method="post">
  <input type="hidden" name="nowpage" id="nowpage" value="${pageParm.nowpage }"/>
<input type="hidden" name="gotopagetype" id="gotopagetype" value=""/>
<input type="hidden" name="gotopageString" id="gotopageString" value=""/>
<input  type="hidden" id="totalpage" value="${pageParm.totalpage}"/>
<input  type="hidden" id="returntype" name="returntype" value="searchlist"/>
<input  type="hidden" id="keyword" name="keyword" value="${keyword }"/>
<input  type="hidden" id="search1" name="search1" value="${search1 }"/>
<input  type="hidden" id="search2" name="search2" value="${search2 }"/>
<input  type="hidden" id="search3" name="search3" value="${search3 }"/>
<input  type="hidden" id="search4" name="search4" value="${search4 }"/>
<input  type="hidden" id="search5" name="search5" value="${search5 }"/>
<input  type="hidden" id="keyword" name="begindate" value="${begindate }"/>
<input  type="hidden" id="keyword" name="enddate" value="${enddate }"/>
<input  type="hidden" id="forumid" name="forumid" value="${forumid }"/>
 <table border="1" width="100%" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;font-size: 12px;color: gray;">
   <a href="<%=path %>/bbs.do?methede=toBbs" style="color:gray;">DBC论坛</a> → 搜索结果</td>
   </tr>
   </table>
   
   
   <div style="padding-top: 20px;width: 100%;">
   <table style="width: 100%;font-size: 12px;" cellpadding="0" cellspacing="0" border="1" bordercolor="#90C8FF">
   <tr style="background-color: #86BAF3;font-size: 14px;font-weight: bold;height: 30px;">
   <td align="center" width="5%" >
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   类型
   </font>
   </td>
   <td align="center" width="35%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   名称
   </font>
   </td>
   <td align="center" width="10%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   所属主题
   </font>
   </td>
   <td align="center" width="10%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   所属论坛
   </font>
   </td>
   <td align="center" width="10%" >
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   作者
   </font>
   </td>
   <td align="center" width="5%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   回复
   </font>
   </td>
   <td align="center" width="5%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   点击
   </font>
   </td>
   <td align="center" width="20%" >
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   最后回复
   </font>
   </td>
   <c:if test="${userinfo.bbs_admin eq '1'}">
   <td align="center">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;">
   操作
   </font>
   </td>
   </c:if>
   </tr>
    
	                 <c:forEach items="${postlist}" var="bbs_post">
				   		<tr style="line-height: 30px;">
				   		<td nowrap="nowrap" align="center" valign="middle" style="background-color: #E8F4FF;">
				   		<c:if test="${bbs_post.isindustrial eq '1'}">
				   		<img src="<%=path %>/images/front/bbs/locktop.gif" alt="置顶" border="0">
				   		</c:if>
				   		<c:if test="${bbs_post.posttype eq '1' && bbs_post.islock ne '1'}">
				   		<a href="javascript:goto('<%=path %>/bbs_post.do?methede=showPost&oid=${bbs_post.id }')" style="text-decoration: none;">
				   		<img src="<%=path %>/images/front/bbs/topicnew0.gif" alt="帖子" border="0">
				   		</a>
				   		</c:if>
				   		<c:if test="${bbs_post.posttype eq '1'  && bbs_post.islock eq '1'}">
				   		<a href="javascript:goto('<%=path %>/bbs_post.do?methede=showPost&oid=${bbs_post.id }')" style="text-decoration: none;">
				   		<img src="<%=path %>/images/front/bbs/lockpost.gif" alt="帖子锁定" border="0">
				   		</a>
				   		</c:if>
				   		<c:if test="${bbs_post.posttype eq '2' && bbs_post.islockvote eq 1}">
				   		<a href="javascript:goto('<%=path %>/bbs_post.do?methede=showVote&oid=${bbs_post.id }')" style="text-decoration: none;">
				   		<img src="<%=path %>/images/front/bbs/closevote.gif" alt="投票锁定" border="0">
				   		</a>
				   		</c:if>
				   		<c:if test="${bbs_post.posttype eq '2' && bbs_post.islockvote ne 1}">
				   		<a href="javascript:goto('<%=path %>/bbs_post.do?methede=showVote&oid=${bbs_post.id }')" style="text-decoration: none;">
				   		<img src="<%=path %>/images/front/bbs/closedb.gif" alt="投票" border="0">
				   		</a>
				   		</c:if>
				   		</td>
				   		<td nowrap="nowrap" align="left" style="padding-left: 5px;">
				   		<c:if test="${bbs_post.posttype eq '1'}">
				   		<a href="javascript:goto('<%=path %>/bbs_post.do?methede=showPost&oid=${bbs_post.id }')" style="text-decoration: none;color: ${bbs_post.titlecolor }">
				   		<font style="color: gray">【${bbs_post.ptype }】</font> ${bbs_post.postname }
				   		</a>
				   		</c:if>
				   		<c:if test="${bbs_post.posttype eq '2'}">
				   		<a href="javascript:goto('<%=path %>/bbs_post.do?methede=showVote&oid=${bbs_post.id }')" style="text-decoration: none;color: ${bbs_post.titlecolor }">
				   		<font style="color: gray">【${bbs_post.ptype }】</font> ${bbs_post.postname }
				   		</a>
				   		</c:if>
				   		 <c:if test="${bbs_post.isdigest eq 1}">
				   		<img src="<%=path %>/images/front/bbs/jihua.gif" border="0" style="vertical-align: middle;" alt="精华帖"/>
				   		</c:if>
				   		 <c:if test="${bbs_post.isrecommend eq 1}">
				   		<img src="<%=path %>/images/front/bbs/jian.gif" border="0" style="vertical-align: middle;" alt="推荐帖"/>
				   		</c:if>
				   		</td>
				   		<td nowrap="nowrap" align="center">${bbs_post.forum.category.categoryname}</td>
				   		<td nowrap="nowrap" align="center">${bbs_post.forum.forumname}</td>
				   		<td nowrap="nowrap" align="center" style="background-color: #E8F4FF;">${bbs_post.user.nickname }</td>
				   		<td nowrap="nowrap" align="center">${bbs_post.replynum}</td>
				   		<td nowrap="nowrap" align="center">${bbs_post.hits}</td>
				   		<td nowrap="nowrap" align="center" style="background-color: #E8F4FF;">
				   		<c:if test="${not empty bbs_post.lastreplydate}">
				   		<img src="<%=path %>/images/front/bbs/lastpost2.gif"  border="0">${bbs_post.lastreplydate } | ${bbs_post.lastreplyuser}
				   		</c:if>
				   		<c:if test="${empty bbs_post.lastreplydate}">
				   		----暂无回复----
				   		</c:if>
				   		</td>
   		                <td nowrap="nowrap" align="left" style="padding-left: 5px;padding-right: 5px;font-size: 12px;">
   		                 <c:if test="${userinfo.bbs_admin eq '1'}">
    <c:if test="${bbs_post.isdigest eq 1}">
    <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isdigest&setvalue=0&oid=${bbs_post.id }')">取消精华</a>
    </c:if> 
    <c:if test="${bbs_post.isdigest ne 1}">
    <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isdigest&setvalue=1&oid=${bbs_post.id }')">设为精华</a>
    </c:if> 
    <b>|</b> 
     <c:if test="${bbs_post.isrecommend eq 1}">
    <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isrecommend&setvalue=0&oid=${bbs_post.id }')">取消推荐</a>
    </c:if> 
    <c:if test="${bbs_post.isrecommend ne 1}">
    <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isrecommend&setvalue=1&oid=${bbs_post.id }')">设为推荐</a>
    </c:if> 
    <b>|</b> 
   <a style="color: green;text-decoration: none;" href="javascript:setcolor('${bbs_post.id}')">标题颜色</a>
    <b>|</b>
     <c:if test="${bbs_post.isindustrial ne 1}">
       <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isindustrial&setvalue=1&oid=${bbs_post.id }')">置顶</a>
    </c:if>
     <c:if test="${bbs_post.isindustrial eq 1}">
       <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isindustrial&setvalue=0&oid=${bbs_post.id }')">取消置顶</a>
    </c:if>
    <b>|</b> 
    <c:if test="${bbs_post.islock eq 1}">
    <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=islock&setvalue=0&oid=${bbs_post.id }')">解锁</a>
    </c:if> 
    <c:if test="${bbs_post.islock ne 1}">
    <a style="color: green;text-decoration: none;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=islock&setvalue=1&oid=${bbs_post.id }')">锁定</a>
    </c:if> 
    <b>|</b>
     <a style="color: green;text-decoration: none;" href="javascript:deletepost('<%=path %>/bbs_post.do?methede=setPost&setfield=deletemark&setvalue=1&oid=${bbs_post.id }')">删除</a>
   		       </c:if>
   		                </td>
   		                </tr>
   		             </c:forEach>
			   		<tr bgcolor="EEEEEE"><td colspan="12"><div align="center"><a href="javascript:gotopage('first','0')" class="right-font08">首页</a>&nbsp;&nbsp;<a  href="javascript:gotopage('previous','0')" class="right-font08">上一页</a>&nbsp;&nbsp;<a  href="javascript:gotopage('next','0')" class="right-font08">下一页</a>&nbsp;&nbsp;<a  href="javascript:gotopage('last','0')" class="right-font08">末页</a>&nbsp;&nbsp;<input type="text" name="yeshu" id="yeshu" maxlength="5" style="width: 45px;" value="${pageParm.nowpage }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" >页&nbsp;&nbsp;<input type="button" value="GO" onclick="gotopage('tiaozhuan','0')"></div>
			         <div align="center">
			         <p>共${pageParm.total }条 ${pageParm.nowpage }/${pageParm.totalpage }页</p>
			          </div></td></tr>
   </table>
   </div>
   </form>
  </body>
</html>
