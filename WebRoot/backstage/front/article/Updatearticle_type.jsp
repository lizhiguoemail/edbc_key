<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		 <title>修改文章类别</title>
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
       var company_form=new Ext.FormPanel({
        method : 'post',
       renderTo:'dd',   
       labelWidth : 80,
       frame:true,
       width:485,
       height:155,
       items:[{
       xtype:'textfield',
       fieldLabel:'文章类别名称',
       name:'type_name',
       value:'${base_type.type_name}',
       allowBlank:false,
       blankText : "文章类别名称不能为空",
       listeners:{   
       render:function(config){   
        var parentNode=document.getElementById(config.id).parentNode;   
        var newChild=document.createElement('span');   
            newChild.innerHTML="<font color='red'>*</font>"  
            parentNode.appendChild(newChild);   
            }   
  
}  
       },{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
 allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60,
  value:'${base_type.sortcode}'
  }
       ]
       });
       
        parent.Ext.getCmp('updatebutton').setHandler(function(){
        if(company_form.form.isValid()){
                  //提交到服务器操作
                  company_form.form.doAction('submit',{
                  url:'<%=path %>/base_type.do?methede=updateBase_typeEXT&type_type=1',
                  params:{oid:'${base_type.id}'},
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在更新数据...', 
                  //提交成功的回调函数
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
	<div id="dd"  ></div>
	</body>
</html>

