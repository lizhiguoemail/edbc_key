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
		<title>${bbs_params.bbs_name }-修改个人信息</title>
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
							修改用户页面
						</th>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									修改用户
								</legend>
								<table border="0" style="width: 850px;" align="center" cellpadding="0" cellspacing="0" >
								<tr><td colspan="4" align="center" style="padding-bottom:  18px;"><font color="green">${msg }</font></td></tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;" align="center" nowrap="nowrap" colspan="4">
											<font color="red" style="font-weight: bold;">用户名：${userbean.username }</font>
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											呢称：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="nickname" name="nickname" value="${userbean.nickname }">
										</td>
										<td style="padding-top: 8px;" align="right">
											真实姓名：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="tname" name="tname" value="${userbean.tname }">
										</td>
									</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											性别：
										</td>
										<td style="padding-top: 8px;">
											<input type="radio" id="sex_1" name="sex" value="男" <c:if test="${'男' eq userbean.sex }">checked="checked"</c:if>>男
											<input type="radio" id="sex_0" name="sex" value="女" <c:if test="${'女' eq userbean.sex }">checked="checked"</c:if>>女
										</td>
										<td style="padding-top: 8px;" align="right">
											出身年月：
										</td>
										<td style="padding-top: 8px;">	
											<input type="text" name="birthday" onClick="getDateString(this,oCalendarChs)" value="${userbean.birthday }">
										</td>
									</tr>
									<tr style="font-size: 14px;">
									<td style="padding-top: 8px;" align="right">
											手机号：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="mobile" name="mobile" value="${userbean.mobile }" />
										</td>
										<td style="padding-top: 8px;" align="right">
											QQ号：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="qq" name="qq" value="${userbean.qq }" />
										</td>
										
									</tr>
									<tr style="font-size: 14px;">
									<td style="padding-top: 8px;" align="right">
											邮箱地址：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											<input type="text" id="email" name="email" value="${userbean.email }">
										</td>
										</tr>
									<c:if test="${not empty companylist}">
										<tr style="font-size: 14px;">
									    <td colspan="4" align="left" nowrap="nowrap" style="padding-top: 8px;">
									    <table cellpadding="0" cellspacing="0"><tr>
									    <td style="padding-left: 60px;">
									    单位：<select name="companyid" id="companyid" onchange="selcdp()">
									    <option value="">--请选择--</option>
									    <c:forEach items="${companylist}" var="company">
									     <option <c:if test="${company.id eq userbean.companyid}">selected="selected"</c:if> value="${company.id }">${company.companyname }</option>
									    </c:forEach>
									    </select>
									    </td>
									    <td style="padding-left: 30px;">
									    部门：<select id="departmentid" name="departmentid" onchange="selcdp()">
									    <option value="">--请选择--</option>
									     <c:forEach items="${departmentlist}" var="department">
									     <option <c:if test="${department.id eq userbean.departmentid}">selected="selected"</c:if> value="${department.id }">${department.departmentname }</option>
									    </c:forEach>
									    </select>
									    </td>
									    <td style="padding-left: 30px;">
									    职位：<select id="positionid" name="positionid" >
									    <option value="">--请选择--</option>
									    <c:forEach items="${positionlist}" var="position">
									     <option <c:if test="${position.id eq userbean.positionid}">selected="selected"</c:if> value="${position.id }">${position.positionname }</option>
									    </c:forEach>
									    </select>
									    </td></tr></table>
									    </td>
									    </tr>
									    </c:if>
										<tr style="font-size: 14px;">
									<td style="padding-top: 8px;" align="right">
											岗位：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="duty" name="duty" value="${userbean.duty }" />
										</td>
										<td style="padding-top: 8px;" align="right">
											职称：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="title" name="title" value="${userbean.title }" />
										</td>
										
									</tr>
									<tr style="font-size: 14px;">
									<td style="padding-top: 8px;" align="right">
											家庭地址：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											<input type="text" id="homeaddress" name="homeaddress" value="${userbean.homeaddress }" style="width: 450px;">
										</td>
										</tr>
									<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											个性签名：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											<textarea name="ownsigned" rows="5"  style="width: 450px;">${userbean.ownsigned }</textarea>
										</td>
									</tr>
									<!--<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											密码提示问题：
										</td>
										<td style="padding-top: 8px;" >
											<input type="text" id="qusetion" name="qusetion" value="${userbean.qusetion }" />
										</td>
										<td style="padding-top: 8px;" align="right">
											密码提示答案：
										</td>
										<td style="padding-top: 8px;">
											<input type="text" id="answerquesetion" name="answerquesetion" value="${userbean.answerquesetion }" />
										</td>
									</tr>
								-->
								<tr style="font-size: 14px;">
										<td style="padding-top: 8px;" align="right">
											个人照片：
										</td>
										<td style="padding-top: 8px;" colspan="3">
											<input type="hidden" name="picture" value="${userbean.picture }">
											<div id="newPreview">
											<c:if test="${userbean.picture==null}">
											&nbsp;&nbsp;<font color="red">暂无照片</font>
											</c:if>
											<c:if test="${userbean.picture!=null}">
											&nbsp;&nbsp;<img src="<%=path%>/memberFace/${userbean.picture }" height="80" width="100">
											</c:if>
											</div>
											&nbsp;&nbsp;<input type="file" onChange="JavaScript:PreviewImg(this);" size="60" id="myfile" name="myfile">
										</td>
									</tr>
								</table>
								<br>
							</fieldset>
						</td>
					</tr>
					<tr style="font-size: 14px;">
						<td style="padding-top: 5px;" align="center">
							<input type="button" name="sub" value="修改" class="button" style="height: 25px;" onClick="return Check();" />
							<input type="button" name="back" value="返回" class="button" style="height: 25px;" onclick="goto('<%=path %>/bbs.do?methede=toBbs')">
						</td>
					</tr>
				</table>
				<br>
			</div>
		</form>
	</body>
</html>

