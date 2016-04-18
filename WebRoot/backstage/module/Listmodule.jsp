<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		 <title>模块管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
     <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
          <script type="text/javascript"><!--
     Ext.onReady(function(){
    var tree = new Ext.tree.TreePanel({
        renderTo:'tree-div',
        useArrows:false,  //是否是vista样式
        autoScroll:true,
        animate:false,
        enableDD:false, //是否可拖动
        height:window.parent.Ext.getCmp('centerP').getHeight()-40,
        width:700,
        containerScroll: true,
        rootVisible: false,
        frame: true,
        root: {
		    id:'1_root',
            text:'后台管理',
            nodeType: 'async',
            children:[  
             <c:if test="${fn:contains(param_module.stopmoduleids,',01,')==false}">  
            {text: ' <font color="green">互动平台</font> <img src="<%=path %>/images/backstage/ok.gif">',checked:false,id: '01',
             </c:if>
             <c:if test="${fn:contains(param_module.stopmoduleids,',01,')==true}">  
            {text: ' <font color="gray">互动平台</font> <img src="<%=path %>/images/backstage/stop.gif">',checked:false,id: '01',
             </c:if>
            children: [
                       <c:if test="${fn:contains(param_module.stopmoduleids,',11,')==false}">
                       {text:'  <font color="green">未读消息</font> <img src="<%=path %>/images/backstage/ok.gif" >',checked:false,leaf:true,id:'11'}, 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',11,')==true}">
                       {text:'  <font color="gray">未读消息</font><img src="<%=path %>/images/backstage/stop.gif">',checked:false,leaf:true,id:'11'}, 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',12,')==false}">
                       {text:'  <font color="green">已读消息</font>  <img src="<%=path %>/images/backstage/ok.gif">',checked:false,leaf:true,id:'12'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',12,')==true}">
                       {text:'  <font color="gray">已读消息</font>  <img src="<%=path %>/images/backstage/stop.gif">',checked:false,leaf:true,id:'12'} , 
                        </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',13,')==false}">
                       {text:'  <font color="green">给管理员留言</font>  <img src="<%=path %>/images/backstage/ok.gif">',checked:false,leaf:true,id:'13'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',13,')==true}">
                       {text:'  <font color="gray">给管理员留言</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'13'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',14,')==false}">
                       {text:'  <font color="green">发送消息</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'14'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',14,')==true}">
                       {text:'  <font color="gray">发送消息</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'14'} , 
                        </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',15,')==false}">
                       {text:'  <font color="green">已发送</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'15'}]}, 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',15,')==true}">
                       {text:'  <font color="gray">已发送</font>  <img src="<%=path %>/images/backstage/stop.gif">',checked:false,leaf:true,id:'15'}]}, 
                        </c:if>
                        <c:if test="${fn:contains(param_module.stopmoduleids,',02,')==false}">
                       {text:'  <font color="green">用户管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'02' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',02,')==true}">
                       {text:'  <font color="gray">用户管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'02' , 
                        </c:if>
  			children: [
  			           <c:if test="${fn:contains(param_module.stopmoduleids,',21,')==false}">
                       {text:'  <font color="green">用户列表</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'21'}, 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',21,')==true}">
                       {text:'  <font color="gray">用户列表</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'21'}, 
                        </c:if>
                        <c:if test="${fn:contains(param_module.stopmoduleids,',22,')==false}">
                       {text:'  <font color="green">需审核用户列表</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'22'}]}, 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',22,')==true}">
                       {text:'  <font color="gray">需审核用户列表</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'22'}]}, 
                        </c:if>
                        <c:if test="${fn:contains(param_module.stopmoduleids,',03,')==false}">
                       {text:'  <font color="green">日志管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'03' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',03,')==true}">
                       {text:'  <font color="gray">日志管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'03', 
                        </c:if>
			children: [
			          <c:if test="${fn:contains(param_module.stopmoduleids,',31,')==false}">
                       {text:'  <font color="green">日志查看</font>  <img src="<%=path %>/images/backstage/ok.gif">',checked:false,leaf:true,id:'31'}]},  
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',31,')==true}">
                       {text:'  <font color="gray">日志查看</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'31'}]},  
                        </c:if>
                        <c:if test="${fn:contains(param_module.stopmoduleids,',04,')==false}">
                       {text:'  <font color="green">系统配置</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'04' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',04,')==true}">
                       {text:'  <font color="gray">系统配置</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'04' , 
                        </c:if>
			children: [
			          <c:if test="${fn:contains(param_module.stopmoduleids,',41,')==false}">
                       {text:'  <font color="green">后台模块配置</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'41'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',41,')==true}">
                       {text:'  <font color="gray">后台模块配置</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'41'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',42,')==false}">
                       {text:'  <font color="green">权限配置</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'42'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',42,')==true}">
                       {text:'  <font color="gray">权限配置</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'42'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',43,')==false}">
                       {text:'  <font color="green">角色配置</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'43'}]},  
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',43,')==true}">
                       {text:'  <font color="gray">角色配置</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'43'}]}, 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',05,')==false}">
                       {text:'  <font color="green">单位部门管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'05' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',05,')==true}">
                       {text:'  <font color="gray">单位部门管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'05' , 
                        </c:if>
			children: [
			           <c:if test="${fn:contains(param_module.stopmoduleids,',51,')==false}">
                       {text:'  <font color="green">单位管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'51'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',51,')==true}">
                       {text:'  <font color="gray">单位管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'51'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',52,')==false}">
                       {text:'  <font color="green">部门管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'52'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',52,')==true}">
                       {text:'  <font color="gray">部门管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'52'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',53,')==false}">
                       {text:'  <font color="green">职位管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'53'}]}, 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',53,')==true}">
                       {text:'  <font color="gray">职位管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'53'}]}, 
                        </c:if>
                        
                        
                        <c:if test="${fn:contains(param_module.stopmoduleids,',07,')==false}">
                       {text:'  <font color="green">前台网站设置</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'07' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',07,')==true}">
                       {text:'  <font color="gray">前台网站设置</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'07' , 
                        </c:if>
                        children: [
			           <c:if test="${fn:contains(param_module.stopmoduleids,',71,')==false}">
                       {text:'  <font color="green">模块管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'71'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',71,')==true}">
                       {text:'  <font color="gray">模块管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'71'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',72,')==false}">
                       {text:'  <font color="green">栏目管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'72'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',72,')==true}">
                       {text:'  <font color="gray">栏目管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'72'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',73,')==false}">
                       {text:'  <font color="green">文章类别管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'73'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',73,')==true}">
                       {text:'  <font color="gray">文章类别管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'73'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',74,')==false}">
                       {text:'  <font color="green">文章管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'74'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',74,')==true}">
                       {text:'  <font color="gray">文章管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'74'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',75,')==false}">
                       {text:'  <font color="green">友情链接管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'75'}]},
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',75,')==true}">
                       {text:'  <font color="gray">友情链接管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'75'}]},
                       </c:if>
                       
            <c:if test="${fn:contains(param_module.stopmoduleids,',010,')==false}">
                       {text:'  <font color="green">艺术与考古博物馆管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'010' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',010,')==true}">
                       {text:'  <font color="gray">艺术与考古博物馆管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'010', 
                        </c:if>
			children: [
			           <c:if test="${fn:contains(param_module.stopmoduleids,',105,')==false}">
                       {text:'  <font color="green">展览管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'105'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',105,')==true}">
                       {text:'  <font color="gray">展览管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'105'} , 
                        </c:if>
			           <c:if test="${fn:contains(param_module.stopmoduleids,',106,')==false}">
                       {text:'  <font color="green">展品管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'106'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',106,')==true}">
                       {text:'  <font color="gray">展品管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'106'} , 
                        </c:if>
			            <c:if test="${fn:contains(param_module.stopmoduleids,',101,')==false}">
                       {text:'  <font color="green">展览活动管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'101'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',101,')==true}">
                       {text:'  <font color="gray">展览活动管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'101'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',102,')==false}">
                       {text:'  <font color="green">专家名录</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'102'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',102,')==true}">
                       {text:'  <font color="gray">专家名录</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'102'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',103,')==false}">
                       {text:'  <font color="green">邮件订阅列表</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'103'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',103,')==true}">
                       {text:'  <font color="gray">邮件订阅列表</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'103'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',104,')==false}">
                       {text:'  <font color="green">刊物列表</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'104'}]},
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',104,')==true}">
                       {text:'  <font color="gray">刊物列表</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'104'}]},
                        </c:if>
        
                        
                        
                         <c:if test="${fn:contains(param_module.stopmoduleids,',09,')==false}">
                       {text:'  <font color="green">资产管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'09' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',09,')==true}">
                       {text:'  <font color="gray">资产管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'09', 
                        </c:if>
			children: [
			           <c:if test="${fn:contains(param_module.stopmoduleids,',91,')==false}">
                       {text:'  <font color="green">资产列表</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'91'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',91,')==true}">
                       {text:'  <font color="gray">资产列表</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'91'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',92,')==false}">
                       {text:'  <font color="green">资产使用记录</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'92'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',92,')==true}">
                       {text:'  <font color="gray">资产使用记录</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'92'} , 
                        </c:if>
			          <c:if test="${fn:contains(param_module.stopmoduleids,',93,')==false}">
                       {text:'  <font color="green">资产交还记录</font>  <img src="<%=path %>/images/backstage/ok.gif">',checked:false,leaf:true,id:'93'}]},  
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',93,')==true}">
                       {text:'  <font color="gray">资产交还记录</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'93'}]},  
                        </c:if>
                        
                        
                         <c:if test="${fn:contains(param_module.stopmoduleids,',08,')==false}">
                       {text:'  <font color="green">库存管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'08' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',08,')==true}">
                       {text:'  <font color="gray">库存管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'08', 
                        </c:if>
			children: [
			           <c:if test="${fn:contains(param_module.stopmoduleids,',81,')==false}">
                       {text:'  <font color="green">产品登记</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'81'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',81,')==true}">
                       {text:'  <font color="gray">产品登记</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'81'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',82,')==false}">
                       {text:'  <font color="green">入库管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'82'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',82,')==true}">
                       {text:'  <font color="gray">入库管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'82'} , 
                        </c:if>
                         <c:if test="${fn:contains(param_module.stopmoduleids,',83,')==false}">
                       {text:'  <font color="green">出库管理</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'83'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',83,')==true}">
                       {text:'  <font color="gray">出库管理</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'83'} , 
                        </c:if>
			          <c:if test="${fn:contains(param_module.stopmoduleids,',84,')==false}">
                       {text:'  <font color="green">出库历史记录</font>  <img src="<%=path %>/images/backstage/ok.gif">',checked:false,leaf:true,id:'84'}]},  
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',84,')==true}">
                       {text:'  <font color="gray">出库历史记录</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'84'}]},  
                        </c:if>
                        
                         <c:if test="${fn:contains(param_module.stopmoduleids,',06,')==false}">
                       {text:'  <font color="green">附件</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'06' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',06,')==true}">
                       {text:'  <font color="gray">附件</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'06' , 
                        </c:if>
			children: [
			            <c:if test="${fn:contains(param_module.stopmoduleids,',61,')==false}">
                       {text:'  <font color="green">代码生成器</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,id:'61' , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',61,')==true}">
                       {text:'  <font color="gray">代码生成器</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,id:'61', 
                        </c:if>
                        children: [
                        <c:if test="${fn:contains(param_module.stopmoduleids,',611,')==false}">
                       {text:'  <font color="green">生成代码</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'611'} , 
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',611,')==true}">
                       {text:'  <font color="gray">生成代码</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'611'} , 
                        </c:if>
                          <c:if test="${fn:contains(param_module.stopmoduleids,',612,')==false}">
                       {text:'  <font color="green">代码生成历史记录</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'612'}]},
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',612,')==true}">
                       {text:'  <font color="gray">代码生成历史记录</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'612'}]},
                       </c:if>
                       
                        <c:if test="${fn:contains(param_module.stopmoduleids,',62,')==false}">
                       {text:'  <font color="green">地图信息</font> <img src="<%=path %>/images/backstage/ok.gif"> ',checked:false,leaf:true,id:'62'}]}
                       </c:if>
                       <c:if test="${fn:contains(param_module.stopmoduleids,',62,')==true}">
                       {text:'  <font color="gray">地图信息</font> <img src="<%=path %>/images/backstage/stop.gif"> ',checked:false,leaf:true,id:'62'}]}
                       </c:if>
            ]
	},
        buttons: [{
            text: '停用选中模块',
            iconCls:'icon_stop',
            handler: function(){
             var stopmoduleids = ',', selNodes = tree.getChecked();
                Ext.each(selNodes, function(node){
                    stopmoduleids += node.id+',';
                });
             Ext.MessageBox.show({
                              title: '请稍等',
                              msg: '正在配置...',
                              progressText: '',
                              width:300,
                              progress:true,
                              closable:false,
                              animEl: 'loading'
                           });
                           //控制进度速度
                           var f = function(v){
                            return function(){
                                    var i = v/11;
                                    Ext.MessageBox.updateProgress(i, '');
                                    };
                           };
 
                           for(var i = 1; i < 13; i++){
                              setTimeout(f(i), i*150);
                           }
                            Ext.Ajax.request({
			            url: '<%=path %>/param.do?methede=updateParam_Module&mtype=stop&stopmoduleids='+stopmoduleids,
			            method: "post",
			            success: function (form,action) {
			                    Ext.MessageBox.hide();
			                    Ext.Msg.alert('系统提示', "配置成功");
			                    window.location.href="<%=path %>/param.do?methede=toUpdateParam_Module";
			                    
			            },
			            failure: function () {
			                Ext.Msg.alert('系统提示', '系统出错！');
			            }
			        });
            }
        },{
            text: '启用选中模块',
            iconCls:'icon_submit',
            handler: function(){
             var stopmoduleids = ',', selNodes = tree.getChecked();
                Ext.each(selNodes, function(node){
                    stopmoduleids += node.id+',';
                });
             Ext.MessageBox.show({
                              title: '请稍等',
                              msg: '正在配置...',
                              progressText: '',
                              width:300,
                              progress:true,
                              closable:false,
                              animEl: 'loading'
                           });
                           //控制进度速度
                           var f = function(v){
                            return function(){
                                    var i = v/11;
                                    Ext.MessageBox.updateProgress(i, '');
                                    };
                           };
 
                           for(var i = 1; i < 13; i++){
                              setTimeout(f(i), i*150);
                           }
                            Ext.Ajax.request({
			            url: '<%=path %>/param.do?methede=updateParam_Module&mtype=star&stopmoduleids='+stopmoduleids,
			            method: "post",
			            success: function (form,action) {
			                    Ext.MessageBox.hide();
			                    Ext.Msg.alert('系统提示', "配置成功");
			                    window.location.href="<%=path %>/param.do?methede=toUpdateParam_Module";
			                    
			            },
			            failure: function () {
			                Ext.Msg.alert('系统提示', '系统出错！');
			            }
			        });
            }
        },{
        text:'取消',
        iconCls:'icon_cancel',
        handler:function(){
        var win = parent.Ext.getCmp('permitnew');
        if (win) {win.close();}
        }
       }]
    });
    
    tree.getRootNode().expand(true);
  
    
});
     

     --></script>
	</head>
	<body style="background-color: #DFE8F6;">
	<div id="tree-div"> 
	</div>
	</body>
</html>

