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
		 <title>修改密码</title>
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
         Ext.apply(Ext.form.VTypes,{
　　               password:function(val,field)
                 {               //val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
　　               if(field.confirmTo)
                  {              //confirmTo是我们自定义的配置参数，一般用来保存另外的组件的id值
　　               var pwd=Ext.get(field.confirmTo);//取得confirmTo的那个id的值
　　               return (val==pwd.getValue());
　　              }
　　              return true;
　　             }});
       Ext.form.Field.prototype.msgTarget = 'side';
       var userform=new Ext.FormPanel({
       url:'<%=path %>/company.do?methede=addCompanyEXT',
       method : 'post',
       renderTo:'dd',   
       labelWidth : 60,
       frame:true,
       width:400,
       items:[{
       xtype:'textfield',
       inputType:"password",
       fieldLabel:'原密码',
       name:'passwordold',
       allowBlank:false,
       blankText : "原密码不能为空"
       }, 
       {
	    xtype:'textfield',
	    name:"password",
	    fieldLabel:"新密码",
	    allowBlank:false,
	    blankText : "新密码不能为空",
	    inputType:"password"
       }
       , 
       {
	    xtype:'textfield',
	    name:"password2",
	    fieldLabel:"确认密码",
	    allowBlank:false,
	    blankText : "确认密码不能为空",
	    inputType:"password",
	    vtype:"password",//自定义的验证类型
        vtypeText:"两次密码不一致！",
　    　 confirmTo:"password"//要比较的另外一个的组件的id
       }
       ]
      
       });
       
         parent.Ext.getCmp('pwdbutton').setHandler(function(){
            if(userform.form.isValid()){
                  //提交到服务器操作
                  userform.form.doAction('submit',{
                  url:'<%=path %>/user.do?methede=updateUserpwdEXT',
                  params:{oid:'${userbean.id}'},
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在修改...', 
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok','密码修改成功');
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error',a.result.msg);
			       }
                     });
                  }  
          } );
       
     });
     

     </script>
	</head>
	<body>
	<div id="dd" style="padding-top: 10px;padding-left: 10px;" ></div>
	</body>
</html>

