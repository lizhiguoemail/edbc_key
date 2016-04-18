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
		<title>${bbs_params.bbs_name }-查看用户资料</title>
		<link rel="stylesheet" href="<%=path %>/css/backstage/style.css" type="text/css" />
				<style type="text/css">
<!--
	#newPreview
{
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
}
-->
</style>
		<script type="text/javascript" src="<%=path %>/js/PopupCalendar.js"></script>
		 <script type='text/javascript' src='dwr/engine.js'></script>
		 <script type='text/javascript' src='dwr/util.js'></script>
		 <script type='text/javascript' src='dwr/interface/userdao.js'></script>
		<script>
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
	       document.forms['userform'].action="<%=path %>/user.do?methede=updateUser";
	        document.getElementById('doing').style.display='block';
	       document.forms['userform'].submit();
	 	  }
	 	  
	       function PreviewImg(imgFile)
	       {
	           //新的预览代码，支持 IE6、IE7。
	           var newPreview = document.getElementById("newPreview");
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value;
	           newPreview.style.width = "80px";
	           newPreview.style.height = "60px";
	       }
	       
	       function goto(str)
	       {
	        document.forms['userform'].action=str;
	         document.getElementById('doing').style.display='block';
	        document.forms['userform'].submit();
	       }
	       
	        function selcdp()
	       {
	          document.forms['userform'].action="<%=path %>/user.do?methede=selcdp&ctype=1";
	          document.getElementById('doing').style.display='block';
	          document.forms['userform'].submit();
	         
	       }
	</script>
	</head>
	<body class="ContentBody">
	  <jsp:include page="/common/doing.jsp" /> 
		<form  name="userform" action="<%=path %>/user.do?methede=updateUser" method="post" enctype="multipart/form-data" onsubmit="return formSubmit(this)">
		<input type="hidden" name="id" id="id" value="${userbean.id }"/>
		<input type="hidden" name="username" id="id" value="${userbean.username }"/>
		<input type="hidden" name="isbbs" id="isbbs" value="1"/>
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center" class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							查看用户资料
						</th>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									查看用户资料
								</legend>
								<table border="0" style="width: 850px;" align="center" cellpadding="0" cellspacing="0" >
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											呢称：
										</td>
										<td style="padding-top: 8px;">
											${userbean.nickname }
										</td>
										<td style="padding-top: 8px;" align="right">
											真实姓名：
										</td>
										<td style="padding-top: 8px;">
											${userbean.tname }
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											性别：
										</td>
										<td style="padding-top: 8px;">
										${userbean.sex }
										</td>
										<td style="padding-top: 8px;" align="right">
											出身年月：
										</td>
										<td style="padding-top: 8px;">	
											${userbean.birthday }
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											级别：
										</td>
										<td style="padding-top: 8px;">
										${userbean.bbs_rank }
										</td>
										<td style="padding-top: 8px;" align="right">
											魅力：
										</td>
										<td style="padding-top: 8px;">	
											${userbean.bbs_charm }
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											金币：
										</td>
										<td style="padding-top: 8px;">
										${userbean.bbs_gold }
										</td>
										<td style="padding-top: 8px;" align="right">
											发帖数：
										</td>
										<td style="padding-top: 8px;">	
											${userbean.bbs_postnum }
										</td>
									</tr>
									<tr style="font-size: 14px;">
									<td style="padding-top: 8px;" align="right">
											手机号：
										</td>
										<td style="padding-top: 8px;">
											${userbean.mobile }
										</td>
										<td style="padding-top: 8px;" align="right">
											QQ号：
										</td>
										<td style="padding-top: 8px;">
											${userbean.qq }
										</td>
										
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											注册时间：
										</td>
										<td style="padding-top: 8px;" colspan="3">
										${userbean.regdate }
										</td>
										
									</tr>
									<tr style="font-size: 14px;">
									<td style="padding-top: 8px;" align="right">
											邮箱地址：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											${userbean.email }
										</td>
										</tr>
									<tr style="font-size: 14px;">
									<td style="padding-top: 8px;" align="right">
											家庭地址：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											${userbean.homeaddress }
										</td>
										</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											个性签名：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											<textarea name="ownsigned" rows="5"  style="width: 450px;" readonly="readonly">${userbean.ownsigned }</textarea>
										</td>
									</tr>
								<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											个人照片：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											<input type="hidden" name="picture" value="${userbean.picture }">
											<div id="newPreview">
											<c:if test="${userinfo.picture==null}">
											&nbsp;&nbsp;<font color="red">暂无照片</font>
											</c:if>
											<c:if test="${userinfo.picture!=null}">
											&nbsp;&nbsp;<img src="<%=path%>/memberFace/${userbean.picture }" height="80" width="100">
											</c:if>
											</div>
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="center" colspan="4">
										<input type="button" onclick="window.close();" value="关闭本窗口">
										</td>
									</tr>
								</table>
								<br>
							</fieldset>
						</td>
					</tr>
				</table>
				<br>
			</div>
		</form>
	</body>
</html>

