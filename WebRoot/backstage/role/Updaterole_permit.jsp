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
        width:685,
        containerScroll: true,
        rootVisible: false,
        frame: true,
        root: {
            id:'1_root',
            text:'所有权限',
            checked:false,
            nodeType: 'async',
             children:[{text: '互动平台',checked:${fn:contains(role.permitids,',01,')},id: '01',leaf:true},
                  {text: '用户管理模块查看',checked:${fn:contains(role.permitids,',02,')},id: '02',children: [
                             {text:'  用户列表模块查看  ',checked:${fn:contains(role.permitids,',021,')},id:'021',children: [
                                          {text:'  新建用户  ',checked:${fn:contains(role.permitids,',0211,')},leaf:true,id:'0211'},
                                          {text:'  编辑用户  ',checked:${fn:contains(role.permitids,',0212,')},leaf:true,id:'0212'},
                                          {text:'  角色配置  ',checked:${fn:contains(role.permitids,',0213,')},leaf:true,id:'0213'},
                                          {text:'  权限配置  ',checked:${fn:contains(role.permitids,',0214,')},leaf:true,id:'0214'},
                                          {text:'  查看所有权限  ',checked:${fn:contains(role.permitids,',0215,')},leaf:true,id:'0215'},
                                          {text:'  密码修改  ',checked:${fn:contains(role.permitids,',0216,')},leaf:true,id:'0216'},
                                          {text:'  删除用户  ',checked:${fn:contains(role.permitids,',0217,')},leaf:true,id:'0217'},
                                          {text:'  导出excel  ',checked:${fn:contains(role.permitids,',0218,')},leaf:true,id:'0218'}]}, 
                             {text:'  需审核用户列表模块查看  ',checked:${fn:contains(role.permitids,',022,')},id:'022',children: [
                                          {text:'  审核权限  ',checked:${fn:contains(role.permitids,',0221,')},leaf:true,id:'0221'},
                                          {text:'  导出excel  ',checked:${fn:contains(role.permitids,',0222,')},leaf:true,id:'0222'}]}]},   
                                          
               {text: '日志管理模块查看',checked:${fn:contains(role.permitids,',03,')},id : '03',children: [
                              {text:'  日志查看  ',checked:${fn:contains(role.permitids,',31,')},leaf:true,id:'31'}]},
               {text: '系统配置模块查看',checked:${fn:contains(role.permitids,',04,')},id : '04',children: [
                              {text:'  后台模块配置  ',leaf:true,checked:${fn:contains(role.permitids,',41,')},id:'41'},
                              {text:'  权限配置  ',leaf:true,checked:${fn:contains(role.permitids,',42,')},id:'42'},
                              {text:'  角色列表查看  ',checked:${fn:contains(role.permitids,',43,')},id:'43',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',431,')},leaf:true,id:'431'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',432,')},leaf:true,id:'432'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',433,')},leaf:true,id:'433'},
                                  {text:'  权限配置  ',checked:${fn:contains(role.permitids,',434,')},leaf:true,id:'434'},
                                  {text:'  导出excel  ',checked:${fn:contains(role.permitids,',435,')},leaf:true,id:'435'}
                              ]}]}, 
               {text: '单位部门管理模块查看',checked:${fn:contains(role.permitids,',05,')},id : '05',children: [
                              {text:'  单位管理查看  ',checked:${fn:contains(role.permitids,',51,')},id:'51',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',511,')},leaf:true,id:'511'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',512,')},leaf:true,id:'512'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',513,')},leaf:true,id:'513'}
                              ]},
                              {text:'  部门管理  ',checked:${fn:contains(role.permitids,',52,')},id:'52',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',521,')},leaf:true,id:'521'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',522,')},leaf:true,id:'522'},
                                  {text:'  顺序管理  ',checked:${fn:contains(role.permitids,',523,')},leaf:true,id:'523'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',524,')},leaf:true,id:'524'}
                              ]},
                              {text:'  职位管理  ',checked:${fn:contains(role.permitids,',53,')},id:'53',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',531,')},leaf:true,id:'531'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',532,')},leaf:true,id:'532'},
                                  {text:'  权限配置  ',checked:${fn:contains(role.permitids,',533,')},leaf:true,id:'533'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',534,')},leaf:true,id:'534'}
                              ]}]},   
                 {text: '前台网站管理模块查看',checked:${fn:contains(role.permitids,',07,')},id : '07',children: [
                              {text:'  前台模块列表查看  ',checked:${fn:contains(role.permitids,',71,')},id:'71',children: [
                                  {text:'  新建模块  ',checked:${fn:contains(role.permitids,',711,')},leaf:true,id:'711'},
                                  {text:'  编辑模块  ',checked:${fn:contains(role.permitids,',712,')},leaf:true,id:'712'},
                                  {text:'  删除模块  ',checked:${fn:contains(role.permitids,',713,')},leaf:true,id:'713'}
                              ]},
                              {text:'  栏目列表查看  ',checked:${fn:contains(role.permitids,',72,')},id:'72',children: [
                                  {text:'  新建栏目  ',checked:${fn:contains(role.permitids,',721,')},leaf:true,id:'721'},
                                  {text:'  编辑栏目  ',checked:${fn:contains(role.permitids,',722,')},leaf:true,id:'722'},
                                  {text:'  新建子栏目  ',checked:${fn:contains(role.permitids,',723,')},leaf:true,id:'723'},
                                  {text:'  栏目隐藏设置  ',checked:${fn:contains(role.permitids,',724,')},leaf:true,id:'724'},
                                  {text:'  删除栏目  ',checked:${fn:contains(role.permitids,',725,')},leaf:true,id:'725'}
                              ]},
                              {text:' 文章类别列表查看  ',checked:${fn:contains(role.permitids,',73,')},id:'73',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',731,')},leaf:true,id:'731'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',732,')},leaf:true,id:'732'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',733,')},leaf:true,id:'733'}
                              ]},
                              {text:'  文章列表查看  ',checked:${fn:contains(role.permitids,',74,')},id:'74',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',741,')},leaf:true,id:'741'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',742,')},leaf:true,id:'742'},
                                  {text:'  编辑摘要  ',checked:${fn:contains(role.permitids,',743,')},leaf:true,id:'743'},
                                  {text:'  首页焦点设置  ',checked:${fn:contains(role.permitids,',744,')},leaf:true,id:'744'},
                                  {text:'  栏目焦点设置  ',checked:${fn:contains(role.permitids,',745,')},leaf:true,id:'745'},
                                  {text:'  大事件设置  ',checked:${fn:contains(role.permitids,',7410,')},leaf:true,id:'7410'},
                                  {text:'  热点设置  ',checked:${fn:contains(role.permitids,',746,')},leaf:true,id:'746'},
                                  {text:'  热荐设置  ',checked:${fn:contains(role.permitids,',747,')},leaf:true,id:'747'},
                                  {text:'  屏蔽设置  ',checked:${fn:contains(role.permitids,',748,')},leaf:true,id:'748'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',749,')},leaf:true,id:'749'}
                              ]},
                             
                              {text:' 友情链接管理  ',checked:${fn:contains(role.permitids,',75,')},id:'75',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',751,')},leaf:true,id:'751'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',752,')},leaf:true,id:'752'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',753,')},leaf:true,id:'753'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',754,')},leaf:true,id:'754'}
                              ]}]},
                              
                    {text: '艺术与考古博物馆管理查看',checked:${fn:contains(role.permitids,',010,')},id : '010',children: [
                           {text:'  展览查看  ',checked:${fn:contains(role.permitids,',105,')},id:'105',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',1051,')},leaf:true,id:'1051'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',1052,')},leaf:true,id:'1052'},
                                  {text:'  展品设置  ',checked:${fn:contains(role.permitids,',1053,')},leaf:true,id:'1053'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',1054,')},leaf:true,id:'1054'},
                                  {text:'  导出excel  ',checked:${fn:contains(role.permitids,',1055,')},leaf:true,id:'1055'}
                              ]},
                             {text:'  展品列表查看  ',checked:${fn:contains(role.permitids,',106,')},id:'106',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',1061,')},leaf:true,id:'1061'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',1062,')},leaf:true,id:'1062'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',1063,')},leaf:true,id:'1063'},
                                  {text:'  导出excel  ',checked:${fn:contains(userbean.permitids,',1064,')},leaf:true,id:'1064'}
                              ]},
                                  {text:'  展览活动列表查看  ',checked:${fn:contains(role.permitids,',101,')},id:'101',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',1011,')},leaf:true,id:'1011'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',1012,')},leaf:true,id:'1012'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',1013,')},leaf:true,id:'1013'}
                              ]},
                              {text:'  专家名录列表查看  ',checked:${fn:contains(role.permitids,',102,')},id:'102',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',1021,')},leaf:true,id:'1021'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',1022,')},leaf:true,id:'1022'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',1023,')},leaf:true,id:'1023'},
                                  {text:'  导出excel  ',checked:${fn:contains(role.permitids,',1024,')},leaf:true,id:'1024'}
                              ]},
                              {text:'  邮件订阅列表查看  ',checked:${fn:contains(role.permitids,',103,')},id:'103',children: [
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',1031,')},leaf:true,id:'1031'},
                                  {text:' 导出excel  ',checked:${fn:contains(role.permitids,',1032,')},leaf:true,id:'1032'}
                              ]},
                              {text:'  刊物列表查看  ',checked:${fn:contains(role.permitids,',104,')},id:'104',children: [
                                  {text:'  新建  ',checked:${fn:contains(role.permitids,',1041,')},leaf:true,id:'1041'},
                                  {text:'  编辑  ',checked:${fn:contains(role.permitids,',1042,')},leaf:true,id:'1042'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',1043,')},leaf:true,id:'1043'},
                                  {text:' 导出excel  ',checked:${fn:contains(role.permitids,',1044,')},leaf:true,id:'1044'}
                              ]}
                             ]},                 
                                   
                    {text: '资产管理模块查看',checked:${fn:contains(role.permitids,',09,')},id : '09',children: [
                              {text:'  资产列表查看  ',checked:${fn:contains(role.permitids,',91,')},id:'91',children: [
                                  {text:'  登记新资产  ',checked:${fn:contains(role.permitids,',911,')},leaf:true,id:'911'},
                                  {text:'  编辑资产  ',checked:${fn:contains(role.permitids,',912,')},leaf:true,id:'912'},
                                  {text:'  使用资产  ',checked:${fn:contains(role.permitids,',913,')},leaf:true,id:'913'},
                                  {text:'  资产交还  ',checked:${fn:contains(role.permitids,',914,')},leaf:true,id:'914'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',915,')},leaf:true,id:'915'},
                                  {text:'  导出excel  ',checked:${fn:contains(role.permitids,',916,')},leaf:true,id:'916'}
                              ]},
                              {text:'  资产使用记录查看  ',checked:${fn:contains(role.permitids,',92,')},id:'92',children: [
                                  {text:'  导出excel  ',checked:${fn:contains(role.permitids,',921,')},leaf:true,id:'921'}
                              ]},
                              {text:' 资产交还记录查看  ',checked:${fn:contains(role.permitids,',93,')},id:'93',children: [
                                  {text:' 导出excel  ',checked:${fn:contains(role.permitids,',931,')},leaf:true,id:'931'}
                              ]}
                             ]},     
                    {text: '库存管理模块查看',checked:${fn:contains(role.permitids,',08,')},id : '08',children: [
                              {text:'  产品列表查看  ',checked:${fn:contains(role.permitids,',81,')},id:'81',children: [
                                  {text:'  产品登记  ',checked:${fn:contains(role.permitids,',811,')},leaf:true,id:'811'},
                                  {text:'  产品编辑  ',checked:${fn:contains(role.permitids,',812,')},leaf:true,id:'812'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',813,')},leaf:true,id:'813'},
                                  {text:'  导出excel  ',checked:${fn:contains(role.permitids,',814,')},leaf:true,id:'814'}
                              ]},
                              {text:'  入库管理查看  ',checked:${fn:contains(role.permitids,',82,')},id:'82',children: [
                                  {text:'  产品入库  ',checked:${fn:contains(role.permitids,',821,')},leaf:true,id:'821'},
                                  {text:'  入库编辑  ',checked:${fn:contains(role.permitids,',822,')},leaf:true,id:'822'},
                                  {text:'  删除  ',checked:${fn:contains(role.permitids,',823,')},leaf:true,id:'823'},
                                  {text:'  导出excel  ',checked:${fn:contains(role.permitids,',824,')},leaf:true,id:'824'}
                              ]},
                             {text:'  出库列表查看  ',checked:${fn:contains(role.permitids,',83,')},id:'83',children: [
                                  {text:'  提取产品  ',checked:${fn:contains(role.permitids,',831,')},leaf:true,id:'831'}
                              ]},
                             {text:' 出库历史记录查看  ',checked:${fn:contains(role.permitids,',84,')},id:'84',children: [
                                  {text:' 导出excel  ',checked:${fn:contains(role.permitids,',841,')},leaf:true,id:'841'}
                              ]}
                             ]},     
               {text: '附件模块查看',checked:${fn:contains(role.permitids,',06,')},id : '06',children: [
                              {text:'  代码生成器模块查看  ',checked:${fn:contains(role.permitids,',61,')},id:'61',children: [
                                  {text:' 生成代码  ',checked:${fn:contains(role.permitids,',611,')},leaf:true,id:'611'},
                                  {text:' 代码生成历史记录  ',checked:${fn:contains(role.permitids,',612,')},leaf:true,id:'612'}
                              ]},
                              {text:'  地图信息  ',checked:${fn:contains(role.permitids,',62,')},leaf:true,id:'62'}]}                         
        ]
        }
       
    });
    
    tree.getRootNode().expand(true);
  
     parent.Ext.getCmp('permitbutton').setHandler(function(){
    var permitsid = ',', selNodes = tree.getChecked();
                Ext.each(selNodes, function(node){
                    permitsid += node.id+',';
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
			            url: '<%=path %>/roles.do?methede=updateRolePermitEXT&permitsid='+permitsid,
			            method: "post",
			            params:{rolesid:'${role.id}'},
			            success: function (form,action) {
			                    Ext.MessageBox.hide();
			                    Ext.Msg.alert('系统提示', "配置成功");
			                    
			            },
			            failure: function () {
			                Ext.Msg.alert('系统提示', '系统出错！');
			            }
			        });  
          }                  
         );
});
     

     --></script>
	</head>
	<body style="background-color: #DFE8F6;">
	<div id="tree-div"></div>
	</body>
</html>

