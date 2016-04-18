<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>修改专家表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<script type="text/javascript" src="<%=path %>/FCKeditor/fckeditor.js"></script>
<script type="text/javascript">
  //上传图片类型   
 var img_reg = /\.([jJ][pP][gG]){1}$|\.([jJ][pP][eE][gG]){1}$|\.([gG][iI][fF]){1}$|\.([pP][nN][gG]){1}$|\.([bB][mM][pP]){1}$/ 
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  var f=new Ext.FormPanel({
  method : 'post',
  fileUpload : true,
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:800,
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
            
            { width : 530, 
          items:[
              {xtype:'textfield',
              id:'name',
  fieldLabel:'人物名称 ',
  value:'${experts.name}',
  allowBlank:false,
  blankText : "人物名称不能为空",
  width:150,
  name:'name'
  },{xtype:'textfield',
  fieldLabel:'人物头像',
  name:'imageupload',
  inputType : "file",   
  fieldLabel: '上传头像',   
  id:'imageupload'                          
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  value:'${experts.sortcode}',
  width:60,
  name:'sortcode'
  } 
            ]
            }, { 
          items:[
            {   
            xtype:'panel',
            frame:true,
            layout: 'form',
            width:150,
            height:190,
            autoScoll:true,
            items:[{
            
                                xtype: 'box',   
                                id : 'browseImage',
                                 width:150,
                                 height:190,
                                fieldLabel : "",   
                                autoEl : {   
                                    tag : 'img',
                                    //type : 'image',   
                                    src : '<%=path %>/upload/experts/${experts.pic}',   
                                    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',   
                                    complete:'off',   
                                    id : 'imageBrowse'  
                                    }   
                            }]}   

            ]
            } ,{
             xtype:'hidden',
            id : "summary",
            name:"summary"
        } ,{xtype:'box',
  fieldLabel:'人物摘要',
  width:800,
  renderTo:'ee',
  id:'content',
  name:'content'
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
                var ischange=document.getElementById("ischange");
	           ischange.value="1";    
                 }     
                 },this);     
                  },this);    
    }   
} 
   });
    var fckEditor = new FCKeditor("content");
    fckEditor.BasePath='<%=path%>/FCKeditor/';
	fckEditor.Width=800;//设置FCK编辑器的宽度   
	fckEditor.ToolbarSet='Default';
	fckEditor.ReplaceTextarea();      
	
   
  });

   </script>
   </head>
   <body>
   <input type="hidden" name="ischange" value="0" id="ischange">
   <div id="dd" >
   <div id="ee">
   <textarea name="content"  id="content" style="width: 800px;" >${experts.summary}</textarea>
   </div>
   </div>
   </body>
  </html>