<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>编辑</title>
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
  
  Ext.apply(Ext.form.VTypes,{
　　               isbig:function(val,field)
                 {               //val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
　　               var bigvalue=Ext.get('cap');
                var smallvalue=Ext.get('lower');
               if(bigvalue.getValue()!=''&&smallvalue.getValue()!=''&&parseInt(bigvalue.getValue())>=parseInt(smallvalue.getValue()))
                {
                  return true;
                }
                 else
                 {
                   return false;
                 }
　　               
　　             }
　　});


   function newword(){
      var newword = new parent.window.Ext.Window({
      id:'newword',
      title:'选择新造字',
      layout:'fit', 
      width:900,
      height:600,
      closeAction:'close',  
      modal:true,
      //collapsible:true, 折叠
      plain: false,
      resizable: true,
      buttons:[{
      text:'关闭',
      icon:'<%=path %>/images/backstage/cancel.gif',
      cls: "x-btn-text-icon",
      handler:function(){
      var win = parent.Ext.getCmp('newword');
      if (win) {win.close();}
      }
      }],
      html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/jgw/Listcheckjgw_words.jsp"></iframe>'
      });
      newword.show();
    };
    
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
			  fieldLabel:'编号',
			  value:'${jgw_collection.code}',
			  name:'code'
			  }
			  ,{xtype:'textfield',
			  fieldLabel:'所在册',
			  value:'${jgw_collection.book}',
			  name:'book'
			  }
			  ,{xtype:'numberfield',
			  fieldLabel:'排序码',
			  allowNegative:false, //不允许输入负号
			  //allowDecimals:false,  //不允许有小数
			  width:60,
			  value:'${jgw_collection.sortcode}',
			  name:'sortcode'
			  } ,{xtype:'textfield',
			  fieldLabel:'备注',
			  width:250,
			  value:'${jgw_collection.description}',
			  name:'description'
			  },{xtype:'hidden',
				  fieldLabel:'隐藏的展示内容',
				  id:'showcontent',
				  value:'${jgw_collection.showcontent}',
				  name:'showcontent'
				  } ,{xtype:'hidden',
				  fieldLabel:'隐藏的内容',
				  id:'hidcontent',
				  value:'${jgw_collection.hidcontent}',
				  name:'hidcontent'
				  }
				  ,{xtype:'hidden',
				  fieldLabel:'所有的创新字',
				  id:'allnewwords',
				  value:'${jgw_collection.allnewwords}',
				  name:'allnewwords'
				  }
            ]
            }, { 
          items:[
			    {xtype:'panel',
				  fieldLabel:'内容预览',
				   frame:true,
		            layout: 'form',
		            width:280,
		            height:240,
		            bodyStyle:'overflow: auto',
		            autoScoll:true,
				  name:'showcontent',
				  html:'<div id="showdiv" style="white-space:nowrap;">${jgw_collection.showcontent}</div>'
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
   <div id="dd"></div>
   </body>
  </html>