<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>修改友情链接</title>
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
  labelWidth : 80,
  frame:true,
  width:385,
  height:130,
  items:[
  {xtype:'textfield',
  fieldLabel:'链接名称',
   allowBlank:false,
  blankText : "链接名称不能为空",
  name:'name',
   width:180,
  value:'${friendlink.name}'
  }
  ,{xtype:'textfield',
  fieldLabel:'链接地址',
  name:'linkurl',
   allowBlank:false,
  blankText : "链接地址不能为空",
   width:250,
  value:'${friendlink.linkurl}'
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60,
  value:'${friendlink.sortcode}'
  }
  ]
   });
   
   	parent.Ext.getCmp('updatebutton').setHandler(function(){
  if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/friendlink.do?methede=updateEXT',
    params:{id:'${friendlink.id}'},
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
   <div id="dd" ></div>
   </body>
  </html>