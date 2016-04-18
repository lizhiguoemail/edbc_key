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
    
    <title>${bbs_params.bbs_name }-${forum.forumname }</title>
    
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
document.forms[0].action="<%=path %>/bbs_post.do?methede=listPost";
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
<input  type="hidden" id="forumid" name="forumid" value="${forum.id}"/>
<input  type="hidden" id="returntype" name="returntype" value="list"/>
  <c:set var="str" scope="page" value=",${user.nickname}," ></c:set>
 <table border="1" width="100%"  bordercolor="#8EBEF7">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;font-size: 12px;color: gray;">
   <a href="<%=path %>/bbs.do?methede=toBbs" style="color: gray;">DBC论坛</a>
    → <a href="<%=path %>/bbs.do?methede=listForum&categoryid=${forum.category.id }" style="color: gray;">${forum.category.categoryname }</a>
    → ${forum.forumname }
  </td>
   </tr>
   </table>
    <div style="padding-top: 10px;width: 100%;">
    <table style="width: 100%">
    <tr>
    <td>
     <c:if test="${empty userinfo}">
      <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
     <a href="javascript:alert('请先登录')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
     </c:if>
      <c:if test="${not empty userinfo}">
      <c:if test="${forum.ptype eq '正规论坛'}">
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddPost')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddVote')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
      </c:if>
        <c:if test="${forum.ptype eq '评论论坛'}">
         <c:if test="${userinfo.bbs_admin eq '1' || fn:contains(forum.moderator,str)}">
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddPost')"><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:goto('<%=path %>/bbs_post.do?methede=toaddVote')"><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
        </c:if>
         <c:if test="${userinfo.bbs_admin ne '1' && fn:contains(forum.moderator,str)==false}">
	     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主发帖，您无此权限')" ><img src="<%=path %>/images/front/bbs/newthread.gif" border="0"/></a>
	     <a href="javascript:alert('此版为评论论坛，只能由坛主或者版主添加投票，您无此权限')" ><img src="<%=path %>/images/front/bbs/newpoll.gif" border="0"/></a>
	    </c:if>
       </c:if>
      </c:if>
    </td>
    </tr>
    </table>
    </div>
    <div style="padding-top: 20px;width: 100%;">
   <table width="100%" border="1" bordercolor="#90C8FF">
   <tr>
   <td style="height: 50px;width: 30px;" align="center" bgcolor="#E8F4FF">
    <c:if test="${forum.ptype eq '正规论坛'}">
    <img src="<%=path %>/images/front/bbs/folder.gif" border="0" style="vertical-align: middle;" alt="正规论坛">
   </c:if>
   <c:if test="${forum.ptype eq '评论论坛'}">
    <img src="<%=path %>/images/front/bbs/follow.gif" border="0" style="vertical-align: middle;" alt="评论论坛">
   </c:if>
   </td>
   <td>
   <table width="100%" border="1" bordercolor="#90C8FF">
   <tr>
   <td style="width: 7%" align="center">
   <a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${forum.id }">
  <img width="80px"  style="vertical-align: middle;" src="<%=path%>/bbs/forum/${forum.picture }"  onerror="this.src='<%=path %>/images/front/bbs/team_077.gif';"  border="0">
   </a></td>
   <td align="left" >
   <table style="width: 100%;">
   <tr>
   <td style="padding-left: 10px;">
   <a href="<%=path %>/bbs_post.do?methede=listPost&forumid=${forum.id }" style="text-decoration: none;">
     <font style="FONT-SIZE: 13px; FILTER: Glow(color=#FF0080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
    ﹂${forum.forumname }﹁
    </font>
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
    <c:set var="str" scope="page" value=",${user.nickname}," ></c:set>
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
   <tr><td colspan="3" style="padding-left: 8px;width: 100%;font-size: 12px;color: red;" bgcolor="#E8F4FF">
      <font style="FONT-SIZE: 12px; FILTER: Glow(color=#000000,strength=0); COLOR: #ffffff; HEIGHT: 12px;">
     版主：<c:if test="${empty forum.moderator}">暂时空缺</c:if> <c:if test="${not empty forum.moderator}">${fn:substring(forum.moderator, 1, fn:length(forum.moderator)-1)}</c:if>
    </font>
     </td></tr>
   </table>
   </td>
   </tr></table>
   </div>
   <div style="padding-top: 20px;width: 100%;">
   <table style="width: 100%;font-size: 12px;" cellpadding="0" cellspacing="0" border="1" bordercolor="#90C8FF">
   <tr style="background-color: #86BAF3;height: 30px;">
   <td align="center" width="5%" >
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
   类型
   </font>
   </td>
   <td align="center" width="55%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
   名称
   </font>
   </td>
   <td align="center" width="10%" >
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
   作者
   </font>
   </td>
   <td align="center" width="5%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
   回复
   </font>
   </td>
   <td align="center" width="5%">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
   点击
   </font>
   </td>
   <td align="center" width="20%" >
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
   最后回复
   </font>
   </td>
    <c:if test="${userinfo.bbs_admin eq '1' || fn:contains(forum.moderator,str)}">
   <td align="center">
    <font style="FONT-SIZE: 9pt; FILTER: Glow(color=#008080,strength=2); COLOR: #ffffff; HEIGHT: 9pt">
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
   		                 <c:if test="${userinfo.bbs_admin eq '1' || fn:contains(forum.moderator,str)}">
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
     <a style="color: green;text-decoration: none;" href="javascript:deletepost('<%=path %>/bbs_post.do?methede=deletePost&oid=${bbs_post.id }')">删除</a>
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
