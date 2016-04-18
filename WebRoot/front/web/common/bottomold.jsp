<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
<link href="<%=path %>/css/front/web/main.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  <div class="foot">
   <ul>  
     <li style="padding-top: 38px;text-align: center;"> 
     <table align="center" width="170px;"><tr><td>
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
     │  <a href="javascript:void(0)" style="text-decoration: none;font-weight: normal;line-height: 25px;">纪念品商店</a>
     </td></tr>
     </table>
     </li>
     <li>
      zumaa@zju.edu.cn  杭州市余杭塘路866号浙江大学紫金港校区西三A教学楼<br/>电话:（86571）88981179│传真:（86571）88981149
     </li>
   </ul>
</div>
  </body>
</html>
