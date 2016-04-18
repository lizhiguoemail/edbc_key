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
		 <title>分配权限</title>
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
        width:700,
        containerScroll: true,
        rootVisible: false,
        frame: true,
        root: {
            id:'1_root',
            text:'所有权限',
            checked:false,
            nodeType: 'async',
            children:[{text: '互动平台',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',01,')},id: '01',leaf:true},
                  {text: '用户管理模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',02,')},id: '02',children: [
                                {text:'  用户列表模块查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',021,')},id:'021',children: [
                                          {text:'  新建用户  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0211,')},leaf:true,id:'0211'},
                                          {text:'  编辑用户  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0212,')},leaf:true,id:'0212'},
                                          {text:'  角色配置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0213,')},leaf:true,id:'0213'},
                                          {text:'  权限配置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0214,')},leaf:true,id:'0214'},
                                          {text:'  查看所有权限  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0215,')},leaf:true,id:'0215'},
                                          {text:'  密码修改  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0216,')},leaf:true,id:'0216'},
                                          {text:'  删除用户  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0217,')},leaf:true,id:'0217'},
                                          {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0218,')},leaf:true,id:'0218'}]},
                                {text:'  需审核用户列表模块查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',022,')},id:'022',children: [
                                          {text:'  审核权限  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0221,')},leaf:true,id:'0221'},
                                          {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',0222,')},leaf:true,id:'0222'}]}]},  
               {text: '日志管理模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',03,')},id : '03',children: [
                              {text:'  日志查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',31,')},leaf:true,id:'31'}]},
               {text: '系统配置模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',04,')},id : '04',children: [
                              {text:'  后台模块配置  ',leaf:true,checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',41,')},id:'41'},
                              {text:'  权限配置  ',leaf:true,checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',42,')},id:'42'},
                              {text:'  角色列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',43,')},id:'43',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',431,')},leaf:true,id:'431'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',432,')},leaf:true,id:'432'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',433,')},leaf:true,id:'433'},
                                  {text:'  权限配置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',434,')},leaf:true,id:'434'},
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',435,')},leaf:true,id:'435'}
                              ]}]}, 
               {text: '单位部门管理模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',05,')},id : '05',children: [
                              {text:'  单位管理查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',51,')},id:'51',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',511,')},leaf:true,id:'511'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',512,')},leaf:true,id:'512'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',513,')},leaf:true,id:'513'}
                              ]},
                              {text:'  部门管理  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',52,')},id:'52',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',521,')},leaf:true,id:'521'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',522,')},leaf:true,id:'522'},
                                  {text:'  顺序管理  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',523,')},leaf:true,id:'523'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',524,')},leaf:true,id:'524'}
                              ]},
                              {text:'  职位管理  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',53,')},id:'53',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',531,')},leaf:true,id:'531'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',532,')},leaf:true,id:'532'},
                                  {text:'  权限配置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',533,')},leaf:true,id:'533'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',534,')},leaf:true,id:'534'}
                              ]}]},   
                 {text: '前台网站管理模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',07,')},id : '07',children: [
                              {text:'  前台模块列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',71,')},id:'71',children: [
                                  {text:'  新建模块  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',711,')},leaf:true,id:'711'},
                                  {text:'  编辑模块  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',712,')},leaf:true,id:'712'},
                                  {text:'  删除模块  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',713,')},leaf:true,id:'713'}
                              ]},
                              {text:'  栏目列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',72,')},id:'72',children: [
                                  {text:'  新建栏目  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',721,')},leaf:true,id:'721'},
                                  {text:'  编辑栏目  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',722,')},leaf:true,id:'722'},
                                  {text:'  新建子栏目  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',723,')},leaf:true,id:'723'},
                                  {text:'  栏目隐藏设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',724,')},leaf:true,id:'724'},
                                  {text:'  删除栏目  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',725,')},leaf:true,id:'725'}
                              ]},
                              {text:' 文章类别列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',73,')},id:'73',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',731,')},leaf:true,id:'731'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',732,')},leaf:true,id:'732'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',733,')},leaf:true,id:'733'}
                              ]},
                              {text:'  文章列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',74,')},id:'74',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',741,')},leaf:true,id:'741'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',742,')},leaf:true,id:'742'},
                                  {text:'  编辑摘要  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',743,')},leaf:true,id:'743'},
                                  {text:'  首页焦点设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',744,')},leaf:true,id:'744'},
                                  {text:'  栏目焦点设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',745,')},leaf:true,id:'745'},
                                  {text:'  大事件设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',7410,')},leaf:true,id:'7410'},
                                  {text:'  热点设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',746,')},leaf:true,id:'746'},
                                  {text:'  热荐设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',747,')},leaf:true,id:'747'},
                                  {text:'  屏蔽设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',748,')},leaf:true,id:'748'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',749,')},leaf:true,id:'749'}
                              ]},
                              {text:' 友情链接管理  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',75,')},id:'75',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',751,')},leaf:true,id:'751'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',752,')},leaf:true,id:'752'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',753,')},leaf:true,id:'753'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',754,')},leaf:true,id:'754'}
                              ]}]}, 
                              
                               {text: '艺术与考古博物馆管理查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',010,')},id : '010',children: [
                                {text:'  展览查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',105,')},id:'105',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1051,')},leaf:true,id:'1051'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1052,')},leaf:true,id:'1052'},
                                  {text:'  展品设置  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1053,')},leaf:true,id:'1053'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1054,')},leaf:true,id:'1054'},
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1055,')},leaf:true,id:'1055'}
                              ]},
                               {text:'  展品列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',106,')},id:'106',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1061,')},leaf:true,id:'1061'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1062,')},leaf:true,id:'1062'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1063,')},leaf:true,id:'1063'},
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1064,')},leaf:true,id:'1064'}
                              ]},
                               {text:'  展览活动列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',101,')},id:'101',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1011,')},leaf:true,id:'1011'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1012,')},leaf:true,id:'1012'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1013,')},leaf:true,id:'1013'}
                              ]},
                              {text:'  专家名录列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',102,')},id:'102',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1021,')},leaf:true,id:'1021'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1022,')},leaf:true,id:'1022'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1023,')},leaf:true,id:'1023'},
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1024,')},leaf:true,id:'1024'}
                              ]},
                              {text:'  邮件订阅列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',103,')},id:'103',children: [
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1031,')},leaf:true,id:'1031'},
                                  {text:' 导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1032,')},leaf:true,id:'1032'}
                              ]},
                              {text:'  刊物列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',104,')},id:'104',children: [
                                  {text:'  新建  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1041,')},leaf:true,id:'1041'},
                                  {text:'  编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1042,')},leaf:true,id:'1042'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1043,')},leaf:true,id:'1043'},
                                  {text:' 导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',1044,')},leaf:true,id:'1044'}
                              ]}
                             
                             ]},     
                              
                              {text: '资产管理模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',09,')},id : '09',children: [
                              {text:'  资产列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',91,')},id:'91',children: [
                                  {text:'  登记新资产  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',911,')},leaf:true,id:'911'},
                                  {text:'  编辑资产  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',912,')},leaf:true,id:'912'},
                                  {text:'  使用资产  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',913,')},leaf:true,id:'913'},
                                  {text:'  资产交还  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',914,')},leaf:true,id:'914'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',915,')},leaf:true,id:'915'},
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',916,')},leaf:true,id:'916'}
                              ]},
                              {text:'  资产使用记录查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',92,')},id:'92',children: [
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',921,')},leaf:true,id:'921'}
                              ]},
                              {text:' 资产交还记录查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',93,')},id:'93',children: [
                                  {text:' 导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',931,')},leaf:true,id:'931'}
                              ]}
                             ]},    
                                  
                   
                    {text: '库存管理模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',08,')},id : '08',children: [
                              {text:'  产品列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',81,')},id:'81',children: [
                                  {text:'  产品登记  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',811,')},leaf:true,id:'811'},
                                  {text:'  产品编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',812,')},leaf:true,id:'812'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',813,')},leaf:true,id:'813'},
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',814,')},leaf:true,id:'814'}
                              ]},
                              {text:'  入库管理查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',82,')},id:'82',children: [
                                  {text:'  产品入库  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',821,')},leaf:true,id:'821'},
                                  {text:'  入库编辑  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',822,')},leaf:true,id:'822'},
                                  {text:'  删除  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',823,')},leaf:true,id:'823'},
                                  {text:'  导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',824,')},leaf:true,id:'824'}
                              ]},
                             {text:'  出库列表查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',83,')},id:'83',children: [
                                  {text:'  提取产品  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',831,')},leaf:true,id:'831'}
                              ]},
                             {text:' 出库历史记录查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',84,')},id:'84',children: [
                                  {text:' 导出excel  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',841,')},leaf:true,id:'841'}
                              ]}
                             ]},     
               {text: '附件模块查看',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',06,')},id : '06',children: [
                              {text:'  代码生成器模块查看  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',61,')},id:'61',children: [
                                  {text:' 生成代码  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',611,')},leaf:true,id:'611'},
                                  {text:' 代码生成历史记录  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',612,')},leaf:true,id:'612'}
                              ]},
                              {text:'  地图信息  ',checked:${userbean.isadmin eq '1'||fn:contains(userbean.allpermits,',62,')},leaf:true,id:'62'}]}                         
        ]
        },
        listeners: {
            'checkchange': function docheck(node, checked){
             if(node.getUI().checkbox.checked==true)
             {
               node.getUI().checkbox.checked=false;
             }
             else
             {
                node.getUI().checkbox.checked=true;
             }
            }
        }
    });
    
    tree.getRootNode().expand(true);
  
    
});
     

     --></script>
	</head>
	<body style="background-color: #DFE8F6;">
	<div id="tree-div"></div>
	</body>
</html>

