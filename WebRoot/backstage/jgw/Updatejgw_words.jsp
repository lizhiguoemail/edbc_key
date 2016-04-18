<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>编辑甲骨文自造字</title>
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
            autoScoll:true,
            items:[{
            
                                xtype: 'box',   
                                id : 'browseImage',
                                 width:100,
                                 height:100,
                                fieldLabel : "",   
                                autoEl : {   
                                    tag : 'img',
                                    //type : 'image',   
                                    src : '<%=path %>/upload/jgw/${jgw_words.pic}', 
                                    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',   
                                    complete:'off',   
                                    id : 'imageBrowse'  
                                    }   
                            }]},
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
					            autoScoll:true,
					            items:[{
            
                                xtype: 'box',   
                                id : 'browseImage2',
                                 width:100,
                                 height:100,
                                fieldLabel : "",   
                                autoEl : {   
                                    tag : 'img',
                                    //type : 'image',   
                                    src :'<%=path %>/upload/jgw/${jgw_words.jgw_pic}', 
                                    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',   
                                    complete:'off',   
                                    id : 'imageBrowse2'  
                                    }   
                            }]}      

            ]
            }
           ] 
           }
 
  ],
    listeners:   
{   
    'render':function(f)   
    {   
        this.form.findField('img_pic').on('render',function()   
         {     
             Ext.get('img_pic').on('change',function(field,newValue,oldValue )   
             {   
                 var url = 'file:///'+Ext.get('img_pic').dom.value;   
                if(img_reg.test(url))   
                {     
                                 if(Ext.isIE)   
                                 {     
                                    var image = Ext.get('imageBrowse').dom;     
                                     image.src = Ext.BLANK_IMAGE_URL;//覆盖原来的图片     
                                     image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src=url;    
                                              
                                 }//支持FF   
                                 else  
                                 {     
                                    Ext.get('imageBrowse').dom.src =Ext.get('img_pic').dom.files.item(0).getAsDataURL()   
                                 }     
                 }     
                  var ischange=document.getElementById("ischange");
	                  ischange.value="1";    
                 },this);     
                  },this); 
                  
                  this.form.findField('img_jgw_pic').on('render',function()   
         {     
             Ext.get('img_jgw_pic').on('change',function(field,newValue,oldValue )   
             {   
                 var url = 'file:///'+Ext.get('img_jgw_pic').dom.value;   
                if(img_reg.test(url))   
                {     
                                 if(Ext.isIE)   
                                 {     
                                    var image = Ext.get('imageBrowse2').dom;     
                                     image.src = Ext.BLANK_IMAGE_URL;//覆盖原来的图片     
                                     image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src=url;    
                                              
                                 }//支持FF   
                                 else  
                                 {     
                                    Ext.get('imageBrowse2').dom.src =Ext.get('img_jgw_pic').dom.files.item(0).getAsDataURL()   
                                 }     
                 }    
                  var ischange2=document.getElementById("ischange2");
	                  ischange2.value="1";     
                 },this);     
                  },this);       
    }   
} 
   });

 parent.Ext.getCmp('updatebutton').setHandler(function(){
  if(f.form.isValid()){
   var ischange=document.getElementById("ischange").value;
   var ischange2=document.getElementById("ischange2").value;
    f.form.doAction('submit',{
    url:'<%=path %>/jgw_words.do?methede=updateEXT&ischange='+ischange+'&ischange2='+ischange2,
    method : 'post',
    params:{id:'${jgw_words.id}'},
    waitTitle: "请稍候", 
    waitMsg: '正在修改数据...', 
    success:function(f,a){
    Ext.Msg.alert('ok',a.result.msg);
    var gb=parent.window.document.getElementById("gb");
    gb.value="1";
    var win = parent.Ext.getCmp('updatenew');
    if (win) {win.close();}
    },
  failure:function(f,a){
    Ext.Msg.alert('error','修改失败');
   }
   });
  }  
          }                  
         );
   
  });

   </script>
   </head>
   <body>
   <input type="hidden" name="ischange" value="0" id="ischange">
   <input type="hidden" name="ischange2" value="0" id="ischange2">
   <div id="dd" ></div>
   </body>
  </html>