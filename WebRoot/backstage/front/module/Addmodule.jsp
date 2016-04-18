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
		 <title>添加前台模块</title>
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
       labelWidth : 70,
       frame:true,
       width:765,
       items:[{
       xtype:'textfield',
       fieldLabel:'模块名称',
       name:'m_name',
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
       width:'250px'
       },{
       xtype:'radiogroup',
       width: 580,   
       fieldLabel:'链接类型',
       allowBlank: false,
       items:[{boxLabel:'模块文章首条',inputValue:'1', checked: true,name:'urltype',id:'m1'},
              {boxLabel:'模块栏目列表',inputValue:'2',name:'urltype',id:'m2'}, 
              {boxLabel:'模块文章列表',inputValue:'3',name:'urltype',id:'m3'},   
              {boxLabel:'系统方法',inputValue:'4',name:'urltype',id:'m4'},
              {boxLabel:'自定义链接',inputValue:'6',name:'urltype',id:'m6'},
              {boxLabel:'无链接',inputValue:'5',name:'urltype',id:'m5'}  
             ] 
       
       },{
       xtype:'radiogroup',
       width: 200,   
       fieldLabel:'打开方式',
       allowBlank: false,
       items:[{boxLabel:'本窗口打开',inputValue:'self', checked: true,name:'target',id:'yes3'}, 
              {boxLabel:'新窗口打开',inputValue:'_blank',name:'target',id:'no3'} 
             ] 
       
       },{
       xtype:'radiogroup',
       width: 100,   
       fieldLabel:'是否隐藏',
       allowBlank: false,
       items:[{boxLabel:'否',inputValue:'否', checked: true,name:'ishidden',id:'no'}, 
              {boxLabel:'是',inputValue:'是',name:'ishidden',id:'yes'} 
             ] 
       
       },{
       xtype:'radiogroup',
       width: 100,   
       fieldLabel:'首页菜单',
       allowBlank: false,
       items:[{boxLabel:'是',inputValue:'是', name:'ismenu',checked: true,id:'yes2'}, 
              {boxLabel:'否',inputValue:'否',name:'ismenu',id:'no2'} 
             ] 
       
       },{
       xtype:'numberfield',
       fieldLabel:'排序码',
       name:'sortcode',
       allowNegative:false, //不允许输入负号
     // allowDecimals:false,  //不允许有小数
      width:60
       }
       ]
       });
       
        parent.Ext.getCmp('addbutton').setHandler(function(){
       if(f.form.isValid()){
                  //提交到服务器操作
                  f.form.doAction('submit',{
                  url:'<%=path %>/front_module.do?methede=addEXT',
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在添加数据...', 
                  //提交成功的回调函数
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
	<div id="dd" ></div>
	</body>
</html>

