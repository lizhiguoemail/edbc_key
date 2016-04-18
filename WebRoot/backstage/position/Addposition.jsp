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
		 <title>添加职位</title>
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
       
        //  第一个下拉框   
	      var departmentStore = new Ext.data.Store({   
               proxy: new Ext.data.HttpProxy({   
               url: '<%=path %>/department.do?methede=listDepartmentForSelectEXT&isno=1'  
               }),   
               reader: new Ext.data.JsonReader({   
                root: 'rows',   
                id: 'ds'  
                }, [   
		        {name: 'id', mapping: 'id'},   
		        {name: 'departmentname', mapping: 'departmentname'}   
		       ])   
		       }); 
		       departmentStore.load();
		       
       
       var positionform=new Ext.FormPanel({
       method : 'post',
       renderTo:'dd',   
       labelWidth : 90,
       frame:true,
       width:495,
       height:230,
       items:[{
       xtype:'textfield',
       id:'positionname',
       fieldLabel:'职位名称',
       name:'positionname',
       allowBlank:false,
       width: 200,   
       blankText : "职位名称不能为空"
       }, 
       {
       xtype:'combo',
       fieldLabel: '请选择部门',
           store: departmentStore,   
           valueField :"id",   
           displayField:"departmentname",   
          //数据是在本地   
           mode: 'local',   
           forceSelection: true,//必须选择一项   
           emptyText:'请选择部门...',//默认值   
           hiddenName:'departmentid',//hiddenName才是提交到后台的input的name   
           editable: false,//不允许输入   
           triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。   
           //allowBlank:false,//该选项值不能为空   
           id : 'departmentforid',   
           name: 'departmentforname',   
           width: 200,
           allowBlank:false,
           blankText : "部门不能为空"
       },
       {
       xtype:'textfield',
       width:250,
       fieldLabel:'职位描述',
       name:'introduction'
       }
       ]
       });
       
        parent.Ext.getCmp('addbutton').setHandler(function(){
         if(positionform.form.isValid()){
                  //提交到服务器操作
                  positionform.form.doAction('submit',{
                  url:'<%=path %>/position.do?methede=addPositionEXT',
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在添加职位...', 
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok','职位添加成功');
			       var gb=parent.window.document.getElementById("gb");
			       gb.value="1";
			        var win = parent.Ext.getCmp('addposition');
                    if (win) {win.close();}
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error','职位添加失败');
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

