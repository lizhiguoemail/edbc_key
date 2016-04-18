<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
 <title>艺术考古数字博物馆-修改资料</title>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
	#newPreview
{
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
}
-->
</style>
<script type="text/javascript" src="<%=path %>/js/front/web/PopupCalendarForReg.js" ></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type='text/javascript' src='dwr/interface/userdao.js'></script>
<script >
var oCalendarEn=new PopupCalendar("oCalendarEn");	//初始化控件时,请给出实例名称如:oCalendarEn
oCalendarEn.Init();
var oCalendarChs=new PopupCalendar("oCalendarChs");	//初始化控件时,请给出实例名称:oCalendarChs
oCalendarChs.weekDaySting=new Array("日","一","二","三","四","五","六");
oCalendarChs.monthSting=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
oCalendarChs.oBtnTodayTitle="今天";
oCalendarChs.oBtnCancelTitle="取消";
oCalendarChs.Init();
</script>

<script language="JavaScript" type="text/JavaScript">
	       function Check()
	       {
	         var form=document.forms['userform'];
	         var reg=/^\s+$/;
	 		
			if (form.password.value != form.password2.value) 
			{
			    window.alert ("您的确认密码输入错误，请从新输入密码！");
			    form.password.value='';
				form.password2.value='';
				form.password.focus();
			    return false;
		   }
		    if(isNaN(form.mobile.value))
		   {
	           alert('手机号只能为数字！');
	           form.mobile.focus();
	           return false;
	       } 
		   if(isNaN(form.qq.value))
		   {
	           alert('QQ号只能为数字！');
	           form.qq.focus();
	           return false;
	       } 
	       
	        if(form.email.value=="")
		 	{
		 		alert("请输入email");
		 		document.form.email.focus();
		 		return false;
	       }
	       
		   if(form.email.value!="")
		 	{
		 	 var filter=/^.+@.+\..{2,3}$/ 
		 	 if (!filter.test(form.email.value))
		 	  {
		 		alert("请输入正确的email用户名");
		 		document.form.email.focus();
		 		return false;
		       }
	       }
	     
	       document.forms['userform'].action="<%=path %>/museum.do?methede=updateUser";
	       document.getElementById('doing').style.display='block';
	       document.forms['userform'].submit();
	 	  }
	 	  
	 	  
     
	        function PreviewImg(imgFile)
	       {
	           //新的预览代码，支持 IE6、IE7。
	           var newPreview = document.getElementById("newPreview");
	           var ischange=document.getElementById("ischange");
	           ischange.value="1";
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value;
	           newPreview.style.width = "80px";
	           newPreview.style.height = "60px";
	       }
	       
	       function selcdp()
	       {
	          document.forms['userform'].action="<%=path %>/user.do?methede=selcdp";
	          document.getElementById('doing').style.display='block';
	          document.forms['userform'].submit();
	       }
	       
	       function goto(str)
	       {
	           document.forms['userform'].action=str;
	           document.getElementById('doing').style.display='block';
	           document.forms['userform'].submit();
	       }
	</script>
</head>

