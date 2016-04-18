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
		 <title>回复信息</title>
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
       var reply_form=new Ext.FormPanel({
       url:'',
       method : 'post',
       renderTo:document.body,
       labelWidth : 50,
       frame:true,
       width:400,
       items:[{
       xtype:'textfield',
       fieldLabel:'收件人',
       readOnly:true,
       width:320,
       name:'receiver',
       value:'${interactive.sender }'
       },{
       xtype:'textfield',
       fieldLabel:'标题',
       name:'title',
       width:320,
       value:'回复：${interactive.title}'
       }, {
       xtype:'textarea',
       fieldLabel:'原内容',
       hideLabel:true,
       readOnly:true,
       name:'contentold',
       value:'原内容： ${interactive.content}',
       height:150,
       width:380
       },
       {
       xtype:'textarea',
       hideLabel:true,
       allowBlank:false,
       blankText : "内容不能为空",
       emptyText:'输入回复内容',
       name:'newcontent',
       height:150,
       width:380
       }
       ],
       buttons:[
       {
        text:'发送',
        iconCls:'icon_huifu',
        handler:function(){
           if(reply_form.form.isValid()){
                  //提交到服务器操作
                  reply_form.form.doAction('submit',{
                  url:'<%=path %>/interactive.do?methede=replyEXT',
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在回复...', 
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok','回复成功');
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error','回复失败');
			       }
                     });
                  }  
        }
       },{
        text:'关闭',
        iconCls:'icon_cancel',
        handler:function(){
        var win = parent.Ext.getCmp('showreply');
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

