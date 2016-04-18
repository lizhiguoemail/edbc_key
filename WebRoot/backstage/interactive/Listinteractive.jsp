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
    
    <title>已发送</title>
    
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
      var sl=new Ext.data.SimpleStore({
     fields:['value','text'],
     data:[
     ['','全部'],
     ['title','发送标题'],
     ['receiver','发送对象'],
     ['createdate','发送时间']
     ]
     });
      Ext.onReady(function(){ 
       var myMask = new Ext.LoadMask(Ext.getBody(), {
                        msg: '正在加载数据，请稍后！',
                        removeMask: true //完成后移除
                    });
      
       function shownew(oid){
            var showsend = new parent.window.Ext.Window({
            id:'showsend',
            title:'信息详情',
	        layout:'fit',
	        width:410,
	        height:400,
	        closeAction:'close',
	        modal:true,
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	        html: '<iframe frameborder="0" width="100%" height="100%" scrolling="no" src="<%=path %>/interactive.do?methede=showSendEXT&oid='+oid+'"></iframe>'
	        });
        showsend.show();
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
      
       var Search = function () {
            var val = Ext.getCmp("content").getValue();
            var fe=Ext.getCmp("fname").value;
            store.load({ params: { start: 0,limit: 15,fieldname:fe,content: val},
            callback :function(r,options,success){    
       		if(!success){//没取到数据时返回的success=false
              store.removeAll();//清除原有数据
            //更新page导航信息
              bbar.updateInfo();
              bbar.first.setDisabled(true);
              bbar.prev.setDisabled(true);
              bbar.next.setDisabled(true);
              bbar.last.setDisabled(true);
              }}
            });
                 }

      
   var sm = new Ext.grid.CheckboxSelectionModel();
   var cm = new Ext.grid.ColumnModel([
   new Ext.grid.RowNumberer(),// 自动行号
   sm,// 添加的地方
   {header : '消息ID',dataIndex : 'id',hidden:true}, 
   {header : '发送标题',width:200,dataIndex : 'title',sortable:true}, 
   {header : '发送对象',width:150,dataIndex : 'receiver',sortable:true}, 
   {header : '发送时间',width:120,dataIndex : 'createdate',sortable:true}]);
    cm.defaultSortable = true;
       var store = new Ext.data.Store({ 
        proxy: new Ext.data.HttpProxy(
        {url: '<%=path %>/interactive.do?methede=listSendEXT',
         method : 'post'
        }),//store提交的地址 
        reader: new Ext.data.JsonReader({ 
            totalProperty: 'totalCount',  
            //得到共有多少条条记录，是从后台返回的 
            root: 'rows'
            //得到记录集合，需是json格式的，也是从后台返回的 
        }, [
                         {name:'id',mapping:'id'},
                         {name:'title',mapping:'title'},
                         {name:'receiver',mapping:'receiver'},
                         {name:'createdate',mapping:'createdate'}
                         ]
                        )

    }); 
      store.on("beforeload", function(currentStore, options) {
                currentStore.baseParams["fieldname"] = Ext.getCmp("fname").value;
                currentStore.baseParams["content"] = Ext.getCmp("content").value;
            });
    
     var bbar=new Ext.PagingToolbar({ 
      plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' }), new Ext.ui.plugins.SliderPageSize()],
            pageSize: 15,               //每页显示20条记录 
            store: store, 
            displayInfo: true, 
            displayMsg: '显示第 {0} 条到 {1} 条记录，一共 {2} 条', 
            emptyMsg: "没有记录" 
        });

    var grid = new Ext.grid.GridPanel({ 
        title: '已发送', 
        el:'mm',
        store: store, 
        pageSize: 15, 
        height:window.parent.Ext.getCmp('centerP').getHeight()-30,
        width:window.parent.Ext.getCmp('centerP').getWidth()-5,
        autoScoll:true,//这里是滚动条的出生地
        cm : cm,
        sm : sm,// 加入一列checkbox
        frame : true,
        bbar: bbar,
        tbar: [
        { 
        xtype:'combo',id:'fname',name:'fname',hiddenName:'fieldname',mode:'local',store:sl,valueField:'value',displayField:'text',triggerAction: 'all',submintVaule:true,editable:false,emptyText: '请选择'  
        },'-', 
        { id: 'content', xtype: 'textfield' },'-', 
        { text: '搜索', iconCls:'icon_seek',handler: Search },'-',
        { text: '查看', iconCls:'icon_view',handler: Gridshow },'-'
       ],//这是上面的按钮
        loadMask: myMask,
         listeners:{
           "rowdblclick" : function(grid, rowIndex, e){
            var record = grid.getStore().getAt(rowIndex);
            var id = record.get('id');
            shownew(id);
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
  
  </body>
</html>
