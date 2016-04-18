<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>修改文章栏目</title>
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
  fieldLabel:'栏目名称',
  name:'name',
  blankText : "栏目名称不能为空",
  fieldLabel:'栏目名称',
  value:'${article_column.name}'
  }
   ,{xtype:'combo',
  fieldLabel:'所属模块',
  name:'front_module',
  value:'${article_column.front_module.m_name}',
  store: store,   
  valueField :"id",   
  displayField: "m_name",   
  allowBlank:false,
  blankText : "请选择模块",
  mode: 'local',
  forceSelection: true,//必须选择一项   
  emptyText:'请选择...',//默认值
  editable: false,//不允许输入
  triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。      
  width: 150, 
  listeners:{     
               select : function(combo, record,index){
                var fm=Ext.getCmp('front_moduleid');
                fm.setValue(combo.value); 
            }   
        }     
  },
  {xtype:'textfield',
  fieldLabel:'栏目链接地址',
  value:'${article_column.url}',
  name:'url',
  width: 150
  },{
       xtype:'radiogroup',
       width: 500,   
       fieldLabel:'链接类型',
       allowBlank: false,
       items:[{boxLabel:'栏目文章列表',inputValue:'1', <c:if test="${article_column.urltype eq '1'}">checked: true,</c:if> name:'urltype',id:'t1'}, 
              {boxLabel:'栏目文章首条',inputValue:'2', <c:if test="${article_column.urltype eq '2'}">checked: true,</c:if> name:'urltype',id:'t2'}, 
              {boxLabel:'系统方法',inputValue:'5', <c:if test="${article_column.urltype eq '5'}">checked: true,</c:if> name:'urltype',id:'t5'},
              {boxLabel:'自定义输入',inputValue:'3', <c:if test="${article_column.urltype eq '3'}">checked: true,</c:if> name:'urltype',id:'t3'},
              {boxLabel:'无链接',inputValue:'4', <c:if test="${article_column.urltype eq '4'}">checked: true,</c:if> name:'urltype',id:'t4'} 
             ] 
       
       },{
       xtype:'radiogroup',
       width: 200,   
       fieldLabel:'打开方式',
       allowBlank: false,
       items:[{boxLabel:'本窗口打开',inputValue:'self', <c:if test="${article_column.target eq 'self'}">checked: true,</c:if> name:'target',id:'yes3'}, 
              {boxLabel:'新窗口打开',inputValue:'blank', <c:if test="${article_column.target eq 'blank'}">checked: true,</c:if> name:'target',id:'no3'} 
             ] 
       
       }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60,
  value:'${article_column.sortcode}'
  },{
             xtype:'hidden',
            id : "front_moduleid",
            name:"front_moduleid",
            value : "${article_column.front_module.id}"
        }
  ]
   });
   
      parent.Ext.getCmp('updatebutton').setHandler(function(){
	 if(f.form.isValid()){
	    f.form.doAction('submit',{
	    url:'<%=path %>/article_column.do?methede=updateEXT',
	    params:{id:'${article_column.id}'},
	    method : 'post',
	    waitTitle: "请稍候", 
	    waitMsg: '正在更新数据...', 
	    success:function(f,a){
	    Ext.Msg.alert('ok',a.result.msg);
	    var gb=parent.window.document.getElementById("gb");
	    gb.value="1";
	    var win = parent.Ext.getCmp('updatenew');
	    if (win) {win.close();}
	    },
	  failure:function(f,a){
	    Ext.Msg.alert('error','更新失败');
	   }
	   });
	  }
          } );
          
  });

   </script>
   </head>
   <body>
   <div id="dd" ></div>
   </body>
  </html>