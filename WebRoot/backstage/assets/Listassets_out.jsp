<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>资产交还列表</title>
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
  var addnew=function(){
    var add = new parent.window.Ext.Window({
    id:'addnew',
    title:'添加资产交还',
    layout:'fit',
    width:500,
    height:250,
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
      gb.value='0'; 
      } 
      Ext.getCmp("content").focus();
    } 
    }, 
    html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/assets/Addassets_out.jsp"></iframe>' 
   });
    add.show(); 
  };  

   function shownew(id){

      var shownew = new parent.window.Ext.Window({
      id:'shownew',
      title:'查看详情',
      layout:'fit', 
      width:500,
      height:250,
      closeAction:'close',  
      modal:true,
      //collapsible:true, 折叠
      plain: false,
      resizable: true,
      html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/assets_out.do?methede=show&id='+id+'"></iframe>'
      });
      shownew.show();
    };

  function updatenew(id){ 
    var update = new parent.window.Ext.Window({
    id:'updatenew', 
    title:'编辑资产交还', 
    layout:'fit', 
    width:500,
    height:250, 
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
          gb.value='0';  
          } 
           Ext.getCmp("content").focus();
         }  
      }, 
     html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/assets_out.do?methede=toUpdate&id='+id+'"></iframe>' 
     });
     update.show();
     }; 

   var Gridupdate = function () {
   if (sm.hasSelection()) { 
     var rows=grid.getSelectionModel().getSelections();  
     if(rows.length>1){ 
       Ext.Msg.alert('系统提示', "只能选中一条数据");
     } 
   else{ 
     var id = rows[0].get('id');
     updatenew(id);
      }
    }
    else{
     Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行编辑操作！");
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

  var Griddelete = function () {
  if (sm.hasSelection()) {
    Ext.Msg.confirm("警告", "确定要删除吗？", function (button) {
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
     msg: '正在删除...',
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
       url: '<%=path %>/assets_out.do?methede=batchdeleteEXT',
       method: "post",
       params:{id:id},
       success: function (form,action) {
         Ext.MessageBox.hide();
         store.reload();
         Ext.Msg.alert('系统提示', "删除成功");
        },
     failure: function () {
       Ext.Msg.alert('系统提示', '系统出错！');
     }
    });
    }});
   }
  else {
     Ext.Msg.alert("错误", "没有任何行被选中，无法进行删除操作！");
    }
   }

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

  var cm = new Ext.grid.ColumnModel([
  new Ext.grid.RowNumberer(),// 自动行号
  {header : 'ID',dataIndex : 'id',hidden:true}, 
  {header : '资产编号',dataIndex : 'assetscode',sortable:true,align:'center'}, 
  {header : '资产名称',dataIndex : 'assetsname',sortable:true,align:'center'}, 
  {header : '折旧金额',dataIndex : 'depreciation',sortable:true,align:'center'}, 
  {header : '交还人',dataIndex : 'username',sortable:true,align:'center'}, 
  {header : '备注',dataIndex : 'description',sortable:true},
  {header : '操作人',dataIndex : 'agent',sortable:true,align:'center'}, 
  {header : '操作日期',width:120,dataIndex : 'createdate',sortable:true,align:'center'}]);
   cm.defaultSortable = true;
   var store = new Ext.data.Store({
   proxy: new Ext.data.HttpProxy(
   {url: '<%=path %>/assets_out.do?methede=listEXT',
   method : 'post'
   }),//store提交的地址 
  reader: new Ext.data.JsonReader({ 
  totalProperty: 'totalCount',  //得到共有多少条条记录，是从后台返回的 
  root: 'rows' //得到记录集合，需是json格式的，也是从后台返回的 
  }, [
        {name:'assetsid',mapping:'assetsid'},
        {name:'assetscode',mapping:'assetscode'},
        {name:'assetsname',mapping:'assetsname'},
        {name:'depreciation',mapping:'depreciation'},
        {name:'agent',mapping:'agent'},
        {name:'username',mapping:'username'},
        {name:'description',mapping:'description'},
        {name:'createdate',mapping:'createdate'}
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
  title: '资产交还列表', 
  el:'mm',
  store: store, 
  pageSize: 15, 
  height:window.parent.Ext.getCmp('centerP').getHeight()-30,
  width:window.parent.Ext.getCmp('centerP').getWidth()-5,
  autoScoll:true,//这里是滚动条的出生地
  cm : cm,
  frame : true,
  bbar: bbar,
  tbar: [
     '-', 
     { id: 'content', xtype: 'textfield' },'-', 
     { text: '搜索',iconCls:'icon_seek',handler: Search }, '-',
      <c:if test="${(fn:contains(userinfo.systempermit,',931,')==false)||((fn:contains(userinfo.systempermit,',931,')==true)&&(fn:contains(userinfo.allpermits,',931,')==true))||userinfo.isadmin eq '1'}">
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
