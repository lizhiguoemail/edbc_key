<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>修改文章类</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/examples/ux/css/Spinner.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<!--<script type="text/javascript" src="<%=path %>/js/ExtHtmlEditor.js"></script>
--><script type="text/javascript" src="<%=path %>/FCKeditor/fckeditor.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/examples/ux/Spinner.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/examples/ux/SpinnerField.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/examples/spinner/spinner.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/src/locale/ext-lang-zh_CN.js"></script>
<style type="text/css">
.x-date-bottom {font-size:12px} 
</style>
<script type="text/javascript">
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 55,
  fileUpload : true,
  frame:true,
  width:960,
  items:[
  {xtype:'textfield',
  value:'${article.title}',
  fieldLabel:'文章标题',
  allowBlank:false,
  blankText : "文章标题不能为空",
  name:'title',
  width:600
  },{xtype:'datetimefield',
  fieldLabel:'开始时间',
  allowBlank:false,
  blankText : "开始时间不能为空",
  width:150,
  value:'${article.begindate}',
  format:"Y-n-j H:i",
  name:'begindate'
  },{xtype:'datetimefield',
  allowBlank:false,
  blankText : "结束时间不能为空",
  fieldLabel:'结束时间',
  width:150,
  value:'${article.enddate}',
  format:"Y-n-j H:i",
  name:'enddate'
  },
  {xtype:'box',
  fieldLabel:'文章内容',
  renderTo:'ee',
  id:'content',
  name:'content'
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
	    url:'<%=path %>/article.do?methede=updateExhibitionEXT',
	    method : 'post',
	    params:{id:'${article.id}'},
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
          }                  
         );
	                                   
  });
   </script>
   </head>
   <body>
    <input type="hidden" name="ischange" value="0" id="ischange">
   <div id="dd" style="padding-top: 5px;padding-left: 5px;" >
   <div id="ee">
   <textarea name="content"  id="content" style="height: 320px;width: 800px;">${article.content}</textarea>
   </div>
   </div>
   </body>
  </html>