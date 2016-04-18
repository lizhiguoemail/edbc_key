<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html> 
	<head>
		<title>${bbs_params.bbs_name }-用户登录</title>
		<link href="<%=path %>/css/backstage/backstage.css" rel="stylesheet" type="text/css" />
		 <script type="text/javascript">
		   function reg()
		    {
		       window.location.href='<%=path%>/user.do?methede=toreg';
		    }
		    
		    function denglu()
			{
			   var username=document.getElementById("username").value;
			   var userpwd=document.getElementById("password").value;
			   if(username==null||username=='')
			     {
			      alert('请输入用户名');
			      return;
			     }
			   if(userpwd==null||userpwd=='')
		     	 {
			      alert('请输入密码');
			      return;
			     }
			     document.getElementById('doing').style.display='block';
			     document.forms[0].submit();
			}
			
			function keydenglu()
			{
				if (event.keyCode == 13) 
		          {  
		            event.returnValue=false; 
		            event.cancel = true;
		            denglu();
		        }  
			}
		 </script>
	</head>
	<body  onkeydown="javascript:keydenglu()">
	 <jsp:include page="/common/doing.jsp" /> 
	<form action="<%=path %>/bbs.do?methede=login" method="post">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	   <tr><td></td><td colspan="2" height="30px;"><font color="red" style="font-size: 12px;">${message }</font></td></tr>
	    <tr>
	      <td width="24%" height="40" align="right"><font style="font-size: 12px;">用户名：</font></td>
	      <td width="76%" height="40"><input name="username" id="username" type="text"  class="login_input" value="${username }"/></td>
        </tr>
	    <tr>
	      <td height="40" class="pwd" align="right"><font style="font-size: 12px;">密码：</font></td>
	      <td height="40"><input type="password" name="password" id="password" class="login_input" value="${password }"/></td>
        </tr>
        <tr>
        <td height="40" align="right">验证码：</td>
        <td height="40"><input id="yanzhengma" name="yanzhengma"  value="${yanzhengma }"  style="width: 50px;vertical-align: middle;"/>
      <img id="yzimg" src="<%=path %>/ValidateCodeServlet" onclick="this.src='<%=path %>/ValidateCodeServlet?t='+(new Date()).getTime();''" style="vertical-align: middle;"></img></td>
	    <tr>
	      <td height="40">&nbsp;</td>
	      <td height="40"><input onclick="denglu()" type="button" style="cursor: hand;" class="login_button"/><input type="reset" style="cursor: hand;" class="login_button login_button1" value="取消"/><input type="button" style="cursor: hand;" name="zhuce" onclick="reg()" class="login_button login_button1" value="注册"/></td>
        </tr>
      </table>
</form>
</body>
</html>