<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>${bbs_params.bbs_name }-发送信息</title>
<link href="<%=path %>/css/backstage/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function tj(){
	var title=document.getElementById("title");
	var reg=/^\s+$/;
	if(title.value==""||reg.test(title.value))
	{ 
	  alert("请输入标题");
	  title.focus();
	  title.value="";
	}else{
	alert("发送成功");
	document.getElementById('doing').style.display='block';
	document.form.submit();
	}
	}
	
	function goto(str)
{
  document.forms[0].action=str;
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}
	</script>
  
       <body class="ContentBody">
        <jsp:include page="/common/doing.jsp" />
		<form name="form" action="<%=path %>/bbs.do?methede=send" method="post" >
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
   <a href="javascript:goto('<%=path %>/bbs.do?methede=listSend')"><img src="<%=path %>/images/front/bbs/outboxpm.gif" border="0" style="vertical-align: middle;"/></a>
   <img src="<%=path %>/images/front/bbs/newpm2.gif" border="0" style="vertical-align: middle;"/>
   <img src="<%=path %>/images/front/bbs/friendpm.gif" border="0" style="vertical-align: middle;"/>
   </td></tr>
   <tr><td align="center">
		
		
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center" class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							
						</th>
					</tr>
					<tr>
						<td colspan="3" class="tr2" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									写信息
								</legend>

								<table width="850px" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											收件人：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="receiver" name="receiver" style="width: 600px;" value="${receivername }" readonly="readonly">
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right" >
											标题：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="title" name="title" style="width: 600px;" />
                                          &nbsp;&nbsp;
                                          <font color="red">*</font>
										
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right" valign="top">
											内容：
										</td>
										<td style="padding-top: 8px;">
											<textarea rows="" cols="" id="content" name="content" style="width: 600px;height: 300px;"></textarea>
										</td>
									</tr>
								
								</table>
								<br>
							</fieldset>
						</td>
					</tr>
					<tr style="font-size: 14px;">

						<td style="padding-top: 5px;" align="center">
							<input type="button" name="sub" value="发送" class="button" style="height: 25px;" onClick="tj()" />

							<input type="reset" name="reset" value="重置" class="button"
								style="height: 25px;">

						</td>
					</tr>
				</table>
				<br>
			</div>
			
			</td></tr></table>
		</form>
	</body>
</html>
