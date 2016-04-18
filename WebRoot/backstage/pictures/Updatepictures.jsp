<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>修改图片管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
<style type="text/css">

#newPreview
{
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
}

</style>
<script type="text/javascript">
//下拉框
   var  store = new Ext.data.Store({   
               proxy: new Ext.data.HttpProxy({
               url: '<%=path %>/picture_group.do?methede=listEXT'  
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
function PreviewImg(imgFile,preview,picname)
	       {
	           //新的预览代码，支持 IE6、IE7。
	           var newPreview = document.getElementById(preview);
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value;
	           newPreview.style.width = "80px";
	           newPreview.style.height = "60px";
	           var pic=document.getElementById(picname);
	           pic.value="0";
	       }
	       
	       function setimg(){
	        var newPreview = document.getElementById("newPreview");
	        var path = document.getElementById("path");
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = '<%=path%>/'+path.value;
	           newPreview.style.width = "60px";
	           newPreview.style.height = "60px";
	       }
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
  var newPreview  = new Ext.form.TextField({id:"newPreview",name:"newPreview",fieldLabel:"图片预览(仅支持IE)",width:80,height:60,
     autoEl: {   
            tag : "img",   
            src:"<%=path %>/images/nopic.jpg",
            style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
        }   
    });
   var myfile  = new Ext.form.TextField({id:"myfile",name:"myfile",inputType:"file",fieldLabel:"上传图片",width:200, allowBlank:true,
            autoCreate : {   
            tag : "input",   
            type : "file",   
            size : "20",   
            autocomplete : "off",   
            onChange : "PreviewImg(this,'newPreview','pic')"
        }
           
           });
     var hidpic = new Ext.form.Hidden({
            id : "pic",
            name:"pic",
            value : "kopf01"
        });
  var f=new Ext.FormPanel({
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  width:500,
  fileUpload : true,
  items:[
  {xtype:'textfield',
  fieldLabel:'标题',
  name:'newname',
  value:'${pictures.newname}',
  width:200
  }
  ,{xtype:'textfield',
  fieldLabel:'上传名称',
  name:'oldname',
  width:200,
  readOnly:true,
  value:'${pictures.oldname}'
  }
  ,{xtype:'textfield',
  fieldLabel:'图片展示',
  name:'path',
  id:'path',
  width:200,
  hidden:true,
  value:'${pictures.path}'
  }
  ,{xtype:'panel',
  fieldLabel:'图片展示',
   border:false,
  name:'localtionname',
  html:'<img style="width:50px;hight:50px;" src="<%=path %>/${fn:replace(pictures.path,"\\","/")}" />'
  },
  myfile,newPreview,hidpic
  ,{xtype:'textfield',
  fieldLabel:'类型',
  name:'pictype',
  width:200,
  readOnly:true,
  value:'${pictures.pictype}'
  },
   {
           xtype:'combo',
           fieldLabel: '选择图册',
           store: store,   
           valueField :"id",   
           displayField:"name",   
          //数据是在本地   
           mode: 'remote',   
           pageSize:5,//每页显示的条数
           forceSelection: true,//必须选择一项   
           emptyText:'请选择图册...',//默认值   
           hiddenName:'groupid',//hiddenName才是提交到后台的input的name   
           //editable: false,//不允许输入   
           triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。   
           allowBlank:false,//该选项值不能为空   
           width: 200,
           minChars:1,//设置填充几个字节就去查询一次，默认为4个字节
           allowBlank:false,
           id:'content',
           value:'${pictures.picture_group.name}',
           blankText : "请选择图册",
           listeners:{     
            click : function(combo, record,index){
             store.reload(
           {params:{start:0, limit:5}
             }); //加载数据 
            }   
        }  
       } 
        ,{xtype:'numberfield',
  fieldLabel:'排序码',
  name:'sortcode',
  value:'${pictures.sortcode}',
  allowNegative:false, //不允许输入负号
  //allowDecimals:false,  //不允许有小数
  width:60
  }
  ,{xtype:'textarea',
  fieldLabel:'备注',
  name:'description',
  width:250,
  value:'${pictures.description}'
  }
    ,{xtype:'textarea',
  name:'userid',
  width:250,
  hidden:true,
  value:'${pictures.userid}'
  }
  ]
   });
   parent.Ext.getCmp('updatebutton').setHandler(function(){
   if(f.form.isValid()){
   f.form.doAction('submit',{
   url:'<%=path %>/pictures.do?methede=updateEXT',
   params:{id:'${pictures.id}'},
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
     });
  });

   </script>
   </head>
   <body>
   <div id="dd"></div>
   </body>
  </html>