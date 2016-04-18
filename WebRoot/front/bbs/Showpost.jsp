<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.dbc.util.PageParm"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
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
    
    <title>${bbs_params.bbs_name }-${bbs_post.postname }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type='text/javascript' src='dwr/engine.js'></script>
	<script type='text/javascript' src='dwr/util.js'></script>
	<script type='text/javascript' src='dwr/interface/bbs_weapondao.js'></script>
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
document.forms[0].action="<%=path %>/bbs_post.do?methede=showPost";
document.getElementById('doing').style.display='block';
document.forms[0].submit();
}

	function goto(str)
	{
    document.forms[0].action=str;
    document.getElementById('doing').style.display='block';
    document.forms[0].submit();
    }
    
    function gotonew(str)
	{
    document.forms[0].action=str;
    document.getElementById('doing').style.display='block';
    document.forms[0].target="_blank";
    document.forms[0].submit();
    document.forms[0].target="_self";
    document.getElementById('doing').style.display='none';
    }
    
    function gotoSubmit(str,gtype,gvalue)
	{
	var g=document.getElementById(gtype);
	g.value=gvalue;
    document.forms[0].action=str;
    document.getElementById('doing').style.display='block';
    document.forms[0].target="_blank";
    document.forms[0].submit();
    document.forms[0].target="_self";
    document.getElementById('doing').style.display='none';
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
	
	function weapon(weapontype)
	{
	  document.getElementById('doing').style.display='block';
	  document.forms[0].action="<%=path %>/bbs_post.do?methede=setweapon&weapontype="+weapontype;
	  bbs_weapondao.checkIsweapon('${userinfo.id}','${bbs_post.id }',checkback);
	}
	
	 function checkback(date)
        {
          if(date==false)
          {
            document.forms[0].submit();
		  }
		 if(date==true)
		 {
		    document.getElementById('doing').style.display='none';
		    alert('对不起，您已使用过武器');
		 }
       }
</script>
<style type="text/css">
.right-font08 {
	font-family: "宋体";
	font-size: 12px;
	color: #555555;
	text-decoration: none;
}
</style>
  </head>
  <%      
  response.setHeader("Cache-Control",   "Public");      
  response.setHeader("Pragma",   "no-cache");      
  response.setDateHeader("Expires",   0);      
%>
  <body>
  <jsp:include page="/common/doing.jsp" /> 
  <form method="post">
  <input type="hidden" name="nowpage" id="nowpage" value="${pageParm.nowpage }"/>
<input type="hidden" name="gotopagetype" id="gotopagetype" value=""/>
<input type="hidden" name="gotopageString" id="gotopageString" value=""/>
<input  type="hidden" id="totalpage" value="${pageParm.totalpage}"/>
 <input type="hidden" name="repostid" value="${bbs_post.id }" />
 <input type="hidden" name="forumid" value="${bbs_post.forumid }" />
 <input type="hidden" name="oid" value="${bbs_post.id }" />
 <input type="hidden" id="receiver" name="receiver" />
 <input type="hidden" id="keyword" name="keyword" />
 <input type="hidden" id="user2nickname" name="user2nickname" />
   <c:set var="str" scope="page" value=",${userinfo.nickname}," ></c:set>
 <table border="1" width="100%" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;font-size: 12px;color: gray;">
   <a href="<%=path %>/bbs.do?methede=toBbs" style="color: gray;">DBC论坛</a> 
   →  <a href="<%=path %>/bbs.do?methede=listForum&categoryid=${bbs_post.forum.category.id }" style="color: gray;">${bbs_post.forum.category.categoryname }</a>
   →  <a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${bbs_post.forum.id }" style="color: gray;">${bbs_post.forum.forumname }</a>
   → ${bbs_post.postname }</td>
   </tr>
   </table>
    <div style="padding-top: 10px;width: 100%;">
    <table style="width: 100%">
    <tr>
    <td>
     <c:if test="${empty userinfo}">
     <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
     <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
     <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newreply.gif" border="0"/></a>
     </c:if>
      <c:if test="${not empty userinfo}">
      <c:if test="${bbs_post.forum.ptype eq '正规论坛'}">
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddPost')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddVote')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
      </c:if>
        <c:if test="${bbs_post.forum.ptype eq '评论论坛'}">
         <c:if test="${userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str)}">
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddPost')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddVote')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
        </c:if>
         <c:if test="${userinfo.bbs_admin ne '1' && fn:contains(bbs_post.forum.moderator,str)==false}">
	     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主发帖，您无此权限')" ><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主添加投票，您无此权限')" ><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
	    </c:if>
       </c:if>
      </c:if>
    <c:if test="${bbs_post.islock ne 1 && not empty userinfo}">
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddRePost')"><img src="<%=path %>/images/front/bbs/newreply.gif" border="0"/></a>
    </c:if>
    </td>
    </tr>
    </table>
    </div>
   <div style="padding-top: 10px;width: 100%;">
   <table style="width: 100%;" cellpadding="0" cellspacing="0" border="">
   <tr style="background-color: #86BAF3;font-size: 12px;">
   <td align="left" style="padding-left: 8px;" colspan="12">
   <table width="100%;"><tr><td>
     <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
    * 帖子主题：
    </font>
    <font color="${bbs_post.titlecolor }" >${bbs_post.postname }</font>
    </td>
   <td align="right" style="padding-right: 8px;font-size: 12px;">
   <c:if test="${bbs_post.forum.isallowscore eq '允许' && bba_post.user.id ne userinfo.id}">
   <a href="javascript:weapon('flower');" style="color: black;padding-left: 5px;" title="给他一个鲜花，将消耗您1个金币"><img src="<%=path %>/images/front/bbs/xianhua.gif" border="0"  style="vertical-align: middle;"/>鲜花</a>(${bbs_post.flower })
   <a href="javascript:weapon('kiss');" style="color: black;padding-left: 5px;" title="给他一个飞吻，将消耗您2个金币"><img src="<%=path %>/images/front/bbs/feiwen.gif" border="0"  style="vertical-align: middle;"/>飞吻</a>(${bbs_post.kiss })
   <a href="javascript:weapon('egg');" style="color: black;padding-left: 5px;" title="给他一个鸡蛋，将消耗您1个金币"><img src="<%=path %>/images/front/bbs/jidan.gif" border="0"  style="vertical-align: middle;"/>鸡蛋</a>(${bbs_post.egg })
   <a href="javascript:weapon('brick');" style="color: black;padding-left: 5px;" title="给他一个砖块，将消耗您2个金币"><img src="<%=path %>/images/front/bbs/zhadan.gif" border="0"  style="vertical-align: middle;"/>砖块</a>(${bbs_post.brick })
   </c:if>
   </td></tr></table>
   </td>
   </tr>
   
   
    <c:if test="${pageParm.nowpage eq '1' }">
   <tr>
   <td style="width: 180px;padding-top: 20px;padding-bottom: 20px;" valign="top" nowrap="nowrap">
   <table width="100%;" style="font-size: 12px;">
   <tr>
   <td width="25%" align="right" style="padding-left: 10px;">
   <a  href="<%=path %>/bbs.do?methede=showBbsuser&userid=${bbs_post.user.id }" target="_blank" title="查看此用户信息">
   <img src="<%=path %>/images/front/bbs/offline2.gif" border="0">
   </a>
   </td>
   <td align="left"><b>${bbs_post.user.nickname }</b></td>
   </tr>
   <tr>
   <td align="center" colspan="2" style="padding-left: 10px;">
   <c:if test="${empty bbs_post.user.picture }">
   <img src="<%=path %>/memberFace/kopf07.gif" border="0"/>
   </c:if>
    <c:if test="${not empty bbs_post.user.picture }">
   <img src="<%=path %>/memberFace/${bbs_post.user.picture }" border="0" width="50px;"/>
   </c:if>
   </td>
   </tr>
   <tr>
   <td align="right" colspan="2" style="padding-left: 10px;"><img src="<%=path %>/images/front/bbs/rank/pips${bbs_post.user.bbs_ranknum }.gif" border="0"/></td>
   </tr>
     <tr>
   <td  align="right" style="padding-left: 10px;"><b>级别:</b></td>
   <td align="left">${bbs_post.user.bbs_rank }</td>
   </tr>
     <tr>
   <td  align="right" style="padding-left: 10px;"><b>魅力：</b></td>
   <td align="left">${bbs_post.user.bbs_charm }</td>
   </tr>
     <tr>
   <td align="right" style="padding-left: 10px;"><b>金币：</b></td>
   <td align="left">${bbs_post.user.bbs_gold }</td>
   </tr>
     <tr>
   <td  align="right" style="padding-left: 10px;"><b>发帖数：</b></td>
   <td align="left">${bbs_post.user.bbs_postnum }</td>
   </tr>
    <tr>
   <td align="right" style="padding-left: 10px;" nowrap="nowrap"><b>注册时间：</b></td>
   <td align="left">${bbs_post.user.regdate }</td>
   </tr>
   </table>
   </td>
   <td style="padding-left: 3px;padding-top: 5px;height: 100%;" valign="top">
   <table style="width: 100%;font-size: 12px;height: 100%;width: 100%;" cellpadding="0" cellspacing="0">
    <tr><td style="border-bottom: 1p dashed #000000;padding-bottom: 5px;">
     <c:if test="${not empty userinfo && userinfo.id ne bbs_post.user.id}">
    <a href="javascript:gotoSubmit('<%=path %>/bbs.do?methede=toSend','receiver','${bbs_post.user.nickname }')" style="text-decoration: none;font-size: 12px;color: black;"><img src="<%=path %>/images/front/bbs/message.gif" border="0" style="vertical-align: middle;"/>消息</a>
    <a href="javascript:gotoSubmit('<%=path %>/bbs.do?methede=toSearchPost','keyword','${bbs_post.user.nickname }')" style="text-decoration: none;font-size: 12px;color: black;" ><img src="<%=path %>/images/front/bbs/find.gif" border="0" style="vertical-align: middle;"/>搜索</a> 
    <a  href="javascript:gotoSubmit('<%=path %>/friends.do?methede=listFriend&user2id=${bbs_post.user.id }','user2nickname','${bbs_post.user.nickname }')" style="text-decoration: none;font-size: 12px;color: black;"><img src="<%=path %>/images/front/bbs/friend.gif" border="0" style="vertical-align: middle;"/>好友</a> 
    </c:if>
    </td></tr>
    <tr><td style="padding-top: 5px;padding-bottom: 5px;padding-left: 10px;height: 100%;background-color: #ffffff;">
   ${bbs_post.postcontent }
   </td></tr>
   <c:if test="${not empty bbs_post.attachment}">
   <tr><td style="padding-top: 25px;padding-bottom: 5px;padding-left: 10px;" valign="bottom">附件：<a href="<%=path %>/bbs/attachment/${bbs_post.attachment }" style="text-decoration: none;color: green;">点击下载</a></td></tr>
   </c:if>
   <c:if test="${bbs_post.isshowsignature eq '1'}">
   <tr><td style="padding-top: 5px;padding-bottom: 5px;padding-left: 10px;border-top: 1p dashed #000000;padding-bottom: 5px;" valign="bottom">
    <pre>${bbs_post.user.ownsigned }</pre>
   </td></tr>
  </c:if>
   </table>
   </td>
   </tr>
   <tr>
   <td style="padding-left: 10px;"><font style="font-size: 12px;font-weight: bold;">${bbs_post.createdate }</font></td>
   <td > 
   <table style="width: 100%">
   <tr>
   <td style="font-size: 12px;padding-left: 10px;">
    <c:if test="${bbs_post.user.id eq userinfo.id }">
    <b>|</b>
    <a style="color: green;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=toUpdatePost&oid=${bbs_post.id }')">编辑</a>
    </c:if> 
    <c:if test="${bbs_post.isdigest eq '1' &&(  userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
     <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isdigest&setvalue=0')">取消精华</a>
    </c:if> 
    <c:if test="${bbs_post.isdigest ne '1' &&(  userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
     <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isdigest&setvalue=1')">设为精华</a>
    </c:if> 
     <c:if test="${bbs_post.isrecommend eq '1' &&(  userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
    <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isrecommend&setvalue=0')">取消推荐</a>
    </c:if> 
    <c:if test="${bbs_post.isrecommend ne '1' &&(  userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
    <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isrecommend&setvalue=1')">设为推荐</a>
    </c:if> 
    <c:if test="${ bbs_post.user.id eq userinfo.id || userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str)}">
    <b>|</b>
   <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:setcolor('${bbs_post.id}')">标题颜色</a>
   </c:if>
     <c:if test="${bbs_post.isindustrial ne '1' &&( userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
        <b>|</b>
       <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isindustrial&setvalue=1')">置顶</a>
    </c:if>
     <c:if test="${bbs_post.isindustrial eq '1' &&(  userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
        <b>|</b>
       <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isindustrial&setvalue=0')">取消置顶</a>
    </c:if>
    <c:if test="${bbs_post.islock eq '1' &&(  userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
     <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=islock&setvalue=0')">解锁</a>
    </c:if> 
    <c:if test="${bbs_post.islock ne '1' &&(  userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str))}">
     <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=islock&setvalue=1')">锁定</a>
    </c:if> 
      <c:if test="${ bbs_post.user.id eq userinfo.id || userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str)}">
      <b>|</b>
     <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:deletepost('<%=path %>/bbs_post.do?methede=deletePost')">删除</a>
     <b>|</b>  
     </c:if>
    </td>
   <td style="padding-right: 50px;" align="right"><font style="font-size: 12px;font-weight: bold;">楼主</font></td>
   </tr>
   </table>
   </td>
   </tr>
   </c:if>
   
  <c:forEach items="${postlist}" var="bbs_repost">
   <tr>
  <td style="width: 180px;padding-top: 20px;padding-bottom: 20px;" valign="top">
   <table width="100%;" style="font-size: 12px;">
   <tr>
   <td width="25%" align="right" style="padding-left: 10px;">
  <a href="<%=path %>/bbs.do?methede=showBbsuser&userid=${bbs_repost.user.id }" target="_blank" title="查看此用户信息">
   <img src="<%=path %>/images/front/bbs/offline2.gif" border="0">
   </a>
   </td>
   <td align="left"><b>${bbs_repost.user.nickname }</b></td>
   </tr>
   <tr>
   <td align="center" colspan="2" style="padding-left: 10px;">
