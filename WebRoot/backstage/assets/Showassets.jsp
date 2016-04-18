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
              id:'code',
  fieldLabel:'资产编号',
  width:250,
  name:'code',
  readOnly:true,
  value:'${assets.code}'
  }
  ,{xtype:'textfield',
  fieldLabel:'资产名称',
  width:250,
   value:'${assets.name}',
   readOnly:true,
  name:'name'
  }
  ,{xtype:'textfield',
  fieldLabel:'购置日期',
  width:250,
   value:'${assets.buydate}',
   readOnly:true,
  name:'unit'
  }
    ,{xtype:'numberfield',
  fieldLabel:'资产价格',
  value:'${assets.price}',
  readOnly:true,
  name:'cap'
  }
  ,{xtype:'numberfield',
  fieldLabel:'累计折旧',
  readOnly:true,
  value:'${assets.depreciation}',
  name:'lower'
  }  
  ,{xtype:'numberfield',
  fieldLabel:'资产净值',
  readOnly:true,
  value:'${assets.networth}'
  },{xtype:'textfield',
  fieldLabel:'存放地点',
  width:250,
  name:'location',
   readOnly:true,
   value:'${assets.location}'
  },{xtype:'textfield',
  fieldLabel:'使用状态',
  width:250,
  name:'location',
   readOnly:true,
   value:'${assets.state}'
  }
  <c:if test="${not empty assets.nowuseuser}">
  ,{xtype:'textfield',
  fieldLabel:'当前使用者',
  width:250,
  name:'location',
  readOnly:true,
  value:'${assets.nowuseuser}'}
   ,{xtype:'textfield',
  fieldLabel:'使用时间',
  width:250,
  name:'location',
  readOnly:true,
  value:'${assets.nowusetime}'
  }   ,{xtype:'textfield',
  fieldLabel:'预计归还时间',
  width:250,
  name:'location',
  readOnly:true,
  value:'${assets.returntime}'
  }
  </c:if>
  <c:if test="${not empty assets.lastuseuser}">
    ,{xtype:'textfield',
  fieldLabel:'最后交还人',
  width:250,
  name:'location',
  readOnly:true,
  value:'${assets.lastuseuser}'
   ,{xtype:'textfield',
  fieldLabel:'最后归还时间',
  width:250,
  name:'location',
  readOnly:true,
  value:'${assets.lastreturntime}'
  }
  </c:if>
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  readOnly:true,
  width:60,
  value:'${assets.sortcode}',
  name:'sortcode'
  },{xtype:'textfield',
  fieldLabel:'备注',
  width:200,
  readOnly:true,
  value:'${assets.description}',
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
            html:'<img src="<%=path %>/upload/assets/${assets.pic}">'
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