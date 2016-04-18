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
    
    <title>未读信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
    <script type="text/javascript" src="<%=path %>/js/ext-ui-combo-pagesize.js"></script>
      <script type="text/javascript" src="<%=path %>/js/ext-ui-slider-pagesize.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/src/locale/ext-lang-zh_CN.js"></script>  
     <script type="text/javascript">
      Ext.onReady(function(){ 
        function shownew(oid){
            var showunread = new parent.window.Ext.Window({
            id:'showunread',
            title:'未读信息详情',
	        layout:'fit',
	        width:410,
	        height:400,
	        closeAction:'close',
	        modal:true,
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	        listeners:{
	          "close":function(){ 
			  var gb=parent.window.document.getElementById("gb");
	          if(gb.value!='0')
	          { 
			   replynew(gb.value);
			   gb.value='0';
			  }
			   Ext.getCmp("content").focus();
				}
	        },
	        html: '<iframe frameborder="0" width="100%" height="100%" scrolling="no"  src="<%=path %>/interactive.do?methede=showUnread&oid='+oid+'"></iframe>'
	        });
        showunread.show();
      };
      
       function replynew(oid){
            var showreply = new parent.window.Ext.Window({
            id:'showreply',
            title:'信息回复',
	        layout:'fit',
	        width:410,
	        height:450,
	        closeAction:'close',
	        modal:true,
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	           listeners:{
	          "close":function(){ 
			   Ext.getCmp("content").focus();
				}
	        },
	        html: '<iframe frameborder="0" width="100%" height="100%" scrolling="no" src="<%=path %>/interactive.do?methede=toreply&oid='+oid+'"></iframe>'
	        });
           showreply.show();
      };
      
      var Gridshow = function () {
       if (sm.hasSelection()) {
        var rows=grid.getSelectionModel().getSelections(); 
        if(rows.length>1)
        {
          Ext.Msg.alert('系统提示', "只能选中一个单位");
        }
        else
        {
          var id = rows[0].get('id');
          shownew(id);
          store.reload();
        }
        }
        else
        {
           Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行查看操作！");
        }
       }
       
       var myMask = new Ext.LoadMask(Ext.getBody(), {
                        msg: '正在加载数据，请稍后！',
                        removeMask: true //完成后移除
                    });
   var sm = new Ext.grid.CheckboxSelectionModel();
   var cm = new Ext.grid.ColumnModel([
   new Ext.grid.RowNumberer(),// 自动行号
   sm,// 添加的地方
   {header : '消息ID',dataIndex : 'id',hidden:true}, 
   {header : '发送者',width:200,dataIndex : 'sender',sortable:true}, 
   {header : '发送标题',width:150,dataIndex : 'title',sortable:true}, 
   {header : '发送时间',width:120,dataIndex : 'createdate',sortable:true}
   ]);
    cm.defaultSortable = true;
       var store = new Ext.data.Store({ 
        proxy: new Ext.data.HttpProxy(
        {url: '<%=path %>/interactive.do?methede=listunreadEXT',
         method : 'post'
        }),//store提交的地址 
        reader: new Ext.data.JsonReader({ 
            totalProperty: 'totalCount',  
            //得到共有多少条条记录，是从后台返回的 
            root: 'rows'
            //得到记录集合，需是json格式的，也是从后台返回的 
        }, [
                         {name:'id',mapping:'id'},
                         {name:'sender',mapping:'sender'},
                         {name:'title',mapping:'title'},
                         {name:'createdate',mapping:'createdate'}
                         ]
                        )

    }); 

    var grid = new Ext.grid.GridPanel({ 
        title: '未读消息', 
        el:'mm',
        store: store, 
        pageSize: 15, 
        height:window.parent.Ext.getCmp('centerP').getHeight()-30,
        width:window.parent.Ext.getCmp('centerP').getWidth()-5,
        autoScoll:true,//这里是滚动条的出生地
        cm : cm,
        sm : sm,// 加入一列checkbox
        frame : true,
        bbar: new Ext.PagingToolbar({ 
             plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' }), new Ext.ui.plugins.SliderPageSize()],
            pageSize: 15,               //每页显示20条记录 
            store: store, 
            displayInfo: true, 
            displayMsg: '显示第 {0} 条到 {1} 条记录，一共 {2} 条', 
            emptyMsg: "没有记录" 
        }),
         tbar: [
          '-', 
        { text: '查看', iconCls:'icon_view',handler: Gridshow }
       ],//这是上面的按钮
        loadMask: myMask,
         listeners:{
           "rowdblclick" : function(grid, rowIndex, e){
            var record = grid.getStore().getAt(rowIndex);
            var id = record.get('id');
            shownew(id);
            store.reload();
        }
    }
    }); 
    grid.render();
    store.load({params:{start:0, limit:15}}); //加载数据 
    
    grid.on('bodyresize', function() {
    grid.setSize(window.parent.Ext.getCmp('centerP').getSize().width-5, window.parent.Ext.getCmp('centerP').getSize().height-30); }); 
});  
     </script>

  </head>

  <body>
  <div id="mm" ></div>
   <input type="hidden" value="0" id="gb" name="gb">
  </body>
</html>
