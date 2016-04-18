<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

function goto(str)
{
  window.location.href=str;
}
function pgoto(str)
{
  window.parent.window.location.href=str;
}
function tijiao()
{
   var username=document.getElementById("username");
   var password=document.getElementById("password");
   var yanzhengma=document.getElementById("yanzhengma");
   if(username.value=='')
   {
     alert("请输入用户名");
     return;
   }
    if(password.value=='')
   {
     alert("请输入密码");
     return;
   }
    if(yanzhengma.value=='')
   {
     alert("请输入验证码");
     return;
   }
   document.forms[0].submit();
}
</script>
  </head>
  
  <body>
  <form action="<%=path %>/museum.do?methede=login" name="loginform" method="post">
                <ul>
                    <li class="yq_l"><img src="<%=path %>/images/front/web/images/titile.GIF" width="13" height="15" style="vertical-align:middle" />&nbsp;<font style="vertical-align: middle;">博物馆用户</font></li>
                    <li class="yq_2">
                   <table>
                    <c:if test="${empty userinfo}">
                    <tr><td colspan="2" align="center"><font style="font-size: 12px;color: red;">${message }</font></td></tr>
                   <tr><td>用户名：</td><td><input type="text" id="username" name="username" value="${username }" style="width: 120px;"/></td></tr>
                   <tr><td>密码：</td><td><input type="password" id="password" name="password" style="width: 120px;"/></td></tr>
                   <tr><td>验证码：</td><td><input type="text" id="yanzhengma" name="yanzhengma" value="${yanzhengma }" style="width: 50px;"/> <img id="yzimg" src="<%=path %>/ValidateCodeServlet" onclick="this.src='<%=path %>/ValidateCodeServlet?t='+(new Date()).getTime();''" style="vertical-align: middle;"></img></td></tr>
                   <tr><td colspan="2"  style="padding-top: 10px;padding-left: 40px;"><input type="button" value="登录" style="background-color: #968A6F;height:25px;width: 50px;color: #DBD1BC;border: 0;cursor: hand;" onclick="tijiao()"/><input type="button" value="注册" onclick="pgoto('<%=path %>/front.do?methede=toReg')" style="background-color: #968A6F;height:25px;width: 50px;margin-left: 20px;color: #DBD1BC;border: 0;cursor: hand;"/></td></tr>
                   </c:if>
                  <c:if test="${not empty userinfo}">
     			 <tr><td colspan="2" style="padding-left: 10px;">
     			 <c:if test="${empty userinfo.picture }">
     			  <c:if test="${userinfo.sex ne '女'}">
     			   <img src="<%=path %>/memberFace/kopf01.gif" style="width: 70px;height: 70px;"/><br/>
     			  </c:if>
     			 <c:if test="${userinfo.sex eq '女'}">
     			  <img src="<%=path %>/memberFace/kopf04.gif" style="width: 70px;height: 70px;"/><br/>
     			  </c:if>
     			 </c:if>
     			 <c:if test="${not empty userinfo.picture }">
     			  <img src="<%=path %>/memberFace/${userinfo.picture }" style="width: 80px;height: 80px;"/><br/>
     			 </c:if>
                 <font  style="font-size: 12px; font-family: sans-serif;">呢称：${userinfo.nickname}</font><br/>
                  <input type="button" value="修改资料" onclick="pgoto('<%=path %>/museum.do?methede=toUpdateUser')" style="background-color: #968A6F;width:70px;margin-top:5px;border: 0;cursor: hand;font-size: 12px;color: #DBD1BC;"/>
                 <input type="button" value="注销" onclick="goto('<%=path %>/museum.do?methede=loginout')" style="background-color: #968A6F;width: 50px;margin-left: 5px;margin-top:5px;border: 0;cursor: hand;font-size: 12px;color: #DBD1BC;"/>
                  </td></tr>
			      </c:if>
                   </table>
                    </li>
                </ul>
   </form>
  </body>
</html>
