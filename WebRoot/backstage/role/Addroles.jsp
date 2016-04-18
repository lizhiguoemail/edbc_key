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
		 <title>添加角色</title>
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
       var roleform=new Ext.FormPanel({
       url:'<%=path %>/company.do?methede=addCompanyEXT',
       method : 'post',
       renderTo:'dd',   
       labelWidth : 60,
       frame:true,
       width:380,
       height:150,
       items:[{
       xtype:'textfield',
       fieldLabel:'角色名称',
       width:200,
       name:'rolesname',
       allowBlank:false,
       blankText : "角色名称不能为空"
       }, {
       xtype:'numberfield',
       fieldLabel:'排序号',
       allowNegative:false, //不允许输入负号
	  //allowDecimals:false,  //不允许有小数
	  width:60,
       name:'sortcode'
       },
       {
       xtype:'textfield',
       width:250,
       fieldLabel:'备注',
       name:'description'
       }
       ]
       });
       
       
       parent.Ext.getCmp('addbutton').setHandler(function(){
         if(roleform.form.isValid()){
                  //提交到服务器操作
                  roleform.form.doAction('submit',{
                  url:'<%=path %>/roles.do?methede=addRoleEXT',
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在添加角色...', 
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok','角色添加成功');
			       var gb=parent.window.document.getElementById("gb");
			       gb.value="1";
			       var win = parent.Ext.getCmp('addrole');
                  if (win) {win.close();}
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error','角色添加失败');
			       }
                     });
                  }
          }                  
         );
       
     });
     

     </script>
	</head>
	<body>
	<div id="dd"  ></div>
	</body>
</html>

