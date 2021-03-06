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
		 <title>查看已读信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
     <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
          <script type="text/javascript">
       Ext.onReady(function(){
       Ext.QuickTips.init();
       Ext.form.Field.prototype.msgTarget = 'side';
       var company_form=new Ext.FormPanel({
       url:'',
       method : 'post',
       renderTo:document.body,
       labelWidth : 60,
       frame:true,
       width:400,
       items:[{
       xtype:'textfield',
       fieldLabel:'标题',
       readOnly:true,
       width:300,
       name:'title',
       value:'${interactive.title}'
       }, {
       xtype:'textfield',
       fieldLabel:'发送时间',
       readOnly:true,
       width:300,
       name:'createdate',
       value:'${interactive.createdate}'
       },{
       xtype:'textarea',
       hideLabel:true,
       readOnly:true,
       name:'content',
       value:'${interactive.content}',
       height:250,
       width:380
       }
       ],
       buttons:[
       {
        text:'回复',
        iconCls:'icon_huifu',
        handler:function(){
         var gb=parent.window.document.getElementById("gb");
			 gb.value="${interactive.id}";
        var win = parent.Ext.getCmp('showunread');
        if (win) {win.close();}
        }
       },{
        text:'关闭',
        iconCls:'icon_cancel',
        handler:function(){
        var win = parent.Ext.getCmp('showunread');
        if (win) {win.close();}
        }
       }]
       });
     });
     </script>
	</head>
	<body>
	</body>
</html>