<c:if test="${empty bbs_repost.user.picture }">
   <img src="<%=path %>/memberFace/kopf07.gif" border="0"/>
   </c:if>
    <c:if test="${not empty bbs_repost.user.picture }">
   <img src="<%=path %>/memberFace/${bbs_repost.user.picture }" border="0" width="50px;"/>
   </c:if>
   </td>
   </tr>
    <tr>
   <td align="right" colspan="2" style="padding-left: 10px;">
   <img src="<%=path %>/images/front/bbs/rank/pips${bbs_repost.user.bbs_ranknum }.gif" border="0"/></td>
   </tr>
       <tr>
   <td  align="right" style="padding-left: 10px;"><b>级别:</b></td>
   <td align="left">${bbs_repost.user.bbs_rank }</td>
   </tr>
     <tr>
   <td  align="right" style="padding-left: 10px;"><b>魅力：</b></td>
   <td align="left">${bbs_repost.user.bbs_charm }</td>
   </tr>
     <tr>
   <td align="right" style="padding-left: 10px;"><b>金币：</b></td>
   <td align="left">${bbs_repost.user.bbs_gold }</td>
   </tr>
     <tr>
   <td  align="right" style="padding-left: 10px;"><b>发帖数：</b></td>
   <td align="left">${bbs_repost.user.bbs_postnum }</td>
   </tr>
    <tr>
   <td align="right" style="padding-left: 10px;" nowrap="nowrap"><b>注册时间：</b></td>
   <td align="left">${bbs_repost.user.regdate }</td>
   </tr>
   </table>
   </td>
   <td style="padding-left: 3px;padding-top: 5px;height: 100%" valign="top" >
    <table style="width: 100%;font-size: 12px;height: 100%" cellpadding="0" cellspacing="0">
    <tr><td style="border-bottom: 1p dashed #000000;padding-bottom: 5px;">
    <c:if test="${not empty userinfo && userinfo.id ne bbs_repost.user.id}">
     <a href="javascript:gotoSubmit('<%=path %>/bbs.do?methede=toSend','receiver','${bbs_repost.user.nickname }')" style="text-decoration: none;font-size: 12px;color: black;"><img src="<%=path %>/images/front/bbs/message.gif" border="0" style="vertical-align: middle;"/>消息</a>
    <a href="javascript:gotoSubmit('<%=path %>/bbs.do?methede=toSearchPost','keyword','${bbs_repost.user.nickname }')" style="text-decoration: none;font-size: 12px;color: black;" ><img src="<%=path %>/images/front/bbs/find.gif" border="0" style="vertical-align: middle;"/>搜索</a> 
    <a  href="javascript:gotoSubmit('<%=path %>/friends.do?methede=listFriend&user2id=${bbs_repost.user.id }','user2nickname','${bbs_repost.user.nickname }')" style="text-decoration: none;font-size: 12px;color: black;"><img src="<%=path %>/images/front/bbs/friend.gif" border="0" style="vertical-align: middle;"/>好友</a> 
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toCopy&copyid=${bbs_repost.id }')" style="text-decoration: none;font-size: 12px;color: black;"><img src="<%=path %>/images/front/bbs/copy.gif" border="0" style="vertical-align: middle;"/>复制</a> 
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toreply&replyid=${bbs_repost.id }')" style="text-decoration: none;font-size: 12px;color: black;"><img src="<%=path %>/images/front/bbs/reply.gif" border="0" style="vertical-align: middle;"/>引用</a>
     </c:if> 
    </td></tr>
    <c:if test="${bbs_repost.isscreen ne '1'}">
    <c:if test="${not empty bbs_repost.replynickname }">
      <tr><td style="padding-top: 5px;border-bottom: 1p dashed #cccccc;padding-bottom: 5px;background-color: #ffffff;">
   <div style="background-color: #EFEFEF;"><div style="font-size: 12px;font-weight: 宋体;">下面引用由 【<font color="red">${bbs_repost.replynickname }</font>】 ${bbs_repost.replydate } <b>发表内容:</b></div><p>${bbs_repost.replycontent }</p></div>
   </td></tr>
   </c:if>
    <tr><td style="padding-top: 5px;padding-bottom: 5px;height: 100%;background-color: #ffffff;">
   ${bbs_repost.postcontent }
   </td></tr>
   <c:if test="${bbs_repost.isshowsignature eq '1'}">
   <tr><td style="padding-top: 5px;padding-bottom: 5px;padding-left: 10px;border-top: 1p dashed #000000;padding-bottom: 5px;" valign="bottom">
    <pre>${bbs_repost.user.ownsigned }</pre>
   </td></tr>
  </c:if>
  </c:if>
   <c:if test="${bbs_repost.isscreen eq '1'}">
    <tr><td style="padding-top: 5px;padding-bottom: 5px;padding-left:50px;height: 100%;">
       <div style="width: 400px;height: 80px;background-color: #EEEEEE;" align="center">
       <div style="width: 100%;padding-top: 30px;">
      <font style="font-size: 14px;color: red;font-weight: bold;">此回复已被管理员屏蔽</font>
      </div>
      </div>
   </td></tr>
  </c:if>
   </table>
   </td>
   </tr>
   <tr>
   <td style="padding-left: 10px;"><font style="font-size: 12px;font-weight: bold;">${bbs_repost.createdate }</font></td>
   <td >
   <table width="100%"><tr>
   <td style="font-size: 12px;padding-left: 10px;">
    <c:if test="${(userinfo.bbs_admin eq '1' || fn:contains(bbs_repost.forum.moderator,str))&& bbs_repost.isscreen ne '1'}">
     <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isscreen&setvalue=1&reoid=${bbs_repost.id }')">屏蔽此回复</a>
     <b>|</b>
    </c:if> 
     <c:if test="${(userinfo.bbs_admin eq '1' || fn:contains(bbs_repost.forum.moderator,str))&& bbs_repost.isscreen eq '1'}">
     <b>|</b>
    <a style="color: red;text-decoration: none;font-weight: bold;" href="javascript:goto('<%=path %>/bbs_post.do?methede=setPost&setfield=isscreen&setvalue=0&reoid=${bbs_repost.id }')">恢复此回复</a>
     <b>|</b>
    </c:if> 
   </td>
   <td style="padding-right: 50px;" align="right">
    <font style="font-size: 12px;font-weight: bold;">第${bbs_repost.floor }楼</font>
    </td>
   </tr></table></td></tr>
   </c:forEach>
   <tr bgcolor="EEEEEE"><td colspan="12" style="font-size: 12px;"><div align="center"><a href="javascript:gotopage('first','0')" class="right-font08">首页</a>&nbsp;&nbsp;<a  href="javascript:gotopage('previous','0')" class="right-font08">上一页</a>&nbsp;&nbsp;<a  href="javascript:gotopage('next','0')" class="right-font08">下一页</a>&nbsp;&nbsp;<a  href="javascript:gotopage('last','0')" class="right-font08">末页</a>&nbsp;&nbsp;<input type="text" name="yeshu" id="yeshu" maxlength="5" style="width: 45px;" value="${pageParm.nowpage }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" >页&nbsp;&nbsp;<input type="button" value="GO" onclick="gotopage('tiaozhuan','0')"></div>
			         <div align="center">
			         <p>共${pageParm.total }条回复 ${pageParm.nowpage }/${pageParm.totalpage }页</p>
			          </div></td></tr>
   </table>
   </div>
    <div style="padding-top: 10px;width: 100%;">
    <table style="width: 100%">
    <tr>
    <td>
     <c:if test="${empty userinfo}">
     <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
     <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
     <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newreply.gif" border="0"/></a>
     </c:if>
      <c:if test="${not empty userinfo}">
      <c:if test="${bbs_post.forum.ptype eq '正规论坛'}">
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddPost')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddVote')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
      </c:if>
        <c:if test="${bbs_post.forum.ptype eq '评论论坛'}">
         <c:set var="str" scope="page" value=",${userinfo.nickname}," ></c:set>
         <c:if test="${userinfo.bbs_admin eq '1' || fn:contains(bbs_post.forum.moderator,str)}">
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddPost')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddVote')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
        </c:if>
         <c:if test="${userinfo.bbs_admin ne '1' && fn:contains(bbs_post.forum.moderator,str)==false}">
	     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主发帖，您无此权限')" ><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主添加投票，您无此权限')" ><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
	    </c:if>
       </c:if>
      </c:if>
     <c:if test="${bbs_post.islock ne 1 && not empty userinfo}">
     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddRePost')"><img src="<%=path %>/images/front/bbs/newreply.gif" border="0"/></a>
     </c:if>
    </td>
    </tr>
    </table>
    </div>
     </form>
  </body>
</html>
