<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.dbc.pojo.Department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>部门管理</title>
	<link rel="StyleSheet" href="<%=path %>/css/common/dtree.css" type="text/css" />
	<link href="<%=path %>/css/backstage/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>   
	 <script type="text/javascript" src="<%=path %>/js/jquery.contextmenu.js"></script>
	<script type="text/javascript" src="<%=path %>/js/dtreeback.js"></script>   
  <script type="text/javascript">
  
    dTree.prototype.isParentNode = function(id) {
	    var isParentNode = false;
		var n=0;
		for (n; n<this.aNodes.length; n++) 
		{	
			if (this.aNodes[n].pid == id) 
			{
			   isParentNode = true;
			   break;
			}
		}
		return isParentNode;
	};
	d = new dTree('d');
		<%List departmentlist=(List)request.getAttribute("departmentlist");
		for(int i=0;i<departmentlist.size();i++)
		{
			Department department=(Department)departmentlist.get(i);
			if("0".equals(department.getDeep()))
			{
				%>
				d.add(<%=department.getId() %>,-1,' <%=department.getNodename() %>','#','<%=department.getNodename() %>','_self');
				<%
			}
			else
			{
				%>
				d.add(<%=department.getId() %>,<%=department.getParentid() %>,'<%=department.getNodename() %>','#','<%=department.getNodename() %>','_self');
				<%
			}
		}
		%>
	
    $(document).ready(function() {
      $('a').contextMenu('jqueryDtreeMenu', {
		onContextMenu: function(t) {
		return true;
        },
        bindings: {
         'up': function(t) {
            document.forms[0].action="<%=path %>/department.do?methede=paixu&t=up&oid="+t.name;
            document.getElementById('doing').style.display='block';
            document.forms[0].submit();
          },
         'down': function(t) {
            document.forms[0].action="<%=path %>/department.do?methede=paixu&t=down&oid="+t.name;
            document.getElementById('doing').style.display='block';
            document.forms[0].submit();
          },
           'top': function(t) {
            document.forms[0].action="<%=path %>/department.do?methede=paixu&t=top&oid="+t.name;
            document.getElementById('doing').style.display='block';
            document.forms[0].submit();
          },
           'buttom': function(t) {
            document.forms[0].action="<%=path %>/department.do?methede=paixu&t=buttom&oid="+t.name;
            document.getElementById('doing').style.display='block';
            document.forms[0].submit();
          },
          'add': function(t) {
            var arr=window.showModalDialog(encodeURI("<%=path %>/department.do?methede=toAddsonnode&pname="+t.title),"new","dialogHeight:300px;dialogWidth:600px;edge:Raised;center:Yes;help:No;resizable:no;status:no;"); 
            var nodename=document.getElementById("nodename");
            var introduction=document.getElementById("introduction");
            nodename.value=arr[0];
            introduction.value=arr[1];
            document.forms[0].action="<%=path %>/department.do?methede=addnode&pid="+t.name;
            document.getElementById('doing').style.display='block';
            document.forms[0].submit();
          },
          'update': function(t) {
           var arr=window.showModalDialog(encodeURI("<%=path %>/department.do?methede=toUpdatenode&treeid="+t.name),"new","dialogHeight:300px;dialogWidth:600px;edge:Raised;center:Yes;help:No;resizable:no;status:no;"); 
            var nodename=document.getElementById("nodename");
            var introduction=document.getElementById("introduction");
            nodename.value=arr[0];
            introduction.value=arr[1];
            document.forms[0].action="<%=path %>/department.do?methede=update&treeid="+t.name;
            document.getElementById('doing').style.display='block';
            document.forms[0].submit();
          },
          'delete': function(t) {
            if(confirm('确认删除该部门吗'))
            {
              document.forms[0].action="<%=path %>/department.do?methede=deletenode&oid="+t.name;
              document.getElementById('doing').style.display='block';
              document.forms[0].submit();
            }
          }
        }

      });
	  
    });
    
    function tianjiaroot()
{
  var rzhi=document.getElementById("rootname");
  if(rzhi.value==''||rzhi==null)
  {
  alert("不能输入空值");
  return;
  }
  else
  {
   document.forms[0].action="<%=path %>/module.do?methede=addroot";
   document.getElementById('doing').style.display='block';
   document.forms[0].submit();
  }
}    

