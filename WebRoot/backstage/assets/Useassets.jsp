<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>查看资产详情</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/examples/ux/css/Spinner.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/src/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/examples/ux/Spinner.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/examples/ux/SpinnerField.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/examples/spinner/spinner.js"></script>
<style type="text/css">
.x-date-bottom {font-size:12px} 
</style>
<script type="text/javascript">
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';

  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  fileUpload : true,
  labelWidth : 60,
  frame:true,
  autoScoll:true,
  width:825,
  items:[
  {  
      xtype:'panel',  
      layout:'column', 
      border:false,
      defaults : {                   //应用到每一个子元素上的配置   
                    border : false,            //不显示边框   
                    layout : 'form'            //在列布局中嵌套form布局   
                },   
      items:[
            
            { width : 430, 
          items:[
              {xtype:'label',
              id:'code',
  fieldLabel:'资产编号',
  width:250,
  text:'${assets.code}'
  }
  ,{xtype:'label',
  fieldLabel:'资产名称',
  text:'${assets.name}'
  }
  ,{xtype:'label',
  fieldLabel:'购置日期',
  text:'${assets.buydate}',
  width:250
  }
    ,{xtype:'label',
  fieldLabel:'资产价格',
  text:'${assets.price}'
  }
  ,{xtype:'label',
  fieldLabel:'累计折旧',
  text:'${assets.depreciation}'
  }  
 ,{xtype:'label',
  fieldLabel:'存放地点',
  width:250,
  text:'${assets.location}'
  },{xtype:'textfield',
  fieldLabel:'使用人',
  width:200,
  allowBlank:false,
  blankText : "使用人不能为空",
  name:'username'
  },{xtype:'datetimefield',
  fieldLabel:'交还日期',
  width:150,
  format:"Y-n-j H:i",
  name:'ruturntime'
  }
  ,{xtype:'textfield',
  fieldLabel:'备注',
  width:250,
  name:'description'
  } ,{xtype:'hidden',
  name:'assetsid',
  value:'${assets.id}'
  } ,{xtype:'hidden',
  value:'${assets.code}',
  name:'assetscode'
  } ,{xtype:'hidden',
  value:'${assets.name}',
  name:'assetsname'
  }
            ]
            }, { 
          items:[
            {   
            xtype:'panel',
            frame:true,
            layout: 'form',
            width:350,
            height:250,
            bodyStyle:'overflow: auto',
            autoScoll:true,
            html:'<img src="<%=path %>/upload/assets/${assets.pic}">'
           }   

            ]
            }
           ] 
           }
 
  ]

   });

   parent.Ext.getCmp('usebutton').setHandler(function(){
  if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/assets_use.do?methede=addEXT',
    method : 'post',
    waitTitle: "请稍候", 
    waitMsg: '正在添加数据...', 
    success:function(f,a){
    Ext.Msg.alert('ok',a.result.msg);
    var gb=parent.window.document.getElementById("gb");
    gb.value="1";
    var win = parent.Ext.getCmp('usenew');
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
   <div id="dd"  ></div>
   </body>
  </html>