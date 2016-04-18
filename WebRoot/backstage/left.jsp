<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html> 
	<head>
    <title>DBC后台管理系统模板</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
     <script type="text/javascript"><!-- 014 -->
     Ext.onReady(function(){
	var root = new Ext.tree.AsyncTreeNode( {
		    id:'1_root',
            text:'后台管理',
            iconCls : 'icon_treeroot',
            nodeType: 'async',
            children:[   
              <c:if test="${((fn:contains(userinfo.systemstopmodules,',01,')==false)&&(fn:contains(userinfo.systempermit,',01,')==false))||((fn:contains(userinfo.systemstopmodules,',01,')==false)&&(fn:contains(userinfo.systempermit,',01,')==true)&&(fn:contains(userinfo.allpermits,',01,')==true))||userinfo.isadmin eq '1'}">  
              {text: '互动平台',id: '01',iconCls : 'icon_hdpt',
              children: [
              <c:if test="${(fn:contains(userinfo.systemstopmodules,',11,')==false)||userinfo.isadmin eq '1'}">  
              {text:'  未读消息  ',leaf:true,iconCls : 'icon_wdxx',id:'11'}, 
              </c:if> 
              <c:if test="${(fn:contains(userinfo.systemstopmodules,',12,')==false)||userinfo.isadmin eq '1'}">          
			  {text:'  已读消息  ',leaf:true,iconCls : 'icon_ydxx',id:'12'} , 
			  </c:if> 
              <c:if test="${(fn:contains(userinfo.systemstopmodules,',13,')==false)||userinfo.isadmin eq '1'}"> 
			  {text:'  给管理员留言  ',leaf:true,iconCls : 'icon_ly',id:'13'},
			  </c:if> 
              <c:if test="${(fn:contains(userinfo.systemstopmodules,',14,')==false)||userinfo.isadmin eq '1'}"> 
			  {text:'  发送消息  ',leaf:true,iconCls : 'icon_fsxx',id:'14'},
			  </c:if> 
              <c:if test="${(fn:contains(userinfo.systemstopmodules,',15,')==false)||userinfo.isadmin eq '1'}"> 
			  {text:'  已发送  ',leaf:true,iconCls : 'icon_yfs',id:'15'},
			  </c:if> 
			  {leaf:true,hidden:true}
			  ]},
			  </c:if>
			   <c:if test="${((fn:contains(userinfo.systemstopmodules,',02,')==false)&&(fn:contains(userinfo.systempermit,',02,')==false))||((fn:contains(userinfo.systemstopmodules,',02,')==false)&&(fn:contains(userinfo.systempermit,',02,')==true)&&(fn:contains(userinfo.allpermits,',02,')==true))||userinfo.isadmin eq '1'}">  
			  {text: '用户管理',iconCls : 'icon_yhgl',id: '02',
  			children: [
  			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',21,')==false)&&(fn:contains(userinfo.systempermit,',21,')==false))||((fn:contains(userinfo.systemstopmodules,',21,')==false)&&(fn:contains(userinfo.systempermit,',21,')==true)&&(fn:contains(userinfo.allpermits,',21,')==true))||userinfo.isadmin eq '1'}">
  			 {text:'  用户列表  ',iconCls : 'icon_yhlb',leaf:true,id:'21'},
  			  </c:if> 
  			   <c:if test="${((fn:contains(userinfo.systemstopmodules,',22,')==false)&&(fn:contains(userinfo.systempermit,',22,')==false))||((fn:contains(userinfo.systemstopmodules,',22,')==false)&&(fn:contains(userinfo.systempermit,',22,')==true)&&(fn:contains(userinfo.allpermits,',22,')==true))||userinfo.isadmin eq '1'}">
  			 {text:' 需审核用户列表  ',iconCls : 'icon_yhlb',leaf:true,id:'22'},
  			  </c:if> 
  			  {leaf:true,hidden:true}
  			  ]}, 
  			 </c:if>
  			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',03,')==false)&&(fn:contains(userinfo.systempermit,',03,')==false))||((fn:contains(userinfo.systemstopmodules,',03,')==false)&&(fn:contains(userinfo.systempermit,',03,')==true)&&(fn:contains(userinfo.allpermits,',03,')==true))||userinfo.isadmin eq '1'}">  
				{text: '日志管理',iconCls : 'icon_rzgl',id : '03',
			children: [
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',31,')==false)&&(fn:contains(userinfo.systempermit,',31,')==false))||((fn:contains(userinfo.systemstopmodules,',31,')==false)&&(fn:contains(userinfo.systempermit,',31,')==true)&&(fn:contains(userinfo.allpermits,',31,')==true))||userinfo.isadmin eq '1'}">  
			{text:'  日志查看  ',leaf:true,iconCls : 'icon_rzck',id:'31'},
			 </c:if>
			 {leaf:true,hidden:true}
			]}, 
			 </c:if>
			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',04,')==false)&&(fn:contains(userinfo.systempermit,',04,')==false))||((fn:contains(userinfo.systemstopmodules,',04,')==false)&&(fn:contains(userinfo.systempermit,',04,')==true)&&(fn:contains(userinfo.allpermits,',04,')==true))||userinfo.isadmin eq '1'}">
			 {text: '系统配置',iconCls : 'icon_xtpz',id : '04',
			children: [
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',41,')==false)&&(fn:contains(userinfo.systempermit,',41,')==false))||((fn:contains(userinfo.systemstopmodules,',41,')==false)&&(fn:contains(userinfo.systempermit,',41,')==true)&&(fn:contains(userinfo.allpermits,',41,')==true))||userinfo.isadmin eq '1'}">
			{text:'  后台模块配置  ',iconCls : 'icon_mkpz',leaf:true,id:'41'},
			 </c:if>
			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',42,')==false)&&(fn:contains(userinfo.systempermit,',42,')==false))||((fn:contains(userinfo.systemstopmodules,',42,')==false)&&(fn:contains(userinfo.systempermit,',42,')==true)&&(fn:contains(userinfo.allpermits,',42,')==true))||userinfo.isadmin eq '1'}">
			{text:'  权限配置  ',iconCls : 'icon_permit',leaf:true,id:'42'},
			 </c:if>
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',43,')==false)&&(fn:contains(userinfo.systempermit,',43,')==false))||((fn:contains(userinfo.systemstopmodules,',43,')==false)&&(fn:contains(userinfo.systempermit,',43,')==true)&&(fn:contains(userinfo.allpermits,',43,')==true))||userinfo.isadmin eq '1'}">
			{text:'  角色配置  ',leaf:true,iconCls : 'icon_role',id:'43'},
			 </c:if>
			 {leaf:true,hidden:true}
			]}, 
		    </c:if>				
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',05,')==false)&&(fn:contains(userinfo.systempermit,',05,')==false))||((fn:contains(userinfo.systemstopmodules,',05,')==false)&&(fn:contains(userinfo.systempermit,',05,')==true)&&(fn:contains(userinfo.allpermits,',05,')==true))||userinfo.isadmin eq '1'}">			
			{text: '单位部门管理',iconCls : 'icon_dwbm',id : '05',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',51,')==false)&&(fn:contains(userinfo.systempermit,',51,')==false))||((fn:contains(userinfo.systemstopmodules,',51,')==false)&&(fn:contains(userinfo.systempermit,',51,')==true)&&(fn:contains(userinfo.allpermits,',51,')==true))||userinfo.isadmin eq '1'}">
			{text:'  单位管理  ',iconCls : 'icon_dwgl',leaf:true,id:'51'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',52,')==false)&&(fn:contains(userinfo.systempermit,',52,')==false))||((fn:contains(userinfo.systemstopmodules,',52,')==false)&&(fn:contains(userinfo.systempermit,',52,')==true)&&(fn:contains(userinfo.allpermits,',52,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  部门管理  ',leaf:true,iconCls : 'icon_bmgl',id:'52'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',53,')==false)&&(fn:contains(userinfo.systempermit,',53,')==false))||((fn:contains(userinfo.systemstopmodules,',53,')==false)&&(fn:contains(userinfo.systempermit,',53,')==true)&&(fn:contains(userinfo.allpermits,',53,')==true))||userinfo.isadmin eq '1'}">
			{text:'  职位管理  ',leaf:true,iconCls : 'icon_zwgl',id:'53'},
			</c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',07,')==false)&&(fn:contains(userinfo.systempermit,',07,')==false))||((fn:contains(userinfo.systemstopmodules,',07,')==false)&&(fn:contains(userinfo.systempermit,',07,')==true)&&(fn:contains(userinfo.allpermits,',07,')==true))||userinfo.isadmin eq '1'}">			
			{text: '前台网站设置',iconCls : 'icon_qtwz',id : '07',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',71,')==false)&&(fn:contains(userinfo.systempermit,',71,')==false))||((fn:contains(userinfo.systemstopmodules,',71,')==false)&&(fn:contains(userinfo.systempermit,',71,')==true)&&(fn:contains(userinfo.allpermits,',71,')==true))||userinfo.isadmin eq '1'}">
			{text:'  模块管理  ',iconCls : 'icon_mkgl',leaf:true,id:'71'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',72,')==false)&&(fn:contains(userinfo.systempermit,',72,')==false))||((fn:contains(userinfo.systemstopmodules,',72,')==false)&&(fn:contains(userinfo.systempermit,',72,')==true)&&(fn:contains(userinfo.allpermits,',72,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  栏目管理  ',leaf:true,iconCls : 'icon_lmgl',id:'72'},
			</c:if>	
		    <c:if test="${((fn:contains(userinfo.systemstopmodules,',73,')==false)&&(fn:contains(userinfo.systempermit,',73,')==false))||((fn:contains(userinfo.systemstopmodules,',73,')==false)&&(fn:contains(userinfo.systempermit,',73,')==true)&&(fn:contains(userinfo.allpermits,',73,')==true))||userinfo.isadmin eq '1'}">
			{text:'  文章类别管理  ',leaf:true,iconCls : 'icon_wzlb',id:'73'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',74,')==false)&&(fn:contains(userinfo.systempermit,',74,')==false))||((fn:contains(userinfo.systemstopmodules,',74,')==false)&&(fn:contains(userinfo.systempermit,',74,')==true)&&(fn:contains(userinfo.allpermits,',74,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  文章管理  ',leaf:true,iconCls : 'icon_wzgl',id:'74'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',75,')==false)&&(fn:contains(userinfo.systempermit,',75,')==false))||((fn:contains(userinfo.systemstopmodules,',75,')==false)&&(fn:contains(userinfo.systempermit,',75,')==true)&&(fn:contains(userinfo.allpermits,',75,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  友情链接管理  ',leaf:true,iconCls : 'icon_yqljgl',id:'75'},
			</c:if>
			{leaf:true,hidden:true}
			]}, 
			 </c:if>
			 
			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',010,')==false)&&(fn:contains(userinfo.systempermit,',010,')==false))||((fn:contains(userinfo.systemstopmodules,',010,')==false)&&(fn:contains(userinfo.systempermit,',010,')==true)&&(fn:contains(userinfo.allpermits,',010,')==true))||userinfo.isadmin eq '1'}">			
			{text: '艺术与考古博物馆管理',iconCls : 'icon_qtwz',id : '010',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',105,')==false)&&(fn:contains(userinfo.systempermit,',105,')==false))||((fn:contains(userinfo.systemstopmodules,',105,')==false)&&(fn:contains(userinfo.systempermit,',105,')==true)&&(fn:contains(userinfo.allpermits,',105,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  展览管理  ',leaf:true,iconCls : 'icon_wzgl',id:'105'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',106,')==false)&&(fn:contains(userinfo.systempermit,',106,')==false))||((fn:contains(userinfo.systemstopmodules,',106,')==false)&&(fn:contains(userinfo.systempermit,',106,')==true)&&(fn:contains(userinfo.allpermits,',106,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  展品管理  ',leaf:true,iconCls : 'icon_wzgl',id:'106'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',101,')==false)&&(fn:contains(userinfo.systempermit,',101,')==false))||((fn:contains(userinfo.systemstopmodules,',101,')==false)&&(fn:contains(userinfo.systempermit,',101,')==true)&&(fn:contains(userinfo.allpermits,',101,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  展览活动管理  ',leaf:true,iconCls : 'icon_wzgl',id:'101'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',102,')==false)&&(fn:contains(userinfo.systempermit,',102,')==false))||((fn:contains(userinfo.systemstopmodules,',102,')==false)&&(fn:contains(userinfo.systempermit,',102,')==true)&&(fn:contains(userinfo.allpermits,',102,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  专家名录  ',leaf:true,iconCls : 'icon_wzgl',id:'102'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',103,')==false)&&(fn:contains(userinfo.systempermit,',103,')==false))||((fn:contains(userinfo.systemstopmodules,',103,')==false)&&(fn:contains(userinfo.systempermit,',103,')==true)&&(fn:contains(userinfo.allpermits,',103,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  邮件订阅列表  ',leaf:true,iconCls : 'icon_wzgl',id:'103'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',104,')==false)&&(fn:contains(userinfo.systempermit,',104,')==false))||((fn:contains(userinfo.systemstopmodules,',104,')==false)&&(fn:contains(userinfo.systempermit,',104,')==true)&&(fn:contains(userinfo.allpermits,',104,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  刊物列表  ',leaf:true,iconCls : 'icon_wzgl',id:'104'},
			</c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>
			 
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',014,')==false)&&(fn:contains(userinfo.systempermit,',014,')==false))||((fn:contains(userinfo.systemstopmodules,',014,')==false)&&(fn:contains(userinfo.systempermit,',014,')==true)&&(fn:contains(userinfo.allpermits,',014,')==true))||userinfo.isadmin eq '1'}">			
			{text: '工作进度管理',iconCls : 'icon_qtwz',id : '014',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',141,')==false)&&(fn:contains(userinfo.systempermit,',141,')==false))||((fn:contains(userinfo.systemstopmodules,',141,')==false)&&(fn:contains(userinfo.systempermit,',141,')==true)&&(fn:contains(userinfo.allpermits,',141,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  任务列表  ',leaf:true,iconCls : 'icon_wzgl',id:'141'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',142,')==false)&&(fn:contains(userinfo.systempermit,',142,')==false))||((fn:contains(userinfo.systemstopmodules,',142,')==false)&&(fn:contains(userinfo.systempermit,',142,')==true)&&(fn:contains(userinfo.allpermits,',142,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  任务进度  ',leaf:true,iconCls : 'icon_wzgl',id:'142'},
			</c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>
			 
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',011,')==false)&&(fn:contains(userinfo.systempermit,',011,')==false))||((fn:contains(userinfo.systemstopmodules,',011,')==false)&&(fn:contains(userinfo.systempermit,',011,')==true)&&(fn:contains(userinfo.allpermits,',011,')==true))||userinfo.isadmin eq '1'}">			
			{text: '甲骨文系统',iconCls : 'icon_qtwz',id : '011',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',111,')==false)&&(fn:contains(userinfo.systempermit,',111,')==false))||((fn:contains(userinfo.systemstopmodules,',111,')==false)&&(fn:contains(userinfo.systempermit,',111,')==true)&&(fn:contains(userinfo.allpermits,',111,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  自造字管理  ',leaf:true,iconCls : 'icon_wzgl',id:'111'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',112,')==false)&&(fn:contains(userinfo.systempermit,',112,')==false))||((fn:contains(userinfo.systemstopmodules,',112,')==false)&&(fn:contains(userinfo.systempermit,',112,')==true)&&(fn:contains(userinfo.allpermits,',112,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  甲骨文合集  ',leaf:true,iconCls : 'icon_wzgl',id:'112'},
			</c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>
			 
			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',09,')==false)&&(fn:contains(userinfo.systempermit,',09,')==false))||((fn:contains(userinfo.systemstopmodules,',09,')==false)&&(fn:contains(userinfo.systempermit,',09,')==true)&&(fn:contains(userinfo.allpermits,',09,')==true))||userinfo.isadmin eq '1'}">			
			{text: '资产管理',iconCls : 'icon_zcgl',id : '09',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',91,')==false)&&(fn:contains(userinfo.systempermit,',91,')==false))||((fn:contains(userinfo.systemstopmodules,',91,')==false)&&(fn:contains(userinfo.systempermit,',91,')==true)&&(fn:contains(userinfo.allpermits,',91,')==true))||userinfo.isadmin eq '1'}">
			{text:'  资产列表  ',iconCls : 'icon_cpdj',leaf:true,id:'91'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',92,')==false)&&(fn:contains(userinfo.systempermit,',92,')==false))||((fn:contains(userinfo.systemstopmodules,',92,')==false)&&(fn:contains(userinfo.systempermit,',92,')==true)&&(fn:contains(userinfo.allpermits,',92,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  资产使用记录  ',leaf:true,iconCls : 'icon_ckgl',id:'92'},
			</c:if>	
				<c:if test="${((fn:contains(userinfo.systemstopmodules,',93,')==false)&&(fn:contains(userinfo.systempermit,',93,')==false))||((fn:contains(userinfo.systemstopmodules,',93,')==false)&&(fn:contains(userinfo.systempermit,',93,')==true)&&(fn:contains(userinfo.allpermits,',93,')==true))||userinfo.isadmin eq '1'}">
			{text:'  资产交还记录  ',leaf:true,iconCls : 'icon_tiqu',id:'93'},
			</c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>		
			 
			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',08,')==false)&&(fn:contains(userinfo.systempermit,',08,')==false))||((fn:contains(userinfo.systemstopmodules,',08,')==false)&&(fn:contains(userinfo.systempermit,',08,')==true)&&(fn:contains(userinfo.allpermits,',08,')==true))||userinfo.isadmin eq '1'}">			
			{text: '库存管理',iconCls : 'icon_kcgl',id : '08',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',81,')==false)&&(fn:contains(userinfo.systempermit,',81,')==false))||((fn:contains(userinfo.systemstopmodules,',81,')==false)&&(fn:contains(userinfo.systempermit,',81,')==true)&&(fn:contains(userinfo.allpermits,',81,')==true))||userinfo.isadmin eq '1'}">
			{text:'  产品登记  ',iconCls : 'icon_cpdj',leaf:true,id:'81'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',82,')==false)&&(fn:contains(userinfo.systempermit,',82,')==false))||((fn:contains(userinfo.systemstopmodules,',82,')==false)&&(fn:contains(userinfo.systempermit,',82,')==true)&&(fn:contains(userinfo.allpermits,',82,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  入库管理  ',leaf:true,iconCls : 'icon_rkgl',id:'82'},
			</c:if>	
				<c:if test="${((fn:contains(userinfo.systemstopmodules,',83,')==false)&&(fn:contains(userinfo.systempermit,',83,')==false))||((fn:contains(userinfo.systemstopmodules,',83,')==false)&&(fn:contains(userinfo.systempermit,',83,')==true)&&(fn:contains(userinfo.allpermits,',83,')==true))||userinfo.isadmin eq '1'}">
			{text:'  出库管理  ',leaf:true,iconCls : 'icon_ckgl',id:'83'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',84,')==false)&&(fn:contains(userinfo.systempermit,',84,')==false))||((fn:contains(userinfo.systemstopmodules,',84,')==false)&&(fn:contains(userinfo.systempermit,',84,')==true)&&(fn:contains(userinfo.allpermits,',84,')==true))||userinfo.isadmin eq '1'}">		
			{text:'  出库历史记录  ',leaf:true,iconCls : 'icon_cklsjl',id:'84'},
			</c:if>
			{leaf:true,hidden:true}
			]}, 
			 </c:if> 
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',012,')==false)&&(fn:contains(userinfo.systempermit,',012,')==false))||((fn:contains(userinfo.systemstopmodules,',012,')==false)&&(fn:contains(userinfo.systempermit,',012,')==true)&&(fn:contains(userinfo.allpermits,',012,')==true))||userinfo.isadmin eq '1'}">			
			{text: '图片空间',iconCls : 'icon_kcgl',id : '012',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',121,')==false)&&(fn:contains(userinfo.systempermit,',121,')==false))||((fn:contains(userinfo.systemstopmodules,',121,')==false)&&(fn:contains(userinfo.systempermit,',121,')==true)&&(fn:contains(userinfo.allpermits,',121,')==true))||userinfo.isadmin eq '1'}">
			{text:'  图片列表  ',iconCls : 'icon_cpdj',leaf:true,id:'121'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',122,')==false)&&(fn:contains(userinfo.systempermit,',122,')==false))||((fn:contains(userinfo.systemstopmodules,',122,')==false)&&(fn:contains(userinfo.systempermit,',122,')==true)&&(fn:contains(userinfo.allpermits,',122,')==true))||userinfo.isadmin eq '1'}">
			{text:'  图册列表  ',iconCls : 'icon_cpdj',leaf:true,id:'122'},
			</c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',013,')==false)&&(fn:contains(userinfo.systempermit,',013,')==false))||((fn:contains(userinfo.systemstopmodules,',013,')==false)&&(fn:contains(userinfo.systempermit,',013,')==true)&&(fn:contains(userinfo.allpermits,',013,')==true))||userinfo.isadmin eq '1'}">			
			{text: '视频空间',iconCls : 'icon_kcgl',id : '013',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',131,')==false)&&(fn:contains(userinfo.systempermit,',131,')==false))||((fn:contains(userinfo.systemstopmodules,',131,')==false)&&(fn:contains(userinfo.systempermit,',131,')==true)&&(fn:contains(userinfo.allpermits,',131,')==true))||userinfo.isadmin eq '1'}">
			{text:'  视频列表  ',iconCls : 'icon_cpdj',leaf:true,id:'131'},
			</c:if>	
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',132,')==false)&&(fn:contains(userinfo.systempermit,',132,')==false))||((fn:contains(userinfo.systemstopmodules,',132,')==false)&&(fn:contains(userinfo.systempermit,',132,')==true)&&(fn:contains(userinfo.allpermits,',132,')==true))||userinfo.isadmin eq '1'}">
			{text:'  专辑列表  ',iconCls : 'icon_cpdj',leaf:true,id:'132'},
			</c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>
			 
			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',06,')==false)&&(fn:contains(userinfo.systempermit,',06,')==false))||((fn:contains(userinfo.systemstopmodules,',06,')==false)&&(fn:contains(userinfo.systempermit,',06,')==true)&&(fn:contains(userinfo.allpermits,',06,')==true))||userinfo.isadmin eq '1'}">			
			{text: '附件',iconCls : 'icon_fj',id : '06',
			children: [
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',61,')==false)&&(fn:contains(userinfo.systempermit,',61,')==false))||((fn:contains(userinfo.systemstopmodules,',61,')==false)&&(fn:contains(userinfo.systempermit,',61,')==true)&&(fn:contains(userinfo.allpermits,',61,')==true))||userinfo.isadmin eq '1'}">		
			{text: '代码生成器',iconCls : 'icon_dmscq',id : '61',
			children: [
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',611,')==false)&&(fn:contains(userinfo.systempermit,',611,')==false))||((fn:contains(userinfo.systemstopmodules,',611,')==false)&&(fn:contains(userinfo.systempermit,',611,')==true)&&(fn:contains(userinfo.allpermits,',611,')==true))||userinfo.isadmin eq '1'}">
				{text:'  生成代码(dao版)  ',leaf:true,iconCls : 'icon_scdm',id:'611'},
			 </c:if>
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',613,')==false)&&(fn:contains(userinfo.systempermit,',613,')==false))||((fn:contains(userinfo.systemstopmodules,',613,')==false)&&(fn:contains(userinfo.systempermit,',613,')==true)&&(fn:contains(userinfo.allpermits,',613,')==true))||userinfo.isadmin eq '1'}">
				{text:'  生成代码(service版)  ',leaf:true,iconCls : 'icon_scdm',id:'613'},
			 </c:if>				
			<c:if test="${((fn:contains(userinfo.systemstopmodules,',612,')==false)&&(fn:contains(userinfo.systempermit,',612,')==false))||((fn:contains(userinfo.systemstopmodules,',612,')==false)&&(fn:contains(userinfo.systempermit,',612,')==true)&&(fn:contains(userinfo.allpermits,',612,')==true))||userinfo.isadmin eq '1'}">	
				{text:'  代码生成历史记录  ',leaf:true,iconCls : 'icon_scdmlsjl',id:'612'},
			 </c:if>
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',614,')==false)&&(fn:contains(userinfo.systempermit,',614,')==false))||((fn:contains(userinfo.systemstopmodules,',614,')==false)&&(fn:contains(userinfo.systempermit,',614,')==true)&&(fn:contains(userinfo.allpermits,',614,')==true))||userinfo.isadmin eq '1'}">	
				{text:'  生成edbc扩展项目  ',leaf:true,iconCls : 'icon_scdmlsjl',id:'614'},
			 </c:if>
			 {leaf:true,hidden:true}	
						]}, 
			 </c:if>
			 <c:if test="${((fn:contains(userinfo.systemstopmodules,',63,')==false)&&(fn:contains(userinfo.systempermit,',63,')==false))||((fn:contains(userinfo.systemstopmodules,',63,')==false)&&(fn:contains(userinfo.systempermit,',63,')==true)&&(fn:contains(userinfo.allpermits,',63,')==true))||userinfo.isadmin eq '1'}">	
				{text:'  系统KEY注册  ',leaf:true,iconCls : 'icon_cpdj',id:'63'},
			 </c:if>
			  <c:if test="${((fn:contains(userinfo.systemstopmodules,',62,')==false)&&(fn:contains(userinfo.systempermit,',62,')==false))||((fn:contains(userinfo.systemstopmodules,',62,')==false)&&(fn:contains(userinfo.systempermit,',62,')==true)&&(fn:contains(userinfo.allpermits,',62,')==true))||userinfo.isadmin eq '1'}">	
				{text:'  地图信息  ',leaf:true,iconCls : 'icon_dtxx',id:'62'},
			 </c:if>	
			{leaf:true,hidden:true}
			]}, 
			 </c:if>					
			 				
			{text: '用户注销',iconCls : 'icon_yhzx',id : '99',
			children: [
						{text:'  进入首页  ',leaf:true,id:'991'},
						{text:'  退出  ',iconCls : 'icon_tc',leaf:true,id:'992'}]}                    
            ]
	});
	var tree = new Ext.tree.TreePanel( {
	});
	tree.setRootNode(root);
	tree.render("tree");
	tree.expandAll();// 默认展开全部
    
    var contentPanel=parent.Ext.getCmp("centerP");
    tree.on("click", function(node) {
					var nodeId = node.id;
					var n = contentPanel.getComponent(node.id);

						// 未读消息
						if (nodeId == ''+11) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/interactive/Listunread.jsp"></iframe>'
										});
							};
						}

						// 已读消息
						if (nodeId == ''+12) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/interactive.do?methede=listisread"></iframe>'
										});
							};
						}
						
						
						//给管理员留言
						if (nodeId == ''+13) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/interactive.do?methede=toAddMessage"></iframe>'
										});
							};
						}

						// 发送消息
						if (nodeId == ''+14) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/interactive.do?methede=toSend"></iframe>'
										});
							};
						}

						// 已发送
						if (nodeId == ''+15) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/interactive/Listinteractive.jsp"></iframe>'
										});
							};
						}
						
						// 用户列表
						if (nodeId == ''+21) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/user/Listuser.jsp" name="userlist"></iframe>'
										});
							};
						}
						
						// 需审核用户列表
						if (nodeId == ''+22) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/user/Listusercheck.jsp" name="userlist"></iframe>'
										});
							};
						}
						
						// 日志查看
						if (nodeId == ''+31) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/Listlog.jsp"></iframe>'
										});
							};
						}
						
						// 模块配置
						if (nodeId == ''+41) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/param.do?methede=toUpdateParam_Module"></iframe>'
										});
							};
						}
						
						
						// 权限配置
						if (nodeId == ''+42) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/param.do?methede=toUpdateParam_Permit"></iframe>'
										});
							};
						}
						
						// 角色配置
						if (nodeId == ''+43) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/role/Listroles.jsp"></iframe>'
										});
							};
						}
						// 单位管理
						if (nodeId == ''+51) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/company.do?methede=toUpdatecompany"></iframe>'
										});
							};
						}
						// 部门管理
						if (nodeId == ''+52) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/department.do?methede=listDepartment"></iframe>'
										});
							};
						}
						// 职位管理
						if (nodeId == ''+53) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/position/Listposition.jsp"></iframe>'
										});
							};
						}
						// 生成代码（dao版）
						if (nodeId == ''+611) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/createcode.do?methede=toCreateCode"></iframe>'
										});
							};
						}
						
						// 生成代码（service版）
						if (nodeId == ''+613) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/createcode.do?methede=toCreateCodeForService"></iframe>'
										});
							};
						}
						
						// 代码生成历史记录
						if (nodeId == ''+612) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/createcode.do?methede=listCreate"></iframe>'
										});
							};
						}
						
						// 生成edbc扩展项目
						if (nodeId == ''+614) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/createcode.do?methede=toCreateProject"></iframe>'
										});
							};
						}
						
						// 系统KEY注册
						if (nodeId == ''+63) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/key/key.jsp"></iframe>'
										});
							};
						}
						
						// 地图信息
						if (nodeId == ''+62) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/map/Map.jsp"></iframe>'
										});
							};
						}
						
						// 模块管理
						if (nodeId == ''+71) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/front/module/Listmodule.jsp"></iframe>'
										});
							};
						}
						
						// 栏目管理
						if (nodeId == ''+72) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/front/article_column/Listarticle_column.jsp"></iframe>'
										});
							};
						}
						
						// 文章类别管理
						if (nodeId == ''+73) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/front/article/Listarticle_type.jsp"></iframe>'
										});
							};
						}
						
						// 文章管理
						if (nodeId == ''+74) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/front/article/Listarticle.jsp"></iframe>'
										});
							};
						}
						
						// 友情链接管理
						if (nodeId == ''+75) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/front/friendlink/Listfriendlink.jsp"></iframe>'
										});
							};
						}
						
						// 展览管理
						if (nodeId == ''+105) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/museum/exhibition/Listexhibition.jsp"></iframe>'
										});
							};
						}
						
						// 展品管理
						if (nodeId == ''+106) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/museum/art_goods/Listart_goods.jsp"></iframe>'
										});
							};
						}
						
						// 展览活动管理
						if (nodeId == ''+101) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/museum/exhibition/Listexhibitionshow.jsp"></iframe>'
										});
							};
						}
						
						// 专家名录
						if (nodeId == ''+102) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/museum/experts/Listexperts.jsp"></iframe>'
										});
							};
						}
						
						// 邮件订阅列表
						if (nodeId == ''+103) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/museum/subscribe_email/Listsubscribe_email.jsp"></iframe>'
										});
							};
						}
						
						// 刊物列表
						if (nodeId == ''+104) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/museum/publications/Listpublications.jsp"></iframe>'
										});
							};
						}
						
						// 自造字管理
						if (nodeId == ''+111) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/jgw/Listjgw_words.jsp"></iframe>'
										});
							};
						}
						
						// 甲骨文合集
						if (nodeId == ''+112) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/jgw/Listjgw_collection.jsp"></iframe>'
										});
							};
						}
						
						// 产品登记
						if (nodeId == ''+81) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/product/Listproduct.jsp"></iframe>'
										});
							};
						}
						
						// 入库管理
						if (nodeId == ''+82) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/product/Listin_product.jsp"></iframe>'
										});
							};
						}
						
						// 出库管理
						if (nodeId == ''+83) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/product/Out_product.jsp"></iframe>'
										});
							};
						}
						
						// 出库历史记录
						if (nodeId == ''+84) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/product/Listout_product.jsp"></iframe>'
										});
							};
						}
						// 图片列表
						if (nodeId == ''+121) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/pictures/Listpictures.jsp"></iframe>'
										});
							};
						}
						// 图册列表
						if (nodeId == ''+122) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/picturegroup/Listpicture_group.jsp"></iframe>'
										});
							};
						}
						// 视频列表
						if (nodeId == ''+131) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/videos/Listvideos.jsp"></iframe>'
										});
							};
						}
						// 专辑列表
						if (nodeId == ''+132) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/video_group/Listvideo_group.jsp"></iframe>'
										});
							};
						}
						
						// 任务列表
						if (nodeId == ''+141) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/progress/Listworktask.jsp"></iframe>'
										});
							};
						}
						
						// 任务进度
						if (nodeId == ''+142) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/progress/Listprogress.jsp"></iframe>'
										});
							};
						}
						
						// 资产列表
						if (nodeId == ''+91) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/assets/Listassets.jsp"></iframe>'
										});
							};
						}
						
						// 资产使用记录
						if (nodeId == ''+92) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/assets/Listassets_use.jsp"></iframe>'
										});
							};
						}
						
						// 资产交还记录
						if (nodeId == ''+93) {
							if (!n) {
								n = contentPanel.add( {
											'id' : node.id,
											'title' : node.text,
											closable : true,
											html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/assets/Listassets_out.jsp"></iframe>'
										});
							};
						}
						
						// 进入首页
						if (nodeId == ''+991) {
							parent.window.location.href = '<%=path %>/index.jsp';
						}
						// 退出
						if (nodeId == ''+992) {
							tuichu();
						}
						
						contentPanel.setActiveTab(n);
					})
		
						});
						
	function tuichu()
	{
	if(confirm('是否退出后台管理系统')){
	
	window.parent.window.location.href="<%=path %>/user.do?methede=loginout";
	}
	}
    </script>
    </head>
    <body>
    <div id="tree"></div>
    </body>
</html>
