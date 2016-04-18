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
    
    <title>${bbs_params.bbs_name }-首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function goto(str)
{
  document.forms[0].action=str;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}
function denglu()
{
  var username=document.getElementById("username");
  var password=document.getElementById("password");
  var yanzhengma=document.getElementById("yanzhengma");
  if(username.value=='')
  {
    alert('帐号不能为空');
    return;
  }
  if(password.value=='')
  {
    alert('密码不能为空');
    return;
  }
  if(yanzhengma.value=='')
  {
    alert('请输入验证码');
    return;
  }
  document.forms[0].action="<%=path %>/bbs.do?methede=login";
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}

function gotosearch()
{
  var keyword=document.getElementById("keyword");
  if(keyword.value=='')
  {
    alert('请输入关键字');
    return;
  }
  document.forms[0].action="<%=path %>/bbs.do?methede=searchPost&search1=2&keyword="+keyword.value;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}
	</script>

  <script language="javascript"> 
function changeColor(){ 
var color="red|blue"; 
color=color.split("|"); 
document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)]; 
} 
<c:if test="${not empty userinfo && userinfo.unreadsize ne '0'}">
setInterval("changeColor()",200); 
</c:if>
</script> 
  </head>
  
  <body>
   <jsp:include page="/common/doing.jsp" /> 
   <form method="post">
   <c:set var="str" scope="page" value=",${user.nickname}," ></c:set>
   <table border="1px" width="100%" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td>
   <table width="100%">
   <tr bgcolor="#8EBEF7">
   <td  align="left" colspan="2" style="padding-left: 10px;"><font style="FONT-SIZE: 9pt; FILTER: Glow(color=#4A7AC9,strength=2); COLOR: #ffffff; HEIGHT: 9pt"><c:if test="${not empty userinfo}">我的基本资料</c:if><c:if test="${empty userinfo}">快速登录入口</c:if></font></td>
   </tr>
   <tr>
   <td align="left" style="padding-left: 10px;font-size: 12px;">
   <c:if test="${empty userinfo}">
          用户名：<input name="username" id="username" type="text" style="vertical-align: middle;"/> 
           密码：<input type="password" name="password" id="password" style="vertical-align: middle;"/>
           验证码：<input id="yanzhengma" name="yanzhengma"  value="${yanzhengma }"  style="width: 50px;vertical-align: middle;"/>
      <img id="yzimg" src="<%=path %>/ValidateCodeServlet" onclick="this.src='<%=path %>/ValidateCodeServlet?t='+(new Date()).getTime();''" style="vertical-align: middle;"></img>
       <input onclick="denglu()" type="button" style="cursor: hand;vertical-align: middle;" value="登录"/> <font color="red">${message }</font>
       </c:if>
       <c:if test="${not empty userinfo}">
       <table width="100%"><tr>
       <td align="center" width="100px;">
        <c:if test="${not empty userinfo.picture}">
	   <img src="<%=path %>/memberFace/${userinfo.picture} " border="0" style="width: 50px;"/>
	   </c:if>
	   <c:if test="${empty userinfo.picture}">
	   <img src="<%=path %>/memberFace/kopf07.gif" border="0" />
	   </c:if>
       </td>
       <td align="left" colspan="2">
       <table cellpadding="0" cellspacing="0" style="font-size: 12px;"><tr>
        <td  style="padding-left: 10px;">呢称：${userinfo.nickname }</td>
        <td  style="padding-left: 10px;">等级：${userinfo.bbs_rank }</td>
       <td style="padding-left: 10px;"> 魅力: ${userinfo.bbs_charm }</td>
       <td style="padding-left: 10px;"> 金币: ${userinfo.bbs_gold }</td>
       <td style="padding-left: 10px;"> 发帖数：<a href="javascript:goto('<%=path %>/bbs.do?methede=searchPost&search1=1&keyword=${userinfo.nickname }&isfuzzy=0')" style="color: green;" title="查看帖子">${userinfo.bbs_postnum }</a></td>
       <td style="padding-left: 10px;"> <a href="javascript:goto('<%=path %>/user.do?methede=toUpdateUserpwd&isbbs=1&oid=${userinfo.id }')" style="color: green;">修改密码</a></td>
       <td style="padding-left: 10px;"> <a href="javascript:goto('<%=path %>/user.do?methede=toUpdateUser&isbbs=1&oid=${userinfo.id }')" style="color: green;">修改个人资料</a></td>
       <td style="padding-left: 10px;"> <a href="javascript:goto('<%=path %>/friends.do?methede=listFriend')" style="color: green;">我的好友</a></td>
       <td style="padding-left: 10px;"> <a href="javascript:goto('<%=path %>/bbs.do?methede=listreceiver')" style="color: green;">查看我的消息</a></td>
       <td style="padding-left: 10px;"> <a href="javascript:goto('<%=path %>/bbs.do?methede=listreceiver&isunread=1')" style="color: green;"><div id="blink"><c:if test="${userinfo.unreadsize ne '0'}">未读消息(${userinfo.unreadsize }) </c:if></div></a></td>
       </tr></table>
       </td>
       </tr></table>
       </c:if>
        </td>
        <td align="right" style="padding-right: 10px;"><input type="text" name="keyword" id="keyword" style="width: 80px;vertical-align: middle;"> 
        <a href="javascript:gotosearch()"><img src="<%=path %>/images/front/bbs/sousuo.jpg" border="0" style="vertical-align: middle;"></a></td>
   </tr></table>
   </td>
   </tr>
   <tr><td>
   <table width="100%" border="1" bordercolor="#8EBEF7">
   <tr bgcolor="#8EBEF7">
   <td width="33%" align="center" >
   <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#4A7AC9,strength=2); COLOR: #ffffff; HEIGHT: 9pt">最新帖子</font>
   </td>
   <td width="33%" align="center">
   <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#4A7AC9,strength=2); COLOR: #ffffff; HEIGHT: 9pt">最新精华</font>
   </td>
   <td width="33%" align="center">
   <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#4A7AC9,strength=2); COLOR: #ffffff; HEIGHT: 9pt">最新推荐</font>
   </td>
   </tr>
   <tr>
   <td width="33%" align="center" >
   <table width="100%">
   <c:forEach items="${newpostlist}" var="newpost">
   <tr><td align="left" style="padding-left: 5px;font-size: 12px;"><img src="<%=path %>/images/front/bbs/dot2.gif" border="0"/>
   <c:if test="${newpost[2] eq '1'}">
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=showPost&oid=${newpost[0] }')" style="text-decoration: none;color: FF8000;">${newpost[1] }</a>
    </c:if>
    <c:if test="${newpost[2] eq '2'}">
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=showVote&oid=${newpost[0] }')" style="text-decoration: none;color: FF8000;">${newpost[1] }</a>
    </c:if>
    </td></tr>
   </c:forEach>
   </table>
   </td>
   <td width="33%" align="center">
   <table width="100%">
   <c:forEach items="${digestpostlist}" var="digestpost">
   <tr><td align="left" style="padding-left: 5px;font-size: 12px;"><img src="<%=path %>/images/front/bbs/dot2.gif" border="0"/>
   <c:if test="${digestpost[2] eq '1'}">
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=showPost&oid=${digestpost[0] }')" style="text-decoration: none;color: FF8000;">${digestpost[1] }</a>
    </c:if>
    <c:if test="${digestpost[2] eq '2'}">
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=showVote&oid=${digestpost[0] }')" style="text-decoration: none;color: FF8000;">${digestpost[1] }</a>
    </c:if>
    </td></tr>
   </c:forEach>
   </table>
   </td>
   <td width="33%" align="center">
   <table width="100%">
   <c:forEach items="${recommendpostlist}" var="recommendpost">
   <tr><td align="left" style="padding-left: 5px;font-size: 12px;"><img src="<%=path %>/images/front/bbs/dot2.gif" border="0"/>
   <c:if test="${recommendpost[2] eq '1'}">
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=showPost&oid=${recommendpost[0] }')" style="text-decoration: none;color: FF8000;">${recommendpost[1] }</a>
    </c:if>
    <c:if test="${recommendpost[2] eq '2'}">
    <a href="javascript:goto('<%=path %>/bbs_post.do?methede=showVote&oid=${recommendpost[0] }')" style="text-decoration: none;color: FF8000;">${recommendpost[1] }</a>
    </c:if>
    </td></tr>
   </c:forEach>
   </table>
   </td>
   </tr>
   </table>
   </td></tr>
   <c:forEach items="${listcategory}" var="category">
   <tr><td>
   <table width="100%" border="1" bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 10px;" bgcolor="#8EBEF7">
   <a href="<%=path %>/bbs.do?methede=listForum&categoryid=${category.id }" style="text-decoration: none;">
   <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;cursor: hand;">${category.categoryname }</font>
   </a>
   </td>
   </tr>
   <c:forEach items="${category.forums}" var="forum">
   <c:if test="${forum.isopen ne '否'|| userinfo.bbs_admin eq '1'|| fn:contains(forum.moderator,str)}">
   <table width="100%" border="1" bordercolor="#8EBEF7">
   <tr>
   <td style="width: 30px;" align="center" bgcolor="#E8F4FF">
   <c:if test="${forum.ptype eq '正规论坛'}">
    <img src="<%=path %>/images/front/bbs/folder.gif" border="0" style="vertical-align: middle;" alt="正规论坛">
   </c:if>
   <c:if test="${forum.ptype eq '评论论坛'}">
    <img src="<%=path %>/images/front/bbs/follow.gif" border="0" style="vertical-align: middle;" alt="评论论坛">
   </c:if>
   </td>
   <td>
   <table width="100%" border="1" bordercolor="#8EBEF7">
   <tr>
   <td style="width: 15%" align="center">
   <a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${forum.id }">
   <img width="80px"  style="vertical-align: middle;" src="<%=path%>/bbs/forum/${forum.picture }"  onerror="this.src='<%=path %>/images/front/bbs/team_077.gif';"  border="0">
   </a>
   </td>
   <td align="left" >
   <table style="width: 100%;">
   <tr>
   <td style="padding-left: 10px;"><a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${forum.id }" style="text-decoration: none;">
   <font style="FONT-SIZE: 13px; FILTER: Glow(color=#FF0080,strength=2); COLOR: #ffffff; HEIGHT: 9pt;cursor: hand;">
   ﹂${forum.forumname }﹁</font>
   </a></td>
   <td align="right" style="padding-right: 5px;">
   <c:if test="${empty userinfo}">
     <a href="javascript:alert('请先登录')" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
     <a href="javascript:alert('请先登录')" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
   </c:if>
   <c:if test="${not empty userinfo}">
   <c:if test="${forum.ptype eq '正规论坛'}">
   <a href="<%=path %>/bbs_post.do?methede=toaddPost&forumid=${forum.id }" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
   <a href="<%=path %>/bbs_post.do?methede=toaddVote&forumid=${forum.id }" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
   </c:if>
    <c:if test="${forum.ptype eq '评论论坛'}">
    <c:if test="${userinfo.bbs_admin eq '1' || fn:contains(forum.moderator,str)}">
     <a href="<%=path %>/bbs_post.do?methede=toaddPost&forumid=${forum.id }" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
     <a href="<%=path %>/bbs_post.do?methede=toaddVote&forumid=${forum.id }" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
    </c:if>
    <c:if test="${userinfo.bbs_admin ne '1' && fn:contains(forum.moderator,str)==false}">
     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主发帖，您无此权限')" title="在此论坛发帖" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost1.gif"  border="0"></a>
     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主添加投票，您无此权限')" title="在此论坛发表新投票" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost2.gif"  border="0"></a>
    </c:if>
   </c:if>
   </c:if>
   <a href="<%=path %>/bbs.do?methede=searchPost&search5=${forum.id }&search3=1" title="查看此论坛的精华帖子" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost3.gif"  border="0"></a>
   <a href="<%=path %>/bbs.do?methede=searchPost&search5=${forum.id }&search3=2" title="查看此论坛的推荐帖子" style="padding-right: 5px;"><img src="<%=path %>/images/front/bbs/ipost3.gif"  border="0"></a>
   </td>
   </tr>
   <c:if test="${not empty forum.description }">
   <tr><td style="padding-left: 10px;" colspan="2">
   <pre><font style="font-size: 12px;color: gray;">论坛说明：${forum.description }  </font></pre>
   </td></tr>
   </c:if>
   </table>
   </td>
   </tr>
   <tr>
   <td  style="padding-left: 8px;" bgcolor="#E8F4FF" nowrap="nowrap">
  <font style="FONT-SIZE: 12px; FILTER: Glow(color=#000000,strength=0); COLOR: #ffffff; HEIGHT: 12px;">
   <c:if test="${empty forum.moderator}"> 版主：暂时空缺</c:if> 
   <c:if test="${not empty forum.moderator}"> 版主：${fn:substring(forum.moderator, 1, fn:length(forum.moderator)-1)}</c:if>
   </font>
   </td>
   <td  style="padding-right: 20px;font-size: 12px;" bgcolor="#E8F4FF" align="right">
    <%int a=0;int b=0;int c=0; int d=0;%>
    
   <c:forEach items="${forum.posts}" var="post">
  <c:if test="${post.deletemark ne '1' && post.floor==0}">
  <%a=a+1; %>
  </c:if>
  <c:if test="${post.deletemark ne '1' && post.floor>0}">
  <%b=b+1; %>
  </c:if>
  <c:if test="${fn:contains(post.createdate,nowdate) && post.deletemark ne '1' && post.floor==0}">
  <%c=c+1; %>
  </c:if>
  <c:if test="${fn:contains(post.createdate,nowdate) && post.deletemark ne '1' && post.floor>0}">
  <%d=d+1; %>
  </c:if>
   </c:forEach>
   <font style="FONT-SIZE: 10px; FILTER: Glow(color=#000000,strength=0); COLOR: #ffffff; HEIGHT: 10px;">
   主题数【<%=a %>】
   &nbsp;&nbsp;&nbsp;&nbsp;回复数【<%=b %>】
   &nbsp;&nbsp;&nbsp;&nbsp;今日主题数【<%=c %>】
   &nbsp;&nbsp;&nbsp;&nbsp;今日回复数【<%=d %>】
   </font>
   </td>
   </tr>
   </table>
   </td>
   </tr></table>
   </c:if>
   </c:forEach>
   </table>
   </td></tr>
   </c:forEach>
   <tr><td>
   <table width="100%" >
   <tr  bgcolor="#8EBEF7">
   <td width="100%" align="left" style="padding-left: 10px;">
   <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#4A7AC9,strength=2); COLOR: #ffffff; HEIGHT: 9pt">魅力排行榜</font>
   </td>
   </tr>
   <tr>
   <td>
   <table width="100%" border="1" ><tr>
   <td align="left">
   <ul>
   <c:forEach items="${charmuserlist}" var="charmuser" varStatus="status">
   <li style="float: left;width: 200px;padding-top: 10px;padding-bottom: 10px;padding-left: 5px;">
   <table width="100%;" cellpadding="0" cellspacing="0" border="1px;" bordercolor="#8EBEF7" style="font-size: 12px;">
   <tr>
   <td colspan="2" align="center"">
   <font style="FONT-SIZE: 13px; FILTER: Glow(color=#FF0080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">TOP ${status.count}</font>
   </td>
   </tr>
   <tr>
   <td align="center">
   <c:if test="${not empty charmuser[5]}">
   <img src="<%=path %>/memberFace/${charmuser[5] } " border="0" width="50px;"/>
   </c:if>
   <c:if test="${empty charmuser[5]}">
   <img src="<%=path %>/memberFace/kopf07.gif" border="0" />
   </c:if>
   </td>
   <td style="padding-left: 5px;">
     用户名: ${charmuser[1] }<br/>
    魅力: ${charmuser[2] }<br/>
    金币: ${charmuser[3] }<br/>
    发帖数：${charmuser[4] }<br/>
   </td>
   </tr>
   </table>
   </li>
    </c:forEach>
   </ul>
   </td>
   </tr>
   <tr><td></td></tr>
   </table>
   </td>
   </tr>
   </table></td></tr>
  </table>
   </form>
  </body>
  <script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>
