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
		 <title>用户详情</title>
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
    var username = new Ext.form.TextField({
    id:"username",
    name:"username",
    value:'${userbean.username}',
    fieldLabel:"用户名",
    readOnly:true,
    width:200
   });
    
    var nickname = new Ext.form.TextField({id:'nickname',
             readOnly:true,
             name:"nickname",
             value:'${userbean.nickname}',
             fieldLabel:"呢称",
             width:200
               });
    
    var tname = new Ext.form.TextField({name:"tname",value:'${userbean.tname}', readOnly:true,fieldLabel:"真实姓名",width:200});
    
    var rsboy=new  Ext.form.Radio({name:"sex",inputValue:"男",boxLabel:"男" <c:if test="${'男' eq userbean.sex }">,checked:true</c:if>});
    
    var rsgirl= new Ext.form.Radio({name:"sex",inputValue:"女",boxLabel:"女" <c:if test="${'女' eq userbean.sex }">,checked:true</c:if>});
    
    var grpsex = new Ext.form.RadioGroup({name:"sex",fieldLabel:"性别",items:[rsboy,rsgirl],width:200})
    
    var birthday = new Ext.form.TextField({name:"birthday",value:'${userbean.birthday}',fieldLabel:"出生日期",readOnly:true,width:200});
    
    var mobile = new Ext.form.TextField({
    fieldLabel:"联系电话",
    name:"mobile",
    value:'${userbean.mobile}',
    readOnly:true,
    width:200});
    
    var qq = new Ext.form.TextField({name:"qq",value:'${userbean.qq}',fieldLabel:"QQ号",readOnly:true,width:200});
    
    var email = new Ext.form.TextField({
    name:"email",
    value:'${userbean.email}',
    fieldLabel:"邮箱地址",
    readOnly:true,
    width:200});
    

    
    var department = new Ext.form.TextField({name:"departmentname", 
     <c:if test="${not empty userbean.department && not empty userbean.departmentid}">  
    value:'${userbean.department.departmentname}',
     </c:if>      
    readOnly:true,fieldLabel:"所属部门",width:200});
      
    var position = new Ext.form.TextField({name:"positionname", 
     <c:if test="${not empty userbean.position && not empty userbean.positionid}">  
    value:'${userbean.position.positionname}',
    </c:if>    
    readOnly:true,fieldLabel:"职位",width:200});
    
    var duty = new Ext.form.TextField({name:"duty", value:'${userbean.duty}',readOnly:true,fieldLabel:"岗位",width:200});
    
    var title = new Ext.form.TextField({name:"title",value:'${userbean.title}',readOnly:true,fieldLabel:"职称",width:200});
    
    var homeaddress = new Ext.form.TextField({name:'homeaddress',value:'${userbean.homeaddress}',readOnly:true,fieldLabel:"家庭地址",width:400});
    
    var ownsigned = new Ext.form.TextArea({name:'ownsigned',value:'${userbean.ownsigned}',readOnly:true,fieldLabel:"个性签名",width:200,height:100});
    
     var newPreview  = new Ext.form.TextField({id:"newPreview",name:"newPreview",fieldLabel:"照片预览",width:80,height:60,
     autoEl: {   
            tag : "img",   
            src:"<%=path %>/images/nopic.jpg",
            style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
        }   
    
    });
    
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
       email,department,position,homeaddress,ownsigned,newPreview
        ]
    });
setimg();
     });
     </script>
	</head>
	<body >
	<div id="dd" ></div>
	</body>
</html>

