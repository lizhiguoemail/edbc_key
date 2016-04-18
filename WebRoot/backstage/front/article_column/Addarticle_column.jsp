<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>添加文章栏目</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<script type="text/javascript">
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  
   // 下拉框   
  var store = new Ext.data.Store({   
  proxy: new Ext.data.HttpProxy({   
  url: '<%=path %>/front_module.do?methede=listForSelectEXT&must=1'  
   }),   
    reader: new Ext.data.JsonReader({   
     root: 'rows',   
       id: 'fs'  
    }, [   
		  {name: 'id', mapping: 'id'},   
		  {name: 'm_name', mapping: 'm_name'}   
		 ])   
	 }); 
	store.load();
  
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:635,
  items:[
  {xtype:'textfield',
  allowBlank:false,
  blankText : "栏目名称不能为空",
  fieldLabel:'栏目名称',
  name:'name',
  width: 150
  }
  ,{xtype:'combo',
  fieldLabel:'所属模块',
  name:'front_module',
  loadingText:'加载中...',
  allowBlank:false,
  blankText : "请选择模块",
  store: store,   
  valueField :"id",   
  displayField: "m_name",   
  mode: 'local',
  forceSelection: true,//必须选择一项   
  emptyText:'请选择...',//默认值
  hiddenName:'front_moduleid',//hiddenName才是提交到后台的input的name   
  editable: false,//不允许输入
  triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。      
  width: 150
  },
  {xtype:'textfield',
  fieldLabel:'栏目链接地址',
  name:'url',
  width: 200
  },{
       xtype:'radiogroup',
       width: 500,   
       fieldLabel:'链接类型',
       allowBlank: false,
       items:[{boxLabel:'栏目文章列表',inputValue:'1', checked: true,name:'urltype',id:'t1'}, 
              {boxLabel:'栏目文章首条',inputValue:'2', name:'urltype',id:'t2'}, 
              {boxLabel:'系统方法',inputValue:'5',name:'urltype',id:'t5'},
              {boxLabel:'自定义链接',inputValue:'3',name:'urltype',id:'t3'},
              {boxLabel:'无链接',inputValue:'4',name:'urltype',id:'t4'} 
             ] 
       
       },{
       xtype:'radiogroup',
       width: 200,   
       fieldLabel:'打开方式',
       allowBlank: false,
       items:[{boxLabel:'本窗口打开',inputValue:'self', checked: true,name:'target',id:'yes3'}, 
              {boxLabel:'新窗口打开',inputValue:'blank',name:'target',id:'no3'} 
             ] 
       
       }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60
  }
  ]
   });
   
    parent.Ext.getCmp('addbutton').setHandler(function(){
      if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/article_column.do?methede=addEXT',
    method : 'post',
    waitTitle: "请稍候", 
    waitMsg: '正在添加数据...', 
    success:function(f,a){
    Ext.Msg.alert('ok',a.result.msg);
    var gb=parent.window.document.getElementById("gb");
    gb.value="1";
    var win = parent.Ext.getCmp('addnew');
    if (win) {win.close();}
    },
  failure:function(f,a){
    Ext.Msg.alert('error','添加失败');
   }
   });
  }
          }                  
         );
         
  });

   </script>
   </head>
   <body>
   <div id="dd"></div>
   </body>
  </html>