<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>产品入库列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<script type="text/javascript" src="<%=path %>/js/ExportExcel.js"></script>
<script type="text/javascript" src="<%=path %>/js/ext-ui-combo-pagesize.js"></script>
<script type="text/javascript" src="<%=path %>/js/ext-ui-slider-pagesize.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/src/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
  Ext.onReady(function(){
  var myMask = new Ext.LoadMask(Ext.getBody(), {
  msg: '正在加载数据，请稍后！',
  removeMask: true //完成后移除
  });

  function outnew(id){ 
    var out = new parent.window.Ext.Window({
    id:'outnew', 
    title:'提取产品', 
    layout:'fit', 
    width:830,
    height:340,
    closeAction:'close', 
    modal:true,
    //collapsible:true, 折叠 
    plain: false, 
    resizable: true, 
    listeners:{ 
      "close":function(){ 
        var gb=parent.window.document.getElementById("gb"); 
        if(gb.value=='1'){
          store.reload(); 
          storeout.reload();
          gb.value='0';  
          } 
          Ext.getCmp("content").focus();
         }  
      }, 
      buttons:[{
	       text:'提交',
	       id:'addbutton',
	       icon:'<%=path %>/images/backstage/ok.gif',
	       cls: "x-btn-text-icon",
	       type: 'submit'
	       },{
	        text:'取消',
	        icon:'<%=path %>/images/backstage/cancel.gif',
	        cls: "x-btn-text-icon",
	        handler:function(){
	        var win = parent.Ext.getCmp('outnew');
	        if (win) {win.close();}
	        }
	       }],
     html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/out_product.do?methede=toOutproduct&id='+id+'"></iframe>' 
     });
     out.show();
     }; 

   var Gridout = function () {
   if (sm.hasSelection()) { 
     var rows=grid.getSelectionModel().getSelections();  
     if(rows.length>1){ 
       Ext.Msg.alert('系统提示', "只能选中一条数据");
     } 
   else{ 
     var id = rows[0].get('id');
     outnew(id);
      }
    }
    else{
     Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行提取操作！");
     }
    }

   var Search = function () {
   var val = Ext.getCmp("content").getValue();
   store.load({ params: { start: 0,limit: 15,content: val},
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
   } //一个执行搜索是的函数

  var sm = new Ext.grid.CheckboxSelectionModel();
  var cm = new Ext.grid.ColumnModel([
  new Ext.grid.RowNumberer(),// 自动行号
  sm,// 添加的地方
  {header : 'ID',dataIndex : 'id',hidden:true}, 
  {header : '产品编号',dataIndex : 'productcode',sortable:true,align:'center'}, 
  {header : '产品名称',dataIndex : 'productname',sortable:true,align:'center',renderer:function(value){return '<div align="left">'+value+'</div>';}}, 
  {header : '入库单价',dataIndex : 'price',sortable:true,align:'center',type:'double'}, 
  {header : '入库数量',dataIndex : 'num',sortable:true,align:'center',type:'double'}, 
  {header : '总价',dataIndex : 'totalprice',sortable:true,align:'center',type:'double'},
  {header : '生产日期',dataIndex : 'production_date',sortable:true,align:'center'}, 
  {header : '过期日期',dataIndex : 'expiration_date',sortable:true,align:'center'}, 
  {header : '存放位置',dataIndex : 'location',sortable:true,align:'center',renderer:function(value){return '<div align="left">'+value+'</div>';}}
  ]);
   cm.defaultSortable = true;
   
    var cmout = new Ext.grid.ColumnModel([
  new Ext.grid.RowNumberer(),// 自动行号
  {header : '出库日期',width:120,dataIndex : 'createdate',sortable:true,align:'center'}, 
  {header : '产品编号',dataIndex : 'productcode',sortable:true,align:'center'}, 
  {header : '产品名称',dataIndex : 'productname',sortable:true,align:'center',renderer:function(value){return '<div align="left">'+value+'</div>';}}, 
  {header : '销售单价',dataIndex : 'out_price',sortable:true,align:'center',type:'double'}, 
  {header : '销售数量',dataIndex : 'num',sortable:true,align:'center',type:'double'},
  {header : '销售总价',dataIndex : 'totalprice',sortable:true,align:'center',type:'double'},
  {header : '生产日期',dataIndex : 'production_date',sortable:true,align:'center'}, 
  {header : '过期日期',dataIndex : 'expiration_date',sortable:true,align:'center'},
  {header : '经办人',dataIndex : 'usernickname',sortable:true,align:'center'}
  ]);
   
   var store = new Ext.data.Store({
   proxy: new Ext.data.HttpProxy(
   {url: '<%=path %>/in_product.do?methede=listEXT',
   method : 'post'
   }),//store提交的地址 
  reader: new Ext.data.JsonReader({ 
  totalProperty: 'totalCount',  //得到共有多少条条记录，是从后台返回的 
  root: 'rows' //得到记录集合，需是json格式的，也是从后台返回的 
  }, [
        {name:'id',mapping:'id'},
        {name:'productcode',mapping:'productcode'},
        {name:'productname',mapping:'productname'},
        {name:'price',mapping:'price'},
        {name:'num',mapping:'num'},
        {name:'totalprice',mapping:'totalprice'},
        {name:'production_date',mapping:'production_date'},
        {name:'expiration_date',mapping:'expiration_date'},
        {name:'location',mapping:'location'}
      ]
   )
  }); 
  
     var storeout = new Ext.data.Store({
   proxy: new Ext.data.HttpProxy(
   {url: '<%=path %>/out_product.do?methede=listEXT',
   method : 'post'
   }),//store提交的地址 
  reader: new Ext.data.JsonReader({ 
  totalProperty: 'totalCount',  //得到共有多少条条记录，是从后台返回的 
  root: 'rows' //得到记录集合，需是json格式的，也是从后台返回的 
  }, [
        {name:'createdate',mapping:'createdate'},
        {name:'productcode',mapping:'productcode'},
        {name:'productname',mapping:'productname'},
        {name:'out_price',mapping:'out_price'},
        {name:'num',mapping:'num'},
        {name:'totalprice',mapping:'totalprice'},
        {name:'production_date',mapping:'production_date'},
        {name:'expiration_date',mapping:'expiration_date'},
        {name:'usernickname',mapping:'usernickname'}
      ]
   )
  }); 
  
  store.on("beforeload", function(currentStore, options) {
   currentStore.baseParams["content"] = Ext.getDom("content").value;
   });

   var bbar=new Ext.PagingToolbar({
       plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' }), new Ext.ui.plugins.SliderPageSize()],
       pageSize: 10,               //每页显示15条记录 
       store: store, 
       displayInfo: true, 
       displayMsg: '显示第 {0} 条到 {1} 条记录，一共 {2} 条',
       emptyMsg: "没有记录" 
    });
    
     var bbarout=new Ext.PagingToolbar({
       plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' }), new Ext.ui.plugins.SliderPageSize()],
       pageSize: 5,               //每页显示15条记录 
       store: store, 
       displayInfo: true, 
       displayMsg: '显示第 {0} 条到 {1} 条记录，一共 {2} 条',
       emptyMsg: "没有记录" 
    });

  var grid = new Ext.grid.GridPanel({ 
  title:'<img src="<%=path %>/images/backstage/kcgl.gif" style="vertical-align:middle;"> 仓库中的产品',
  el:'mm',
  store: store, 
  pageSize: 10, 
  height:(window.parent.Ext.getCmp('centerP').getHeight()-30)*0.6,
  width:window.parent.Ext.getCmp('centerP').getWidth()-5,
  autoScoll:true,//这里是滚动条的出生地
  cm : cm,
  sm : sm,// 加入一列checkbox
  frame : true,
  bbar: bbar,
  tbar: [
     '-', 
     { id: 'content', xtype: 'textfield' },'-', 
     { text: '搜索',iconCls:'icon_seek',handler: Search }, '-',
     <c:if test="${(fn:contains(userinfo.systempermit,',831,')==false)||((fn:contains(userinfo.systempermit,',831,')==true)&&(fn:contains(userinfo.allpermits,',831,')==true))||userinfo.isadmin eq '1'}">
     { text: '提取产品',iconCls:'icon_tiqu', handler: Gridout}, '-',
     </c:if>
      ''
     ],//这是上面的按钮
     loadMask: myMask,
     listeners:{
     "rowdblclick" : function(grid, rowIndex, e){
     var record = grid.getStore().getAt(rowIndex);
     var id = record.get('id');
     outnew(id);}}
    }); 
    grid.render();
    store.load(
    {params:{start:0, limit:10}
    }); //加载数据 
    grid.on('bodyresize', function() {
    grid.setSize(window.parent.Ext.getCmp('centerP').getSize().width-5, (window.parent.Ext.getCmp('centerP').getSize().height-30))*0.4; }); 
    
    
    var gridout = new Ext.grid.GridPanel({ 
  title:'<img src="<%=path %>/images/backstage/cklsjl.gif" style="vertical-align:middle;"> 产品出库的历史记录',
  el:'out',
  store: storeout, 
  pageSize: 5, 
  height:(window.parent.Ext.getCmp('centerP').getHeight()-30)*0.4,
  width:window.parent.Ext.getCmp('centerP').getWidth()-5,
  autoScoll:true,//这里是滚动条的出生地
  cm : cmout,
  frame : true,
  bbar: bbarout
    }); 
    gridout.render();
    storeout.load(
    {params:{start:0, limit:5}
    }); //加载数据 
    gridout.on('bodyresize', function() {
    gridout.setSize(window.parent.Ext.getCmp('centerP').getSize().width-5, (window.parent.Ext.getCmp('centerP').getSize().height-30))*0.4; });
   }); 
      </script>

   </head>

   <body>
   <div id="mm" ></div>
   <div id="out" ></div>
   <input type="hidden" value="0" id="gb" name="gb">
   </body>
  </html>
