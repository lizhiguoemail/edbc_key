<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>添加文章栏目</title>
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
  width:635,
  items:[
  {xtype:'label',
  fieldLabel:'所属栏目',
  text:'${particle_column.name}',
  width: 150
  },
  {xtype:'textfield',
  allowBlank:false,
  blankText : "栏目名称不能为空",
  fieldLabel:'栏目名称',
  value:'${article_column.name}',
  name:'name',
  width: 150
  },
  {xtype:'textfield',
  fieldLabel:'栏目链接地址',
  value:'${article_column.url}',
  name:'url',
  width: 200
  },{
       xtype:'radiogroup',
       width: 500,   
       fieldLabel:'链接类型',
       allowBlank: false,
       items:[{boxLabel:'栏目文章列表',inputValue:'1', <c:if test="${article_column.urltype eq '1'}">checked: true,</c:if> name:'urltype',id:'t1'}, 
              {boxLabel:'栏目文章首条',inputValue:'2', <c:if test="${article_column.urltype eq '2'}">checked: true,</c:if> name:'urltype',id:'t2'}, 
              {boxLabel:'系统方法',inputValue:'5', <c:if test="${article_column.urltype eq '5'}">checked: true,</c:if> name:'urltype',id:'t5'},
              {boxLabel:'自定义输入',inputValue:'3', <c:if test="${article_column.urltype eq '3'}">checked: true,</c:if> name:'urltype',id:'t3'},
              {boxLabel:'无链接',inputValue:'4', <c:if test="${article_column.urltype eq '4'}">checked: true,</c:if> name:'urltype',id:'t4'} 
             ] 
       
       },{
       xtype:'radiogroup',
       width: 200,   
       fieldLabel:'打开方式',
       allowBlank: false,
       items:[{boxLabel:'本窗口打开',inputValue:'self', <c:if test="${article_column.target eq 'self'}">checked: true,</c:if> name:'target',id:'yes3'}, 
              {boxLabel:'新窗口打开',inputValue:'blank', <c:if test="${article_column.target eq 'blank'}">checked: true,</c:if> name:'target',id:'no3'} 
             ] 
       
       }
  ,{xtype:'numberfield',
  fieldLabel:'二级排序码',
  name:'sortcode2',
  value:'${article_column.sortcode2}',
  allowNegative:false, //不允许输入负号
 // allowDecimals:false,  //不允许有小数
  width:60
  }
  ]
   });
   
    parent.Ext.getCmp('updatebutton').setHandler(function(){
	  if(f.form.isValid()){
	    f.form.doAction('submit',{
	    url:'<%=path %>/article_column.do?methede=updateEXT2',
	    params:{id:'${article_column.id}'},
	    method : 'post',
	    waitTitle: "请稍候", 
	    waitMsg: '正在添加数据...', 
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
          } );
   
  });

   </script>
   </head>
   <body>
   <div id="dd" ></div>
   </body>
  </html>