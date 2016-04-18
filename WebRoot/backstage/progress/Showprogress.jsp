<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看任务进度</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<script type="text/javascript" src="<%=path %>/FCKeditor/fckeditor.js"></script>
<script type="text/javascript">
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:960,
  items:[
  {xtype:'textfield',
  fieldLabel:'所属任务',
  name:'worktaskid',
  readOnly:true,
  value:'${progress.worktask.name}'
  }
  ,{xtype:'textfield',
  fieldLabel:'工作时间',
  name:'worktime',
  readOnly:true,
  value:'${progress.worktime}'
  }
  ,{xtype:'textfield',
  fieldLabel:'工作人',
  name:'workuser',
  readOnly:true,
  value:'${progress.workuser}'
  }
   ,{xtype:'textarea',
  fieldLabel:'精简描述',
  name:'description',
  value:"${progress.description}",
  width:250
  },
  {xtype:'box',
  fieldLabel:'详细描述',
  renderTo:'ee',
  id:'content',
  name:'workcontent'
  }
  
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  readOnly:true,
  value:'${progress.sortcode}'
  }
  ]
   });
   
   var fckEditor = new FCKeditor("content");
    fckEditor.BasePath='<%=path%>/FCKeditor/';
	fckEditor.Heigth=320;
	fckEditor.Width=800;//设置FCK编辑器的宽度   
	fckEditor.ToolbarSet='Default';
	fckEditor.ReplaceTextarea();              
	
  });

   </script>
   </head>
   <body>
    <div id="dd"  >
   <div id="ee">
   <textarea name="workcontent"  id="content" style="height: 320px;width: 800px;">${progress.workcontent}</textarea>
   </div>
   </div>
   </body>
  </html>