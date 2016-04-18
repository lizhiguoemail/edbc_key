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
    
    <title>用户列表</title>
    
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
      var addnew=function(){
       var add = new parent.Ext.Window({
            id:'adduser',
            title:'添加用户',
	        layout:'fit',
	        width:635,
	        height:590,
	        closeAction:'close',
	         modal:true,
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	         listeners:{
	          "close":function(){ 
			  var gb=parent.window.document.getElementById("gb");
	          if(gb.value=='1')
	          { 
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
	       text:'重置',
	       id:'resetbutton',
	       icon:'<%=path %>/images/backstage/remove.gif',
	       cls: "x-btn-text-icon"
	       },{
	        text:'取消',
	        icon:'<%=path %>/images/backstage/cancel.gif',
	        cls: "x-btn-text-icon",
	        handler:function(){
	        var win = parent.Ext.getCmp('adduser');
	        if (win) {win.close();}
	        }
	       }],
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/backstage/user/reg.jsp"></iframe>'
	        });
            add.show();
      };
      
       function updatenew(oid){
            var update = new parent.Ext.Window({
            id:'updateuser',
            title:'编辑用户信息',
	        layout:'fit',
	        width:635,
	        height:566,
	         modal:true,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	        listeners:{
	          "close":function(){
	          var gb=parent.window.document.getElementById("gb");
	          if(gb.value=='1')
	          { 
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
       },
         {
	       text:'重置',
	       id:'updateresetbutton',
	       icon:'<%=path %>/images/backstage/remove.gif',
	       cls: "x-btn-text-icon"
	       },{
        text:'取消',
        icon:'<%=path %>/images/backstage/cancel.gif',
	    cls: "x-btn-text-icon",
        handler:function(){
        var win = parent.Ext.getCmp('updateuser');
        if (win) {win.close();}
        }
       }],
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/user.do?methede=toUpdateUserEXT&oid='+oid+'"></iframe>'
	        });
        update.show();
      };
      
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
      
       function sendnew(uid){
            var sendnew = new parent.Ext.Window({
            id:'sendnew',
            title:'发送消息',
	        layout:'fit',
	        width:550,
	        height:450,
	         modal:true,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	        listeners:{
	          "close":function(){
	          var gb=parent.window.document.getElementById("gb");
	          if(gb.value=='1')
	          { 
			   store.reload();
			   gb.value='0'; 
			  }
			  Ext.getCmp("content").focus();
			  } 
	        },
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/interactive.do?methede=toSendEXT&uid='+uid+'"></iframe>'
	        });
        sendnew.show();
      };
      
      
       function rolenew(oid){
            var rolenew = new parent.Ext.Window({
            id:'rolenew',
            title:'角色配置',
	        layout:'fit',
	        width:690,
	        height:600,
	         modal:true,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	         buttons:[{
	       text:'提交配置',
	       id:'rolebutton',
	       icon:'<%=path %>/images/backstage/ok.gif',
	       cls: "x-btn-text-icon",
	       type: 'submit'
	       },{
	        text:'取消',
	        icon:'<%=path %>/images/backstage/cancel.gif',
	        cls: "x-btn-text-icon",
	        handler:function(){
	        var win = parent.Ext.getCmp('rolenew');
	        if (win) {win.close();}
	        }
	       }],
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/user.do?methede=toUpdateUserRoleEXT&userid='+oid+'"></iframe>'
	        });
        rolenew.show();
      };
      
       function pwdnew(oid){
            var pwdnew = new parent.Ext.Window({
            id:'pwdnew',
            title:'修改密码',
	        layout:'fit',
	        width:430,
	        height:180,
	         modal:true,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	          buttons:[{
	       text:'提交',
	       id:'pwdbutton',
	       icon:'<%=path %>/images/backstage/ok.gif',
	       cls: "x-btn-text-icon",
	       type: 'submit'
	       },{
	        text:'取消',
	        icon:'<%=path %>/images/backstage/cancel.gif',
	        cls: "x-btn-text-icon",
	        handler:function(){
	        var win = parent.Ext.getCmp('pwdnew');
	        if (win) {win.close();}
	        }
	       }],
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/user.do?methede=toUpdateUserpwd&oid='+oid+'"></iframe>'
	        });
        pwdnew.show();
      };
      
      function permitnew(oid){
            var permitnew = new parent.Ext.Window({
            id:'permitnew',
            title:'权限配置',
	        layout:'fit',
	         width:740,
	         height:600,
	          modal:true,
	        closeAction:'close',
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	         buttons:[{
	       text:'提交配置',
	       id:'permitbutton',
	       icon:'<%=path %>/images/backstage/ok.gif',
	       cls: "x-btn-text-icon",
	       type: 'submit'
	       },{
	        text:'取消',
	        icon:'<%=path %>/images/backstage/cancel.gif',
	        cls: "x-btn-text-icon",
	        handler:function(){
	        var win = parent.Ext.getCmp('permitnew');
	        if (win) {win.close();}
	        }
	       }],
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/user.do?methede=toUpdateUserPermitEXT&userid='+oid+'"></iframe>'
	        });
        permitnew.show();
      };
      
       function showpermitnew(oid){
            var showpermitnew = new parent.Ext.Window({
            id:'showpermitnew',
            title:'查看用户所有权限',
	        layout:'fit',
	        width:740,
	        height:600,
	        closeAction:'close',
	         modal:true,
	        //collapsible:true, 折叠
	        plain: false,
	        resizable: true,
	         buttons:[
	         {
	        text:'关闭',
	        icon:'<%=path %>/images/backstage/cancel.gif',
	        cls: "x-btn-text-icon",
	        handler:function(){
	        var win = parent.Ext.getCmp('showpermitnew');
	        if (win) {win.close();}
	        }
	       }],
	        html: '<iframe frameborder="0" width="100%" height="100%" src="<%=path %>/user.do?methede=ShowUserPermitEXT&userid='+oid+'"></iframe>'
	        });
        showpermitnew.show();
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
        } //一个执行搜索是的函数
      
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
            
              var Gridsendmsg = function () {
           if (sm.hasSelection()) {
                            var rows=grid.getSelectionModel().getSelections(); 
                            var uid = '';
						     for(var i=0;i <rows.length;i++){ 
						      if(i>0){
						       uid = uid + ',' + rows[i].get('id'); 
						      }else{
						       uid = uid + rows[i].get('id'); 
						      } 
                        }
                       sendnew(uid);
                }
                else {
                    Ext.Msg.alert("错误", "没有任何行被选中，无法进行操作！");
                }
            }
            
       var Gridrole = function () {
       if (sm.hasSelection()) {
        var rows=grid.getSelectionModel().getSelections(); 
        if(rows.length>1)
        {
          Ext.Msg.alert('系统提示', "只能选中一个用户");
        }
        else
        {
          var uid = rows[0].get('id');
          rolenew(uid);
        }
        }
        else
        {
           Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行操作！");
        }
       }
       
         var Gridpwd = function () {
       if (sm.hasSelection()) {
        var rows=grid.getSelectionModel().getSelections(); 
        if(rows.length>1)
        {
          Ext.Msg.alert('系统提示', "只能选中一个用户");
        }
        else
        {
          var uid = rows[0].get('id');
          pwdnew(uid);
        }
        }
        else
        {
           Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行操作！");
        }
       }

      var Gridpermit = function () {
       if (sm.hasSelection()) {
        var rows=grid.getSelectionModel().getSelections(); 
        if(rows.length>1)
        {
          Ext.Msg.alert('系统提示', "只能选中一个用户");
        }
        else
        {
          var uid = rows[0].get('id');
          permitnew(uid);
        }
        }
        else
        {
           Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行操作！");
        }
       }
       
         var Gridshowpermit = function () {
       if (sm.hasSelection()) {
        var rows=grid.getSelectionModel().getSelections(); 
        if(rows.length>1)
        {
          Ext.Msg.alert('系统提示', "只能选中一个用户");
        }
        else
        {
          var uid = rows[0].get('id');
          showpermitnew(uid);
        }
        }
        else
        {
           Ext.Msg.alert("系统提示", "没有任何行被选中，无法进行操作！");
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
   {header : '邮箱地址',width:120,align:'center',dataIndex : 'email',sortable:true}
   //{header : '个人照片',width:100,align:'center',dataIndex : 'picture',renderer:cover_img}
   ]);
    cm.defaultSortable = true;
       var store = new Ext.data.GroupingStore({ 
        proxy: new Ext.data.HttpProxy(
        {url: '<%=path %>/user.do?methede=listUserEXT',
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
                         {name:'email',mapping:'email'}
                         //{name:'picture',mapping:'picture'}
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
        title: '用户列表', 
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
        { 
        xtype:'combo',id:'fname',name:'fname',hiddenName:'fieldname',mode:'local',store:sl,valueField:'value',displayField:'text',triggerAction: 'all',submintVaule:true,editable:false,emptyText: '请选择'  
        },'-', 
        { id: 'content', xtype: 'textfield' },'-', 
        { text: '搜索',iconCls:'icon_seek',handler: Search }, '-',
         <c:if test="${(fn:contains(userinfo.systempermit,',0211,')==false)||((fn:contains(userinfo.systempermit,',0211,')==true)&&(fn:contains(userinfo.allpermits,',0211,')==true))||userinfo.isadmin eq '1'}">
        { text: '新建',iconCls:'icon_add', handler: addnew}, '-',
        </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0212,')==false)||((fn:contains(userinfo.systempermit,',0212,')==true)&&(fn:contains(userinfo.allpermits,',0212,')==true))||userinfo.isadmin eq '1'}">
        { text: '编辑',iconCls:'icon_edit', handler: Gridupdate}, '-',
         </c:if>
        { text: '发送消息',iconCls:'icon_sendmsg', handler: Gridsendmsg}, '-',
         <c:if test="${(fn:contains(userinfo.systempermit,',0213,')==false)||((fn:contains(userinfo.systempermit,',0213,')==true)&&(fn:contains(userinfo.allpermits,',0213,')==true))||userinfo.isadmin eq '1'}">
        { text: '角色配置',iconCls:'icon_role', handler: Gridrole}, '-',
         </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0214,')==false)||((fn:contains(userinfo.systempermit,',0214,')==true)&&(fn:contains(userinfo.allpermits,',0214,')==true))||userinfo.isadmin eq '1'}">
        { text: '权限配置',iconCls:'icon_permit', handler: Gridpermit}, '-',
         </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0215,')==false)||((fn:contains(userinfo.systempermit,',0215,')==true)&&(fn:contains(userinfo.allpermits,',0215,')==true))||userinfo.isadmin eq '1'}">
        { text: '所有权限',iconCls:'icon_view', handler: Gridshowpermit}, '-',
         </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0216,')==false)||((fn:contains(userinfo.systempermit,',0216,')==true)&&(fn:contains(userinfo.allpermits,',0216,')==true))||userinfo.isadmin eq '1'}">
        { text: '密码修改',iconCls:'icon_key', handler: Gridpwd}, '-',
         </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0217,')==false)||((fn:contains(userinfo.systempermit,',0217,')==true)&&(fn:contains(userinfo.allpermits,',0217,')==true))||userinfo.isadmin eq '1'}">
        { text: '删除',iconCls:'icon_delete',handler: Griddelete}, '-',
         </c:if>
         <c:if test="${(fn:contains(userinfo.systempermit,',0218,')==false)||((fn:contains(userinfo.systempermit,',0218,')==true)&&(fn:contains(userinfo.allpermits,',0218,')==true))||userinfo.isadmin eq '1'}">
        { text: '导出Excel',iconCls:'icon_excel',handler : ExcelExport },  '-',
        </c:if>
        ''
       ],//这是上面的按钮
        loadMask: myMask,
         listeners:{
           "rowdblclick" : function(grid, rowIndex, e){
            var record = grid.getStore().getAt(rowIndex);
            var uid = record.get('id');
             <c:choose>
		   <c:when test="${(fn:contains(userinfo.systempermit,',512,')==false)||((fn:contains(userinfo.systempermit,',512,')==true)&&(fn:contains(userinfo.allpermits,',512,')==true))||userinfo.isadmin eq '1'}">
		   updatenew(uid);
		   </c:when>
		   <c:otherwise>
		   shownew(uid);
		   </c:otherwise>
		   </c:choose>
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
