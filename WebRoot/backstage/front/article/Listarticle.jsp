<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>文章类列表</title>
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
  var myMask = new Ext.LoadMask(Ext.getBody(), {
  msg: '正在加载数据，请稍后！',
  removeMask: true //完成后移除
  });
  var addnew=function(){
    var add = new parent.window.Ext.Window({
    id:'addnew',
    title:'添加文章',
    layout:'fit',
    width:1000,
    height:600,
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
	        var win = parent.Ext.getCmp('addnew');
	        if (win) {win.close();}
	        }
	       }], 
    html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/front/article/Addarticle.jsp"></iframe>' 
   });
    add.show(); 
  };  

   function shownew(id){

      var shownew = new parent.window.Ext.Window({
      id:'shownew',
      title:'查看详情',
      layout:'fit', 
      width:1000,
      height:600,
      closeAction:'close',  
      modal:true,
      //collapsible:true, 折叠
      plain: false,
      resizable: true,
      buttons:[
      {
        text:'取消',
        icon:'<%=path %>/images/backstage/cancel.gif',
	    cls: "x-btn-text-icon",
        handler:function(){
        var win = parent.Ext.getCmp('shownew');
        if (win) {win.close();}
        }
       }], 
      html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/article.do?methede=show&id='+id+'"></iframe>'
      });
      shownew.show();
    };

  function updatenew(id){ 
    var update = new parent.window.Ext.Window({
    id:'updatenew', 
    title:'编辑文章', 
    layout:'fit', 
    width:1000,
    height:630,
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
       buttons:[{
       text:'提交',
       icon:'<%=path %>/images/backstage/ok.gif',
	   cls: "x-btn-text-icon",
       type: 'submit',
       id:'updatebutton'
       },{
        text:'取消',
        icon:'<%=path %>/images/backstage/cancel.gif',
	    cls: "x-btn-text-icon",
        handler:function(){
        var win = parent.Ext.getCmp('updatenew');
        if (win) {win.close();}
        }
       }], 
     html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/article.do?methede=toUpdate&id='+id+'"></iframe>' 
     });
     update.show();
     }; 
     
     function updatenewrili(id){ 
    var update = new parent.window.Ext.Window({
    id:'updatenewrili', 
    title:'日历活动', 
    layout:'fit', 
    width:500,
    height:400,
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
       buttons:[{
       text:'提交',
       icon:'<%=path %>/images/backstage/ok.gif',
	   cls: "x-btn-text-icon",
       type: 'submit',
       id:'updatebutton'
       },{
        text:'关闭',
        icon:'<%=path %>/images/backstage/cancel.gif',
	    cls: "x-btn-text-icon",
        handler:function(){
        var win = parent.Ext.getCmp('updatenewrili');
        if (win) {win.close();}
        }
       }], 
     html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/article.do?methede=toUpdaterili&id='+id+'"></iframe>' 
     });
     update.show();
     }; 

 function updatesummarynew(id){ 
    var updatesummary = new parent.window.Ext.Window({
    id:'updatesummary', 
    title:'编辑文章摘要', 
    layout:'fit', 
    width:840,
    height:608,
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
      buttons:[{
       text:'提交',
       icon:'<%=path %>/images/backstage/ok.gif',
	   cls: "x-btn-text-icon",
       type: 'submit',
       id:'updatesummarybutton'
       },{
        text:'取消',
        icon:'<%=path %>/images/backstage/cancel.gif',
	    cls: "x-btn-text-icon",
        handler:function(){
        var win = parent.Ext.getCmp('updatesummary');
        if (win) {win.close();}
        }
       }], 
     html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/article.do?methede=toUpdatesummary&id='+id+'"></iframe>' 
     });
     updatesummary.show();
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
    
       var Gridupdaterili = function () {
   if (sm.hasSelection()) { 
     var rows=grid.getSelectionModel().getSelections();  
     if(rows.length>1){ 
       Ext.Msg.alert('系统提示', "只能选中一条数据");
     } 
   else{ 
     var id = rows[0].get('id');
     updatenewrili(id);
      }
    }
    else{
     Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行编辑操作！");
     }
    }
    
     var Gridupdatesummary = function () {
   if (sm.hasSelection()) { 
     var rows=grid.getSelectionModel().getSelections();  
     if(rows.length>1){ 
       Ext.Msg.alert('系统提示', "只能选中一条数据");
     } 
   else{ 
     var id = rows[0].get('id');
     updatesummarynew(id);
      }
    }
    else{
     Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行编辑操作！");
     }
    }

   var Search = function () {
   var val = Ext.getCmp("content").getValue();
   var isindexfocus = Ext.getCmp("isindexfocus").getValue();
   var iscolumnfocus = Ext.getCmp("iscolumnfocus").getValue();
   var ishot = Ext.getCmp("ishot").getValue();
   var isrecommend = Ext.getCmp("isrecommend").getValue();
   var ishidden = Ext.getCmp("ishidden").getValue();
   var isrili = Ext.getCmp("isrili").getValue();
   store.load({ params: { start: 0,limit: 15,content: val,isindexfocus:isindexfocus,iscolumnfocus:iscolumnfocus,ishot:ishot,isrecommend:isrecommend,ishidden:ishidden,isrili:isrili},
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
       url: '<%=path %>/article.do?methede=batchdeleteEXT',
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
   
   var Griddeleterili = function () {
  if (sm.hasSelection()) {
    Ext.Msg.confirm("警告", "确定要取消此日历活动吗？", function (button) {
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
     msg: '正在取消...',
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
       url: '<%=path %>/article.do?methede=batchdeleteriliEXT',
       method: "post",
       params:{id:id},
       success: function (form,action) {
         Ext.MessageBox.hide();
         store.reload();
         Ext.Msg.alert('系统提示', "设置成功");
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
   
     var Gridset=function(str,str2) {
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
       url: '<%=path %>/article.do?methede=batchsetEXT',
       method: "post",
       params:{id:id,settype:str,typevalue:str2},
       success: function (form,action) {
         Ext.MessageBox.hide();
         store.reload();
         Ext.Msg.alert('系统提示', "设置成功");
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
  {header : '文章标题',width:200,dataIndex : 'title',sortable:true,align:'center',renderer:function(value){return '<div align="left">'+value+'</div>';}}, 
  {header : '所属模块',dataIndex : 'front_modulem_name',sortable:true,align:'center'}, 
  {header : '所属栏目',dataIndex : 'article_columnname',sortable:true,align:'center'}, 
  {header : '文章来源',dataIndex : 'source',sortable:true,align:'center'}, 
  {header : '作者',dataIndex : 'author',sortable:true,align:'center'}, 
  {header : '文章状态',dataIndex : 'zhuangtai',sortable:true,align:'center',renderer:function(val){
       var str="";
       if(val!='')
       {
       if(val.indexOf("fou1.gif")>-1)
       {
         str+='<img src=<%=path %>/images/backstage/fou1.gif alt="首页焦点"/>';
       }
       if(val.indexOf("fou2.gif")>-1)
       {
         str+='<img src=<%=path %>/images/backstage/fou2.gif alt="栏目焦点"/>';
       }
       if(val.indexOf("big.png")>-1)
       {
         str+='<img src=<%=path %>/images/backstage/big.png alt="大事件"/>';
       }
       if(val.indexOf("hot1.gif")>-1)
       {
         str+='<img src=<%=path %>/images/backstage/hot1.gif alt="热点"/>';
       }
       if(val.indexOf("rejian.gif")>-1)
       {
         str+='<img src=<%=path %>/images/backstage/rejian.gif alt="热荐"/>';
       }
       if(val.indexOf("yincang.gif")>-1)
       {
         str+='<img src=<%=path %>/images/backstage/yincang.png alt="隐藏"/>';
       }
       if(val.indexOf("rili.jpg")>-1)
       {
         str+='<img src=<%=path %>/images/backstage/rili.jpg alt="日历活动"/>';
       }
       }
       return str;}}, 
  {header : '排序码',dataIndex : 'sortcode',sortable:true,align:'center',type:'double'}, 
  {header : '标题图片',dataIndex : 'title_pic',sortable:true,align:'center',renderer:function(val){
  if(val!=null&&val!=''&&val!='null')
  {
   return '<img src="<%=path %>/upload/article/'+val+'" style="width:50px;height:50px;"/>'
  }
  }
  }, 
  {header : '录入者',dataIndex : 'usernickname',sortable:true,align:'center'}, 
  {header : '创建日期',width:120,dataIndex : 'createdate',sortable:true,align:'center'}, 
  {header : '修改日期',width:120,dataIndex : 'updatedate',sortable:true,align:'center'}]);
   cm.defaultSortable = true;
   var store = new Ext.data.GroupingStore({
   proxy: new Ext.data.HttpProxy(
   {url: '<%=path %>/article.do?methede=listEXT',
   method : 'post'
   }),//store提交的地址 
  reader: new Ext.data.JsonReader({ 
  totalProperty: 'totalCount',  //得到共有多少条条记录，是从后台返回的 
  root: 'rows' //得到记录集合，需是json格式的，也是从后台返回的 
  }, [
        {name:'id',mapping:'id'},
        {name:'title',mapping:'title'},
        {name:'front_modulem_name',mapping:'front_modulem_name'},
        {name:'article_columnname',mapping:'article_columnname'},
        {name:'source',mapping:'source'},
        {name:'author',mapping:'author'},
        {name:'sortcode',mapping:'sortcode'},
        {name:'zhuangtai',mapping:'zhuangtai'},
        {name:'title_pic',mapping:'title_pic'},
        {name:'usernickname',mapping:'usernickname'},
        {name:'createdate',mapping:'createdate'},
        {name:'updatedate',mapping:'updatedate'}
      ]
   )
  }); 
  store.on("beforeload", function(currentStore, options) {
   currentStore.baseParams["content"] = Ext.getDom("content").value;
   currentStore.baseParams["isindexfocus"] = Ext.getDom("isindexfocus").value;
   currentStore.baseParams["iscolumnfocus"] = Ext.getDom("iscolumnfocus").value;
   currentStore.baseParams["isbig"] = Ext.getDom("isbig").value;
   currentStore.baseParams["ishot"] = Ext.getDom("ishot").value;
   currentStore.baseParams["isrecommend"] = Ext.getDom("isrecommend").value;
   currentStore.baseParams["ishidden"] = Ext.getDom("ishidden").value;
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
  title: '文章类列表', 
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
    <c:if test="${(fn:contains(userinfo.systempermit,',744,')==false)||((fn:contains(userinfo.systempermit,',744,')==true)&&(fn:contains(userinfo.allpermits,',744,')==true))||userinfo.isadmin eq '1'}">
     { id: 'isindexfocus', xtype: 'checkbox',handler: Search },'首页焦点','-', 
      </c:if>
     <c:if test="${(fn:contains(userinfo.systempermit,',745,')==false)||((fn:contains(userinfo.systempermit,',745,')==true)&&(fn:contains(userinfo.allpermits,',745,')==true))||userinfo.isadmin eq '1'}">
     { id: 'iscolumnfocus', xtype: 'checkbox',handler: Search },'栏目焦点','-', 
      </c:if>
     <c:if test="${(fn:contains(userinfo.systempermit,',7410,')==false)||((fn:contains(userinfo.systempermit,',7410,')==true)&&(fn:contains(userinfo.allpermits,',7410,')==true))||userinfo.isadmin eq '1'}">
     { id: 'isbig', xtype: 'checkbox',handler: Search },'大事件','-', 
      </c:if>
     <c:if test="${(fn:contains(userinfo.systempermit,',746,')==false)||((fn:contains(userinfo.systempermit,',746,')==true)&&(fn:contains(userinfo.allpermits,',746,')==true))||userinfo.isadmin eq '1'}">
     { id: 'ishot', xtype: 'checkbox',handler: Search },'热点','-', 
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',747,')==false)||((fn:contains(userinfo.systempermit,',747,')==true)&&(fn:contains(userinfo.allpermits,',747,')==true))||userinfo.isadmin eq '1'}">
     { id: 'isrecommend', xtype: 'checkbox',handler: Search },'热荐','-', 
      </c:if>
     <c:if test="${(fn:contains(userinfo.systempermit,',748,')==false)||((fn:contains(userinfo.systempermit,',748,')==true)&&(fn:contains(userinfo.allpermits,',748,')==true))||userinfo.isadmin eq '1'}">
     { id: 'ishidden',xtype: 'checkbox',handler: Search },'屏蔽','-', 
      </c:if>
      { id: 'isrili',xtype: 'checkbox',handler: Search },'日历活动','-', 
     { id: 'content', xtype: 'textfield' },'-', 
     { text: '搜索',iconCls:'icon_seek',handler: Search }, '-',
      ''
     ],//这是上面的按钮
     loadMask: myMask,
     listeners:{
     "rowdblclick" : function(grid, rowIndex, e){
     var record = grid.getStore().getAt(rowIndex);
     var id = record.get('id');
      <c:choose>
	  <c:when test="${(fn:contains(userinfo.systempermit,',742,')==false)||((fn:contains(userinfo.systempermit,',742,')==true)&&(fn:contains(userinfo.allpermits,',742,')==true))||userinfo.isadmin eq '1'}">
	  updatenew(id);
      </c:when>
	  <c:otherwise>
	  shownew(id);
	  </c:otherwise>
	  </c:choose>
     }}
    }); 
    grid.render();
    
    
     tbar1 = new Ext.Toolbar({
   renderTo : grid.tbar,//其中grid是上边创建的grid容器
   items : [  
    <c:if test="${(fn:contains(userinfo.systempermit,',741,')==false)||((fn:contains(userinfo.systempermit,',741,')==true)&&(fn:contains(userinfo.allpermits,',741,')==true))||userinfo.isadmin eq '1'}">
     { text: '新建',iconCls:'icon_add', handler: addnew}, '-',
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',742,')==false)||((fn:contains(userinfo.systempermit,',742,')==true)&&(fn:contains(userinfo.allpermits,',742,')==true))||userinfo.isadmin eq '1'}">
     { text: '编辑',iconCls:'icon_edit', handler: Gridupdate}, '-',
     { text: '设为日历活动',iconCls:'icon_edit', handler: Gridupdaterili}, '-',
     { text: '取消日历活动',iconCls:'icon_delete', handler: Griddeleterili}, '-',
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',743,')==false)||((fn:contains(userinfo.systempermit,',743,')==true)&&(fn:contains(userinfo.allpermits,',743,')==true))||userinfo.isadmin eq '1'}">
     { text: '编辑摘要',iconCls:'icon_edit', handler: Gridupdatesummary}, '-',
      </c:if>
       <c:if test="${(fn:contains(userinfo.systempermit,',748,')==false)||((fn:contains(userinfo.systempermit,',748,')==true)&&(fn:contains(userinfo.allpermits,',748,')==true))||userinfo.isadmin eq '1'}">
     { text: '屏蔽',   iconCls:'icon_yincang',handler: function(){Gridset('ishidden','1')}}, '-',
     { text: '取消屏蔽',iconCls:'icon_noyincang',handler: function(){Gridset('ishidden','0')}}, '-',
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',749,')==false)||((fn:contains(userinfo.systempermit,',749,')==true)&&(fn:contains(userinfo.allpermits,',749,')==true))||userinfo.isadmin eq '1'}">
     { text: '删除',iconCls:'icon_delete',handler: Griddelete}, '-',
      </c:if>
      ''
	]});
    
    tbar2 = new Ext.Toolbar({
   renderTo : grid.tbar,//其中grid是上边创建的grid容器
   items : [  
    <c:if test="${(fn:contains(userinfo.systempermit,',744,')==false)||((fn:contains(userinfo.systempermit,',744,')==true)&&(fn:contains(userinfo.allpermits,',744,')==true))||userinfo.isadmin eq '1'}">
     { text: '设为首页焦点',iconCls:'icon_fou1',handler: function(){Gridset('isindexfocus','1')}}, '-',
     { text: '取消首页焦点',iconCls:'icon_nofou1',handler: function(){Gridset('isindexfocus','0')}}, '-',
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',745,')==false)||((fn:contains(userinfo.systempermit,',745,')==true)&&(fn:contains(userinfo.allpermits,',745,')==true))||userinfo.isadmin eq '1'}">
     { text: '设为栏目焦点',iconCls:'icon_fou2',handler: function(){Gridset('iscolumnfocus','1')}}, '-',
     { text: '取消栏目焦点',iconCls:'icon_nofou2',handler: function(){Gridset('iscolumnfocus','0')}}, '-',
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',7410,')==false)||((fn:contains(userinfo.systempermit,',7410,')==true)&&(fn:contains(userinfo.allpermits,',7410,')==true))||userinfo.isadmin eq '1'}">
     { text: '设为大事件',iconCls:'icon_big',handler: function(){Gridset('isbig','1')}}, '-',
     { text: '取消大事件',iconCls:'icon_nobig',handler: function(){Gridset('isbig','0')}}, '-',
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',746,')==false)||((fn:contains(userinfo.systempermit,',746,')==true)&&(fn:contains(userinfo.allpermits,',746,')==true))||userinfo.isadmin eq '1'}">
     { text: '设为热点',iconCls:'icon_hot1',handler: function(){Gridset('ishot','1')}}, '-',
     { text: '取消热点',iconCls:'icon_quxiao',handler: function(){Gridset('ishot','0')}}, '-',
      </c:if>
      <c:if test="${(fn:contains(userinfo.systempermit,',747,')==false)||((fn:contains(userinfo.systempermit,',747,')==true)&&(fn:contains(userinfo.allpermits,',747,')==true))||userinfo.isadmin eq '1'}">
     { text: '设为热荐',iconCls:'icon_rejian',handler: function(){Gridset('isrecommend','1')}}, '-',
     { text: '取消热荐',iconCls:'icon_quxiao',handler: function(){Gridset('isrecommend','0')}}, '-',
      </c:if>
     
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
