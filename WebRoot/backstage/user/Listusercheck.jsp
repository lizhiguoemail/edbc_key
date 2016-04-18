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
    
    <title>用户审核列表</title>
    
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
     ['username','用户名'],
     ['nickname','呢称'],
     ['tname','真实姓名'],
     ['birthday','出生日期'],
     ['mobile','联系电话'],
     ['qq','QQ号'],
     ['email','邮箱地址']
     ]
     });
      Ext.onReady(function(){ 
      var myMask = new Ext.LoadMask(Ext.getBody(), {
                        msg: '正在加载数据，请稍后！',
                        removeMask: true //完成后移除
                    });
      
       function shownew(oid){
            var showuser = new parent.Ext.Window({
            id:'showuser',
            title:'查看用户信息',
	        layout:'fit',
	        width:635,
	        height:533,
	         modal:true,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	         buttons:[{
	        text:'取消',
	        icon:'<%=path %>/images/backstage/cancel.gif',
		    cls: "x-btn-text-icon",
	        handler:function(){
	        var win = parent.Ext.getCmp('showuser');
	        if (win) {win.close();}
	        }
	       }],
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/user.do?methede=ShowUser&oid='+oid+'"></iframe>'
	        });
        showuser.show();
      };
      
      
       var Gridupdate = function () {
       if (sm.hasSelection()) {
        var rows=grid.getSelectionModel().getSelections(); 
        if(rows.length>1)
        {
          Ext.Msg.alert('系统提示', "只能选中一个用户");
        }
        else
        {
          var uid = rows[0].get('id');
          updatenew(uid);
        }
        }
        else
        {
           Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行编辑操作！");
        }
       }
       
       var Search = function () {
                var val = Ext.getCmp("content").getValue();
                var fe=Ext.getCmp("fname").getValue();
                var wait = Ext.getCmp("wait").getValue();
			   var allow = Ext.getCmp("allow").getValue();
			   var noallow = Ext.getCmp("noallow").getValue();
                store.load({ params: { start: 0,limit: 15,fieldname:fe,content: val,wait:wait,allow:allow,noallow:noallow},
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
       url: '<%=path %>/user.do?methede=batchsetEXT',
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
      
       var Griddelete = function () {
           if (sm.hasSelection()) {
                    Ext.Msg.confirm("警告", "确定要删除吗？", function (button) {
                        if (button == "yes") {
                            var rows=grid.getSelectionModel().getSelections(); 
                            var companyid = '';
						     for(var i=0;i <rows.length;i++){ 
						      if(i>0){
						       companyid = companyid + ',' + rows[i].get('id'); 
						      }else{
						       companyid = companyid + rows[i].get('id'); 
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
			       // Ext.Ajax.defaultPostHeader = 'FTchinaMVC/json'; //仅传递ids数组即可，无需转换为json
			        Ext.Ajax.request({
			            url: '<%=path %>/user.do?methede=batchdeleteUserEXT',
			            method: "post",
			            params:{oid:companyid},
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

       
   var sm = new Ext.grid.CheckboxSelectionModel();
   var cm = new Ext.grid.ColumnModel([
   new Ext.grid.RowNumberer(),// 自动行号
   sm,// 添加的地方
   {header : '用户ID',dataIndex : 'id',hidden:true}, 
   {header : '用户名',width:90,dataIndex : 'username',sortable:true}, 
   {header : '昵称',width:100,dataIndex : 'nickname',sortable:true}, 
   {header : '真实姓名',width:90,align:'center',dataIndex : 'tname',sortable:true}, 
   {header : '出生日期',width:80,align:'center',dataIndex : 'birthday',sortable:true}, 
   {header : '性别',width:40,align:'center',dataIndex : 'sex',sortable:true}, 
   {header : '联系电话',width:80,align:'center',dataIndex : 'mobile',sortable:true}, 
   {header : 'QQ号',width:70,align:'center',dataIndex : 'qq',sortable:true}, 
   {header : '邮箱地址',width:120,align:'center',dataIndex : 'email',sortable:true},
   {header : '用户类别',width:120,align:'center',dataIndex : 'category',sortable:true},
   {header : '审核状态',width:120,align:'center',dataIndex : 'auditstatus',sortable:true,renderer:function(val){
       var str="";
       if(val!='')
       {
       if(val=='1')
       {
         str+='<font color="green">审核通过</font>';
       }
       else if(val=='2')
       {
         str+='<font color="red">审核不通过</font>';
       }
       else
       {
         str+='<font color="blue">待审核</font>';
       }
       }
       return str;}}
   //{header : '个人照片',width:100,align:'center',dataIndex : 'picture',renderer:cover_img}
   ]);
    cm.defaultSortable = true;
       var store = new Ext.data.GroupingStore({ 
        proxy: new Ext.data.HttpProxy(
        {url: '<%=path %>/user.do?methede=listUserByCheckEXT',
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
                         {name:'nickname',mapping:'nickname'},
                         {name:'tname',mapping:'tname'},
                         {name:'birthday',mapping:'birthday'},
                         {name:'sex',mapping:'sex'},
                         {name:'mobile',mapping:'mobile'},
                         {name:'qq',mapping:'qq'},
                         {name:'email',mapping:'email'},
                         {name:'category',mapping:'category'},
                         {name:'auditstatus',mapping:'auditstatus'}
                         ]
                        )

    }); 
      store.on("beforeload", function(currentStore, options) {
                currentStore.baseParams["fieldname"] = Ext.getCmp("fname").value;
                currentStore.baseParams["content"] = Ext.getCmp("content").value;
            });
    
    var bbar=new Ext.PagingToolbar({ 
       //plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' })],
            //带滑动的pagesize,需导入js/ext-ui-slider-pagesize.js
            plugins: [new Ext.ui.plugins.ComboPageSize({ prefixText: '每页', postfixText: '条' }), new Ext.ui.plugins.SliderPageSize()],
            pageSize: 15,               //每页显示20条记录 
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
        view: new Ext.grid.GroupingView(),
        cm : cm,
        sm : sm,// 加入一列checkbox
        frame : true,
        bbar: bbar,
        tbar: [
        '-',
          <c:if test="${(fn:contains(userinfo.systempermit,',0221,')==false)||((fn:contains(userinfo.systempermit,',0221,')==true)&&(fn:contains(userinfo.allpermits,',0221,')==true))||userinfo.isadmin eq '1'}">
     { id: 'wait', xtype: 'checkbox',handler: Search },'待审核','-', 
     { id: 'allow', xtype: 'checkbox',handler: Search },'审核通过','-', 
     { id: 'noallow', xtype: 'checkbox',handler: Search },'审核不通过','-', 
      </c:if>
        { 
        xtype:'combo',id:'fname',name:'fname',hiddenName:'fieldname',mode:'local',store:sl,valueField:'value',displayField:'text',triggerAction: 'all',submintVaule:true,editable:false,emptyText: '请选择'  
        },'-', 
        { id: 'content', xtype: 'textfield' },'-', 
        { text: '搜索',iconCls:'icon_seek',handler: Search }, '-',
        <c:if test="${(fn:contains(userinfo.systempermit,',0221,')==false)||((fn:contains(userinfo.systempermit,',0221,')==true)&&(fn:contains(userinfo.allpermits,',0221,')==true))||userinfo.isadmin eq '1'}">
        { text: '审核通过',iconCls:'icon_submit',handler: function(){Gridset('auditstatus','1')}}, '-',
        { text: '审核不通过',iconCls:'icon_cancel',handler: function(){Gridset('auditstatus','2')}}, '-',
        { text: '还原为待审核',iconCls:'icon_view',handler: function(){Gridset('auditstatus','0')}}, '-',
         </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0217,')==false)||((fn:contains(userinfo.systempermit,',0217,')==true)&&(fn:contains(userinfo.allpermits,',0217,')==true))||userinfo.isadmin eq '1'}">
        { text: '删除',iconCls:'icon_delete',handler: Griddelete}, '-',
         </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0222,')==false)||((fn:contains(userinfo.systempermit,',0222,')==true)&&(fn:contains(userinfo.allpermits,',0222,')==true))||userinfo.isadmin eq '1'}">
        { text: '导出Excel',iconCls:'icon_excel',handler : ExcelExport },  '-',
        </c:if>
        ''
       ],//这是上面的按钮
        loadMask: myMask,
         listeners:{
           "rowdblclick" : function(grid, rowIndex, e){
            var record = grid.getStore().getAt(rowIndex);
            var uid = record.get('id');
		    shownew(uid);
        }
    }
    }); 
    grid.render();
    store.load(
    {params:{start:0, limit:15}
    }); //加载数据 
    
     grid.on('bodyresize', function() {
    grid.setSize(window.parent.Ext.getCmp('centerP').getSize().width-5, window.parent.Ext.getCmp('centerP').getSize().height-30); }); 
    
    function cover_img(val){
    if(val!=''&&val!=null&&val!='null')
    {
     return '<img src="<%=path %>/memberFace/'+val+'" height="40" width="50" />';
    }
    else
    {
     return '<img src="<%=path %>/images/nopic.jpg" height="40" width="50" />'; 
    }
    }
});  
     </script>

  </head>

  <body>
  <div id="mm" ></div>
  </body>
</html>
