<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>添加</title>
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
			  name:'code'
			  }
			  ,{xtype:'textfield',
			  fieldLabel:'所在册',
			  name:'book'
			  },
			  {xtype:'textfield',
			  fieldLabel:'内容编写',
			  width:200,
			  id:'wcontent',
			  name:'wcontent'
			  },
			  {xtype:'panel',
			  fieldLabel:'',
			  layout:'form', 
			  buttonAlign:'center',
			  buttons:[{ 
			    text:'加入内容', 
			    id:'addcontent', 
			    icon:'<%=path %>/images/backstage/add.gif', 
			    cls: "x-btn-text-icon", 
			    handler:function(){
                 var showdiv=document.getElementById("showdiv");
                 var showcontent=document.getElementById("showcontent");
                 var hidcontent=document.getElementById("hidcontent");
			     var wcontent=document.getElementById("wcontent");
			     showdiv.innerHTML+=wcontent.value;
			     hidcontent.value+=wcontent.value;
			     showcontent.value+=wcontent.value;
			     wcontent.value="";
               }
			    },{ 
			    text:'内容换行', 
			    id:'gocontent', 
			    icon:'<%=path %>/images/backstage/edit.gif', 
			    cls: "x-btn-text-icon", 
			    handler:function(){
                 var showdiv=document.getElementById("showdiv");
                 var showcontent=document.getElementById("showcontent");
                 var hidcontent=document.getElementById("hidcontent");
                 showdiv.innerHTML+='</br>'; 
                 hidcontent.value+='</br>';
                 showcontent.value+='</br>';
               }
			    },{ 
			    text:'选择新造字', 
			    id:'addbutton', 
			    icon:'<%=path %>/images/backstage/kcgl.gif', 
			    cls: "x-btn-text-icon", 
			    handler:function(){
                newword();}
               } ,{ 
			    text:'清空内容', 
			    id:'deletebutton', 
			    icon:'<%=path %>/images/backstage/stop.gif', 
			    cls: "x-btn-text-icon", 
			    handler:function(){
                var showdiv=document.getElementById("showdiv");
                var hidcontent=document.getElementById("hidcontent");
                var allnewwords=document.getElementById("allnewwords");
                var showcontent=document.getElementById("showcontent");
                 showdiv.innerHTML=''; 
                 hidcontent.value='';
                 allnewwords.value='';
                 showcontent.value='';
               } 
			    }]
			  }
			 ,{xtype:'textfield',
			  fieldLabel:'备注',
			  width:250,
			  name:'description'
			  } ,{xtype:'numberfield',
			  fieldLabel:'排序码',
			  allowNegative:false, //不允许输入负号
			  //allowDecimals:false,  //不允许有小数
			  width:60,
			  name:'sortcode'
			  } ,{xtype:'hidden',
				  fieldLabel:'隐藏的展示内容',
				  id:'showcontent',
				  name:'showcontent'
				  }  ,{xtype:'hidden',
				  fieldLabel:'隐藏的内容',
				  id:'hidcontent',
				  name:'hidcontent'
				  }
				  ,{xtype:'hidden',
				  fieldLabel:'所有的创新字',
				  id:'allnewwords',
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
				  name:'showcontent2',
				  html:'<div id="showdiv" style="white-space:nowrap;"></div>'
				  }

            ]
            }
           ] 
           }
 
  ]
   });

 parent.Ext.getCmp('addbutton').setHandler(function(){
  if(f.form.isValid()){
    f.form.doAction('submit',{
     url:'<%=path %>/jgw_collection.do?methede=addEXT',
    method : 'post',
    waitTitle: "请稍候", 
    waitMsg: '正在添加数据...', 
    success:function(f,a){
    Ext.Msg.alert('ok',a.result.msg);
    var gb=parent.window.document.getElementById("gb");
    gb.value="1";
    var win = parent.Ext.getCmp('addnew');
    if (win) {win.close();}
    },
  failure:function(f,a){
   var gb=parent.window.document.getElementById("gb");
    gb.value="1";
    var win = parent.Ext.getCmp('addnew');
    if (win) {win.close();}
   }
   });
  }  
          }                  
         );
   
  });
  
   </script>
   </head>
   <body>
   <div id="dd"></div>
   </body>
  </html>