<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Demo19-某地前往某地</title>
        <style type="text/css">
        #map_canvas { width: 99%; height: 100%; }
    </style>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
     <link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
	<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
   <script type="text/javascript">
    var directionDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;
    
    Ext.onReady(function(){
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side';
    
     function chakan(){
     var isshow=document.getElementById("isshow");
     isshow.value='1'; 
    };
    
    
     function markadd(){
     var isshow=document.getElementById("isshow");
     isshow.value='2'; 
    };
    
     function calRoute(){
     Ext.MessageBox.wait('正在等待服务器响应...','请稍等');
	 var start = document.getElementById("start").value;
     var end = document.getElementById("end").value;
     var request = {
     origin: start,
     destination: end,
     travelMode: google.maps.DirectionsTravelMode.DRIVING
      };
      directionsService.route(request, function(response, status)
       {
         if (status == google.maps.DirectionsStatus.OK)
           {
              directionsDisplay.setDirections(response);
              Ext.MessageBox.hide();
           }
           else
           {
             Ext.Msg.alert('', '无法规划导航路线，请确认起点和终点是否正确。');
           }
           
       });
    };
      var addnew=function(location){
    var addnew= new Ext.Window({
    id:'addnew',
    title:'标记地点',
    width:310,
    height:180,
    layout:'form',
    closeAction:'close',
    modal:true,
    //collapsible:true, 折叠
    plain: false,
    resizable: true,
    items:[ 
    {xtype:'panel',
     layout:'form',
     renderTo:document.body,   
     width:300,
     frame:true,
     items:[
  {xtype:'textfield',
  labelSeparator:'',
  fieldLabel:'<div style="width:100%;" align="right">地点名称：</div>',
  labelWidth : 55,
  width:150,
  labelAlign : 'right',
  allowBlank:false,
  blankText : "地点名称不能为空",
  id:'mn',
  name:'name'
  },{xtype:'textarea',
  labelSeparator:'',
  fieldLabel:'<div style="width:100%;" align="right">地点描述：</div>',
  labelWidth : 55,
  width:150,
  labelAlign : 'right',
  id:'ms',
  name:'ms'
  }]}],
  buttons : [{
text : '标记',
iconCls:'icon_submit',
handler : function() {
var mn=document.getElementById("mn");
var ms=document.getElementById("ms");
if(mn.value=='')
{
  Ext.Msg.alert('', '请输入地点名字');
}
else
{
var clickedLocation = new google.maps.LatLng(location); 
var marker = new google.maps.Marker({       
position: location,        
     map: map,
     title:mn.value   
     }); 
 var message=new google.maps.InfoWindow({
 content:'<font style="font-size:12px;color:red;">地点名称：'+mn.value+'</font><br/><font style="font-size:12px;">地点描述：'+ms.value+'</font>',
 size:new google.maps.Size(100,30)
 });
google.maps.event.addListener(marker, "click", function() { 
 message.open(map,marker); 
}); 
var isshow=document.getElementById("isshow");
isshow.value='0';
var win = Ext.getCmp('addnew');
  if (win) {win.close();}
}
}
}, {
text : '关闭',
iconCls:'icon_cancel',
handler : function() {
var win = Ext.getCmp('addnew');
  if (win) {win.close();}
}
}]
   });
    addnew.show(); 
  };
    
   var gotonew=function(){
    var gotonew= new Ext.Window({
    id:'gotonew',
    title:'转到经纬度',
    width:310,
    height:150,
    layout:'form',
    closeAction:'close',
    modal:true,
    //collapsible:true, 折叠
    plain: false,
    resizable: true,
    items:[ 
    {xtype:'panel',
     layout:'form',
     renderTo:document.body,   
     width:300,
     frame:true,
     items:[
  {xtype:'numberfield',
  labelSeparator:'',
  fieldLabel:'<div style="width:100%;" align="right">经度：</div>',
  labelWidth : 55,
  width:150,
  labelAlign : 'right',
  allowBlank:false,
  blankText : "经度不能为空",
  id:'glog',
  name:'glog'
  },{xtype:'numberfield',
  labelSeparator:'',
  fieldLabel:'<div style="width:100%;" align="right">纬度：</div>',
  labelWidth : 55,
  width:150,
  labelAlign : 'right',
  allowBlank:false,
  blankText : "纬度不能为空",
  id:'glat',
  name:'glat'
  }]}],
  buttons : [{
text : '跳转',
iconCls:'icon_submit',
handler : function() {
var glog=document.getElementById("glog");
if(glog.value=='')
{
  Ext.Msg.alert('', '请输入经度');
  return;
}
var glat=document.getElementById("glat");
if(glat.value=='')
{
  Ext.Msg.alert('', '请输入纬度');
  return;
}
var win = Ext.getCmp('gotonew');
  if (win) {win.close();}
  var point =  new google.maps.LatLng(glog.value, glat.value); 
  map.panTo(point);
}
}, {
text : '关闭',
iconCls:'icon_cancel',
handler : function() {
var win = Ext.getCmp('gotonew');
  if (win) {win.close();}
}
}]
   });
    gotonew.show(); 
  };  
    
    directionsDisplay = new google.maps.DirectionsRenderer();
    var guangzhou = new google.maps.LatLng(39.9087,116.3972);
    var myOptions = {
            zoom: 4,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
           center: guangzhou
            }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    google.maps.event.addListener(map,'click',function(event){
    var isshow=document.getElementById("isshow");
     if(isshow.value=='1')
       {
        Ext.Msg.alert('', '您点击地点的经度为：'+event.latLng.lng()+'，纬度为：'+event.latLng.lat());
		isshow.value='0'; 
		}
		else if(isshow.value=='2')
		 {
		   addnew(event.latLng);
		 }
		});
     directionsDisplay.setMap(map);
      
    
    var tbar=new Ext.Toolbar({
    renderTo:'toolbar',
    items:[
     '-', 
     { text: '标记地点名',iconCls:'icon_biaoji',handler: markadd}, '-',
     { text: '查看经纬度',iconCls:'icon_chakan',handler: chakan}, '-',
     { text: '转到经纬度',iconCls:'icon_tiqu',handler: gotonew }, '-',
     '起点：', 
     { id: 'start', xtype: 'textfield' },'-', 
     '终点：', 
     { id: 'end', xtype: 'textfield' },'-', 
     { text: '规划路线',iconCls:'icon_go',handler: calRoute}, '-'
     ]
    });
    
        });
        
    </script>
</head>
 <body  onunload="GUnload()">
  <input type="hidden" id="isshow" value="0"/>
  <div id="container">
    <div id="toolbar"></div>
</div>
    <div id="map_canvas" ></div>
</body>
</html>
