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
		function gotodelete(str,f)
		{
		 if(confirm('确认删除该生成代码吗'))
		  {
		  var fname=document.getElementById("fname");
		  fname.value=f;
		  document.forms[0].action=str;
		  document.forms[0].submit();
		  }
		}
		</script>
	</head>
	<body class="ContentBody">
	 <jsp:include page="/common/doing.jsp" /> 
		<form   action="<%=path %>/createcode.do?methede=createCode" method="post" >
		<input type="hidden" id="fname" name="fname">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr><td height="62" background="<%=path %>/images/backstage/nav04.gif" > </td></tr></table> 
			<div class="MainDiv">
				<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center" class="CContent">
					<tr class="CTitle">
						<th class="tablestyle_title">
							代码生成器
						</th>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
           <td>
				   <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				        <tr class="CTitle" >
                    	<td height="22" colspan="11" align="center" style="font-size:16px">生成代码历史记录</td>
                        </tr>
                       <tr bgcolor="#EEEEEE" height="25px;">
				        <td nowrap="nowrap" align="center" width="40px;">编号</td>
				   		<td nowrap="nowrap" align="center"  colspan="2">pojo</td>
				   		<td nowrap="nowrap" align="center" >formBean</td>
				   		<td nowrap="nowrap" align="center" >interDao</td>
				   		<td nowrap="nowrap" align="center" >dao</td>
				   		<td nowrap="nowrap" align="center" >action</td>
				   		<td nowrap="nowrap" align="center" >config</td>
				   		<td nowrap="nowrap" align="center" >压缩包(zip)</td>
				   		<td nowrap="nowrap" align="center" >操作</td>
                      </tr>
	                         <%
									int i = 0;
							%>
	                 <c:forEach items="${listzip}" var="createcode">
   		                    <% i++; %>
				   		<tr bgcolor="#FFFFFF" class="tr_g2" onmouseover="this.className='tr_g2_over'" onmouseout="this.className='tr_g2'">
				   	    <td nowrap="nowrap" align="center" width="40px;"><%=i %></td>
				   		<td nowrap="nowrap" align="center">${createcode}.java (<a href="<%=path %>/createcode/${createcode }/pojo/${createcode }.java" target="_blank" style="color: green;">查看源码</a>)</td>
				   		<td nowrap="nowrap" align="center">${createcode}.hbm.xml (<a href="<%=path %>/createcode/${createcode }/pojo/${createcode }.hbm.xml" target="_blank" style="color: green;">查看源码</a>)</td>
				   		<td nowrap="nowrap" align="center">${createcode}Form.java (<a href="<%=path %>/createcode/${createcode }/formBean/${createcode }Form.java" target="_blank" style="color: green;">查看源码</a>)</td>
				   		<td nowrap="nowrap" align="center">I${createcode}Dao.java (<a href="<%=path %>/createcode/${createcode }/interDao/I${createcode }Dao.java" target="_blank" style="color: green;">查看源码</a>)</td>
				   		<td nowrap="nowrap" align="center">${createcode}Dao.java (<a href="<%=path %>/createcode/${createcode }/dao/${createcode }Dao.java" target="_blank" style="color: green;">查看源码</a>)</td>
				   		<td nowrap="nowrap" align="center">${createcode}Action.java (<a href="<%=path %>/createcode/${createcode }/action/${createcode }Action.java" target="_blank" style="color: green;">查看源码</a>)</td>
				   		<td nowrap="nowrap" align="center">${createcode}config.txt (<a href="<%=path %>/createcode/${createcode }/config/${createcode }config.txt" target="_blank" style="color: green;">查看配置代码</a>)</td>
				   		<td nowrap="nowrap" align="center">${createcode}.zip (<a href="<%=path %>/createcode/${createcode }.zip" target="_blank" style="color: red;">下载压缩包</a>)</td>
				   		<td nowrap="nowrap" align="center"><a href="javascript:gotodelete('<%=path %>/createcode.do?methede=deleteCreate','${createcode }')" style="color: red;">删除</a></td>
   		                </tr>
   		             </c:forEach>
                    </table></td></tr></table></td></tr></table></div></form>
	</body>
</html>

