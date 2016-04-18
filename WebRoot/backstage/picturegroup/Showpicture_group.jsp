<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看图册</title>
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
  width:380,
  items:[
  {xtype:'textfield',
  fieldLabel:'名称',
  name:'name',
  readOnly:true,
  value:'${picture_group.name}'
  }
  , {
			xtype : 'combo',
			typeAhead : true,
			triggerAction : 'all',
			hiddenName : 'grouptype',
			id : 'grouptype',
			lazyRender : true,
			editable : false,
			readOnly : true,
			emptyText : '请选择类别...',
			mode : 'local',
			store : new Ext.data.ArrayStore({
						id : 0,
						fields : ['label', 'value'],
						data : [['人文', 1], ['飞机', 2]]
					}),
			valueField : 'value',
			displayField : 'label',
			fieldLabel : '类别',
			allowBlank:false,
			value:'${picture_group.grouptype}'
		}
  ,{
			xtype : 'combo',
			typeAhead : true,
			triggerAction : 'all',
			hiddenName : 'visibility',
			id : 'visibility',
			lazyRender : true,
			editable : false,
			readOnly : true,
			emptyText : '请选择...',
			mode : 'local',
			store : new Ext.data.ArrayStore({
						id : 0,
						fields : ['label', 'value'],
						data : [['仅自己可见', 1]]
					}),
			valueField : 'value',
			displayField : 'label',
			fieldLabel : '可见性',
			allowBlank:false,
			value:'${picture_group.visibility}'
		}
  ,{xtype:'textarea',
  fieldLabel:'描述',
  name:'description',
  width:250,
  readOnly:true,
  value:'${picture_group.description}'
  }
  ]
   });
  });

   </script>
   </head>
   <body>
   <div id="dd" ></div>
   </body>
  </html>