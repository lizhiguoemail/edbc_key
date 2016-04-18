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
		<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="<%=path %>/extjs/ext-all-debug.js"></script>
		 <script type="text/javascript">
	  Ext.onReady(function(){  
          //使用表单提示
          Ext.QuickTips.init();
          Ext.form.Field.prototype.msgTarget = 'side';
       
        //定义表单
          var simple = new Ext.FormPanel({
            labelWidth: 75,         
            baseCls: 'x-plain',
            defaults: {width: 150},
            defaultType: 'textfield',//默认字段类型
                
            //定义表单元素
            items: [{
                  fieldLabel: '帐户',
                  name: 'username',//元素名称
                  //anchor:'95%',//也可用此定义自适应宽度
                  allowBlank:false,//不允许为空
                  blankText:'帐户不能为空!'//错误提示内容
               },{
                   inputType:'password',
                  fieldLabel: '密码',
                  //anchor:'95%',
                  name: 'password',
                  allowBlank:false,
                  blankText:'密码不能为空!'
               }
            ],
            buttons: [{
               text: '登陆',
               type: 'submit',
               //定义表单提交事件
               handler:function(){
                              if(simple.form.isValid()){//验证合法后使用加载进度条
                           Ext.MessageBox.show({
                              title: '请稍等',
                              msg: '正在加载...',
                              progressText: '',
                              width:300,
                              progress:true,
                              closable:false,
                              animEl: 'loading'
                           });
                           //控制进度速度
                           var f = function(v){
                            return function(){
                                    var i = v/11;
                                    Ext.MessageBox.updateProgress(i, '');
                                    };
                           };
 
                           for(var i = 1; i < 13; i++){
                              setTimeout(f(i), i*150);
                           }
                                 
                          //提交到服务器操作
                          simple.form.doAction('submit',{
                            url:'login.do',//文件路径
                            method:'post',//提交方法post或get
                            params:'',
                            //提交成功的回调函数
                            success:function(form,action){
                                 if (action.result.msg=='ok') {
                                    document.location='index.jsp';
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
            },{
               text: '取消',
               handler:function(){simple.form.reset();}//重置表单
            }]
         });   
                //定义窗体
               win = new Ext.Window({
                  id:'win',
                  title:'EDBC用户登陆       (管理员帐号：admin 密码：111111)',
                  layout:'fit',   //布局方式fit，自适应布局              
                  width:300,
                  height:150,
                  modal:true,
                  plain:true,
                        bodyStyle:'padding:5px;',
                  maximizable:false,//禁止最大化
                  closeAction:'close',
                  closable:false,//禁止关闭
                  collapsible:true,//可折叠
                  plain: true,
                  buttonAlign:'center',
                  items:simple//将表单作为窗体元素嵌套布局
               });
               win.show();//显示窗体
                             
       });
 </script>
    </head>
    <body>
    </body>
</html>
