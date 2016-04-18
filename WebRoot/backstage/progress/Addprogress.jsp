<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>添加任务进度</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<script type="text/javascript" src="<%=path %>/FCKeditor/fckeditor.js"></script>
<script type="text/javascript">
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  
   // 下拉框   
  var store = new Ext.data.Store({   
  proxy: new Ext.data.HttpProxy({   
  url: '<%=path %>/worktask.do?methede=listForSelectEXT&must=1'  
   }),   
    reader: new Ext.data.JsonReader({   
     root: 'rows',   
       id: 'fs'  
    }, [   
		  {name: 'id', mapping: 'id'},   
		  {name: 'name', mapping: 'name'}   
		 ])   
	 }); 
	store.load();
  
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:960,
  items:[
  {xtype:'combo',
  fieldLabel:'所属任务',
  name:'worktask',
  loadingText:'加载中...',
  allowBlank:false,
  blankText : "请选择任务",
  store: store,   
  valueField :"id",   
  displayField: "name",   
  mode: 'local',
  forceSelection: true,//必须选择一项   
  emptyText:'请选择...',//默认值
  hiddenName:'worktaskid',//hiddenName才是提交到后台的input的name   
  editable: false,//不允许输入
  triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。      
  width: 150
  },{xtype:'textfield',
  fieldLabel:'工作人',
  name:'workuser',
  value:'${userinfo.nickname}',
  width:200
  },
  {xtype:'datefield',
  fieldLabel:'工作日期',
  width:150,
  format:"Y-n-j",
  value:new Date(),
  name:'worktime'
  }

  ,{xtype:'textarea',
  fieldLabel:'精简描述',
  name:'description',
  width:250
  },
    {xtype:'textarea',
  fieldLabel:'详细描述',
  width: 800,
  height:340,
  id:'content',
  name:'workcontent',
  listeners:{   
     render:function(f){   
                       var fckEditor = new FCKeditor("content") ;//初始化FCK   
                       fckEditor.Height=340;//设置FCK编辑器的高度   
                       fckEditor.Width=800;//设置FCK编辑器的宽度   
                       fckEditor.BasePath = "<%=path%>/FCKeditor/" ;//设定FCK的源文件路径，这里要注意相对和绝对路径   
                       fckEditor.ReplaceTextarea() ;//用FCK编辑器替换Ext中的textarea   
                     }   
                   }   
  }  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60
  }
  ]
   });
   parent.Ext.getCmp('addbutton').setHandler(function(){
   var fck = FCKeditorAPI.GetInstance('content');
  fck.UpdateLinkedField();
   if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/progress.do?methede=addEXT',
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
    });
  });

   </script>
   </head>
   <body>
   <div id="dd" ></div>
   </body>
  </html>