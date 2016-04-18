<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="org.dbc.util.PageParm"%>
<%      
  response.setHeader("Cache-Control",   "Public");      
  response.setHeader("Pragma",   "no-cache");      
  response.setDateHeader("Expires",   0);      
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>${bbs_params.bbs_name }-好友列表</title>
<link href="<%=path %>/css/backstage/style.css" rel="stylesheet" type="text/css" />
 <script type='text/javascript' src='dwr/engine.js'></script>
 <script type='text/javascript' src='dwr/util.js'></script>
 <script type='text/javascript' src='dwr/interface/friendsdao.js'></script>
  <script type='text/javascript' src='dwr/interface/userdao.js'></script>

<script type='text/javascript'>
function tj()
{
  var user2id=document.getElementById("user2id");
  var user2nickname=document.getElementById("user2nickname");
  if(user2nickname.value=='')
  {
    alert('请输入用户呢称');
    return;
  }
  document.forms[0].action="<%=path %>/friends.do?methede=addFriend";
  document.getElementById('doing').style.display='block';
  if(user2id.value=='')
  {
    friendsdao.checkNickname(user2nickname.value,checkbacknick);
  }
  else
  {
  friendsdao.checkisfriend('${userinfo.id}',user2nickname.value,checkback);
  }
}
       
      function checkbacknick(date)
        {
          if(date==false)
          {
            document.getElementById('doing').style.display='none';
            alert('该用户不存在');
            return;
		  }
		  else
		  {
		    var user2nickname=document.getElementById("user2nickname");
		    friendsdao.checkisfriend('${userinfo.id}',user2nickname.value,checkback);
		  }
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
		    alert('您已加此用户为好友');
		    return;
		 }
       }
function goto(str)
{
  document.forms[0].action=str;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
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

function gotodelete(str)
{
 if(confirm("确认删除此好友？"))
  {
 document.getElementById('doing').style.display='block';
 document.forms[0].action=str;
 document.forms[0].submit();
 }
}
</script>
  </head>
<body>
 <jsp:include page="/common/doing.jsp" />
<form id="form1" name="form1"  method="post" action="<%=path %>/friends.do?methede=addFriend">
<input  type="hidden" id="user2id" name="user2id" value="${user2id}"/>
<input type="hidden" id="receiver" name="receiver">
 <table border="1" width="100%">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;"><a href="<%=path %>/bbs.do?methede=toBbs" style="text-decoration: none;color: black;">DBC论坛</a> →  好友列表</td>
   </tr>
   </table>

   
   
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td style="padding-top: 20px;"><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" colspan="11" align="center" style="font-size:16px">好友列表</td>
                  </tr>
                  <tr bgcolor="#EEEEEE" height="25px;" align="center">
				 <!--   <td nowrap="nowrap" align="center">编号</td>--> 
   		<td nowrap="nowrap" width="5%">序号</td>
   		<td nowrap="nowrap" >用户呢称</td>
   		<td nowrap="nowrap" >添加时间</td>
   		<td nowrap="nowrap" >操作</td>
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
	<c:forEach items="${listmyfriend}" var="friend">
   		<%
												i++;
												%>
   		<tr bgcolor="#FFFFFF" class="tr_g2" onmouseover="this.className='tr_g2_over'" onmouseout="this.className='tr_g2'" align="center" >
   	    <td nowrap="nowrap""><%=(currentPage - 1) * pageRecorders + i %></td>
   		<td nowrap="nowrap" align="center" style="padding-left: 10px;">
   		<a  href="<%=path %>/bbs.do?methede=showBbsuser&userid=${friend[1]}" target="_blank">${friend[2] }</a>
   		</td>
   		<td nowrap="nowrap">${friend[3] }</td>
   		<td nowrap="nowrap">
   		<a href="javascript:gotoSubmit('<%=path %>/bbs.do?methede=toSend','receiver','${friend[2]}')" >发送消息</a>
   		<a href="javascript:gotodelete('<%=path %>/friends.do?methede=deleteFriend&user2id=${friend[1]}')" >删除</a>
   		</td>
   		</tr>
   		</c:forEach>
        </table></td></tr>
        </table></td></tr></table>
        </td></tr></table>
        <div style="padding-top: 30px;width: 100%;font-size: 12px;">
        <table width="100%"><tr><td align="center">用户呢称：<input type="text" name="user2nickname" id="user2nickname" value="${user2nickname }"> <input type="button" value="添加为好友" onclick="tj()"></td></tr></table>
         </div>
        </form>  
</body>
</html>
