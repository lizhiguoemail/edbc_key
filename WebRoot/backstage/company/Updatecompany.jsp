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
		 <title>编辑单位</title>
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
       var company_form=new Ext.FormPanel({
       url:'<%=path %>/company.do?methede=updateCompanyEXT',
       method : 'post',
       renderTo:document.body,  
       title:'单位信息', 
       labelWidth : 60,
       frame:true,
        items: [{
            layout:'column',
            items:[{
                columnWidth:.5,
                layout: 'form',
                items: [
				{
				    xtype:'hidden', 
				    fieldLabel: '单位ID',
				    value:'${company.id}',
				   	name: 'id',
				    id: 'id',
				    anchor:'95%'
				},
                {
                    xtype:'textfield',
                    fieldLabel: '单位编号',
                    value:'${company.code}',
                    name: 'code',
                    id: 'code',
                    anchor:'95%'
                },{
                    xtype:'textfield',
                    id: 'companyname',
                    fieldLabel: '公司名称',       
                    name:'companyname',
       				value:'${company.companyname}',
                    allowBlank:false,
                    anchor:'95%'
                },{
                    xtype:'textfield',
                    fieldLabel: '法人',
                    name:'legalperson',
       				value:'${company.legalperson}',
                    id: 'legalperson',
                    anchor:'95%'
                },{
                    xtype:'textfield',
                    fieldLabel: '电话',
                    name:'phone',
       				value:'${company.phone}',
                    id: 'phone',
                    anchor:'95%'
                }]
            },{
                columnWidth:.5,
                layout: 'form',
                items: [ {
                	fieldLabel: '成立时间',
                	xtype:'datefield',
                    format:'Y-m-d', 
                   	name:'companycreatedate',
       				value:'${company.companycreatedate}',
                    id: 'companycreatedate'
                },{
                    xtype:'textfield',
                    fieldLabel: '传真',
                  	 name:'fax',
       				value:'${company.fax}',
                    id: 'fax',
                    anchor:'95%'
                },{
                    xtype:'textfield',
                    fieldLabel: 'Logo',
                    name:'logo',
       				value:'${company.logo}',
                    id: 'logo',
                    anchor:'95%'
                }
                , {
                    xtype:'textfield',
                    fieldLabel: '公司网址',
                    name:'url',
       				value:'${company.url}',
                    id: 'url',
                    anchor:'95%'
                }
                ]
            },{
                columnWidth:1,
                layout: 'form',
                items: [ {
                    xtype:'textfield',
                    fieldLabel: '公司地址',
                  	 name:'address',
       				value:'${company.address}',
                    id: 'address',
                    anchor:'95%'
                }
                ]
            }]
        },{xtype:'box',
			  fieldLabel:'公司描述',
			  renderTo:'ee',
			  id:'ucontent',
			  name:'ucontent' 
			  },
			   {xtype:'hidden',
			  id:'introduction',
			  name:'introduction' 
			  }],

        buttons: [{
            text: '保存',
            handler:function(){  	
             document.getElementById("introduction").value=editor.getContent();
         	if(company_form.form.isValid()){
                  //提交到服务器操作
                  company_form.form.doAction('submit',{
                  url:'<%=path %>/company.do?methede=updatecompanyEXT',
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在操作数据...', 
                  params:{id:'${company.id}'},
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok',a.result.msg);
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error','单位编辑失败');
			       }
                     });
                  } 
            }
        }]
       });
     });
     </script>
	</head>
	<body style="background-color: #DFE8F6;">
	<div id="dd"  ></div>
	 <div id="ee">
   <textarea name="ucontent"  id="ucontent" style="height: 200px;width: 95%;">${company.introduction }</textarea>
   </div>
<script type="text/javascript"> 
    var editor = new baidu.editor.ui.Editor();  
    editor.render('ucontent');  
</script>  
	</body>
</html>

