<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html> 
	<head>
		<title>用户登录</title>
		<link href="<%=path %>/css/backstage/backstage.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function login(){
				document.getElementById('doing').style.display='block';
				document.forms[0].submit();
			}
			function gotoreg(){
				window.location.href="<%=path%>/user.do?methede=toregEXT";
			}
		</script>
    </head>
    <body id="shenti">
     <jsp:include page="/common/doing.jsp" />
	<form action="<%=path %>/user.do?methede=login" method="post">
	<div style="background: #FBFCFE;width:570px;height:557px;margin-top:103px;">
		<table align="center" style="font-size: 14px;" >
		<tr><td colspan="2" align="left" background="red" style="width: 570px;"><img src="<%=path %>/images/backstage/login_bg2.jpg" style="border: 0px;"/></td></tr>
		<tr><td colspan="2" align="center"><font style="color: red;font-size: 12px;font-weight: bold;">${msg }</font></td></tr>	
			<tr>
				<td style="padding-top: 10px;width: 150px;" align="right"><b>用户名: </b></td><td style="padding-top: 10px;" align="left"><input type="text" id="username" name="username" style="width: 200px;"> </td>
			</tr>
			<tr>	
				<td style="padding-top: 10px;width: 150px;" align="right" valign="top"><b>密 码:</b></td><td  style="padding-top: 10px;" align="left"><input type="password" id="password" name="password" style="width: 200px;"></td>
			</tr>
			<tr>	
				<td style="padding-top: 10px;width: 150px;" align="right" valign="middle"><b>验证码:</b></td>
				<td  style="padding-top: 10px;" align="left">
					<script type='text/javascript'>
						var YXM_PUBLIC_KEY = '865d84ec546f08412eeb00c5a5406575';//这里填写PUBLIC_KEY
						document.write("<input type='hidden' id='YXM_here' /><script type='text/javascript' charset='gbk' id='YXM_script' async src='http://api.yinxiangma.com/api2/yzm.yinxiangma.php?pk="+YXM_PUBLIC_KEY+"&v=YinXiangMaJsSDK_1.0'><"+"/script>");
						function YXM_valided_true()
						{
							//验证码输入正确后的操作
							document.getElementById("YXM_submit_btn").disabled="";	
						}
						function YXM_valided_false()
						{
							//验证码输入错误后的操作
							document.getElementById("YXM_submit_btn").disabled="disabled";	
						}
						</script>
				</td>
			</tr>
			<tr>	
				<td style="padding-top: 10px;width: 570px;"  valign="top" colspan="2" align="center">
					<input id="YXM_submit_btn" disabled="disabled" value="登录" type="button" style="width: 80px;" onclick="login()">
					&nbsp;&nbsp;
					<input type="button" value="注册" style="width: 80px;" onclick="gotoreg()">
				</td>
			</tr>
		</table>
		</div>	
		</form>
    </body>
    <script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>
