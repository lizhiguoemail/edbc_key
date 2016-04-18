<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>甲骨文自造字列表</title>
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

 var Gridcheck = function () {
   if (sm.hasSelection()) { 
     var rows=grid.getSelectionModel().getSelections();  
     if(rows.length>1){ 
       Ext.Msg.alert('系统提示', "只能选中一条数据");
     } 
   else{ 
     var id = rows[0].get('id');
     var pic = rows[0].get('pic');
     var code = rows[0].get('code');
     var showdiv = window.parent.frames["addj"].document.getElementById("showdiv");
     var hidcontent=window.parent.frames["addj"].document.getElementById("hidcontent");
     var allnewwords=window.parent.frames["addj"].document.getElementById("allnewwords");
     var showcontent=window.parent.frames["addj"].document.getElementById("showcontent");
         showdiv.innerHTML+='<img src="<%=path %>/upload/jgw/'+pic+'" height="12px">';
         hidcontent.value+="~"+code+"~";
         showcontent.value+='<img src="<%=path %>/upload/jgw/'+pic+'">';
         if(allnewwords.value=='')
         {
           allnewwords.value=code;
         }
         else
         {
            allnewwords.value+=","+code;
         }
         var win = parent.Ext.getCmp('newword');
         if (win) {win.close();}
      }
    }
    else{
     Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行编辑操作！");
     }
    }

   function shownew(id){
      var shownew = new parent.window.Ext.Window({
      id:'shownew',
      title:'查看详情',
      layout:'fit', 
      width:640,
      height:490,
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
      html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/jgw_words.do?methede=show&id='+id+'"></iframe>'
      });
      shownew.show();
    };

   var Search = function () {
   var radical = Ext.getCmp("radical").getValue();
   var strokesmall = Ext.getCmp("strokesmall").getValue();
   var strokebig = Ext.getCmp("strokebig").getValue();
   var w_top = Ext.getCmp("w_top").getValue();
   var w_middle = Ext.getCmp("w_middle").getValue();
   var w_bottom = Ext.getCmp("w_bottom").getValue();
   var w_left = Ext.getCmp("w_left").getValue();
   var w_right = Ext.getCmp("w_right").getValue();
   var searchwords = Ext.getCmp("searchwords").getValue();
   var searchsound = Ext.getCmp("searchsound").getValue();
   store.load({ params: { start: 0,limit: 15,
   radical: radical,
   strokesmall: strokesmall,
   strokebig: strokebig,
   w_top: w_top,
   w_middle: w_middle,
   w_bottom: w_bottom,
   w_left: w_left,
   w_right: w_right,
   searchwords: searchwords,
   searchsound: searchsound
   },
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
  {header : '编号',width:60,dataIndex : 'code',sortable:true,align:'center'}, 
  {header : '图片',width:60,dataIndex : 'pic',sortable:true,align:'center',renderer:function(val){
  if(val!=null&&val!=''&&val!='null')
  {
   return '<img src="<%=path %>/upload/jgw/'+val+'" style="width:50px;height:50px;"/>'
  }
  }
  },  
  {header : '原型图',dataIndex : 'jgw_pic',sortable:true,align:'center',renderer:function(val){
  if(val!=null&&val!=''&&val!='null')
  {
   return '<img src="<%=path %>/upload/jgw/'+val+'" style="width:50px;height:50px;"/>'
  }
  }
  },
  {header : '偏旁部首',width:60,dataIndex : 'radical',sortable:true,align:'center'},   
  {header : '笔画数',width:60,dataIndex : 'stroke',sortable:true,align:'center',type:'int'}, 
  {header : '字意',dataIndex : 'meaning',sortable:true,align:'center'}, 
  {header : '上边字形',width:60,dataIndex : 'w_top',sortable:true,align:'center'}, 
  {header : '中间字形',width:60,dataIndex : 'w_middle',sortable:true,align:'center'}, 
  {header : '底边字形',width:60,dataIndex : 'w_bottom',sortable:true,align:'center'}, 
  {header : '左边字形',width:60,dataIndex : 'w_left',sortable:true,align:'center'}, 
  {header : '右边字形',width:60,dataIndex : 'w_right',sortable:true,align:'center'}, 
  {header : '搜索字',width:60,dataIndex : 'searchwords',sortable:true,align:'center'}, 
  {header : '字音',width:60,dataIndex : 'searchsound',sortable:true,align:'center'}, 
  {header : '录入人',width:60,dataIndex : 'usernickname',sortable:true,align:'center'}, 
  {header : '排序码',width:60,dataIndex : 'sortcode',sortable:true,align:'center',type:'double'},
  {header : '录入日期',width:120,dataIndex : 'createdate',sortable:true,align:'center'}]);
   cm.defaultSortable = true;
   var store = new Ext.data.GroupingStore({
   proxy: new Ext.data.HttpProxy(
   {url: '<%=path %>/jgw_words.do?methede=listEXT',
   method : 'post'
   }),//store提交的地址 
  reader: new Ext.data.JsonReader({ 
  totalProperty: 'totalCount',  //得到共有多少条条记录，是从后台返回的 
  root: 'rows' //得到记录集合，需是json格式的，也是从后台返回的 
  }, [
        {name:'id',mapping:'id'},
        {name:'pic',mapping:'pic'},
        {name:'jgw_pic',mapping:'jgw_pic'},
        {name:'radical',mapping:'radical'},
        {name:'code',mapping:'code'},
        {name:'meaning',mapping:'meaning'},
        {name:'w_top',mapping:'w_top'},
        {name:'w_middle',mapping:'w_middle'},
        {name:'w_bottom',mapping:'w_bottom'},
        {name:'w_left',mapping:'w_left'},
        {name:'w_right',mapping:'w_right'},
        {name:'searchwords',mapping:'searchwords'},
        {name:'searchsound',mapping:'searchsound'},
        {name:'usernickname',mapping:'usernickname'},
        {name:'stroke',mapping:'stroke'},
      {name:'sortcode',mapping:'sortcode'},
        {name:'createdate',mapping:'createdate'}
      ]
   )
  }); 
  store.on("beforeload", function(currentStore, options) {
   currentStore.baseParams["radical"] = Ext.getCmp("radical").value;
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
  title: '甲骨文自造字列表', 
  el:'mm',
  store: store, 
  pageSize: 15, 
  height:window.parent.Ext.getCmp('centerP').getHeight()-65,
  width:window.parent.Ext.getCmp('centerP').getWidth()-5,
  autoScoll:true,//这里是滚动条的出生地
  view: new Ext.grid.GroupingView(),
  cm : cm,
  sm : sm,// 加入一列checkbox
  frame : true,
  bbar: bbar,
  tbar: [
     { text: '加入',iconCls:'icon_add',handler: Gridcheck}, '-'
     ],//这是上面的按钮
     loadMask: myMask,
     listeners:{
     "rowdblclick" : function(grid, rowIndex, e){
     var record = grid.getStore().getAt(rowIndex);
     var id = record.get('id');
     shownew(id);}}
    }); 
    grid.render();
    
     tbar2 = new Ext.Toolbar({
   renderTo : grid.tbar,//其中grid是上边创建的grid容器
   items : [  
         '部首:', 
     { id: 'radical', xtype: 'textfield',width:50 },'-', 
     '笔画数:', 
     { id: 'strokesmall', xtype: 'textfield' ,width:20},'~',  {id: 'strokebig', xtype: 'textfield',width:20 },'-', 
     '上:', 
     { id: 'w_top', xtype: 'textfield' ,width:50},'-', 
     '中:', 
     { id: 'w_middle', xtype: 'textfield',width:50 },'-', 
     '底:', 
     { id: 'w_bottom', xtype: 'textfield' ,width:50},'-', 
     '左:', 
     { id: 'w_left', xtype: 'textfield' ,width:50},'-', 
     '右:', 
     { id: 'w_right', xtype: 'textfield' ,width:50},'-', 
     '搜索字:', 
     { id: 'searchwords', xtype: 'textfield' ,width:50},'-', 
     '字音:', 
     { id: 'searchsound', xtype: 'textfield' ,width:50},'-', 
     { text: '开始搜索',iconCls:'icon_seek',handler: Search }, '-',
      ''

]});
    
    
    
    store.load(
    {params:{start:0, limit:15}
    }); //加载数据 
    grid.on('bodyresize', function() {
    grid.setSize(window.parent.Ext.getCmp('centerP').getSize().width-5, window.parent.Ext.getCmp('centerP').getSize().height-65); }); 
   }); 
      </script>

   </head>

   <body>
   <div id="mm" ></div>
   <input type="hidden" value="0" id="gb" name="gb">
   </body>
  </html>
