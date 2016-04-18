<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
function search()
{
  document.forms[0].submit();
}
</script>
<script type="text/javascript" src="<%=path %>/js/tongji.js"></script>

  	<div class="m3">
		<div class="ss">
		<form action="<%=path %>/front.do?methede=search" method="post">
		<input name="content" type="text" value="${content }" maxlength="17" style="width:225px;height: 14px;vertical-align: middle;border: 1px solid #756645;"/> 
		<a href="javascript:search();"><img src="<%=path %>/images/front/web/images/search.gif" style="vertical-align: middle;border: 0;" /></a>
		</form>
		</div>
	</div>
 	<div class="m4">
		<div class="fx">
			 <table align="left" ><tr><td>
		     <script type="text/javascript" charset="utf-8">
		(function(){
		  var _w = 86 , _h = 16;
		  var param = {
		    url:location.href,
		    type:'6',
		    count:'', /**是否显示分享数，1显示(可选)*/
		    appkey:'3877121700', /**您申请的应用appkey,显示分享来源(可选)*/
		    title:'', /**分享的文字内容(可选，默认为所在页面的title)*/
		    pic:'', /**分享图片的路径(可选)*/
		    ralateUid:'', /**关联用户的UID，分享微博会@该用户(可选)*/
			language:'zh_cn', /**设置语言，zh_cn|zh_tw(可选)*/
		    rnd:new Date().valueOf()
		  }
		  var temp = [];
		  for( var p in param ){
		    temp.push(p + '=' + encodeURIComponent( param[p] || '' ) )
		  }
		  document.write('<iframe allowTransparency="true" frameborder="0" scrolling="no" src="http://hits.sinajs.cn/A1/weiboshare.html?' + temp.join('&') + '" width="'+ _w+'" height="'+_h+'"></iframe>')
		})()
		</script>
	     </td>
	     <td>
    	 │  <a href="javascript:void(0)" style="text-decoration: none;font-size:14px;line-height: 25px;color:#000000;font-family: 黑体;">纪念品商店</a>
     </td></tr>
     </table>
		</div>
	</div> 
	<div class="m5">
		<div class="ms">
		  <font style="font-size: 14px;font-family: 黑体;">地址：杭州市余杭塘路866号浙江大学紫金港校区西三A教学楼</font>
		</div>
		<div class="ms">  
		 <font style="font-size: 14px;font-family: 黑体;">电话：</font><font style="font-size: 14px;font-family: arial;">（86571）88981179</font>
		 </div>
		 <div class="ms">
		 <font style="font-size: 14px;font-family: 黑体;">传真：</font><font style="font-size: 14px;font-family: arial;">（86571）88981149</font>
		 </div>
		 <div class="ms">
		 <font style="font-size: 14px;font-family: arial;">zumaa@zju.edu.cn</font>
		 </div>
	</div>