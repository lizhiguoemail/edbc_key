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
		 <title>修改前台模块</title>
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
       labelWidth : 70,
       frame:true,
       width:765,
       items:[{
       xtype:'textfield',
       fieldLabel:'模块名称',
       name:'m_name',
       value:'${front_module.m_name}',
       allowBlank:false,
       blankText : "模块名称不能为空",
       listeners:{   
       render:function(config){   
        var parentNode=document.getElementById(config.id).parentNode;   
        var newChild=document.createElement('span');   
            newChild.innerHTML="<font color='red'>*</font>"  
            parentNode.appendChild(newChild);   
            }   
  
}  
       },{
       xtype:'textfield',
       fieldLabel:'模块链接',
       name:'m_url',
       value:'${front_module.m_url}',
       width:'250px'
       },{
       xtype:'radiogroup',
       width: 580,   
       fieldLabel:'链接类型',
       allowBlank: false,
        items:[{boxLabel:'模块文章首条',inputValue:'1', <c:if test="${front_module.urltype eq '1'}">checked: true,</c:if> name:'urltype',id:'m1'},
              {boxLabel:'模块栏目列表',inputValue:'2', <c:if test="${front_module.urltype eq '2'}">checked: true,</c:if> name:'urltype',id:'m2'}, 
              {boxLabel:'模块文章列表',inputValue:'3', <c:if test="${front_module.urltype eq '3'}">checked: true,</c:if> name:'urltype',id:'m3'},   
              {boxLabel:'系统方法',inputValue:'4', <c:if test="${front_module.urltype eq '4'}">checked: true,</c:if> name:'urltype',id:'m4'},
              {boxLabel:'自定义链接',inputValue:'6', <c:if test="${front_module.urltype eq '5'}">checked: true,</c:if> name:'urltype',id:'m6'},
              {boxLabel:'无链接',inputValue:'5', <c:if test="${front_module.urltype eq '5'}">checked: true,</c:if> name:'urltype',id:'m5'}  
             ] 
       
       },{
       xtype:'radiogroup',
       width: 200,   
       fieldLabel:'打开方式',
       allowBlank: false,
       items:[{boxLabel:'本窗口打开',inputValue:'self', <c:if test="${front_module.target eq 'self'}">checked: true,</c:if> name:'target',id:'yes3'}, 
              {boxLabel:'新窗口打开',inputValue:'_blank', <c:if test="${front_module.target eq 'blank'}">checked: true,</c:if> name:'target',id:'no3'} 
             ] 
       
       },{
       xtype:'radiogroup',
       width: 100,   
       fieldLabel:'是否隐藏',
       allowBlank: false,
       items:[{boxLabel:'否',inputValue:'否', <c:if test="${front_module.ishidden eq '否'}">checked: true,</c:if> name:'ishidden',id:'no'}, 
              {boxLabel:'是',inputValue:'是', <c:if test="${front_module.ishidden eq '是'}">checked: true,</c:if> name:'ishidden',id:'yes'} 
             ] 
       
       },{
       xtype:'radiogroup',
       width: 100,   
       fieldLabel:'首页菜单',
       allowBlank: false,
       items:[{boxLabel:'是',inputValue:'是', name:'ismenu',<c:if test="${front_module.ismenu eq '是'}">checked: true,</c:if>id:'yes2'}, 
              {boxLabel:'否',inputValue:'否',name:'ismenu',<c:if test="${front_module.ismenu eq '否'}">checked: true,</c:if>id:'no2'} 
             ] 
       
       },{
       xtype:'numberfield',
       fieldLabel:'排序码',
       name:'sortcode',
       value:'${front_module.sortcode}',
       allowNegative:false, //不允许输入负号
	  //allowDecimals:false,  //不允许有小数
	  width:60
       }
       ]
      
       });
       
       parent.Ext.getCmp('updatebutton').setHandler(function(){
        if(company_form.form.isValid()){
                  //提交到服务器操作
                  company_form.form.doAction('submit',{
                  url:'<%=path %>/front_module.do?methede=updateEXT',
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在更新数据...', 
                  params:{id:'${front_module.id}'},
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
	<div id="dd" ></div>
	</body>
</html>

