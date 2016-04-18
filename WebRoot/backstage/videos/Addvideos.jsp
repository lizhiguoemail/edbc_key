<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>添加视频</title>
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
   //下拉框
   var  store = new Ext.data.Store({   
               proxy: new Ext.data.HttpProxy({
               url: '<%=path %>/video_group.do?methede=listEXT'  
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
  
   var myfile  = new Ext.form.TextField({id:"myfile",name:"myfile",inputType:"file",fieldLabel:"上传视频截图",width:230, allowBlank:false,
            autoCreate : {   
            tag : "input",   
            type : "file",   
            size : "20",   
            autocomplete : "off"
        }
           });
  var f=new Ext.FormPanel({
  id:'ff',
  name:'ff',
  method : 'post',
  renderTo:'dd',
  labelWidth : 80,
  frame:true,
  fileUpload : true,
  width:500,
  items:[
  {xtype:'panel',
  fieldLabel:'上传视频',
   border:false,
  name:'sc',
  id:'sc',
  html:'点击<img onclick="upload()" src="<%=path %>/images/upload.png" style="cursor: hand; padding-left: 5px;vertical-align: middle;" />上传相关展品视频<font color="red">（单个文件最大允许1G）</font>'
  },
   {xtype:'textfield',
  fieldLabel:'上传视频',
   border:false,
  name:'localtion',
  id:'localtion',
  hidden:true
  }
  ,
   {xtype:'textfield',
  width:200,
  name:'path',
  id:'path',
  hidden:true
  }
  ,
  {xtype:'textfield',
  fieldLabel:'标题',
  width:200,
  name:'newname',
  id:'newname',
  allowBlank:false
  },
  {
           xtype:'combo',
           fieldLabel: '选择专辑',
           store: store,   
           valueField :"id",   
           displayField:"name",   
          //数据是在本地   
           mode: 'remote',   
           pageSize:5,//每页显示的条数
           forceSelection: true,//必须选择一项   
           emptyText:'请选择专辑...',//默认值   
           hiddenName:'groupid',//hiddenName才是提交到后台的input的name   
           //editable: false,//不允许输入   
           triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。   
           allowBlank:false,//该选项值不能为空   
           width: 200,
           minChars:1,//设置填充几个字节就去查询一次，默认为4个字节
           id:'content',
           blankText : "请选择专辑",
           listeners:{     
            click : function(combo, record,index){
             store.reload(
           {params:{start:0, limit:5}
             }); //加载数据 
            }   
        }  
       },
  {xtype:'textfield',
  fieldLabel:'上传名称',
  name:'oldname',
  id:'oldname',
  readOnly:true,
  width:200
  }
  ,{xtype:'textfield',
  fieldLabel:'类型',
  name:'videotype',
  width:200,
  hidden:true
  }
  ,
  myfile
   ,{
			xtype : 'combo',
			typeAhead : true,
			triggerAction : 'all',
			hiddenName : 'visibility',
			id : 'visibility2',
			lazyRender : true,
			readOnly : false,
			editable: false,//不允许输入
			emptyText : '请选择...',
			mode : 'local',
			store : new Ext.data.ArrayStore({
						id : 0,
						fields : ['label', 'value'],
						data : [['仅自己可见', 1]]
					}),
			valueField : 'value',
			displayField : 'label',
			fieldLabel : '可见性',
			allowBlank:false
		}
  ,{xtype:'textfield',
  fieldLabel:'上传用户',
  name:'userid',
  hidden:true,
  width:200,
  value:'${userinfo.id}'
  }
  , {
			xtype : 'combo',
			typeAhead : true,
			triggerAction : 'all',
			hiddenName : 'copyright',
			id : 'copyright2',
			lazyRender : true,
			editable : false,
			readOnly : false,
			emptyText : '请选择版权...',
			mode : 'local',
			store : new Ext.data.ArrayStore({
						id : 0,
						fields : ['label', 'value'],
						data : [['原创', 1], ['转载', 2]]
					}),
			valueField : 'value',
			displayField : 'label',
			fieldLabel : '版权所有',
			allowBlank:false
		}
  ,{xtype:'textarea',
  fieldLabel:'备注',
  name:'description',
  width:250
  }
  ]
   });
   parent.Ext.getCmp('addbutton').setHandler(function(){
   if(f.form.isValid()){
    f.form.doAction('submit',{
    url:'<%=path %>/videos.do?methede=addEXT',
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
   <script type="text/javascript">
function upload(){
          var context = "<%=path%>";
          var layout="table";
			if (context.length > 0) 
			{
			context = context.substring(1);
			}
			var url = "<%=path%>/js/mupload/mupload.html?" + "context=" + context + "&layout=" + layout+"&userid=${userinfo.id}";
			var returnVal = window.showModalDialog(url, "mjc-mupload","dialogHeight=300px; dialogWidth=600px; status=no; help=no; scroll=no");
    		if (returnVal != null && typeof(returnVal) == 'object') {
    		 var ff=Ext.getCmp('ff');
    		 var a=returnVal.localFile.lastIndexOf("\\")+1;
    		 var b=returnVal.localFile.lastIndexOf(".");
    		 var oname=returnVal.localFile.substring(a,b);
    		 ff.getComponent("path").setValue(returnVal.serverFilePath);
    		 ff.getComponent("oldname").setValue(oname);
    		 ff.getComponent("newname").setValue(oname);
    		 ff.getComponent("sc").hide();
    		 ff.getComponent("localtion").show();
    		 ff.getComponent("localtion").setValue(returnVal.localFile);
    		 
		}
}

</script>
   </head>
   <body>
   <div id="dd" ></div>
   </body>
  </html>