<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>出库历史记录</title>
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

  function ExcelExport() {
  Ext.Msg.confirm("系统提示", "确定要导出excel吗？", function (button) {
  if (button == "yes") {
  var vExportContent = grid.getExcelXml(); // 获取数据
  if (Ext.isIE8 ||Ext.isIE6 || Ext.isIE7 || Ext.isSafari || Ext.isSafari2 || Ext.isSafari3) { // 判断浏览器
  var fd = Ext.get('frmDummy'); 
  if (!fd) {
  fd = Ext.DomHelper.append(Ext.getBody(), {
  tag : 'form',
  method : 'post',
  id : 'frmDummy', 
  action : '<%=path %>/backstage/ExportExcel.jsp', 
  target : '_blank',
  name : 'frmDummy', 
  cls : 'x-hidden', 
  cn : [{
    tag : 'input', 
    name : 'exportContent', 
    id : 'exportContent', 
    type : 'hidden'
    }]
  }, true); 
  }
  fd.child('#exportContent').set({
    value : vExportContent
  });
  fd.dom.submit(); 
  } else {
  document.location = 'data:application/vnd.ms-excel;base64,' + Base64.encode(vExportContent);
  }
  }
  })
  }

  //var sm = new Ext.grid.CheckboxSelectionModel();
  var cm = new Ext.grid.ColumnModel([
  new Ext.grid.RowNumberer(),// 自动行号
  //sm,// 添加的地方
   {header : '出库日期',width:120,dataIndex : 'createdate',sortable:true,align:'center'}, 
  {header : '产品编号',dataIndex : 'productcode',sortable:true,align:'center'}, 
  {header : '产品名称',dataIndex : 'productname',sortable:true,align:'center',renderer:function(value){return '<div align="left">'+value+'</div>';}}, 
  {header : '销售单价',dataIndex : 'out_price',sortable:true,align:'center',type:'double'}, 
  {header : '销售数量',dataIndex : 'num',sortable:true,align:'center',type:'double'},
  {header : '销售总价',dataIndex : 'totalprice',sortable:true,align:'center',type:'double'},
  {header : '生产日期',dataIndex : 'production_date',sortable:true,align:'center'}, 
  {header : '过期日期',dataIndex : 'expiration_date',sortable:true,align:'center'},
  {header : '经办人',dataIndex : 'usernickname',sortable:true,align:'center'}]);
   cm.defaultSortable = true;
   var store = new Ext.data.Store({
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
       pageSize: 15,               //每页显示15条记录 
       store: store, 
       displayInfo: true, 
       displayMsg: '显示第 {0} 条到 {1} 条记录，一共 {2} 条',
       emptyMsg: "没有记录" 
    });

  var grid = new Ext.grid.GridPanel({ 
  el:'mm',
  store: store, 
  pageSize: 15, 
  height:window.parent.Ext.getCmp('centerP').getHeight()-30,
  width:window.parent.Ext.getCmp('centerP').getWidth()-5,
  autoScoll:true,//这里是滚动条的出生地
  cm : cm,
  //sm : sm,// 加入一列checkbox
  frame : true,
  bbar: bbar,
  tbar: [
     '-', 
     { id: 'content', xtype: 'textfield' },'-', 
     { text: '搜索',iconCls:'icon_seek',handler: Search }, '-',
      <c:if test="${(fn:contains(userinfo.systempermit,',841,')==false)||((fn:contains(userinfo.systempermit,',841,')==true)&&(fn:contains(userinfo.allpermits,',841,')==true))||userinfo.isadmin eq '1'}">
     { text: '导出Excel',iconCls:'icon_excel',handler: ExcelExport}, '-',
      </c:if>
      ''
     ],//这是上面的按钮
     loadMask: myMask
    }); 
    grid.render();
    store.load(
    {params:{start:0, limit:15}
    }); //加载数据 
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
