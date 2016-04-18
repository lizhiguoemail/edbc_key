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
		<title>代码生成器（service版）</title>
		<link rel="stylesheet" href="<%=path %>/css/backstage/style.css" type="text/css" />
		<script type="text/javascript">
		function add()
		{
		  var table_name=document.getElementById('table_name');
		  var class_name=document.getElementById('class_name');
		  var class_description=document.getElementById('class_description');
		  var field_name=document.getElementsByName("field_name");
		  if(table_name.value=='')
		  {
		   alert('请输入表名');
		   return;
		  }
		  if(class_name.value=='')
		  {
		   alert('请输入类名');
		   return;
		  }
		   if(class_description.value=='')
		  {
		   alert('请输入类描述');
		   return;
		  }
		  for(var i=0;i<field_name.length;i++)
		  {
		     if(field_name[i].value=='')
		     {
		       alert('字段名不能为空');
		       return;
		     }
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
		 function additemL1(s1){
         var div = document.createElement("div"); 
         div.innerHTML='字段名：<input type=\"text\" id=\"field_name\" name=\"field_name\" style=\"width: 100px;\"><font color=\"red\">*</font>&nbsp;&nbsp;'
						+'字段类型：<select id=\"field_type\" name=\"field_type\">'
						+'<option value=\"String\">String</option>'
						+'<option value=\"Integer\">Integer</option>'
						+'<option value=\"Double\">Double</option>'
						+'<option value=\"Long\">Long</option>'
						+'<option value=\"Clob\">Clob</option>'
						+'</select>&nbsp;&nbsp;'
						+'字段长度：<input type=\"text\" id=\"field_length\" name=\"field_length\" style=\"width: 50px;\">&nbsp;&nbsp;&nbsp;&nbsp;'
						+'是否允许为空：<select id=\"field_nullable\" name=\"field_nullable\">'
						+'<option value=\"1\">是</option>'
						+'<option value=\"0\">否</option>'
						+'</select>&nbsp;&nbsp;'
						+'字段描述：<input type=\"text\" id=\"field_description\" name=\"field_description\">&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"removeMe(this);\"><img src=\"<%=path %>/images/front/bbs/a_delete.gif\" border=\"0\" /></a>';
         document.getElementById(s1).appendChild(div);
         }
        function removeMe(va){//删除模版
    		var tr=va.parentNode.parentNode;
    		tr.removeChild(va.parentNode);
    	}
		</script>
	</head>
	<body class="ContentBody">
	 <jsp:include page="/common/doing.jsp" /> 
		<form   action="<%=path %>/createcode.do?methede=createCodeForService" method="post" >
		<input type="hidden" name="nowpage" id="nowpage" value="${nowpage }"/>
        <input type="hidden" name="gotopagetype" id="gotopagetype" value="${gotopagetype }"/>
        <input type="hidden" name="gotopageString" id="gotopageString" value="${gotopageString }"/>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr><td height="62" background="<%=path %>/images/backstage/nav04.gif" > </td></tr></table> 
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center" class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							代码生成器（service版）
						</th>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<fieldset style="height: 100%; width: 90%">
								<br>
								<legend>
									代码生成器（service版）
								</legend>
								<table border="0" style="width: 850px;font-size: 12px;" align="center" cellpadding="0" cellspacing="0" >
								 <tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											pojo包上级包路径：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="packageRoute" name="packageRoute" value="${packageRoute }" style="width: 200px;">  <font color="green">(例如：pojo包路径为：org.dbc.pojo，则输入：org.dbc ,默认值为org.dbc)</font>
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
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											生成数据库表名：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="table_name" name="table_name" value="${createcode.table_name }" style="width: 200px;"> <font color="red">*</font> <font color="green">(最好全部为大写，例如：TEST)</font>
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											class类名：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="class_name" name="class_name" value="${createcode.class_name }" style="width: 200px;"> <font color="red">*</font> <font color="green">(最好头字母为大写，例如：Test)</font>
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											类功能描述：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="class_description" name="class_description" value="${createcode.class_description }" style="width: 200px;"> <font color="red">*</font> <font color="green">(类注释，例如：测试类)</font>
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											JSP存放路径：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="text" id="jsppath" name="jsppath" value="${createcode.jsppath }" style="width: 200px;">  <font color="green">默认为 backstage/xxxx(xxxx:为以此类名为文件夹名称的文件夹)</font>
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											排序方式：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<input type="radio" name="sortmethede" value="sortcode" checked="checked"> 按排序码排序<font color="red">      （在添加和修改界面都可以自由更改排序码）</font><br/>
											<input type="radio" name="sortmethede" value="createdate"> 按创建日期排序<font color="red">（根据添加的日期进行倒叙）</font>
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
											相关字段(类属性)：
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
										</td>
									</tr>
									<tr class="t_pad" style="font-size: 14px;">
										<td style="padding-top: 8px;width: 150px;" align="right" nowrap="nowrap">
										</td>
										<td style="padding-top: 8px;" colspan="3" nowrap="nowrap">
											<div id="model1">
											字段名：<input type="text" id="field_name" name="field_name" style="width: 100px;"><font color="red">*</font>&nbsp;
											字段类型：<select id="field_type" name="field_type">
											<option value="String">String</option>
											<option value="Integer">Integer</option>
											<option value="Double">double</option>
											<option value="Long">long</option>
											<option value="Clob">clob</option>
											</select>&nbsp;
											字段长度：<input type="text" id="field_length" name="field_length" style="width: 50px;">&nbsp;&nbsp;&nbsp;
										    是否允许为空：<select id="field_nullable" name="field_nullable">
										    <option value="1">是</option>
											<option value="0">否</option>
											</select>&nbsp;
										    字段描述：<input type="text" id="field_description" name="field_description">
											</div>
											 <br/>
                                            <a href="javascript:additemL1('model1')"><img src="<%=path %>/images/front/bbs/a_add.gif " border="0"/></a>
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
					<tr style="font-size: 14px;">
						<td style="padding-top: 5px;padding-left: 30px;" align="left">
							<p style="color: red;">注：系统会自动生成主键，主键名为id,为string类型，生成方式为uuid。除此之外系统还会自动生成description（描述）、sortcode（排序码）、createdate(创建日期)、updatedate(修改日期)、deletemark（删除标识），故无需再次生成</p>
						</td>
					</tr>
				</table>
				<br>
			</div>
		</form>
	</body>
</html>

