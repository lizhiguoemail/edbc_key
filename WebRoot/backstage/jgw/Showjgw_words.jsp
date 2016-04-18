<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看甲骨文自造字</title>
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

  //上传图片类型   
var img_reg = /\.([jJ][pP][gG]){1}$|\.([jJ][pP][eE][gG]){1}$|\.([gG][iI][fF]){1}$|\.([pP][nN][gG]){1}$|\.([bB][mM][pP]){1}$/ 
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  fileUpload : true,
  labelWidth : 80,
  frame:true,
  autoScoll:true,
  width:625,
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
  fieldLabel:'编号',
  width:200,
  value:'${jgw_words.code}',
  name:'code'
  }
  ,{xtype:'textfield',
  fieldLabel:'字形图片',
  width:200,
  name:'img_pic',
  inputType : "file", 
  fieldLabel: '字形图片',   
  id:'img_pic'                          
  } ,{xtype:'textfield',
  fieldLabel:'原型图片',
  width:200,
  name:'img_jgw_pic',
  inputType : "file",   
  fieldLabel: '原型图片',   
  id:'img_jgw_pic'                          
  },{xtype:'textfield',
  fieldLabel:'偏旁部首',
  value:'${jgw_words.radical}',
  width:60,
  name:'radical'
  } ,{xtype:'numberfield',
  fieldLabel:'笔画数',
  value:'${jgw_words.stroke}',
  allowNegative:false, //不允许输入负号
  allowDecimals:false,  //不允许有小数
  width:60,
  name:'stroke'
  },{xtype:'textfield',
  fieldLabel:'字意',
  width:250,
  name:'meaning',
  value:'${jgw_words.meaning}'
  }
  ,{xtype:'textfield',
  fieldLabel:'上边字形',
  width:150,
  name:'w_top',
  value:'${jgw_words.w_top}'
  }
  ,{xtype:'textfield',
  fieldLabel:'中间字形',
  width:150,
  name:'w_middle',
  value:'${jgw_words.w_middle}'
  }
  ,{xtype:'textfield',
  fieldLabel:'底边字形',
  width:150,
  name:'w_bottom',
  value:'${jgw_words.w_bottom}'
  }
  ,{xtype:'textfield',
  fieldLabel:'左边字形',
  width:150,
  name:'w_left',
  value:'${jgw_words.w_left}'
  }
  ,{xtype:'textfield',
  fieldLabel:'右边字形',
  width:150,
  name:'w_right',
  value:'${jgw_words.w_right}'
  }
  ,{xtype:'textfield',
  fieldLabel:'搜索字',
  width:250,
  name:'searchwords',
  value:'${jgw_words.searchwords}'
  }
  ,{xtype:'textfield',
  fieldLabel:'搜索字音',
  width:150,
  name:'searchsound',
  value:'${jgw_words.searchsound}'
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
   value:'${jgw_words.sortcode}',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60,
  name:'sortcode'
  } ,{xtype:'textfield',
  fieldLabel:'备注',
  width:250,
  value:'${jgw_words.description}',
  name:'description'
  }
            ]
            }, { 
          items:[
          {
           xtype:'label',
           text:'字形图片'
          },
            {   
           xtype:'panel',
            frame:true,
            layout: 'form',
            width:100,
            height:100,
            bodyStyle:'overflow: auto',
            autoScoll:true,
            html:'<img src="<%=path %>/upload/jgw/${jgw_words.pic}">'
            },
                            {
					           xtype:'label',
					           text:'原型图片'
					          }, 
                            {   
					           xtype:'panel',
					            frame:true,
					            layout: 'form',
					            width:100,
					            height:100,
					            bodyStyle:'overflow: auto',
					            autoScoll:true,
					            html:'<img src="<%=path %>/upload/jgw/${jgw_words.jgw_pic}">'
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
   <input type="hidden" name="ischange" value="0" id="ischange">
   <input type="hidden" name="ischange2" value="0" id="ischange2">
   <div id="dd" ></div>
   </body>
  </html>