<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>修改刊物</title>
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
  width:485,
  height:160,
  items:[
  {xtype:'textfield',
  fieldLabel:'标题',
  allowBlank:false,
  blankText : "标题不能为空",
  name:'title',
  value:'${publications.title}'
  }
 ,{xtype:'textfield',
  fieldLabel:'附件',
  name:'imageupload',
  inputType : "file",   
  fieldLabel: '上传附件',   
  id:'imageupload'                          
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  value:'${publications.sortcode}',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60
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
                var ischange=document.getElementById("ischange");
	           ischange.value="1";    
                 },this);     
                  },this);    
    }   
} 
   });
   
   parent.Ext.getCmp('updatebutton').setHandler(function(){
	  if(f.form.isValid()){
    var ischange=document.getElementById("ischange").value;
    f.form.doAction('submit',{
    url:'<%=path %>/publications.do?methede=updateEXT&ischange='+ischange,
    params:{id:'${publications.id}'},
    method : 'post',
    waitTitle: "请稍候", 
    waitMsg: '正在更新数据...', 
    success:function(f,a){
    Ext.Msg.alert('ok',a.result.msg);
    var gb=parent.window.document.getElementById("gb");
    gb.value="1";
    var win = parent.Ext.getCmp('updatenew');
    if (win) {win.close();}
    },
  failure:function(f,a){
    Ext.Msg.alert('error','更新失败');
   }
   });
  }
          } ); 
   
  });

   </script>
   </head>
   <body>
    <input type="hidden" name="ischange" value="0" id="ischange">
   <div id="dd"  ></div>
   </body>
  </html>