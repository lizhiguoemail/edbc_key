<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看产品</title>
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
              id:'code',
  fieldLabel:'产品编号',
  width:250,
  name:'code',
  readOnly:true,
  value:'${product.code}'
  }
  ,{xtype:'textfield',
  fieldLabel:'产品名称',
  width:250,
   value:'${product.name}',
   readOnly:true,
  name:'name'
  }
  ,{xtype:'textfield',
  fieldLabel:'单位',
  width:250,
   value:'${product.unit}',
   readOnly:true,
  name:'unit'
  }
    ,{xtype:'numberfield',
  fieldLabel:'上限数量',
  id:'cap',
  value:'${product.cap}',
  readOnly:true,
  name:'cap'
  }
  ,{xtype:'numberfield',
  fieldLabel:'下限数量',
  readOnly:true,
  id:'lower',
  value:'${product.lower}',
  name:'lower'
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  readOnly:true,
  width:60,
  value:'${product.sortcode}',
  name:'sortcode'
  },{xtype:'textarea',
  fieldLabel:'备注',
  width:200,
  readOnly:true,
  value:'${product.description}',
  name:'description'
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
            html:'<img src="<%=path %>/upload/product/${product.pic}">'
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