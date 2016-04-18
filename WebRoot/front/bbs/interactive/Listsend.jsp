<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
<title>${bbs_params.bbs_name }-发件箱</title>
<link href="<%=path %>/css/backstage/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
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
document.forms[0].action="<%=path %>/bbs.do?methede=listSend";
document.getElementById('doing').style.display='block';
document.forms[0].submit();
}
function cx()
{
 document.getElementById('doing').style.display='block';
 document.forms[0].submit();
}

function goto(str)
{
  document.forms[0].action=str;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}

function gotodelete(str)
{
 if(confirm("确认删除此信息？"))
  {
 document.getElementById('doing').style.display='block';
 document.forms[0].action=str;
 document.forms[0].submit();
 }
}
</SCRIPT>
  
<body>
 <jsp:include page="/common/doing.jsp" />
<form id="form1" name="form1" action="<%=path %>/bbs.do?methede=listSend" method="post">
<input type="hidden" name="nowpage" id="nowpage" value="${pageParm.nowpage }"/>
 <input type="hidden" name="gotopagetype" id="gotopagetype"/>
 <input type="hidden" name="gotopageString" id="gotopageString"/>
  <input  type="hidden" id="totalpage" value="${pageParm.totalpage}"/>
 <table border="1" width="100%">
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;">
    <jsp:include page="../../bbs/common/top.jsp"/> 
   </td>
   </tr>
   <tr>
   <td width="100%" align="left" style="padding-left: 20px;"><a href="<%=path %>/bbs.do?methede=toBbs" style="text-decoration: none;color: black;">DBC论坛</a> →  发件箱</td>
   </tr>
   </table>
   <table width="99%" cellpadding="0" cellspacing="0" align="center" bgcolor="#E8F4FF">
   <tr><td align="center" height="80px;">
   <a href="javascript:goto('<%=path %>/bbs.do?methede=listreceiver')"><img src="<%=path %>/images/front/bbs/inboxpm.gif" border="0" style="vertical-align: middle;"/></a>
   <img src="<%=path %>/images/front/bbs/outboxpm2.gif" border="0" style="vertical-align: middle;"/>
    <a href="javascript:goto('<%=path %>/bbs.do?methede=toSend')"><img src="<%=path %>/images/front/bbs/newpm.gif" border="0" style="vertical-align: middle;"/></a>
   <img src="<%=path %>/images/front/bbs/friendpm.gif" border="0" style="vertical-align: middle;"/>
   </td></tr>
   <tr><td align="center">
   
   
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" colspan="11" align="center" style="font-size:16px">发件箱</td>
                  </tr>
                  <tr bgcolor="#EEEEEE" height="25px;" align="center">
				 <!--   <td nowrap="nowrap" align="center">编号</td>--> 
   		<td nowrap="nowrap" width="5%">序号</td>
   		<td nowrap="nowrap" >发送标题</td>
   		<td nowrap="nowrap" >发送时间</td>
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
	<c:forEach items="${listinteractive}" var="interactive">
   		<%
												i++;
												%>
   		<tr bgcolor="#FFFFFF" class="tr_g2" onmouseover="this.className='tr_g2_over'" onmouseout="this.className='tr_g2'" align="center" >
   	    <td nowrap="nowrap""><%=(currentPage - 1) * pageRecorders + i %></td>
   		<td nowrap="nowrap" align="left" style="padding-left: 10px;">
   		<a  href="javascript:goto('<%=path %>/bbs.do?methede=showSend&oid=${interactive[0]}')">${interactive[1] }</a>
   		</td>
   		<td nowrap="nowrap">${interactive[2] }</td>
   		<td nowrap="nowrap"><a href="javascript:gotodelete('<%=path %>/bbs.do?methede=deleteInteractive&oid=${interactive[0]}')" >删除</a></td>
   		</tr>
   		</c:forEach>
   		<tr bgcolor="EEEEEE"><td colspan="6"><div align="center"><a id="LtotalSY" href="javascript:gotopage('first','0')" class="right-font08">首页</a>&nbsp;&nbsp;<a id="LtotalSYY" href="javascript:gotopage('previous','0')" class="right-font08">上一页</a>&nbsp;&nbsp;<a id="LtotalXYY" href="javascript:gotopage('next','0')" class="right-font08">下一页</a>&nbsp;&nbsp;<a id="LtotalMY" href="javascript:gotopage('last','0')" class="right-font08">末页</a>&nbsp;&nbsp;<input type="text" name="yeshu" id="yeshu" maxlength="5" style="width: 45px;" value="${pageParm.nowpage }" onkeyup="value=value.replace(/[^\d]/g,'') "  onbeforepaste="clipboardData.setData" >页&nbsp;&nbsp;<input type="button" value="GO" onclick="gotopage('tiaozhuan','0')"></div>
                <div align="center">
                  <p>共${pageParm.total }条 ${pageParm.nowpage }/${pageParm.totalpage }页</p>
                  
            </div></td></tr>
        </table></td></tr>
         <c:if test="${empty listinteractive}">
            <tr align="center"><td><font style="padding-top: 5px;font-size: 14px;font-family: '新宋';">没有已发信息</font> </td></tr>
            </c:if>
        </table></td></tr></table>
        </td></tr></table>
        
        
   </td></tr>
   </table>

        </form>  
</body>
</html>
