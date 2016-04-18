<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>展品列表</title>
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
  

   function shownew(id){

      var shownew = new parent.window.Ext.Window({
      id:'shownew',
      title:'查看详情',
      layout:'fit', 
      width:840,
      height:360,
      closeAction:'close',  
      modal:true,
      //collapsible:true, 折叠
      plain: false,
      resizable: true,
      buttons:[{
      text:'关闭',
      icon:'<%=path %>/images/backstage/cancel.gif',
      cls: "x-btn-text-icon",
      handler:function(){
      var win = parent.Ext.getCmp('shownew');
      if (win) {win.close();}
      }
      }],
      html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/art_goods.do?methede=show&id='+id+'"></iframe>'
      });
      shownew.show();
    };

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

  var Gridset=function(str) {
  if (sm.hasSelection()) {
    Ext.Msg.confirm("警告", "确定要操作吗？", function (button) {
    if (button == "yes") {
      var rows=grid.getSelectionModel().getSelections(); 
      var id = '';
      for(var i=0;i <rows.length;i++){ 
      if(i>0){
      id = id + ',' + rows[i].get('id'); 
      }else{
      id = id + rows[i].get('id'); 
       } 
     }
     Ext.MessageBox.show({
     title: '请稍等',
     msg: '正在设置...',
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
       url: '<%=path %>/exhibition.do?methede=setEXT',
       method: "post",
       params:{ids:id,settype:str,id:'${exhibition.id}'},
       success: function (form,action) {
         Ext.MessageBox.hide();
         Ext.Msg.alert('系统提示', "设置成功");
         window.location.href="<%=path %>/exhibition.do?methede=toSet&id=${exhibition.id}";
        },
     failure: function () {
       Ext.Msg.alert('系统提示', '系统出错！');
     }
    });
    }});
   }
  else {
     Ext.Msg.alert("错误", "没有任何行被选中，无法进行操作！");
    }
   }

  var sm = new Ext.grid.CheckboxSelectionModel();
  var cm = new Ext.grid.ColumnModel([
  new Ext.grid.RowNumberer(),// 自动行号
  sm,// 添加的地方
  {header : 'ID',dataIndex : 'id',hidden:true}, 
  {header : '展品名称',dataIndex : 'name',sortable:true,align:'center'}, 
  {header : '展品状态',width:150,dataIndex : 'id',align:'center',
  renderer:function(val){
  if('${exhibition.gids}'.indexOf(val)>0)
  {
  return '<font color="green">展品已在此展览中</font>'
  }
  else
  {
   return '<font color="red">展品未在此展览中</font>'
  }
  }
  }, 
  {header : '展品图片',dataIndex : 'pic',width:80,sortable:true,align:'center', renderer:function(val){return '<img style="width:50px;height:50px;" src="<%=path %>/upload/art_goods/'+val+'">'}}, 
  {header : '展品描述',dataIndex : 'content',width:250,sortable:true,align:'center',renderer:function(val){return '<div align="left">'+val+'</div>'}}, 
  {header : '排序码',width:60,dataIndex : 'sortcode',sortable:true,align:'center',type:'double'},
  {header : '创建日期',width:120,dataIndex : 'createdate',sortable:true,align:'center'}]);
   cm.defaultSortable = true;
   var store = new Ext.data.GroupingStore({
   proxy: new Ext.data.HttpProxy(
   {url: '<%=path %>/art_goods.do?methede=listEXT',
   method : 'post'
   }),//store提交的地址 
  reader: new Ext.data.JsonReader({ 
  totalProperty: 'totalCount',  //得到共有多少条条记录，是从后台返回的 
  root: 'rows' //得到记录集合，需是json格式的，也是从后台返回的 
  }, [
        {name:'id',mapping:'id'},
        {name:'name',mapping:'name'},
        {name:'pic',mapping:'pic'},
        {name:'content',mapping:'content'},
      {name:'sortcode',mapping:'sortcode'},
        {name:'createdate',mapping:'createdate'}
      ]
   )
  }); 
  store.on("beforeload", function(currentStore, options) {
   currentStore.baseParams["content"] = Ext.getCmp("content").value;
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
  height:530,
  width:943,
  autoScoll:true,//这里是滚动条的出生地
  view: new Ext.grid.GroupingView(),
  cm : cm,
  sm : sm,// 加入一列checkbox
  frame : true,
  bbar: bbar,
  tbar: [
     '-', 
     { id: 'content', xtype: 'textfield' },'-', 
     { text: '搜索',iconCls:'icon_seek',handler: Search }, '-',
     { text: '加入展览',iconCls:'icon_add',handler: function(){Gridset('1')}}, '-',
     { text: '撤出展览',iconCls:'icon_edit',handler: function(){Gridset('0')}}, '-'
     ],//这是上面的按钮
     loadMask: myMask,
     listeners:{
     "rowdblclick" : function(grid, rowIndex, e){
     var record = grid.getStore().getAt(rowIndex);
     var id = record.get('id');
     shownew(id);}}
    }); 
    grid.render();
    store.load(
    {params:{start:0, limit:15}
    }); //加载数据 
   }); 
      </script>

   </head>

   <body>
   <div id="mm" ></div>
   <input type="hidden" value="0" id="gb" name="gb">
   </body>
  </html>
