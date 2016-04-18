<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>提取产品</title>
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
  
 var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  fileUpload : true,
  labelWidth : 60,
  frame:true,
  autoScoll:true,
  width:810,
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
  fieldLabel:'产品编号',
  name:'code',
  text:'${in_product.product.code}'
  }
  ,{xtype:'label',
  fieldLabel:'产品名称',
  text:'${in_product.product.name}',
  name:'name'
  },{xtype:'label',
  fieldLabel:'入库价格',
  text:'${in_product.price}',
  name:'name'
  },{xtype:'label',
  fieldLabel:'库存数量',
  text:'${in_product.num}',
  name:'name'
  }
  ,{xtype:'numberfield',
  fieldLabel:'销售单价',
  allowBlank:false,
  blankText : "请输入单价",
  allowNegative:false, //不允许输入负号
  name:'out_price',
     listeners:{   
       render:function(config){   
        var parentNode=document.getElementById(config.id).parentNode;   
        var newChild=document.createElement('span');   
            newChild.innerHTML="<font style='padding-left:20px;color:green;'>单位：元</font>"  
            parentNode.appendChild(newChild);   
            }   
  
}
  }
  ,{xtype:'numberfield',
  fieldLabel:'销售数量',
  name:'num',
  allowBlank:false,
  blankText : "请输入数量",
   maxValue:'${in_product.num}',
  maxText:'销售数量必需小于库存数量',
   listeners:{   
       render:function(config){   
        var parentNode=document.getElementById(config.id).parentNode;   
        var newChild=document.createElement('span');   
            newChild.innerHTML="<font style='padding-left:20px;color:green;'>单位：${in_product.product.unit}</font>"  
            parentNode.appendChild(newChild);   
            }   
  
}  
  },
  {xtype:'textfield',
  fieldLabel:'备注',
  name:'description',
  width:200
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
            html:'<img src="<%=path %>/upload/product/${in_product.product.pic}">'
           }   

            ]
            }
           ] 
           }
 
  ]

   });
   
    parent.Ext.getCmp('addbutton').setHandler(function(){
        if(f.form.isValid()){
                  //提交到服务器操作
                  f.form.doAction('submit',{
                  url:'<%=path %>/out_product.do?methede=outproduct',
                  params:{id:'${in_product.id}'},
                  method:'post',//提交方法post或get
                  waitTitle: "请稍候", 
                  waitMsg: '正在提取...', 
                  //提交成功的回调函数
                   success:function(f,a){
			       Ext.Msg.alert('ok',a.result.msg);
			       var gb=parent.window.document.getElementById("gb");
			       gb.value="1";
			        var win = parent.Ext.getCmp('outnew');
                   if (win) {win.close();}
			       },
			       failure:function(f,a){
			       Ext.Msg.alert('error','提取失败');
			       }
                     });
                  } 
          }                  
         );
   
  });

   </script>
   </head>
   <body>
   <div id="dd"  ></div>
   </body>
  </html>