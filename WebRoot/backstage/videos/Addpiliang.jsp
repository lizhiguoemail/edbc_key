<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>图片管理列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
		 <style type="text/css">
		 .small2 a{
	color:#5D3B15;
	text-decoration:none;
}
.button{
background:#fff;border:1px solid #C28F27;padding:2px 2px 0px 2px;margin:4px;border-width:1px 3px 1px 3px;font-size: 12px;color: #A74300;}
		 
.tdlee{
border-right: 1px solid #C1DAD7; 
border-bottom: 1px solid #C1DAD7; 
background: #fff; 
font-size:11px; 
padding: 6px 6px 6px 12px; 
color: #4f6b72; 
		}

</style>
 <script type="text/javascript" src="<%=path %>/js/swfupload/handlers.js"></script>
 <script type="text/javascript" src="<%=path %>/js/swfupload/swfupload.js"></script>
  <script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
  <link rel="stylesheet" type="text/css" href="<%=path %>/extjs/resources/css/ext-all.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common/extjs.css"/>
<script type="text/javascript" src="<%=path %>/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=path %>/extjs/ext-all.js"></script>
  <script type="text/javascript">
			var swfu;
			window.onload = function () {
				swfu = new SWFUpload({
					upload_url: "<%=path %>/videos.do?methede=upload&userid=${userinfo.id}&groupid=${groupid}",
					// File Upload Settings
					file_size_limit : "1000MB",	// 1000MB
					file_types : "*.jpg;*png;*.gif;*.jpeg;*.bmp;*.mp4",//设置可上传的类型
					file_types_description : "视频文件",
					file_upload_limit : "5",
					post_max_size: "11111",				
					file_queue_error_handler : fileQueueError,//选择文件后出错
					file_dialog_complete_handler : fileDialogComplete,//选择好文件后提交
					file_queued_handler : fileQueued,
					upload_progress_handler : uploadProgress,
					upload_error_handler : uploadError,
					upload_success_handler : uploadSuccess,
					upload_complete_handler : uploadComplete,
	
					// Button Settings
					button_image_url : "<%=path%>/images/SmallSpyGlassWithTransperancy_17x18.png",
					button_placeholder_id : "spanButtonPlaceholder",
					button_width: 100,
					button_height: 18,
					button_text : '<span class="button">选择图片</span>',
					button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall { font-size: 10pt; }',
					button_text_top_padding: 0,
					button_text_left_padding: 18,
					button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
					button_cursor: SWFUpload.CURSOR.HAND,
					
					// Flash Settings
					flash_url : "<%=path%>/js/swfupload/swfupload.swf",
	
					custom_settings : {
						upload_target : "divFileProgressContainer"
					},
					// Debug Settings
					debug: false  //是否显示调试窗口
				});
			};
			function startUploadFile(){
				swfu.startUpload();
			}
		</script>
		<!-- extjs -->
		<script type="text/javascript">
//下拉款
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
  Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'side';
   parent.Ext.getCmp('addbutton').setHandler(function(){
   //Ext.Msg.alert('error',this.settings.upload_url);
   startUploadFile();
    });
  });
   </script>
   
   </head>
   <body>
   <form action="" method="post" id="form1" name="form1" >
   	<table width="100%" border="0" cellspacing="0" cellpadding="10" style="margin-top: 8px; color: #5d3b15" class="small2">
   		<tr>
			<td class="tdlee" colspan="5" align="left">
				<span id="spanButtonPlaceholder"></span>
		   		<div id="divFileProgressContainer" style="width:200;display:none;"></div>
		    	<div id="thumbnails">
					<table id="infoTable" border="0" width="100%" style="border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 2px;margin-top:8px;">
					</table>
				</div>
			</td>
		</tr>
   </table>
   </form>
   </body>
  </html>
