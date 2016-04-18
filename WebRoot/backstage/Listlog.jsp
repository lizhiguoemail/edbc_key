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
    
    <title>日志查看</title>
    
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
      var sl=new Ext.data.SimpleStore({
     fields:['value','text'],
     data:[
     ['','全部'],
     ['登录','登录'],
     ['修改','修改'],
     ['删除','删除'],
     ['操作失败','操作失败']
     ]
     });
      Ext.onReady(function(){ 
       var myMask = new Ext.LoadMask(Ext.getBody(), {
                        msg: '正在加载数据，请稍后！',
                        removeMask: true //完成后移除
                    });
      
       function shownew(oid){
            var showunread = new Ext.Window({
            id:'showunread',
            title:'信息详情',
	        layout:'fit',
	        width:410,
	        height:400,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	         listeners:{
	          "close":function(){ 
			  var gb=document.getElementById("gb");
	          if(gb.value!='0')
	          { 
			   replynew(gb.value);
			   gb.value='0';
			  }
				}
	        },
	        html: '<iframe frameborder="0" width="100%" height="100%" scrolling="no" src="<%=path %>/interactive.do?methede=showInteractive&oid='+oid+'"></iframe>'
	        });
        showunread.show();
      };
      
       function replynew(oid){
            var showreply = new Ext.Window({
            id:'showreply',
            title:'信息回复',
	        layout:'fit',
	        width:410,
	        height:450,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	        html: '<iframe frameborder="0" width="100%" height="100%" scrolling="no" src="<%=path %>/interactive.do?methede=toreply&oid='+oid+'"></iframe>'
	        });
           showreply.show();
      };
      
       var Search = function () {
            var val = Ext.getCmp("content").getValue();
            var lt=Ext.getCmp("lt").getValue();
            var b=Ext.getCmp("begindate").getValue();
            var e=Ext.getCmp("enddate").getValue();
            store.load({ params: { start: 0,limit: 15,logtype:lt,content: val,begindate:b,enddate:e},
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
   {header : '消息ID',dataIndex : 'id',hidden:true}, 
   {header : '操作人',width:60,dataIndex : 'username',sortable:true,align:'center'}, 
   {header : '日志类别',width:60,dataIndex : 'logtype',sortable:true,align:'center'}, 
   {header : '服务名称',width:80,dataIndex : 'processname',sortable:true,align:'center'},
   {header : '操作名称',width:180,dataIndex : 'methodname',sortable:true}, 
   {header : 'IP地址',width:90,dataIndex : 'ipaddress',sortable:true,align:'center'}, 
   {header : '地域',width:90,dataIndex : 'zone',sortable:true,align:'center'}, 
   {header : '详细地址',width:120,dataIndex : 'detailAddress',sortable:true},  
   {header : '备注',width:180,dataIndex : 'description',sortable:true}, 
   {header : '操作日期',width:120,dataIndex : 'createdate',sortable:true}]);
    cm.defaultSortable = true;
       var store = new Ext.data.GroupingStore({ 
        proxy: new Ext.data.HttpProxy(
        {url: '<%=path %>/log.do?methede=listLogEXT',
         method : 'post'
        }),//store提交的地址 
        reader: new Ext.data.JsonReader({ 
            totalProperty: 'totalCount',  
            //得到共有多少条条记录，是从后台返回的 
            root: 'rows'
            //得到记录集合，需是json格式的，也是从后台返回的 
        }, [
                         {name:'id',mapping:'id'},
                         {name:'username',mapping:'username'},
                         {name:'logtype',mapping:'logtype'},
                         {name:'processname',mapping:'processname'},
                         {name:'methodname',mapping:'methodname'},
                         {name:'ipaddress',mapping:'ipaddress'},
                         {name:'zone',mapping:'zone'},
                         {name:'detailAddress',mapping:'detailAddress'},
                         {name:'description',mapping:'description'},
                         {name:'createdate',mapping:'createdate'}
                         ]
                        )

    }); 
    store.on("beforeload", function(currentStore, options) {
                currentStore.baseParams["logtype"] = Ext.getCmp("lt").value;
                currentStore.baseParams["content"] = Ext.getDom("content").value;
                currentStore.baseParams["begindate"] = Ext.getCmp("begindate").value;
                currentStore.baseParams["enddate"] = Ext.getCmp("enddate").value;
            });
    
    
     var bbar=new Ext.PagingToolbar({ 
            //plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' })],
            //带滑动的pagesize,需导入js/ext-ui-slider-pagesize.js
            plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' }), new Ext.ui.plugins.SliderPageSize()],
            pageSize: 15,               
            store: store, 
            displayInfo: true, 
            displayMsg: '显示第 {0} 条到 {1} 条记录，一共 {2} 条', 
            emptyMsg: "没有记录" 
        });

    var grid = new Ext.grid.GridPanel({ 
        title: '日志查看', 
        el:'mm',
        store: store, 
        pageSize: 15, 
        view: new Ext.grid.GroupingView(),
        height:window.parent.Ext.getCmp('centerP').getHeight()-30,
        width:window.parent.Ext.getCmp('centerP').getWidth()-5,
        autoScoll:true,//这里是滚动条的出生地
        cm : cm,
        frame : true,
        bbar: bbar,
        tbar: [
        '-',
        '从',
        { id: 'begindate',name:'begindate', xtype: 'datefield',format:'Y-m-d',fieldLabel:'Released' },'-',
        '到',
        { id: 'enddate',name:'enddate', xtype: 'datefield',format:'Y-m-d',fieldLabel:'Released' },'-',
        { 
        xtype:'combo',id:'lt',name:'lt',hiddenName:'logtype',mode:'local',store:sl,valueField:'value',displayField:'text',triggerAction: 'all',submintVaule:true,editable:false,emptyText: '请选择'  
        },'-', '关键字',
        { id: 'content',name:'content', xtype: 'textfield' },'-', 
        { text: '搜索', iconCls:'icon_seek',handler: Search },'-',
        { text: '导出Excel',iconCls:'icon_excel',handler : ExcelExport }, '-'
       ],//这是上面的按钮
        loadMask: myMask
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
