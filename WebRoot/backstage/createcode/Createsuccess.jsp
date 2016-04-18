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
		<title>代码生成器</title>
		<link rel="stylesheet" href="<%=path %>/css/backstage/style.css" type="text/css" />
		<script type="text/javascript">
		function goto(str)
		{
		  window.location.href=str;
		}
		function gotonew(str)
		{
		  window.open(str);
		}
		</script>
	</head>
	<body class="ContentBody">
	 <jsp:include page="/common/doing.jsp" /> 
		<form   action="<%=path %>/createcode.do?methede=createCode" method="post" >
		<input type="hidden" name="nowpage" id="nowpage" value="${nowpage }"/>
        <input type="hidden" name="gotopagetype" id="gotopagetype" value="${gotopagetype }"/>
        <input type="hidden" name="gotopageString" id="gotopageString" value="${gotopageString }"/>
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center" class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							代码生成器
						</th>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									代码生成器
								</legend>
								<div align="center"><font color="blue" style="font-size: 12px;">代码生成成功，点击以下链接可直接查看源代码</font></div>
								<table border="1" style="width: 550px;font-size: 12px;" align="center" cellpadding="0" cellspacing="0" bordercolor="gray">
								 <tr>
								       <td rowspan="2" align="center">POJO</td>
										<td align="center" nowrap="nowrap" style="height: 40px;vertical-align: middle;">
											<a href="<%=path %>/createcode/${class_name }/pojo/${class_name }.java" target="_blank" style="color: green;">点击查看 ${class_name }.java 的源代码</a>
										</td>
									</tr>
									 <tr>
										<td style="height: 40px;vertical-align: middle;" align="center" nowrap="nowrap">
											<a href="<%=path %>/createcode/${class_name }/pojo/${class_name }.hbm.xml" target="_blank" style="color: green;">点击查看 ${class_name }.hbm.xml 的源代码</a>
										</td>
									</tr>
									 <tr>
									   <td  align="center">FORMBEAN</td>
										<td style="height: 40px;vertical-align: middle;" align="center" nowrap="nowrap">
											<a href="<%=path %>/createcode/${class_name }/formBean/${class_name }Form.java" target="_blank" style="color: green;">点击查看 ${class_name }.Form 的源代码</a>
										</td>
									</tr>
									 <tr>
									  <td  align="center">INTERDAO</td>
										<td style="height: 40px;vertical-align: middle;" align="center" nowrap="nowrap">
											<a href="<%=path %>/createcode/${class_name }/interDao/I${class_name }Dao.java" target="_blank" style="color: green;">点击查看 I${class_name }Dao.java 的源代码</a>
										</td>
									</tr>
									 <tr>
									 <td  align="center">DAO</td>
										<td style="height: 40px;vertical-align: middle;" align="center" nowrap="nowrap">
											<a href="<%=path %>/createcode/${class_name }/dao/${class_name }Dao.java" target="_blank" style="color: green;">点击查看 ${class_name }Dao.java 的源代码</a>
										</td>
									</tr>
									 <tr>
									  <td  align="center">ACTION</td>
										<td style="height: 40px;vertical-align: middle;" align="center" nowrap="nowrap">
											<a href="<%=path %>/createcode/${class_name }/action/${class_name }Action.java" target="_blank" style="color: green;">点击查看 ${class_name }Action.java 的源代码</a>
										</td>
									</tr>
									 <tr >
									  <td  align="center">CONFIG</td>
										<td style="height: 40px;vertical-align: middle;" align="center" nowrap="nowrap">
											<a href="<%=path %>/createcode/${class_name }/config/${class_name }config.txt" target="_blank" style="color: green;">点击查看其它配置 ${class_name }config.txt 的内容</a>
										</td>
									</tr>
					<tr style="font-size: 14px;">
						<td style="padding-top: 5px;" align="center" colspan="2">
						    <input type="button" name="sub" value="下载源代码包(${class_name }.zip)" class="button" style="height: 25px;" onClick="gotonew('<%=path %>/createcode/${class_name }.zip')" />
							<input type="button" name="sub" value="继续生成" class="button" style="height: 25px;" onClick="goto('<%=path %>/createcode.do?methede=toCreateCode')" />
						</td>
					</tr>
				</table>
				<br></fieldset></td></tr></table></div></form>
	</body>
</html>

