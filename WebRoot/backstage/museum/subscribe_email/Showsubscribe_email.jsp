<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看订阅邮件</title>
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
  width:450,
  items:[
  {xtype:'textfield',
  fieldLabel:'IP地址',
  name:'ip',
  readOnly:true,
  value:'${subscribe_email.ip}'
  }
  ,{xtype:'textfield',
  fieldLabel:'地域',
  name:'zone',
  readOnly:true,
  value:'${subscribe_email.zone}'
  }
  ,{xtype:'textfield',
  fieldLabel:'详细地址',
  name:'detailaddress',
  readOnly:true,
  value:'${subscribe_email.detailaddress}'
  }
  ,{xtype:'textfield',
  fieldLabel:'email地址',
  name:'email',
  readOnly:true,
  value:'${subscribe_email.email}'
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