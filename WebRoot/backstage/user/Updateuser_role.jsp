<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/extjs/examples/ux/css/MultiSelect.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/extjs/examples/shared/examples.css"/>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/examples/ux/MultiSelect.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/examples/ux/ItemSelector.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/examples/shared/examples.js"></script>
     <script type="text/javascript">
     Ext.onReady(function(){
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side';
    var ds = new Ext.data.ArrayStore({
        data: [
        <c:set var="isfirst" value="true" />
        <c:forEach items="${roleslist}" var="i" varStatus="stat">
        <c:set var="isExist" value="false" />
        	<c:forEach items="${userbean.roles}" var="j">
		  		<c:if test="${i.id == j.id }">
  					<c:set var="isExist" value="true" />
  				</c:if>
  			</c:forEach>
  			<c:if test="${isExist == 'false' }">
        <c:if test="${isfirst==false}">,</c:if><c:if test="${isfirst==true}"><c:set var="isfirst" value="false" /></c:if>['${i.id }','${i.rolesname }']
            </c:if>
        </c:forEach>
        ],
        fields: ['value','text'],
        sortInfo: {
            field: 'value',
            direction: 'ASC'
        }
    });
    
     var ds2 = new Ext.data.ArrayStore({
        data: [
      <c:forEach items="${userbean.roles}" var="role" varStatus="stat">
        ['${role.id }','${role.rolesname }']<c:if test="${!stat.last}">,</c:if>   
        </c:forEach>
        ],
        fields: ['value','text'],
        sortInfo: {
            field: 'value',
            direction: 'ASC'
        }
    });

    /*
     * Ext.ux.form.ItemSelector Example Code
     */
    var isForm = new Ext.form.FormPanel({
        title: '请给<font color="red">${userbean.nickname}</font>  分配角色',
        width:600,
        bodyStyle: 'padding:10px;',
        renderTo: 'itemselector',
        labelWidth : 68,
        items:[{
            xtype: 'itemselector',
            name: 'rolesid',
	        imagePath: '<%=path %>/extjs/examples/ux/images/',
            multiselects: [{
                width: 200,
                height: 350,
                store: ds,
                displayField: 'text',
                valueField: 'value'
            },{
                width: 200,
                height: 350,
                store: ds2,
                displayField: 'text',
                valueField: 'value',
                tbar:[{
                    text: '清除',
                    handler:function(){
	                    isForm.getForm().findField('itemselector').reset();
	                }
                }]
            }]
        },
        {
       xtype:'checkbox',
       fieldLabel:'系统管理员',
       <c:if test="${userbean.isadmin eq '1'}">
       checked: true,   
       </c:if> 
       name:'isadmin'
        },
        {
       xtype:'checkbox',
       fieldLabel:'论坛管理员',
       <c:if test="${userbean.bbs_admin eq '1'}">
       checked: true,   
       </c:if> 
       name:'bbs_admin'
        }
        ]
    });

        parent.Ext.getCmp('rolebutton').setHandler(function(){
         if(isForm.form.isValid()){
                  //提交到服务器操作
                  isForm.form.doAction('submit',{
                  url:'<%=path %>/user.do?methede=updateUserRoleEXT',
                  method:'post',//提交方法post或get
                  params:{userid:'${userbean.id}'},
                  waitTitle: "请稍候", 
                  waitMsg: '正在提交数据...', 
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok','角色配置成功');
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error','用户角色配置失败');
			       }
                     });
                  }  
          } );


});
     </script>

  </head>

  <body>
    <div id="itemselector" class="demo-ct"></div>  </body>
</html>
