<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>添加文章类</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_config.js"></script>  
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_all_min.js"></script>  
<link rel="stylesheet" type="text/css" href="<%=path %>/ueditor/themes/default/ueditor.css"/> 
<script type="text/javascript">
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  

	
	 // 下拉框 2  
  var store2 = new Ext.data.Store({   
    reader: new Ext.data.JsonReader({   
     root: 'rows',   
       id: 'as'  
    }, [   
		  {name: 'id', mapping: 'id'},   
		  {name: 'name', mapping: 'name'}   
		 ])   
	 }); 
	
	 // 下拉框 3  
  var store3 = new Ext.data.Store({   
  proxy: new Ext.data.HttpProxy({   
  url: '<%=path %>/front_module.do?methede=listForSelectEXT'  
   }),   
    reader: new Ext.data.JsonReader({   
     root: 'rows',   
       id: 'fm'  
    }, [   
		  {name: 'id', mapping: 'id'},   
		  {name: 'm_name', mapping: 'm_name'}   
		 ])   
	 }); 
	store3.load();
  
  
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 55,
  fileUpload : true,
  frame:true,
  width:930,
  items:[
  {xtype:'textfield',
  fieldLabel:'文章标题',
  allowBlank:false,
  blankText : "文章标题不能为空",
  name:'title',
  width:600
  },{  
      xtype:'panel',  
      layout:'column',  
      border:false,
      defaults : {                   //应用到每一个子元素上的配置   
                    border : false,            //不显示边框   
                    layout : 'form'            //在列布局中嵌套form布局   
                },   
      items:[
             //{ width : 250, 
              //items:[
              //{xtype:'combo',
			 // fieldLabel:'文章类别',
			 // name:'bast_type',
			 // loadingText:'加载中...',
			  //store: store1,   
			  //valueField :"id",   
			 // displayField: "type_name",   
			 // mode: 'local',
			 // forceSelection: true,//必须选择一项   
			 // emptyText:'请选择...',//默认值
			 // hiddenName:'base_typeid',//hiddenName才是提交到后台的input的name   
			 // editable: false,//不允许输入
			 // triggerAction: 'all'//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。      
			  //}
           // ]},
            { width : 300, 
          items:[
              {xtype:'textfield',
			  fieldLabel:'文章来源',
			  name:'source',
			  width:200
			  }
            ]
            }, { width : 300, 
              items:[
              {xtype:'textfield',
			  fieldLabel:'作者',
			  name:'author'
			  }
            ]
            }
           ] 
           },
           {  
      xtype:'panel',  
      layout:'column',  
      border:false,
      defaults : {                   //应用到每一个子元素上的配置   
                    border : false,            //不显示边框   
                    layout : 'form'            //在列布局中嵌套form布局   
                },   
      items:[
                { width : 250, 
              items:[
              {xtype:'combo',
			  fieldLabel:'所属模块',
			  name:'front_module',
			  loadingText:'加载中...',
			  store: store3,   
			  valueField :"id",   
			  displayField: "m_name",   
			  mode: 'local',
			  forceSelection: true,//必须选择一项   
			  emptyText:'请选择...',//默认值
			  hiddenName:'front_moduleid',//hiddenName才是提交到后台的input的name   
			  editable: false,//不允许输入
			  triggerAction: 'all',
			   listeners:{     
                select : function(combo, record,index){
                var article_column=Ext.getCmp('accb');
                store2.removeAll();
                article_column.clearValue();
                if(combo.value==''||combo.value==null)
                {
                store2.proxy= new Ext.data.HttpProxy({url: '<%=path %>/article_column.do?methede=listForSelectEXT&front_moduleid=no'});   
                }
                else
                {
                store2.proxy= new Ext.data.HttpProxy({url: '<%=path %>/article_column.do?methede=listForSelectEXT&front_moduleid=' + combo.value});   
                }
                store2.load();    
            }   
        }   
			  }
            ]},{ width : 250, 
              items:[
              {xtype:'combo',
			  fieldLabel:'所属栏目',
			  name:'article_column',
			  id:'accb',
			  loadingText:'加载中...',
			  store: store2,   
			  valueField :"id",   
			  displayField: "name",   
			  mode: 'local',
			  forceSelection: true,//必须选择一项   
			  emptyText:'请选择...',//默认值
			  hiddenName:'article_columnid',//hiddenName才是提交到后台的input的name   
			  editable: false,//不允许输入
			  triggerAction: 'all'//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。      
			  }
            ]},
           { width : 300, 
          items:[
              {xtype:'numberfield',
			  fieldLabel:'排序码',
			 allowNegative:false, //不允许输入负号
            //allowDecimals:false,  //不允许有小数
            width:60,
			  name:'sortcode'
			  }
            ]
            }
           ] 
           }, {xtype:'textfield',
  fieldLabel:'标题图片',
  name:'imageupload',
  inputType : "file",   
  fieldLabel: '标题图片',   
  id:'imageupload'                          
  },
  {xtype:'htmleditor',
  fieldLabel:'文章摘要',
  width: 800,
  height:100,
  id:'summary',
  name:'summary'
  },
  {xtype:'box',
  fieldLabel:'文章内容',
  renderTo:'ee',
  id:'ucontent',
  name:'ucontent' 
  },
   {xtype:'hidden',
  id:'content',
  name:'content' 
  }
  ]
   });
   
    parent.Ext.getCmp('addbutton').setHandler(function(){
   document.getElementById("content").value=editor.getContent();
  if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/article.do?methede=addEXT',
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
          } );             
   
  });

</script>
   </head>
   <body>
   <div id="dd" >
   </div>
     <div id="ee">
   <textarea name="ucontent"  id="ucontent" style="height: 500px;width: 810px;"></textarea>
   </div>
<script type="text/javascript"> 
    var editor = new baidu.editor.ui.Editor();  
    editor.render('ucontent');  
</script>  
   
   </body> 
  </html>