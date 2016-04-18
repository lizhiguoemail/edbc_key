<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看友情链接</title>
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
  width:385,
  height:130,
  items:[
  {xtype:'textfield',
  fieldLabel:'链接名称',
  name:'name',
  readOnly:true,
   width:180,
  value:'${friendlink.name}'
  }
  ,{xtype:'textfield',
  fieldLabel:'链接地址',
  name:'linkurl',
  readOnly:true,
   width:250,
  value:'${friendlink.linkurl}'
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
   width:60,
  readOnly:true,
  value:'${friendlink.sortcode}'
  }
  ]
   });
  });

   </script>
   </head>
   <body>
   <div id="dd"  ></div>
   </body>
  </html>