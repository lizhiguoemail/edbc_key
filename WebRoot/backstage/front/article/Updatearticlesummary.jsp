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
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_config.js"></script>  
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_all_min.js"></script>  
<link rel="stylesheet" type="text/css" href="<%=path %>/ueditor/themes/default/ueditor.css"/> 
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
  width:820,
  items:[
  {xtype:'box',
  fieldLabel:'摘要内容',
  renderTo:'ee',
  id:'ucontent',
  name:'ucontent' 
  },
  {xtype:'hidden',
  id:'content',
  name:'content' 
  }
  ]


   });
  
	
	   parent.Ext.getCmp('updatesummarybutton').setHandler(function(){
	     document.getElementById("content").value=editor.getContent();
		  if(f.form.isValid()){
		    f.form.doAction('submit',{
		    url:'<%=path %>/article.do?methede=updatesummaryEXT',
		    method : 'post',
		    params:{id:'${article.id}'},
		    waitTitle: "请稍候", 
		    waitMsg: '正在更新数据...', 
		    success:function(f,a){
		    Ext.Msg.alert('ok',a.result.msg);
		    var gb=parent.window.document.getElementById("gb");
		    gb.value="1";
		    var win = parent.Ext.getCmp('updatesummary');
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
 <div id="dd" >
   </div>
    <div id="ee">
   <textarea name="ucontent"  id="ucontent" style="height: 320px;width: 810px;">${article.summary }</textarea>
   </div>
   <script type="text/javascript"> 
    var editor = new baidu.editor.ui.Editor();  
    editor.render('ucontent');  
</script>  
   </body>
  </html>