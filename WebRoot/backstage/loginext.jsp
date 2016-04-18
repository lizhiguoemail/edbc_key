<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html> 
	<head>
		<title>用户登录</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
		<link href="<%=path %>/css/backstage/backstage.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
		<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
		<script type="text/javascript">
	  Ext.onReady(function(){  
          //使用表单提示
          Ext.QuickTips.init();
          Ext.form.Field.prototype.msgTarget = 'side';
          
        //定义表单
          var simple = new Ext.FormPanel({
            renderTo:'loginshow',
            width:275,
            labelWidth: 60,
            labelAlign:'right',
            bodyStyle:'background-color: #F1F4F9;',
            border:false,        
            defaultType: 'textfield',//默认字段类型
            buttonAlign:'center',  
             keys:[
            {
                key: [10,13],
                fn:surely
            } ],
              
            //定义表单元素
            items: [{
                  fieldLabel: '帐号',
                  name: 'username',//元素名称
                  allowBlank:false,//不允许为空
                  width:170,
                  blankText:'帐户不能为空!'//错误提示内容
               },{
                   inputType:'password',
                  fieldLabel: '密码',
                  name: 'password',
                  width:170,
                  allowBlank:false,
                  blankText:'密码不能为空!'
               }
            ],
            buttons: [{
               text: '登录',
               id:'lg',
               type: 'submit',
               iconCls:'icon_submit',
               //定义表单提交事件
               handler:surely
            },{
               text: '注册',
               type: 'button',
               iconCls:'icon_mkpz',
               //定义表单提交事件
               handler:function(){
                     window.parent.window.location.href='<%=path%>/user.do?methede=toregEXT';       
               }
            }]
         });   
                function surely(){
                       if(simple.form.isValid()){//验证合法后使用加载进度条
                          //提交到服务器操作
                          simple.form.doAction('submit',{
                            url:'<%=path %>/user.do?methede=loginEXT',//文件路径
                            method:'post',//提交方法post或get
                            waitTitle: "请稍候", 
                            waitMsg: '正在登录...', 
                            params:'',
                            //提交成功的回调函数
                            success:function(form,action){
                                 if (action.result.msg=='ok') {
                                    window.parent.window.document.location='<%=path %>/backstage/index.jsp';
                                 } else {
                                    Ext.Msg.alert('登陆失败',action.result.msg);
                                 }
                            },
                            //提交失败的回调函数
                            failure:function(){
                                 Ext.Msg.alert('错误','服务器出现错误请稍后再试！');
                            }
                          });
                        }                
          }
                             
       });
 </script>
    </head>
    <body id="shenti">
    <div id="mainf">
	<div class="login">
	<div id="loginshow"></div>
	</div>
</div>
    </body>
    <script type="text/javascript" src="<%=path %>/js/tongji.js"></script>
</html>
