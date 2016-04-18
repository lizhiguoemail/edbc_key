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
		 <title>给管理员留言</title>
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
       var addsend=new Ext.FormPanel({
       url:'',
       method: 'post',
       renderTo:document.body,
       labelWidth:50,
       frame:true,
       autoHeight: true,
       items:[{
       xtype:'textfield',
       fieldLabel:'收件人',
       width:300,
       readOnly:true,
       allowBlank:false,
       value:'${receivername}',
       <c:if test="${receivername eq ''||empty receivername }">
       emptyText:'系统暂无管理员,您无法留言',
       </c:if>
       blankText: '收件人不能为空',
       name:'receiver'
       },{
       xtype:'textfield',
       fieldLabel:'标题',
       name:'title',
       width:300,
       allowBlank:false,
       blankText : '标题不能为空'
       },
       {
       xtype:'textarea',
       hideLabel:true,
       allowBlank:false,
       blankText : '内容不能为空',
       emptyText:'输入回复内容',
       name:'content',
       height:250,
       width:380
       }
       ],
       buttons:[
       {
        text:'发送',
        iconCls:'icon_huifu',
        handler:function(){
           if(addsend.form.isValid()){
                  //提交到服务器操作
                  addsend.form.doAction('submit',{
                  url:'<%=path %>/interactive.do?methede=sendEXT',
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在发送...', 
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok','发送成功');
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error','发送失败');
			       }
                     });
                  }  
        }
       },
       {
               text: '重置',
               iconCls:'icon_remove',
               handler:function(){addsend.form.reset();}//重置表单
            }
       ]
       });
       
       
       //定义窗体
               win = new Ext.Window({
                  id:'win',
                  title:'写信息',
                  layout:'fit',   //布局方式fit，自适应布局              
                  width:450,
                  height:400,
                  modal:true,
                  plain:true,
                  bodyStyle:'padding:5px;',
                  maximizable:false,//禁止最大化
                  closeAction:'close',
                  closable:false,//禁止关闭
                  collapsible:false,//可折叠
                  plain: true,
                  draggable:false,//不可拖动
                  buttonAlign:'center',
                  items:addsend//将表单作为窗体元素嵌套布局
               });
               win.show();//显示窗体
     });
     </script>
	</head>
	<body>
	 <jsp:include page="/common/doing.jsp" />
	</body>
</html>

