<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>编辑产品入库</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/src/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  
   //  第一个下拉框   
	       var  store = new Ext.data.Store({   
               proxy: new Ext.data.HttpProxy({   
               url: '<%=path %>/product.do?methede=listProductForSelectEXT'  
               }),   
               reader: new Ext.data.JsonReader({   
                root: 'rows',   
                totalProperty: 'totalCount',  
                remoteSort: true,
                id: 'cs'  
                }, [   
		        {name: 'id', mapping: 'id'},   
		        {name: 'name', mapping: 'name'}   
		       ])   
		       }); 
  
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:485,
  items:[
       {
           xtype:'combo',
           fieldLabel: '入库产品',
           store: store,   
           valueField :"id",   
           displayField:"name",   
          //数据是在本地   
           mode: 'remote',   
           pageSize:5,//每页显示的条数
           forceSelection: true,//必须选择一项   
           emptyText:'请选择产品...',//默认值   
           //editable: false,//不允许输入   
           triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。   
           //allowBlank:false,//该选项值不能为空   
           width: 300,
           minChars:1,//设置填充几个字节就去查询一次，默认为4个字节
           allowBlank:false,
           id:'content',
           value:'[编号:${in_product.product.code}] ${in_product.product.name}',
           blankText : "请选择入库产品",
           listeners:{     
            click : function(combo, record,index){
             store.reload(
           {params:{start:0, limit:5}
             }); //加载数据 
            },
             select : function(combo, record,index){
               var bt=Ext.getCmp('productid');
               bt.setValue(combo.value); 
            }
        }  
       }
  ,{xtype:'numberfield',
  fieldLabel:'入库单价',
  value:'${in_product.price}',
  allowBlank:false,
  blankText : "请输入单价",
  allowNegative:false, //不允许输入负号
  name:'price',
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
  fieldLabel:'入库数量',
  value:'${in_product.num}',
  allowBlank:false,
  blankText : "请输入数量",
  allowNegative:false, //不允许输入负号
  minValue :'0.000001',
  minText:'库存数量必需大于0',
  name:'num'
  }
  ,{xtype:'datefield',
  fieldLabel:'生产日期',
  width:150,
  value:'${in_product.production_date}',
  format:"Y-n-j",
  name:'production_date'
  }
  ,{xtype:'datefield',
  fieldLabel:'过期日期',
  width:150,
  format:"Y-n-j",
  value:'${in_product.expiration_date}',
  name:'expiration_date'
  }
  ,{xtype:'textfield',
  fieldLabel:'存放位置',
  width:300,
  value:'${in_product.location}',
  name:'location'
  }
  ,{xtype:'numberfield',
  fieldLabel:'排序码',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60,
  value:'${in_product.sortcode}',
  name:'sortcode'
  },{xtype:'textfield',
  fieldLabel:'备注',
  width:200,
  value:'${in_product.description}',
  name:'description'
  },{
             xtype:'hidden',
            id : "productid",
            name:"productid",
            value : "${in_product.productid}"
        }
  ]
   });
   
    store.on("beforeload", function(currentStore, options) {
               currentStore.baseParams["content"] = Ext.getDom("content").value;
             });
		        store.load(
           {params:{start:0, limit:5}
             }); //加载数据 
             
              parent.Ext.getCmp('updatebutton').setHandler(function(){
			  if(f.form.isValid()){
			    f.form.doAction('submit',{
			    url:'<%=path %>/in_product.do?methede=updateEXT',
			    method : 'post',
			    params:{id:'${in_product.id}'},
			    waitTitle: "请稍候", 
			    waitMsg: '正在编辑数据...', 
			    success:function(f,a){
			    Ext.Msg.alert('ok',a.result.msg);
			    var gb=parent.window.document.getElementById("gb");
			    gb.value="1";
			    var win = parent.Ext.getCmp('updatenew');
			    if (win) {win.close();}
			    },
			  failure:function(f,a){
			    Ext.Msg.alert('error','编辑失败');
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