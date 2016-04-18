<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>添加产品</title>
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
  fieldLabel:'产品编号<font color="red">*</font> ',
  allowBlank:false,
  blankText : "产品编号不能为空",
  width:250,
  name:'code'
  }
  ,{xtype:'textfield',
  fieldLabel:'产品名称<font color="red">*</font> ',
  allowBlank:false,
  blankText : "产品名称不能为空",
  width:250,
  name:'name'
  }
  ,{xtype:'textfield',
  fieldLabel:'单位',
  width:250,
  name:'unit'
  }
    ,{xtype:'numberfield',
  fieldLabel:'上限数量',
  id:'cap',
  name:'cap'
  }
  ,{xtype:'numberfield',
  fieldLabel:'下限数量',
  id:'lower',
  vtype:"isbig",//自定义的验证类型
  vtypeText:"下限数量不能大于上限数量！",
  name:'lower'
  }
  ,{xtype:'textfield',
  fieldLabel:'图片',
  name:'imageupload',
  inputType : "file",   
  fieldLabel: '上传图片',   
  id:'imageupload'                          
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60,
  name:'sortcode'
  } ,{xtype:'textarea',
  fieldLabel:'备注',
  width:200,
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
            autoScoll:true,
            items:[{
            
                                xtype: 'box',   
                                id : 'browseImage',
                                 width:350,
                                 height:250,
                                fieldLabel : "",   
                                autoEl : {   
                                    tag : 'img',
                                    //type : 'image',   
                                    src : Ext.BLANK_IMAGE_URL,   
                                    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',   
                                    complete:'off',   
                                    id : 'imageBrowse'  
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
        this.form.findField('imageupload').on('render',function()   
         {     
             Ext.get('imageupload').on('change',function(field,newValue,oldValue )   
             {   
                 var url = 'file:///'+Ext.get('imageupload').dom.value;   
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
                                    Ext.get('imageBrowse').dom.src =Ext.get('imageupload').dom.files.item(0).getAsDataURL()   
                                 }     
                 }     
                 },this);     
                  },this);    
    }   
} 
   });
   
 parent.Ext.getCmp('addbutton').setHandler(function(){
   if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/product.do?methede=addEXT',
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
    Ext.Msg.alert('error','添加失败');
   }
   });
  } 
          }                  
         );
   
  });

   </script>
   </head>
   <body>
   <div id="dd"  ></div>
   </body>
  </html>