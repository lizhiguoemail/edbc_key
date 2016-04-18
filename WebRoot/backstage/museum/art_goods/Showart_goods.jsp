<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看资产详情</title>
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
  fileUpload : true,
  labelWidth : 80,
  frame:true,
  autoScoll:true,
  width:825,
  items:[
  {  
      xtype:'panel',  
      layout:'column', 
      border:false,
      defaults : {                   //应用到每一个子元素上的配置   
                    border : false,            //不显示边框   
                    layout : 'form'            //在列布局中嵌套form布局   
                },   
      items:[
            
            { width : 430, 
          items:[
        
  {xtype:'textfield',
  fieldLabel:'展品名称',
  width:250,
   value:'${art_goods.name}',
   readOnly:true,
  name:'name'
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  readOnly:true,
  width:60,
  value:'${art_goods.sortcode}',
  name:'sortcode'
  },{xtype:'textfield',
  fieldLabel:'展品描述',
  width:300,
  height:210,
  readOnly:true,
  value:'${art_goods.content}'
  }
            ]
            }, { 
          items:[
            {   
            xtype:'panel',
            frame:true,
            layout: 'form',
            width:350,
            height:250,
            bodyStyle:'overflow: auto',
            autoScoll:true,
            html:'<img src="<%=path %>/upload/art_goods/${art_goods.pic}">'
           }   

            ]
            }
           ] 
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