<body>
<jsp:include page="common/top.jsp"/> 
<jsp:include page="common/doing.jsp" /> 
 <form id="userform" name="userform" action="<%=path %>/front.do?methede=regUser" method="post" enctype="multipart/form-data" >
 <input type="hidden" name="auditstatus" value="1"/>
  <input type="hidden" name="category" value="museum"/>
  <input type="hidden" name="ischange" value="0"/>
 <input type="hidden" name="id" value="${userinfo.id }"/>
  <input type="hidden" name="username" value="${userinfo.username }"/>
   <input type="hidden" name="nickname" value="${userinfo.nickname }"/>
 <div class="mid">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="656">
      <tr>
        <td width="100%" style="background:#FFF url(<%=path %>/images/front/web/images/login.jpg) no-repeat 0 top;" valign="top">
        <div class="zhanpin_center"></div>
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
          <tr>
            <td height="46" valign="top" style="padding:0 0 0 225px;">
              <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                  <td height="25" align="right">用户名：</td>
                  <td height="25"><label>
                   ${userinfo.username }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${msg }  </font> 
                 </label></td>
                </tr>
                 <tr>
                  <td height="25" align="right">昵称：</td>
                  <td height="25">${userinfo.nickname }</td>
                </tr>
                <tr>
                  <td height="25" align="right">修改密码：</td>
                  <td height="25"><input type="password" id="password" name="password"  />
                    </td>
                </tr>
                <tr>
                  <td height="25" align="right">确认修改密码：</td>
                  <td height="25"><input type="password" id="password2" name="password2"  />
                    </td>
                </tr>
               
                <tr>
                  <td height="25" align="right">真实姓名：</td>
                  <td height="25"><input type="text" id="tname" name="tname" value="${userinfo.tname }" />
                    </td>
                </tr>
                <tr>
                  <td height="25" align="right">性别：</td>
                  <td height="25"><label>
                  <input type="radio" id="sex_1" name="sex" value="男" <c:if test="${'女' ne userinfo.sex }">checked="checked"</c:if> />男
				  <input type="radio" id="sex_0" name="sex" value="女" <c:if test="${'女' eq userinfo.sex }">checked="checked"</c:if> />女
                  </label></td>
                </tr>
                <tr>
                  <td height="25" align="right">出生年月：</td>
                  <td height="25"><input type="text" name="birthday" value="${userinfo.birthday }" onClick="getDateString(this,oCalendarChs)"  value="${userbean.birthday }" /></td>
                </tr>
                <tr>
                  <td height="25" align="right">个人照片：</td>
                  <td height="25"> <label>
              <input type="hidden" name="picture" value="${userinfo.picture }"/>
											<div id="newPreview">
											<c:if test="${userinfo.picture==null}">
											&nbsp;&nbsp;<font color="red">暂无照片</font>
											</c:if>
											<c:if test="${userinfo.picture!=null}">
											&nbsp;&nbsp;<img src="<%=path%>/memberFace/${userinfo.picture }" height="80" width="100"/>
											</c:if>
											</div>
											&nbsp;&nbsp;<input type="file" onChange="JavaScript:PreviewImg(this);" size="60" id="myfile" name="myfile"/>
              </label></td>
                </tr>
                <tr>
                  <td height="25" align="right">手机号：</td>
                  <td height="25"><input type="text" id="mobile" name="mobile" value="${userinfo.mobile }" /></td>
                </tr>
                <tr>
                  <td height="25" align="right">QQ号：</td>
                  <td height="25"><input type="text" id="qq" name="qq" value="${userinfo.qq }" /></td>
                </tr>
                <tr>
                  <td height="25" align="right">邮箱：</td>
                  <td height="25"><input type="text" id="email" name="email" value="${userinfo.email }" />&nbsp;(必填)</td>
                </tr>
                <tr>
                  <td height="25" align="right">个人说明：</td>
                  <td height="25"><label>
                    <textarea  name="ownsigned" id="textarea" cols="45" rows="5" style="width:200px">${userinfo.ownsigned }</textarea>
                  </label></td>
                </tr>
                <tr>
                  <td height="25" align="right">&nbsp;</td>
                  <td height="25"><label>
                    <input type="button" name="button" id="button" value=""   onclick="Check();" style="background:url(<%=path %>/images/front/web/images/sub.gif) no-repeat; width:62px; height:25px; border:none; cursor:hand;"/>
                    <input type="reset" name="button2" id="button2" value=""  style="background:url(<%=path %>/images/front/web/images/copy.gif) no-repeat; width:62px; height:25px; border:none; cursor:hand;"/>
                  </label></td>
                </tr>
              </table>
           </td>
          </tr>
        </table></td>
      </tr>
  </table>
  </div>
</form>
  <jsp:include page="common/bottom.jsp"/>
</body>
</html>
