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
		 <title>编辑用户</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
					<style type="text/css">
<!--
	#newPreview
{
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
}
-->
</style>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
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
	           var ischange=document.getElementById("ischange");
	           ischange.value="1";
	            var pic=document.getElementById("pic");
	           pic.value="0";
	       }
	       
	       function setimg(){
	        var newPreview = document.getElementById("newPreview");
	           if(newPreview.innerHTML != ""){
                   newPreview.innerHTML = "";
                  }
               <c:if test="${userbean.picture!=null}">
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = '<%=path%>/memberFace/${userbean.picture }';
	           </c:if>
	            <c:if test="${userbean.picture==null}">
	           newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = '<%=path%>/images/nopic.jpg';
	           </c:if>
	           newPreview.style.width = "80px";
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
				<c:if test="${userbean.departmentid ne ''&& not empty userbean.departmentid}"> 
				 proxy: new Ext.data.HttpProxy({   
               url: '<%=path %>/position.do?methede=listPositionForSelectEXT&departmentid=${userbean.departmentid}' 
               }),  
               </c:if> 
				    reader: new Ext.data.JsonReader({   
				    root: 'rows',   
				    id: 'ps'  
				    }, [   
				        {name: 'id', mapping: 'id'},   
				        {name: 'positionname', mapping: 'positionname'}   
				    ])   
				});
				<c:if test="${userbean.departmentid ne ''&& not empty userbean.departmentid}">  
				positionStore.load();
				 </c:if>      
    
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
    value:'${userbean.username}',
    fieldLabel:"用户名",
    readOnly:true,
    width:200,
    allowBlank:false,
    blankText : "用户名不能为空"
   });
    
    var nickname = new Ext.form.TextField({id:'nickname',
             readOnly:true,
             name:"nickname",
             value:'${userbean.nickname}',
             fieldLabel:"呢称",
             width:200,allowBlank:false,blankText : "用户呢称不能为空"
               });
    
    var tname = new Ext.form.TextField({name:"tname",value:'${userbean.tname}',fieldLabel:"真实姓名",width:200});
    
    var rsboy=new  Ext.form.Radio({name:"sex",inputValue:"男",boxLabel:"男" <c:if test="${'男' eq userbean.sex }">,checked:true</c:if>});
    
    var rsgirl= new Ext.form.Radio({name:"sex",inputValue:"女",boxLabel:"女" <c:if test="${'女' eq userbean.sex }">,checked:true</c:if>});
    
    var grpsex = new Ext.form.RadioGroup({name:"sex",fieldLabel:"性别",items:[rsboy,rsgirl],width:200})
    
    var birthday = new Ext.form.DateField({name:"birthday",value:'${userbean.birthday}',fieldLabel:"出生日期",width:200,format:"Y-n-j"});
    
    var mobile = new Ext.form.TextField({
    fieldLabel:"联系电话",
    name:"mobile",
    value:'${userbean.mobile}',
    vtype:'phonecheck',
    vtypeText:"号码不匹配",
    width:200});
    
    var qq = new Ext.form.TextField({name:"qq",value:'${userbean.qq}',fieldLabel:"QQ号",width:200});
    
    var email = new Ext.form.TextField({
    name:"email",
    value:'${userbean.email}',
    fieldLabel:"邮箱地址",
    vtype:"email",//email格式验证
　　 vtypeText:"不是有效的邮箱地址",
    width:200});
    
    var duty = new Ext.form.TextField({name:"duty", value:'${userbean.duty}',fieldLabel:"岗位",width:200});
    
    var title = new Ext.form.TextField({name:"title",value:'${userbean.title}',fieldLabel:"职称",width:200});
    
    var homeaddress = new Ext.form.TextField({name:'homeaddress',value:'${userbean.homeaddress}',fieldLabel:"家庭地址",width:400});
    
    var ownsigned = new Ext.form.TextArea({name:'ownsigned',value:'${userbean.ownsigned}',fieldLabel:"个性签名",width:200,height:100});
    
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
    
    var hid = new Ext.form.Hidden({
            id : "ischange",
            name:"ischange",
            value : "0"
        });
        
          var hidpic = new Ext.form.Hidden({
            id : "pic",
            name:"pic",
            value : "kopf01"
        });
        
        
           var hiddepartment = new Ext.form.Hidden({
            id : "departmentid",
            name:"departmentid",
            value : "${userbean.departmentid}"
        });
        
           var hidposition = new Ext.form.Hidden({
            id : "positionid",
            name:"positionid",
            value : "${userbean.positionid}"
        });
        
        var department = new Ext.form.ComboBox({   
           fieldLabel: '请选择部门',
           store: departmentStore,   
           valueField :"id",   
           displayField:"departmentname",   
           <c:if test="${not empty userbean.departmentid}"> 
           value:'${userbean.department.departmentname}',
           </c:if>       
          //数据是在本地   
           mode: 'local',   
           forceSelection: true,//必须选择一项   
           emptyText:'请选择部门...',//默认值   
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
                var dc=Ext.getCmp('departmentid');
                dc.setValue(combo.value); 
                var pc=Ext.getCmp('positionid');
                pc.setValue('0');      
            }   
        }     
       } ); 
       
        var position = new Ext.form.ComboBox({   
           fieldLabel: '请选择职位',
           store: positionStore,   
            <c:if test="${not empty userbean.positionid}"> 
           value:'${userbean.position.positionname}',
           </c:if>       
           valueField :"id",   
           displayField:"positionname",   
    //数据是在本地   
           mode: 'local',   
           forceSelection: true,//必须选择一项   
           emptyText:'请选择职位...',//默认值   
           editable: false,//不允许输入   
           triggerAction: 'all',//因为这个下拉是只能选择的，所以一定要设置属性triggerAction为all，不然当你选择了某个选项后，你的下拉将只会出现匹配选项值文本的选择项，其它选择项是不会再显示了，这样你就不能更改其它选项了。   
           //allowBlank:false,//该选项值不能为空   
           id : 'positionforid',   
           name: 'positionforname',   
           width: 200,
            listeners:{     
            select : function(combo, record,index){
                var pc=Ext.getCmp('positionid');
                 pc.setValue(combo.value);      
            }   
        }       
       } ); 
        
    
    
    var f = new Ext.form.FormPanel({
        renderTo:"dd",
        frame:true,
        fileUpload : true,
        labelAlign:"right",
        labelWidth : 70,
        width:620,
        autoHeight:true,
        items:[
        username,
      {  
      xtype:'panel',  
      layout:'column', 
      border:false,
      defaults : {                   //应用到每一个子元素上的配置   
                    border : false,            //不显示边框   
                    layout : 'form'            //在列布局中嵌套form布局   
                },   
      items:[
            
            { width : 300, 
          items:[
              nickname
            ]
            }, { width : 300, 
          items:[
              tname
            ]
            }
           ] 
           },{  
      xtype:'panel',  
      layout:'column', 
      border:false,
      defaults : {                   //应用到每一个子元素上的配置   
                    border : false,            //不显示边框   
                    layout : 'form'            //在列布局中嵌套form布局   
                },   
      items:[
            
            { width : 300, 
          items:[
              grpsex
            ]
            }, { width : 300, 
          items:[
              birthday
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
            
            { width : 300, 
          items:[
              mobile
            ]
            }, { width : 300, 
          items:[
              qq
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
            
            { width : 300, 
          items:[
              duty
            ]
            }, { width : 300, 
          items:[
              title
            ]
            }
           ] 
           },
        email,department,position,homeaddress,ownsigned,myfile,newPreview,hid,hidpic,hiddepartment,hidposition
        ]
    });
   setimg();

    parent.Ext.getCmp('updatebutton').setHandler(function(){
                     var ischange=document.getElementById("ischange").value;
				      if(f.form.isValid()){//验证合法后使用加载进度条
                          //提交到服务器操作
                            f.form.doAction('submit',{
                            url:'<%=path %>/user.do?methede=updateUserEXT&ischange='+ischange,//文件路径
                            method:'post',//提交方法post或get
                            waitTitle: "请稍候", 
                            waitMsg: '正在修改...', 
                            params:{id:'${userbean.id}'},
                            //提交成功的回调函数
                            success:function(form,action){
                                 if (action.result.msg=='ok') {
                                     Ext.Msg.show({title:'用户修改成功',
                                     msg:'用户修改成功',
                                     buttons:{
                                     yes:'OK'
                                    }, 
                                     fn:function callback(btn,text){
                                     switch(btn){
                                      case "yes":
                                      var gb=parent.window.document.getElementById("gb");
			                          gb.value="1";
                                      var win = parent.Ext.getCmp('updateuser');
                                       if (win) {
                                       win.close();
                                       }
                                       break;
                                       }
                                   }
                                    
                                       });
                                     
                                 } else {
                                    Ext.Msg.alert('编辑失败','用户修改失败');
                                 }
                            },
                            //提交失败的回调函数
                            failure:function(){
                                 Ext.Msg.alert('错误','服务器出现错误请稍后再试！');
                            }
                          });
                        }  
          }                  
         );
          parent.Ext.getCmp('updateresetbutton').setHandler(function(){f.getForm().reset(); });
          
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
	           var ischange=document.getElementById("ischange");
	           ischange.value="1";
     } 
	}
     </script>
	</head>
	<body >
	<div id="dd" ></div>
	</body>
</html>

