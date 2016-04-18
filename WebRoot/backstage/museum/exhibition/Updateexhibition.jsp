<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>修改展览</title>
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
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:925,
  items:[
  {xtype:'textfield',
  fieldLabel:'展览名称',
  name:'name',
  value:'${exhibition.name}'
  }
  ,{xtype:'box',
  fieldLabel:'展览介绍',
  renderTo:'ee',
  id:'content',
  name:'content'
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  value:'${exhibition.sortcode}',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60
  }
  ]
   });
   
    var fckEditor = new FCKeditor("content");
    fckEditor.BasePath='<%=path%>/FCKeditor/';
	fckEditor.Heigth=320;
	fckEditor.Width=800;//设置FCK编辑器的宽度   
	fckEditor.ToolbarSet='Default';
	fckEditor.ReplaceTextarea();               
	
   parent.Ext.getCmp('updatebutton').setHandler(function(){
   var fck = FCKeditorAPI.GetInstance('content');
  fck.UpdateLinkedField();
   if(f.form.isValid()){
   f.form.doAction('submit',{
   url:'<%=path %>/exhibition.do?methede=updateEXT',
   params:{id:'${exhibition.id}'},
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
     });
  });

   </script>
   </head>
   <body>
    <div id="dd"  >
   <div id="ee">
   <textarea name="content"  id="content" style="height: 320px;width: 800px;">${exhibition.content}</textarea>
   </div>
   </div>
   </body>
  </html>