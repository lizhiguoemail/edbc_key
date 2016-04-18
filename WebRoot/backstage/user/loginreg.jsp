<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		 <title>用户注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
						<style type="text/css">
<!--
	#newPreview
{
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
}
-->
</style>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
    <script type="text/javascript" src="<%=path %>/extjs/src/locale/ext-lang-zh_CN.js"></script>
    <script type="text/javascript">
      function PreviewImg(imgFile)
	       {
	           //新的预览代码，支持 IE6、IE7。
	           var newPreview = document.getElementById("newPreview");
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value;
	           newPreview.style.width = "80px";
	           newPreview.style.height = "60px";
	           var pic=document.getElementById("pic");
	           pic.value="0";
	       }
	       
	         function setimg(){
	        var newPreview = document.getElementById("newPreview");
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = '<%=path%>/userpic/kopf1.gif';
	           newPreview.style.width = "60px";
	           newPreview.style.height = "60px";
	       }
	       
    Ext.onReady(function(){
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side'; //under,title,qtip,side
    
    	 //  第一个下拉框   
	      var departmentStore = new Ext.data.Store({   
               proxy: new Ext.data.HttpProxy({   
               url: '<%=path %>/department.do?methede=listDepartmentForSelectEXT&isno=1'  
               }),   
               reader: new Ext.data.JsonReader({   
                root: 'rows',   
                id: 'ds'  
                }, [   
		        {name: 'id', mapping: 'id'},   
		        {name: 'departmentname', mapping: 'departmentname'}   
		       ])   
		       }); 
		       departmentStore.load();
		       
				
				   //     第2个下拉框   
				var positionStore = new Ext.data.Store({   
				    reader: new Ext.data.JsonReader({   
				    root: 'rows',   
				    id: 'ps'  
				    }, [   
				        {name: 'id', mapping: 'id'},   
				        {name: 'positionname', mapping: 'positionname'}   
				    ])   
				});     
				
    Ext.apply(Ext.form.VTypes,{
　　               password:function(val,field)
                 {               //val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
　　               if(field.confirmTo)
                  {              //confirmTo是我们自定义的配置参数，一般用来保存另外的组件的id值
　　               var pwd=Ext.get(field.confirmTo);//取得confirmTo的那个id的值
　　               return (val==pwd.getValue());
　　              }
　　              return true;
　　             },
		  phonecheck:function(val, field) { 
		    var str=val;
		    var reg=/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/; 
		    if (reg.test(str)==false) 
		    {
		    return false;
		    }
		    else
		    {
		    return true;
		    } 
		   }
　　});

    var username = new Ext.form.TextField({
    id:"username",
    name:"username",
    fieldLabel:"用户名",
    width:200,
    allowBlank:false,
    blankText : "用户名不能为空", 
    maxLength : 15,              
    maxLengthText : "长度超过了15个字符",
    listeners:{   
            'change':function(){
             Ext.Ajax.request({
             url:'<%=path %>/user.do?methede=checkRegEXT',
             method:'post',//提交方法post或get
             waitTitle: "请稍候", 
             waitMsg: '正在验证用户名是否被注册...', 
             params:{username:Ext.getCmp('username').getValue()},
             success: function(response,opts){
             var respText=Ext.util.JSON.decode(response.responseText);
             if(respText.msg=='on')
             {
               Ext.getCmp('username').markInvalid('该用户名已被使用');
             }
             
              }
              }) 
		   }
              } });
    
    var password = new Ext.form.TextField({
    id:"password",
    name:"password",
    fieldLabel:"密码",
    allowBlank:false,
    blankText : "密码不能为空",
    inputType:"password",
    width:200});
    
    var password2 = new Ext.form.TextField({
    name:"password2",
    fieldLabel:"确认密码",
    allowBlank:false,
    blankText : "确认密码不能为空",
    vtype:"password",//自定义的验证类型
    vtypeText:"两次密码不一致！",
　　 confirmTo:"password",//要比较的另外一个的组件的id
    inputType:"password",width:200});
    
    var nickname = new Ext.form.TextField({id:'nickname',name:"nickname",fieldLabel:"呢称",width:200,allowBlank:false,blankText : "用户呢称不能为空", 
               listeners:{   
             'blur':function(){
             Ext.Ajax.request({
             url:'<%=path %>/user.do?methede=checkNicknameEXT',
             method:'post',//提交方法post或get
             waitTitle: "请稍候", 
             waitMsg: '正在验证用户呢称是否被注册...', 
             params:{nickname:Ext.getCmp('nickname').getValue()},
             success: function(response,opts){
             var respText=Ext.util.JSON.decode(response.responseText);
             if(respText.msg=='on')
             {
               Ext.getCmp('nickname').markInvalid('该呢称已被使用');
             }
             
              }
              }) 
		   }
              } });
    
    var tname = new Ext.form.TextField({name:"tname",fieldLabel:"真实姓名",width:200});
    
    var rsboy=new  Ext.form.Radio({name:"sex",inputValue:"男",boxLabel:"男",checked:true});
    
    var rsgirl= new Ext.form.Radio({name:"sex",inputValue:"女",boxLabel:"女"});
    
    var grpsex = new Ext.form.RadioGroup({name:"sex",fieldLabel:"性别",items:[rsboy,rsgirl],width:200})
    
    var birthday = new Ext.form.DateField({name:"birthday",fieldLabel:"出生日期",width:200,format:"Y-n-j"});
    
    var mobile = new Ext.form.TextField({
    fieldLabel:"联系电话",
    name:"mobile",
    vtype:'phonecheck',
    vtypeText:"号码不匹配",
    width:200});
    
    var qq = new Ext.form.TextField({name:"qq",fieldLabel:"QQ号",width:200});
    
    var email = new Ext.form.TextField({
    name:"email",
    fieldLabel:"邮箱地址",
    vtype:"email",//email格式验证
　　 vtypeText:"不是有效的邮箱地址",
    width:200});
    
    var duty = new Ext.form.TextField({name:"duty",fieldLabel:"岗位",width:200});
    
    var title = new Ext.form.TextField({name:"title",fieldLabel:"职称",width:200});
    
    var homeaddress = new Ext.form.TextField({name:'homeaddress',fieldLabel:"家庭地址",width:400});
    
    var ownsigned = new Ext.form.TextArea({name:'ownsigned',fieldLabel:"个性签名",width:200,height:100});
    
     var myfile  = new Ext.form.TextField({id:"myfile",name:"myfile",inputType:"file",fieldLabel:"用户头像",width:200, 
            autoCreate : {   
            tag : "input",   
            type : "file",   
            size : "20",   
            autocomplete : "off",   
            onChange : "PreviewImg(this)"
        },
         listeners:{   
        render:function(config){   
        var parentNode=document.getElementById(config.id).parentNode;   
        var newChild=document.createElement('span');   
            newChild.innerHTML="<font color='red'><input type='button' value='选择服务器头像' onclick='tjpic();' style='valign:middle;'></font>"  
            parentNode.appendChild(newChild);   
            } }    
           });
        
     var newPreview  = new Ext.form.TextField({id:"newPreview",name:"newPreview",fieldLabel:"头像预览",width:80,height:60,
     autoEl: {   
            tag : "img",   
            src:"<%=path %>/images/nopic.jpg",
            style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
        }   
    });
    
      var hidpic = new Ext.form.Hidden({
            id : "pic",
            name:"pic",
            value : "kopf01"
        });
        
        
        var department = new Ext.form.ComboBox({   
           fieldLabel: '请选择部门',
           store: departmentStore,   
           valueField :"id",   
           displayField:"departmentname",   
          //数据是在本地   
           mode: 'local',   
           forceSelection: true,//必须选择一项   
           emptyText:'请选择部门...',//默认值   
           hiddenName:'departmentid',//hiddenName才是提交到后台的input的name   
           editable: false,//不允许输入   
           triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。   
           //allowBlank:false,//该选项值不能为空   
           id : 'departmentforid',   
           name: 'departmentforname',   
           width: 200,
            listeners:{     
            select : function(combo, record,index){
               var parent=Ext.getCmp('position');
                positionStore.removeAll();
                position.clearValue();
                positionStore.proxy= new Ext.data.HttpProxy({url: '<%=path %>/position.do?methede=listPositionForSelectEXT&departmentid=' + combo.value});   
                positionStore.load();    
            }   
        }     
       } ); 
       
        var position = new Ext.form.ComboBox({   
           fieldLabel: '请选择职位',
           store: positionStore,   
           valueField :"id",   
           displayField:"positionname",   
    //数据是在本地   
           mode: 'local',   
           forceSelection: true,//必须选择一项   
           emptyText:'请选择职位...',//默认值   
           hiddenName:'positionid',//hiddenName才是提交到后台的input的name   
           editable: false,//不允许输入   
           triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。   
           //allowBlank:false,//该选项值不能为空   
           id : 'positionforid',   
           name: 'positionforname',   
           width: 200   
       } ); 
        
    
    //提交按钮
    var btnbutton = new Ext.Button({text:"提交", iconCls:'icon_submit',
    				 type: 'submit',
               		//定义表单提交事件
				     handler:function(){
				      if(f.form.isValid()){//验证合法后使用加载进度条
                          //提交到服务器操作
                            f.form.doAction('submit',{
                            url:'<%=path %>/user.do?methede=regUserEXT',//文件路径
                            method:'post',//提交方法post或get
                            waitTitle: "请稍候", 
                            waitMsg: '正在添加...', 
                            params:'',
                            //提交成功的回调函数
                            success:function(form,action){
                                   document.location='<%=path %>/backstage/user/regsuccess.jsp';
                            },
                            //提交失败的回调函数
                            failure:function(){
                                 Ext.Msg.alert('错误','服务器出现错误请稍后再试！');
                            }
                          });
                        }                                                   
               }
    });
    
    var btnReset = new Ext.Button({text:"重置",iconCls:'icon_remove',handler:function(){f.getForm().reset();}});
    
    var btncancel = new Ext.Button({text:"取消",iconCls:'icon_cancel',handler:function(){
        document.location="<%=path %>/admin.jsp";
        }
        });
    
    var f = new Ext.form.FormPanel({
        frame:true,
        fileUpload : true,
        labelAlign:"right",
        autoScroll:true,
        width:650,
        height:530,
        
        items:[username,password,password2,nickname,tname,grpsex,birthday,mobile,qq,email,department,position,duty,title,homeaddress,ownsigned,myfile,newPreview,hidpic],
        buttons:[btnbutton,btnReset,btncancel]
    });
    
     //定义窗体
               win = new Ext.Window({
                  id:'win',
                  title:'用户注册',
                  layout:'fit',   //布局方式fit，自适应布局              
                  width:800,
                  modal:true,
                  plain:true,
                  bodyStyle:'padding:5px;',
                  maximizable:false,//禁止最大化
                  closeAction:'close',
                  closable:false,//禁止关闭
                  collapsible:false,//可折叠
                  plain: true,
                  buttonAlign:'center',
                  items:f//将表单作为窗体元素嵌套布局
               });
               win.show();//显示窗体

        setimg();
     });
     function tjpic()
	{
     var arr=window.showModalDialog(encodeURI("<%=path %>/backstage/user/userpic.jsp"),"new","dialogHeight:400px;dialogWidth:600px;edge:Raised;center:Yes;help:no;resizable:Yes;status:no;");
     if(arr!=null)
     {
        var pic=document.getElementById("pic");
        pic.value=arr[0];
         var newPreview = document.getElementById("newPreview");
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = "<%=path %>/userpic/"+pic.value+".gif";
	           newPreview.style.width = "60px";
	           newPreview.style.height = "60px";
     } 
	}
     </script>
	</head>
	<body>
	<div id="dd" ></div>
	</body>
</html>