function tj()
{
  document.getElementById('doing').style.display='block';
  document.forms[0].submit();
}
function goto(str)
{
document.forms[0].action=str;
document.getElementById('doing').style.display='block';
document.forms[0].submit();
}
  </script>


</head>

<body>
 <jsp:include page="/common/doing.jsp" /> 
 <form method="post" action="<%=path %>/department.do?methede=listDepartment">
<input type="hidden" id="nodename" name="nodename"/>
<input type="hidden" id="introduction" name="introduction"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr><td height="62" background="<%=path %>/images/backstage/nav04.gif"></td></tr>
 <tr><td><div style="width: 100%" align="center"></div>
   <c:if test="${not empty departmentlist}">
<div class="dtree" style="padding-left: 100px;">
	<p><a href="javascript: d.openAll();">展开所有部门</a> | <a href="javascript: d.closeAll();">收拢所有部门</a></p>
	<script type="text/javascript">
		<!--
		document.write(d);
		//-->
	</script>
</div>
  <div class="contextMenu" id="jqueryDtreeMenu">
    <ul>
     <c:if test="${(fn:contains(userinfo.systempermit,',523,')==false)||((fn:contains(userinfo.systempermit,',523,')==true)&&(fn:contains(userinfo.allpermits,',523,')==true))||userinfo.isadmin eq '1'}">
      <li id="up"><div style="width: 100%;" align="center"><font style="font-size: 12px;font-weight: bold;">上移</font></div></li>
      <li id="down"><div style="width: 100%;" align="center"><font style="font-size: 12px;font-weight: bold;">下移</font></div></li>
      <li id="top"><div style="width: 100%;" align="center"><font style="font-size: 12px;font-weight: bold;">置顶</font></div></li>
      <li id="buttom"><div style="width: 100%;" align="center"><font style="font-size: 12px;font-weight: bold;">置底</font></div></li>
      </c:if>
       <c:if test="${(fn:contains(userinfo.systempermit,',521,')==false)||((fn:contains(userinfo.systempermit,',521,')==true)&&(fn:contains(userinfo.allpermits,',521,')==true))||userinfo.isadmin eq '1'}">
      <li id="add"><div style="width: 100%;" align="center"><font style="font-size: 12px;font-weight: bold;">添加</font></div></li>
       </c:if>
       <c:if test="${(fn:contains(userinfo.systempermit,',522,')==false)||((fn:contains(userinfo.systempermit,',522,')==true)&&(fn:contains(userinfo.allpermits,',522,')==true))||userinfo.isadmin eq '1'}">
      <li id="update"><div style="width: 100%;" align="center"><font style="font-size: 12px;font-weight: bold;">编辑</font></div></li>
       </c:if>
       <c:if test="${(fn:contains(userinfo.systempermit,',524,')==false)||((fn:contains(userinfo.systempermit,',524,')==true)&&(fn:contains(userinfo.allpermits,',524,')==true))||userinfo.isadmin eq '1'}">
      <li id="delete"><div style="width: 100%;" align="center"><font style="font-size: 12px;font-weight: bold;">删除</font></div></li>
       </c:if>
    </ul>

  </div>
  </c:if>
     <c:if test="${empty departmentlist}">
     		 <font color="red">请先创建单位</font> <input type="button" value="点此添加新单位" class="button" onclick="goto('<%=path %>/company.do?methede=toUpdatecompany')" style="vertical-align: middle;">
     </c:if>
  </td></tr></table>
   </form>
  </body>
</html>