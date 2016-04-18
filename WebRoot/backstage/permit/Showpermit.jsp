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
		 <title>查看权限</title>
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
        title: '系统所有权限',
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
            text:'所有权限',
            checked:false,
            nodeType: 'async',
             children:[ 
                 <c:if test="${fn:contains(param_module.permitids,',01,')==false}">   
              	 {text: '<font color="gray">互动平台模块查看</font>',checked:false,id: '01',leaf:true}, 
              	 </c:if>
              	  <c:if test="${fn:contains(param_module.permitids,',01,')==true}">   
              	 {text: '<font color="green">互动平台模块查看</font>',checked:false,id: '01',leaf:true}, 
              	 </c:if>
              	  <c:if test="${fn:contains(param_module.permitids,',02,')==false}">   
  				 {text: '<font color="gray">用户管理模块查看</font>',checked:false,id: '02',
  				  </c:if>
  				    <c:if test="${fn:contains(param_module.permitids,',02,')==true}">   
  				 {text: '<font color="green">用户管理模块查看</font>',checked:false,id: '02',
  				  </c:if>
  			children: [
  			<c:if test="${fn:contains(param_module.permitids,',021,')==false}">   
  				{text:'  <font color="gray">用户列表模块查看</font>  ',checked:false,id:'021',
  			 </c:if>
  			 <c:if test="${fn:contains(param_module.permitids,',021,')==true}">   
  				{text:'  <font color="green">用户列表模块查看</font>  ',checked:false,id:'021',
  			 </c:if>
  			children: [
  			<c:if test="${fn:contains(param_module.permitids,',0211,')==false}">   
  				{text:'  <font color="gray">新建用户</font> ',checked:false,leaf:true,id:'0211'},
  			</c:if>
  			<c:if test="${fn:contains(param_module.permitids,',0211,')==true}">   
  				{text:'  <font color="green">新建用户</font> ',checked:false,leaf:true,id:'0211'},
  			</c:if>
  			<c:if test="${fn:contains(param_module.permitids,',0212,')==false}">   
	  			{text:'  <font color="gray">编辑用户</font>  ',checked:false,leaf:true,id:'0212'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0212,')==true}">   
	  			{text:'  <font color="green">编辑用户</font>  ',checked:false,leaf:true,id:'0212'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0213,')==false}">   
	  			{text:'  <font color="gray">角色配置</font>  ',checked:false,leaf:true,id:'0213'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0213,')==true}">   
	  			{text:'  <font color="green">角色配置</font>  ',checked:false,leaf:true,id:'0213'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0214,')==false}">   
	  			{text:' <font color="gray">权限配置</font>  ',checked:false,leaf:true,id:'0214'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0214,')==true}">   
	  			{text:' <font color="green">权限配置</font>  ',checked:false,leaf:true,id:'0214'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0215,')==false}">   
	  			{text:'  <font color="gray">查看所有权限</font>  ',checked:false,leaf:true,id:'0215'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0215,')==true}">   
	  			{text:'  <font color="green">查看所有权限</font>  ',checked:false,leaf:true,id:'0215'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0216,')==false}">   
	  			{text:'  <font color="gray">密码修改</font>  ',checked:false,leaf:true,id:'0216'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0216,')==true}">   
	  			{text:'  <font color="green">密码修改</font>  ',checked:false,leaf:true,id:'0216'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0218,')==false}">   
	  			{text:'  <font color="gray">删除用户</font>  ',checked:false,leaf:true,id:'0217'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0218,')==true}">   
	  			{text:'  <font color="green">删除用户</font>  ',checked:false,leaf:true,id:'0217'},
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0217,')==false}">   
	  			{text:'  <font color="gray">导出excel</font>   ',checked:false,leaf:true,id:'0218'}]}, 
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0217,')==true}">   
	  			{text:'  <font color="green">导出excel</font>   ',checked:false,leaf:true,id:'0218'}]}, 
	  			</c:if>
	  			
  			<c:if test="${fn:contains(param_module.permitids,',022,')==false}">   
  				{text:'  <font color="gray">需审核用户列表模块查看</font>  ',checked:false,id:'022',
  			 </c:if>
  			 <c:if test="${fn:contains(param_module.permitids,',022,')==true}">   
  				{text:'  <font color="green">需审核用户列表模块查看</font>  ',checked:false,id:'022',
  			 </c:if>
  			children: [
  			<c:if test="${fn:contains(param_module.permitids,',0211,')==false}">   
  				{text:'  <font color="gray">审核权限</font> ',checked:false,leaf:true,id:'0221'},
  			</c:if>
  			<c:if test="${fn:contains(param_module.permitids,',0211,')==true}">   
  				{text:'  <font color="green">审核权限</font> ',checked:false,leaf:true,id:'0221'},
  			</c:if>
	  		<c:if test="${fn:contains(param_module.permitids,',0222,')==false}">   
	  			{text:'  <font color="gray">导出excel</font>   ',checked:false,leaf:true,id:'0222'}]}]}, 
	  			</c:if>
	  			<c:if test="${fn:contains(param_module.permitids,',0222,')==true}">   
	  			{text:'  <font color="green">导出excel</font>   ',checked:false,leaf:true,id:'0222'}]}]}, 
	  			</c:if>
	  			
	  			<c:if test="${fn:contains(param_module.permitids,',03,')==false}">   
 				{text: ' <font color="gray">日志管理模块查看</font>',checked:false,id : '03',
 				</c:if>
 				<c:if test="${fn:contains(param_module.permitids,',03,')==true}">   
 				{text: ' <font color="green">日志管理模块查看</font>',checked:false,id : '03',
 				</c:if>
 		   children: [
 		      <c:if test="${fn:contains(param_module.permitids,',31,')==false}">   
 		   	    {text:'  <font color="gray">日志查看</font>  ',checked:false,leaf:true,id:'31'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',31,')==true}">   
 		   	    {text:'  <font color="green">日志查看</font>  ',checked:false,leaf:true,id:'31'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',04,')==false}">   
			  	{text: '<font color="gray">系统配置模块查看</font>',checked:false,id : '04',
			  	  </c:if>
			  	    <c:if test="${fn:contains(param_module.permitids,',04,')==true}">   
			  	{text: '<font color="green">系统配置模块查看</font>',checked:false,id : '04',
			  	  </c:if>
		  children: [
		     <c:if test="${fn:contains(param_module.permitids,',41,')==false}">   
		  		{text:' <font color="gray"> 后台模块配置</font>  ',leaf:true,checked:false,id:'41'},
		  	 </c:if>
		  	   <c:if test="${fn:contains(param_module.permitids,',41,')==true}">   
		  		{text:' <font color="green"> 后台模块配置</font>  ',leaf:true,checked:false,id:'41'},
		  	 </c:if>
		  	 <c:if test="${fn:contains(param_module.permitids,',42,')==false}"> 
			  	{text:'  <font color="gray">权限配置</font>  ',leaf:true,checked:false,id:'42'},
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',42,')==true}"> 
			  	{text:'  <font color="green">权限配置</font>  ',leaf:true,checked:false,id:'42'},
			  	</c:if>
			  <c:if test="${fn:contains(param_module.permitids,',43,')==false}"> 
			  	{text:'   <font color="gray">角色列表查看</font>  ',checked:false,id:'43', 
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',43,')==true}"> 
			  	{text:'   <font color="green">角色列表查看</font>  ',checked:false,id:'43', 
			  	</c:if>
			  	 children: [
		        <c:if test="${fn:contains(param_module.permitids,',431,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '431'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',431,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '431'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',432,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '432'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',432,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '432'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',433,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '433'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',433,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '433'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',434,')==false}"> 
			  	{text: '<font color="gray">权限配置</font> ',checked:false,leaf:true,id : '434'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',434,')==true}"> 
			  	{text: '<font color="green">权限配置</font> ',checked:false,leaf:true,id : '434'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',435,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'435'}]}]},
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',435,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'435'}]}]}, 
 		   	    </c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',05,')==false}"> 
			  	{text: '<font color="gray">单位部门管理模块查看</font> ',checked:false,id : '05',
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',05,')==true}"> 
			  	{text: '<font color="green">单位部门管理模块查看</font> ',checked:false,id : '05',
			  	</c:if>
		  children: [
		        <c:if test="${fn:contains(param_module.permitids,',51,')==false}"> 
			  	{text:'  <font color="gray">单位管理查看</font>  ',checked:false,id:'51',
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',51,')==true}"> 
			  	{text:'  <font color="green">单位管理查看</font>  ',checked:false,id:'51',
			  	</c:if>
			  	 children: [
			  	 <c:if test="${fn:contains(param_module.permitids,',511,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '511'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',511,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '511'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',512,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '512'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',512,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '512'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',513,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '513'}]},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',513,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '513'}]},
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',52,')==false}"> 
			  	{text:' <font color="gray"> 部门管理 </font> ',checked:false,id:'52',
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',52,')==true}"> 
			  	{text:' <font color="green"> 部门管理 </font> ',checked:false,id:'52',
			  	</c:if>
			  	 children: [
			  	 <c:if test="${fn:contains(param_module.permitids,',521,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '521'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',521,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '521'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',522,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '522'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',522,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '522'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',523,')==false}"> 
			  	{text: '<font color="gray">顺序管理</font> ',checked:false,leaf:true,id : '523'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',523,')==true}"> 
			  	{text: '<font color="green">顺序管理</font> ',checked:false,leaf:true,id : '523'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',524,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '524'}]},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',524,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '524'}]},
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',53,')==false}"> 
			  	{text:'  <font color="gray">职位管理 </font>  ',checked:false,id:'53', 
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',53,')==true}"> 
			  	{text:'  <font color="green">职位管理 </font>  ',checked:false,id:'53', 
			  	</c:if>
			  	 children: [
			  	 <c:if test="${fn:contains(param_module.permitids,',531,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '531'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',531,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '531'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',532,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '532'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',532,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '532'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',533,')==false}"> 
			  	{text: '<font color="gray">权限配置</font> ',checked:false,leaf:true,id : '533'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',533,')==true}"> 
			  	{text: '<font color="green">权限配置</font> ',checked:false,leaf:true,id : '533'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',534,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '534'}]}]},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',534,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '534'}]}]},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',07,')==false}"> 
			  	{text: '<font color="gray">前台网站设置模块查看</font> ',checked:false,id : '07',
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',07,')==true}"> 
			  	{text: '<font color="green">前台网站设置模块查看</font> ',checked:false,id : '07',
			  	</c:if>
			  	  children: [
		         <c:if test="${fn:contains(param_module.permitids,',71,')==false}"> 
		        {text:'  <font color="gray">前台模块列表查看 </font>  ',checked:false,id:'71',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',71,')==true}"> 
		        {text:'  <font color="green">前台模块列表查看 </font>  ',checked:false,id:'71',
		        </c:if>
		        children: [
		        <c:if test="${fn:contains(param_module.permitids,',711,')==false}"> 
			  	{text: '<font color="gray">新建模块</font> ',checked:false,leaf:true,id : '711'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',711,')==true}"> 
			  	{text: '<font color="green">新建模块</font> ',checked:false,leaf:true,id : '711'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',712,')==false}"> 
			  	{text: '<font color="gray">编辑模块</font> ',checked:false,leaf:true,id : '712'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',712,')==true}"> 
			  	{text: '<font color="green">编辑模块</font> ',checked:false,leaf:true,id : '712'},
			  	</c:if>
 		      <c:if test="${fn:contains(param_module.permitids,',713,')==false}">   
 		   	    {text:'  <font color="gray">删除模块</font>  ',checked:false,leaf:true,id:'713'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',713,')==true}">   
 		   	    {text:'  <font color="green">删除模块</font>  ',checked:false,leaf:true,id:'713'}]}, 
 		   	    </c:if>
		          <c:if test="${fn:contains(param_module.permitids,',72,')==false}"> 
		        {text:'  <font color="gray">栏目列表查看 </font>  ',checked:false,id:'72',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',72,')==true}"> 
		        {text:'  <font color="green">栏目列表查看 </font>  ',checked:false,id:'72',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',721,')==false}"> 
			  	{text: '<font color="gray">新建栏目</font> ',checked:false,leaf:true,id : '721'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',721,')==true}"> 
			  	{text: '<font color="green">新建栏目</font> ',checked:false,leaf:true,id : '721'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',722,')==false}"> 
			  	{text: '<font color="gray">编辑栏目</font> ',checked:false,leaf:true,id : '722'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',722,')==true}"> 
			  	{text: '<font color="green">编辑栏目</font> ',checked:false,leaf:true,id : '722'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',723,')==false}"> 
			  	{text: '<font color="gray">新建子栏目</font> ',checked:false,leaf:true,id : '723'},
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',723,')==true}"> 
			  	{text: '<font color="green">新建子栏目</font> ',checked:false,leaf:true,id : '723'},
			  	</c:if>
			    <c:if test="${fn:contains(param_module.permitids,',724,')==false}"> 
			  	{text: '<font color="gray">栏目隐藏设置</font> ',checked:false,leaf:true,id : '724'},
			  	</c:if>
			  	 <c:if test="${fn:contains(param_module.permitids,',724,')==true}"> 
			  	{text: '<font color="green">栏目隐藏设置</font> ',checked:false,leaf:true,id : '724'},
			  	</c:if>
 		      <c:if test="${fn:contains(param_module.permitids,',725,')==false}">   
 		   	    {text:'  <font color="gray">删除栏目</font>  ',checked:false,leaf:true,id:'725'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',725,')==true}">   
 		   	    {text:'  <font color="green">删除栏目</font>  ',checked:false,leaf:true,id:'725'}]},
 		   	     </c:if>
		          <c:if test="${fn:contains(param_module.permitids,',73,')==false}"> 
		        {text:'  <font color="gray">文章类别列表查看 </font>  ',checked:false,id:'73',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',73,')==true}"> 
		        {text:'  <font color="green">文章类别列表查看 </font>  ',checked:false,id:'73',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',731,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '731'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',731,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '731'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',732,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '732'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',732,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '732'},
			  	</c:if>
 		      <c:if test="${fn:contains(param_module.permitids,',733,')==false}">   
 		   	    {text:'  <font color="gray">删除</font>  ',checked:false,leaf:true,id:'733'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',733,')==true}">   
 		   	    {text:'  <font color="green">删除</font>  ',checked:false,leaf:true,id:'733'}]}, 
 		   	    </c:if>
		          <c:if test="${fn:contains(param_module.permitids,',74,')==false}"> 
		        {text:'  <font color="gray">文章列表查看 </font>  ',checked:false,id:'74',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',74,')==true}"> 
		        {text:'  <font color="green">文章列表查看 </font>  ',checked:false,id:'74',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',741,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '741'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',741,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '741'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',742,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '742'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',742,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '742'},
			  	</c:if>
			  		<c:if test="${fn:contains(param_module.permitids,',743,')==false}"> 
			  	{text: '<font color="gray">编辑摘要</font> ',checked:false,leaf:true,id : '743'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',743,')==true}"> 
			  	{text: '<font color="green">编辑摘要</font> ',checked:false,leaf:true,id : '743'},
			  	</c:if>
			  		<c:if test="${fn:contains(param_module.permitids,',744,')==false}"> 
			  	{text: '<font color="gray">首页焦点设置</font> ',checked:false,leaf:true,id : '744'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',744,')==true}"> 
			  	{text: '<font color="green">首页焦点设置</font> ',checked:false,leaf:true,id : '744'},
			  	</c:if>
			  		<c:if test="${fn:contains(param_module.permitids,',745,')==false}"> 
			  	{text: '<font color="gray">栏目焦点设置</font> ',checked:false,leaf:true,id : '745'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',745,')==true}"> 
			  	{text: '<font color="green">栏目焦点设置</font> ',checked:false,leaf:true,id : '745'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',7410,')==false}"> 
			  	{text: '<font color="gray">大事件设置</font> ',checked:false,leaf:true,id : '7410'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',7410,')==true}"> 
			  	{text: '<font color="green">大事件设置</font> ',checked:false,leaf:true,id : '7410'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',746,')==false}"> 
			  	{text: '<font color="gray">热点设置</font> ',checked:false,leaf:true,id : '746'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',746,')==true}"> 
			  	{text: '<font color="green">热点设置</font> ',checked:false,leaf:true,id : '746'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',747,')==false}"> 
			  	{text: '<font color="gray">热荐设置</font> ',checked:false,leaf:true,id : '747'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',747,')==true}"> 
			  	{text: '<font color="green">热荐设置</font> ',checked:false,leaf:true,id : '747'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',748,')==false}"> 
			  	{text: '<font color="gray">屏蔽设置</font> ',checked:false,leaf:true,id : '748'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',748,')==true}"> 
			  	{text: '<font color="green">屏蔽设置</font> ',checked:false,leaf:true,id : '748'},
			  	</c:if>
 		      <c:if test="${fn:contains(param_module.permitids,',749,')==false}">   
 		   	    {text:'  <font color="gray">删除</font>  ',checked:false,leaf:true,id:'749'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',749,')==true}">   
 		   	    {text:'  <font color="green">删除</font>  ',checked:false,leaf:true,id:'749'}]}, 
 		   	    </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',75,')==false}"> 
		        {text:'  <font color="gray">友情链接管理 </font>  ',checked:false,id:'75',
		         </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',75,')==true}"> 
		        {text:'  <font color="green">友情链接管理 </font>  ',checked:false,id:'75',
		         </c:if>
		           children: [
		        <c:if test="${fn:contains(param_module.permitids,',751,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '751'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',751,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '751'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',752,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '752'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',752,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '752'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',753,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '753'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',753,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '753'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',754,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'754'}]}]} ,
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',754,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'754'}]}]}, 
 		   	    </c:if>
 		   	    
 		   	    
 		   	      <c:if test="${fn:contains(param_module.permitids,',010,')==false}"> 
			  	{text: '<font color="gray">艺术与考古博物馆管理查看</font> ',checked:false,id : '010',
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',010,')==true}"> 
			  	{text: '<font color="green">艺术与考古博物馆管理查看</font> ',checked:false,id : '010',
			  	</c:if>
			  	  children: [
			  	  <c:if test="${fn:contains(param_module.permitids,',105,')==false}"> 
		        {text:'  <font color="gray">展览查看 </font>  ',checked:false,id:'105',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',105,')==true}"> 
		        {text:'  <font color="green">展览查看 </font>  ',checked:false,id:'105',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',1051,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '1051'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1051,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '1051'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1052,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '1052'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1052,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '1052'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1053,')==false}"> 
			  	{text: '<font color="gray">展品设置</font> ',checked:false,leaf:true,id : '1053'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1053,')==true}"> 
			  	{text: '<font color="green">展品设置</font> ',checked:false,leaf:true,id : '1053'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1054,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '1054'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1054,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '1054'},
			  	</c:if>
 		        <c:if test="${fn:contains(param_module.permitids,',1055,')==false}">   
 		   	    {text:'  <font color="gray">导出Excel</font>  ',checked:false,leaf:true,id:'1055'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',1055,')==true}">   
 		   	    {text:'  <font color="green">导出Excel</font>  ',checked:false,leaf:true,id:'1055'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',106,')==false}"> 
		        {text:'  <font color="gray">展品列表查看 </font>  ',checked:false,id:'106',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',106,')==true}"> 
		        {text:'  <font color="green">展品列表查看 </font>  ',checked:false,id:'106',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',1061,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '1061'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1061,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '1061'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1062,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '1062'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1062,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '1062'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1063,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '1063'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1063,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '1063'},
			  	</c:if>
 		      <c:if test="${fn:contains(param_module.permitids,',1064,')==false}">   
 		   	    {text:'  <font color="gray">导出Excel</font>  ',checked:false,leaf:true,id:'1064'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',1064,')==true}">   
 		   	    {text:'  <font color="green">导出Excel</font>  ',checked:false,leaf:true,id:'1064'}]}, 
 		   	    </c:if> 
		         <c:if test="${fn:contains(param_module.permitids,',101,')==false}"> 
		        {text:'  <font color="gray">展览活动列表查看 </font>  ',checked:false,id:'101',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',101,')==true}"> 
		        {text:'  <font color="green">展览活动列表查看 </font>  ',checked:false,id:'101',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',1011,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '1011'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1011,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '1011'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1012,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '1012'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1012,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '1012'},
			  	</c:if>
 		      <c:if test="${fn:contains(param_module.permitids,',1013,')==false}">   
 		   	    {text:'  <font color="gray">删除</font>  ',checked:false,leaf:true,id:'1013'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',1013,')==true}">   
 		   	    {text:'  <font color="green">删除</font>  ',checked:false,leaf:true,id:'1013'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',102,')==false}"> 
		        {text:'  <font color="gray">专家名录列表查看 </font>  ',checked:false,id:'102',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',102,')==true}"> 
		        {text:'  <font color="green">专家名录列表查看 </font>  ',checked:false,id:'102',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',1021,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '1021'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1021,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '1021'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1022,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '1022'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1022,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '1022'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1023,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '1023'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1023,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '1023'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',1024,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'1024'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',1024,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'1024'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',103,')==false}"> 
		        {text:'  <font color="gray">邮件订阅列表查看 </font>  ',checked:false,id:'103',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',103,')==true}"> 
		        {text:'  <font color="green">邮件订阅列表查看 </font>  ',checked:false,id:'103',
		        </c:if>
		         children: [
			  	<c:if test="${fn:contains(param_module.permitids,',1031,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '1031'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1031,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '1031'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',1032,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'1032'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',1032,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'1032'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',104,')==false}"> 
		        {text:'  <font color="gray">刊物列表查看 </font>  ',checked:false,id:'104',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',104,')==true}"> 
		        {text:'  <font color="green">刊物列表查看 </font>  ',checked:false,id:'104',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',1041,')==false}"> 
			  	{text: '<font color="gray">新建</font> ',checked:false,leaf:true,id : '1041'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1041,')==true}"> 
			  	{text: '<font color="green">新建</font> ',checked:false,leaf:true,id : '1041'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1042,')==false}"> 
			  	{text: '<font color="gray">编辑</font> ',checked:false,leaf:true,id : '1042'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1042,')==true}"> 
			  	{text: '<font color="green">编辑</font> ',checked:false,leaf:true,id : '1042'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',1043,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '1043'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',1043,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '1043'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',1044,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'1044'}]}]},
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',1044,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'1044'}]}]}, 
 		   	    </c:if>
 		   	    
 		   	    
 		   	    
 		   	    
 		   	    
 		   	    
 		   	     <c:if test="${fn:contains(param_module.permitids,',09,')==false}"> 
			  	{text: '<font color="gray">资产管理模块查看</font> ',checked:false,id : '09',
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',09,')==true}"> 
			  	{text: '<font color="green">资产管理模块查看</font> ',checked:false,id : '09',
			  	</c:if>
			  	  children: [
		          <c:if test="${fn:contains(param_module.permitids,',91,')==false}"> 
		        {text:'  <font color="gray">资产列表查看 </font>  ',checked:false,id:'91',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',91,')==true}"> 
		        {text:'  <font color="green">资产列表查看 </font>  ',checked:false,id:'91',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',911,')==false}"> 
			  	{text: '<font color="gray">登记新资产</font> ',checked:false,leaf:true,id : '911'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',911,')==true}"> 
			  	{text: '<font color="green">登记新资产</font> ',checked:false,leaf:true,id : '911'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',912,')==false}"> 
			  	{text: '<font color="gray">编辑资产</font> ',checked:false,leaf:true,id : '912'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',912,')==true}"> 
			  	{text: '<font color="green">编辑资产</font> ',checked:false,leaf:true,id : '912'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',913,')==false}"> 
			  	{text: '<font color="gray">使用资产</font> ',checked:false,leaf:true,id : '913'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',913,')==true}"> 
			  	{text: '<font color="green">使用资产</font> ',checked:false,leaf:true,id : '913'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',914,')==false}"> 
			  	{text: '<font color="gray">资产交还</font> ',checked:false,leaf:true,id : '914'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',914,')==true}"> 
			  	{text: '<font color="green">资产交还</font> ',checked:false,leaf:true,id : '914'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',915,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '915'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',915,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '915'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',916,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'916'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',916,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'916'}]}, 
 		   	    </c:if>
 		   	    <c:if test="${fn:contains(param_module.permitids,',92,')==false}"> 
		        {text:'  <font color="gray">资产使用记录查看 </font>  ',checked:false,id:'92',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',92,')==true}"> 
		        {text:'  <font color="green">资产使用记录查看 </font>  ',checked:false,id:'92',
		        </c:if>
		         children: [
 		       <c:if test="${fn:contains(param_module.permitids,',921,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'921'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',921,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'921'}]}, 
 		   	    </c:if>
 		   	      <c:if test="${fn:contains(param_module.permitids,',93,')==false}"> 
		        {text:'  <font color="gray">资产交还记录查看 </font>  ',checked:false,id:'93',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',93,')==true}"> 
		        {text:'  <font color="green">资产交还记录查看 </font>  ',checked:false,id:'93',
		        </c:if>
		         children: [
 		       <c:if test="${fn:contains(param_module.permitids,',931,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'931'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',931,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'931'}]}, 
 		   	    </c:if>
 		   	    
 		   	      <c:if test="${fn:contains(param_module.permitids,',08,')==false}"> 
			  	{text: '<font color="gray">库存管理模块查看</font> ',checked:false,id : '08',
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',08,')==true}"> 
			  	{text: '<font color="green">库存管理模块查看</font> ',checked:false,id : '08',
			  	</c:if>
			  	  children: [
		          <c:if test="${fn:contains(param_module.permitids,',81,')==false}"> 
		        {text:'  <font color="gray">产品列表查看 </font>  ',checked:false,id:'81',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',81,')==true}"> 
		        {text:'  <font color="green">产品列表查看 </font>  ',checked:false,id:'81',
		        </c:if>
		         children: [
		        <c:if test="${fn:contains(param_module.permitids,',811,')==false}"> 
			  	{text: '<font color="gray">产品登记</font> ',checked:false,leaf:true,id : '811'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',811,')==true}"> 
			  	{text: '<font color="green">产品登记</font> ',checked:false,leaf:true,id : '811'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',812,')==false}"> 
			  	{text: '<font color="gray">产品编辑</font> ',checked:false,leaf:true,id : '812'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',812,')==true}"> 
			  	{text: '<font color="green">产品编辑</font> ',checked:false,leaf:true,id : '812'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',813,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '813'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',813,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '813'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',814,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'814'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',814,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'814'}]}, 
 		   	    </c:if>
 		   	    <c:if test="${fn:contains(param_module.permitids,',82,')==false}"> 
		        {text:'  <font color="gray">入库管理查看 </font>  ',checked:false,id:'82',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',82,')==true}"> 
		        {text:'  <font color="green">入库管理查看 </font>  ',checked:false,id:'82',
		        </c:if>
		         children: [
		          <c:if test="${fn:contains(param_module.permitids,',821,')==false}"> 
			  	{text: '<font color="gray">产品入库</font> ',checked:false,leaf:true,id : '821'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',821,')==true}"> 
			  	{text: '<font color="green">产品入库</font> ',checked:false,leaf:true,id : '821'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',822,')==false}"> 
			  	{text: '<font color="gray">入库编辑</font> ',checked:false,leaf:true,id : '822'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',822,')==true}"> 
			  	{text: '<font color="green">入库编辑</font> ',checked:false,leaf:true,id : '822'},
			  	</c:if>
			  	<c:if test="${fn:contains(param_module.permitids,',823,')==false}"> 
			  	{text: '<font color="gray">删除</font> ',checked:false,leaf:true,id : '823'},
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',823,')==true}"> 
			  	{text: '<font color="green">删除</font> ',checked:false,leaf:true,id : '823'},
			  	</c:if>
 		       <c:if test="${fn:contains(param_module.permitids,',824,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'824'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',824,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'824'}]}, 
 		   	    </c:if>
 		   	    <c:if test="${fn:contains(param_module.permitids,',83,')==false}"> 
		        {text:'  <font color="gray">出库列表查看 </font>  ',checked:false,id:'83',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',83,')==true}"> 
		        {text:'  <font color="green">出库列表查看 </font>  ',checked:false,id:'83',
		        </c:if>
		         children: [
 		       <c:if test="${fn:contains(param_module.permitids,',831,')==false}">   
 		   	    {text:'  <font color="gray">提取产品</font>  ',checked:false,leaf:true,id:'831'}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',831,')==true}">   
 		   	    {text:'  <font color="green">提取产品</font>  ',checked:false,leaf:true,id:'831'}]}, 
 		   	    </c:if>
 		   	      <c:if test="${fn:contains(param_module.permitids,',84,')==false}"> 
		        {text:'  <font color="gray">出库历史记录查看 </font>  ',checked:false,id:'84',
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',84,')==true}"> 
		        {text:'  <font color="green">出库历史记录查看 </font>  ',checked:false,id:'84',
		        </c:if>
		        children: [
 		       <c:if test="${fn:contains(param_module.permitids,',841,')==false}">   
 		   	    {text:'  <font color="gray">导出excel</font>  ',checked:false,leaf:true,id:'841'}]}]}]}, 
 		   	    </c:if>
 		   	     <c:if test="${fn:contains(param_module.permitids,',841,')==true}">   
 		   	    {text:'  <font color="green">导出excel</font>  ',checked:false,leaf:true,id:'841'}]}]}]}, 
 		   	    </c:if>
			  	
		         <c:if test="${fn:contains(param_module.permitids,',06,')==false}"> 
			  	{text: '<font color="gray">附件模块查看</font> ',checked:false,id : '06',
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',06,')==true}"> 
			  	{text: '<font color="green">附件模块查看</font> ',checked:false,id : '06',
			  	</c:if>
		  children: [
		        <c:if test="${fn:contains(param_module.permitids,',61,')==false}"> 
			  	{text: '<font color="gray">代码生成器模块查看</font> ',checked:false,id : '61',
			  	</c:if>
			  	  <c:if test="${fn:contains(param_module.permitids,',61,')==true}"> 
			  	{text: '<font color="green">代码生成器模块查看</font> ',checked:false,id : '61',
			  	</c:if>
			  	children: [
		         <c:if test="${fn:contains(param_module.permitids,',611,')==false}"> 
		        {text:'  <font color="gray">生成代码 </font>  ',checked:false,leaf:true,id:'611'},
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',611,')==true}"> 
		        {text:'  <font color="green">生成代码 </font>  ',checked:false,leaf:true,id:'611'},
		        </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',612,')==false}"> 
		        {text:'  <font color="gray">代码生成历史记录 </font>  ',checked:false,leaf:true,id:'612'}]},
		         </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',612,')==true}"> 
		        {text:'  <font color="green">代码生成历史记录 </font>  ',checked:false,leaf:true,id:'612'}]},
		         </c:if>
		           <c:if test="${fn:contains(param_module.permitids,',62,')==false}"> 
		        {text:'  <font color="gray">地图信息 </font>  ',checked:false,leaf:true,id:'62'}]}
		         </c:if>
		         <c:if test="${fn:contains(param_module.permitids,',62,')==true}"> 
		        {text:'  <font color="green">地图信息 </font>  ',checked:false,leaf:true,id:'62'}]}
		         </c:if>
            ]
        },
        buttons: [{
            text: '启用指定权限',
            iconCls:'icon_submit',
            handler: function(){
             var ids = ',', selNodes = tree.getChecked();
                Ext.each(selNodes, function(node){
                    ids += node.id+',';
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
			            url: '<%=path %>/param.do?methede=updateParam_Permit&mtype=star&ids='+ids,
			            method: "post",
			            success: function (form,action) {
			                    Ext.MessageBox.hide();
			                    Ext.Msg.alert('系统提示', "配置成功");
			                    window.location.href="<%=path %>/param.do?methede=toUpdateParam_Permit";
			                    
			            },
			            failure: function () {
			                Ext.Msg.alert('系统提示', '系统出错！');
			            }
			        });
            }
        },{
            text: '禁用指定权限',
            iconCls:'icon_cancel',
            handler: function(){
             var ids = ',', selNodes = tree.getChecked();
                Ext.each(selNodes, function(node){
                    ids += node.id+',';
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
			            url: '<%=path %>/param.do?methede=updateParam_Permit&mtype=stop&ids='+ids,
			            method: "post",
			            success: function (form,action) {
			                    Ext.MessageBox.hide();
			                    Ext.Msg.alert('系统提示', "配置成功");
			                    window.location.href="<%=path %>/param.do?methede=toUpdateParam_Permit";
			                    
			            },
			            failure: function () {
			                Ext.Msg.alert('系统提示', '系统出错！');
			            }
			        });
            }
        }]
    });

    tree.getRootNode().expand(true);
     tree.on('bodyresize', function() {
    tree.setSize(700, window.parent.Ext.getCmp('centerP').getSize().height-40); }); 
});
     

     --></script>
	</head>
	<body style="background-color: #DFE8F6;">
	<div id="tree-div"></div>
	</body>
</html>

