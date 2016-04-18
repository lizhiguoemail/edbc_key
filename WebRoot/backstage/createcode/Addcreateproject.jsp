<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>生成edbc扩展项目</title>
		<link rel="stylesheet" href="<%=path %>/css/backstage/style.css" type="text/css" />
		<script type="text/javascript">
		function add()
		{
		  var projectname=document.getElementById('projectname');
		  if(projectname.value=='')
		  {
		   alert('请输入项目名称');
		   return;
		  }
		  document.getElementById('doing').style.display='block';
		  document.forms[0].submit();
		}
		function goto(str)
		{
		  document.forms[0].action=str;
		  document.getElementById('doing').style.display='block';
		  document.forms[0].submit();
		}
		</script>
	</head>
	<body class="ContentBody">
	 <jsp:include page="/common/doing.jsp" /> 
		<form   action="<%=path %>/createcode.do?methede=createProject" method="post" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr><td height="62" background="<%=path %>/images/backstage/nav04.gif" > </td></tr></table> 
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center" class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							生成edbc扩展项目
						</th>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									生成edbc扩展项目
								</legend>
								<table border="0" style="width: 850px;font-size: 12px;" align="center" cellpadding="0" cellspacing="0" >
								 <tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											项目名称：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="projectname" name="projectname" value="${projectname }" style="width: 200px;">  <font color="green">系统会自动增加前缀，例如：名称输入aaa，项目名则为edbc_aaa</font>
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											作者：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="author" name="author" value="${author }" style="width: 200px;"> <font color="green">(例如：caihuajun ，如不写作者默认为caihuajun)</font>
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											版本号：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="edition" name="edition" value="${edition }" style="width: 200px;"> <font color="green">(例如：v1.0 ，如不写版本默认为v1.0)</font>
										</td>
									</tr>
									</table>
								<br>
							</fieldset>
						</td>
					</tr>
					<tr style="font-size: 14px;">
						<td style="padding-top: 5px;" align="center">
							<input type="button" name="sub" value="开始生成" class="button" style="height: 25px;" onClick="add()" />
						</td>
					</tr>
				</table>
				<br>
			</div>
		</form>
	</body>
</html>

