<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>EDBC-KEY注册</title>
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
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:700,
  items:[
  {xtype:'textfield',
  fieldLabel:'注册域名',
  allowBlank:false,
  blankText : "域名不能为空",
  emptyText:'如有多个域名，域名之间用,隔开',
  width:500,
  name:'keyvalue'
  }
  ,{xtype:'textfield',
  fieldLabel:'KEY',
  name:'keyzhi',
  id:'keyzhi',
  width:500
  }
  ], 
    buttons:[{ 
    text:'获取序列号', 
    id:'addbutton', 
    icon:'<%=path %>/images/backstage/ok.gif', 
    cls: "x-btn-text-icon", 
    type: 'submit' 
    }]
   });
   Ext.getCmp('addbutton').setHandler(function(){
   if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/key.do?methede=getKeyEXT',
    method : 'post',
    success:function(f,a){
    document.getElementById("keyzhi").value=a.result.msg;
    },
   failure:function(f,a){
    Ext.Msg.alert('error','添加失败');
   }
   });
   }
    });
  });

   </script>
   </head>
   <body>
   <div id="dd" ></div>
   </body>
  </html>