<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看文章栏目</title>
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
  width:600,
  items:[
  {xtype:'textfield',
  fieldLabel:'栏目名称',
  name:'name',
  readOnly:true,
  value:'${article_column.name}'
  }
  ,{xtype:'textfield',
  fieldLabel:'所属模块',
  name:'front_module',
  readOnly:true,
  value:'${article_column.front_module.m_name}'
  },
  {xtype:'textfield',
  fieldLabel:'栏目链接地址',
  value:'${article_column.url}',
  name:'url',
  width: 150
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  readOnly:true,
  value:'${article_column.sortcode}'
  }
  ],
  buttons:[{
  text:'关闭',
  iconCls:'icon_cancel',
  handler:function(){
  var win = parent.Ext.getCmp('shownew');
  if (win) {win.close();}
      }
    }]
   });
  });

   </script>
   </head>
   <body>
   <div id="dd" style="padding-top: 10px;padding-left: 10px;" ></div>
   </body>
  </html>