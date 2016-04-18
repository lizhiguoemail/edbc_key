<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%      
  response.setHeader("Cache-Control",   "Public");      
  response.setHeader("Pragma",   "no-cache");      
  response.setDateHeader("Expires",   0);      
%>
<html>
	<head>
		<title>${bbs_params.bbs_name }-回复信息</title>
		<link href="<%=path %>/css/backstage/style.css" rel="stylesheet" type="text/css" />
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
	alert("回复成功");
	 document.getElementById('doing').style.display='block';
	 document.form.submit();
	}
	}
	function goto(str)
{
 document.getElementById('doing').style.display='block';
 document.forms[0].action=str;
 document.forms[0].submit();
}
	</script>
	</head>
	<body class="ContentBody">
	 <jsp:include page="/common/doing.jsp" />
		<form name="form" action="<%=path %>/bbs.do?methede=reply" method="post" >
			<input type="hidden" id="receiver" name="receiver" value="${interactive.sender }">
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
   <a href="javascript:goto('<%=path %>/bbs.do?methede=toSend')"><img src="<%=path %>/images/front/bbs/newpm.gif" border="0" style="vertical-align: middle;"/></a>
   <img src="<%=path %>/images/front/bbs/friendpm.gif" border="0" style="vertical-align: middle;"/>
   </td></tr>
   <tr><td align="center">
			
			
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center"
					class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							
						</th>
					</tr>
					<tr>
						<td colspan="3" class="tr2" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									回复信息
								</legend>

								<table width="850px" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size: 12px;">
									<tr class="t_pad" >
										<td style="padding-top: 8px;" align="right">
											收件人：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="rreceiver" name="rreceiver" style="width: 600px;" value="${interactive.sender }" disabled="disabled">
											&nbsp;&nbsp;
											<font color="red">*</font>
										</td>
									</tr>
									<tr>
										<td style="padding-top: 8px;" align="right" >
											标题：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="title" name="title" readonly="readonly" style="width: 600px;" <c:if test="${interactive.isReply=='1' }">value="${interactive.title }"</c:if> <c:if test="${interactive.isReply=='0' }">value="回复：${interactive.title }"</c:if>>
                                          &nbsp;&nbsp;
                                          <font color="red">*</font>
										
										</td>
									</tr>
									<tr>
										<td style="padding-top: 8px;" align="right" valign="top">
											原内容：
										</td>
										<td style="padding-top: 8px;">
											<textarea rows="" cols="" id="contentold" name="contentold" style="width: 600px;height: 100px;" readonly="readonly">${interactive.content }</textarea>
										</td>
									</tr>
									<tr >
										<td style="padding-top: 8px;" align="right" valign="top">
											内容：
										</td>
										<td style="padding-top: 8px;">
											<textarea rows="" cols="" id="newcontent" name="newcontent" style="width: 600px;height: 250px;"></textarea>
										</td>
									</tr>
								
								</table>
								<br>
							</fieldset>
						</td>
					</tr>
					<tr >

						<td style="padding-top: 5px;" align="center">
							<input type="button" name="sub" value="发送" class="button"
								style="height: 25px;" onClick="tj()" />

							<input type="reset" name="reset" value="返回" class="button"
								style="height: 25px;" onclick="javascript:history.go(-1);">


						</td>
					</tr>
				</table>
				<br>
			</div>
			
			</td></tr></table>
		</form>
	</body>
</html>

