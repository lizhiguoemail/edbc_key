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
		<title>${bbs_params.bbs_name }-修改密码</title>
		<link rel="stylesheet" href="<%=path %>/css/backstage/style.css" type="text/css" />
		 <script type='text/javascript' src='dwr/engine.js'></script>
		 <script type='text/javascript' src='dwr/util.js'></script>
		 <script type='text/javascript' src='dwr/interface/userdao.js'></script>
		<script language="javascript" type="text/javascript">
		function updatepwd()
		{
		  var passwordold=document.getElementById("passwordold");
		  var password=document.getElementById("password");
		  var password2=document.getElementById("password2");
		  var reg=/^\s+$/;
	      if (passwordold.value == ""||reg.test(passwordold.value)) 
	         {
				alert("请输入原密码");
				passwordold.focus();
				return;
			}
			if (password.value == ""||reg.test(password.value)) 
	         {
				alert("新密码不能为空");
				password.focus();
				return;
			}
			if (password.value.length < 6 || password.value.length > 12  ) 
			{
			    window.alert ("密码长度须在6-12位之间")
				password.value='';
				password.focus();
		        return;
	        }
	        if (password2.value == ""||reg.test(password2.value)) 
			{
				alert("确认密码不能为空");
				password2.focus();
				return;
			}
			if (password.value!=password2.value)
			{
			    window.alert ("您的确认密码输入错误，请从新输入密码");
			    password.value='';
				password2.value='';
				password.focus();
			    return;
		   }
		    userdao.checkPwd('${userinfo.username}',passwordold.value,checkback);
		}
		
	   function checkback(date) {
           if(date==false)
             {
               alert('原密码错误');
               return;
		     }
		  if(date==true)
		    {
		       document.forms[0].action="<%=path %>/user.do?methede=updateUserpwd";
		        document.getElementById('doing').style.display='block';
		       document.forms[0].submit();
		    }
       }
        function goto(str)
	       {
	        document.forms['userform'].action=str;
	         document.getElementById('doing').style.display='block';
	        document.forms['userform'].submit();
	       }
	</script>
	</head>
	<body >
	 <jsp:include page="/common/doing.jsp" /> 
		<form  name="userform" action="<%=path %>/user.do?methede=updateUserpwd" method="post">
		<input type="hidden" id="oid" name="oid" value="${userbean.id }">
		<input type="hidden" id="ismy" name="oid" value="${ismy }">
		<input type="hidden" name="isbbs" id="isbbs" value="1"/>
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center" class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							用户密码修改
						</th>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									用户密码修改
								</legend>
								<table border="0" style="width: 850px;" align="center" cellpadding="0" cellspacing="0" >
								<tr><td colspan="2" align="center" style="padding-bottom:  18px;">
								<font color="green">${msg }</font>
								</td></tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											原密码：
										</td>
										<td style="padding-top: 8px;padding-right: 20px;" nowrap="nowrap">
											<input type="password" id="passwordold" name="passwordold" style="width: 155px;">&nbsp;&nbsp;
											<font color="red">*&nbsp;&nbsp;必填</font>
										</td>
										</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											新密码：
										</td>
										<td style="padding-top: 8px;padding-right: 20px;" nowrap="nowrap">
											<input type="password" id="password" name="password" style="width: 155px;">&nbsp;&nbsp;
											<font color="red">*&nbsp;&nbsp;必填，长度在6~12位之间</font>
										</td>
										</tr>
										<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right" nowrap="nowrap">
											确认密码：
										</td>
										<td style="padding-top: 8px;">
											<input type="password" id="password2" name="password2" style="width: 155px;">&nbsp;&nbsp;
											<font color="red">*</font>
										</td>
								</table>
								<br>
							</fieldset>
						</td>
					</tr>
					<tr style="font-size: 14px;">
						<td style="padding-top: 5px;" align="center">
							<input type="button" name="sub" value="修改" class="button" style="height: 25px;" onClick="updatepwd();" />
							<c:if test="${'1' ne ismy}">
							<input type="button" name="back" value="返回" class="button" style="height: 25px;" onclick="goto('<%=path %>/bbs.do?methede=toBbs')">
							</c:if>
						</td>
					</tr>
				</table>
				<br>
			</div>
		</form>
	</body>
</html>

