  <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>艺术考古数字博物馆</title>
<script type="text/javascript" src="<%=path %>/tjpzoom/tjpzoom.js"></script> 

<script type=text/javascript>
	
	  function small1(){
		   var height;
		   var width;
		   var beishu=document.getElementById("beishu").value;
		   var nojq=document.getElementById("nojq");
	       var jq=document.getElementById("jq");
	      var fangdajing=document.getElementById("fangdajing");
	      if(fangdajing.checked)
	      {
	      alert("开启放大镜状态下无法放大缩小图片");
	      return;
	      }
	             height=document.getElementById("images2").height;
				 width=document.getElementById("images2").width;
				document.getElementById("images2").height=height/beishu
				document.getElementById("images2").width=width/beishu
			}
			
			function big1(){
			 var height;
		   var width;
		   var nojq=document.getElementById("nojq");
	       var jq=document.getElementById("jq");
			var beishu=document.getElementById("beishu").value;
			var fangdajing=document.getElementById("fangdajing");
			if(fangdajing.checked)
	      {
	      alert("开启放大镜状态下无法放大缩小图片");
	      return;
	      }
	             height=document.getElementById("images2").height;
				 width=document.getElementById("images2").width;
				document.getElementById("images2").height=height*beishu
				document.getElementById("images2").width=width*beishu
			}
			
  function tiaozhuan(s){
document.forms[0].action=s;
document.forms[0].submit();
	}
	
		function qidong()
	{
	var fangdajing=document.getElementById("fangdajing");
	var nojq=document.getElementById("nojq");
	var jq=document.getElementById("jq");
	if(fangdajing.checked)
	{
	fangdajing.value="关闭放大镜";
	jq.style.display="block";
	nojq.style.display="none";
	
	}
	else
	{
	fangdajing.value="启动放大镜";
	nojq.style.display="block";
	jq.style.display="none";
	}
	}
	function showpic(url){
	document.getElementById("images1").src=url;
	document.getElementById("images2").src=url;
	
	var fangdajing=document.getElementById("fangdajing").checked=false;;
	var nojq=document.getElementById("nojq");
	var jq=document.getElementById("jq");
	fangdajing.value="启动放大镜";
	nojq.style.display="block";
	jq.style.display="none";
	}
	</script>

</head>

<body style="background-color: #313131;">
<form action="" name="myform" method="post">
<input type="hidden" id="beishu" name="beishu" value="1.5"/>
<div style=" height:157px; margin:0; padding:0;">
<div class="logo"></div>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr><td style="width: 90%;">
      <table width="34%" border="0" cellspacing="5" cellpadding="0" align="right" style="padding-top:10px;">
      <tr>
        <td width="32%" align="right"><a href="javascript:big1();"><img src="<%=path %>/images/front/web/images/bigp.gif" border="0"/></a></td>
        <td width="7%" align="center"><a  href="javascript:small1();"><img src="<%=path %>/images/front/web/images/smallp.gif" border="0"/></a></td>
        <td width="61%">
          <label>
            <input id="fangdajing" type="checkbox"   onclick="qidong()" />
          </label>
       
        <span style="color:#FFF">局部放大镜</span>
       
       </td>
      </tr>
</table></td></tr></table>
        <div id="nojq" style="padding-left: 300px;">
         <p style="color: #ffffff;">&nbsp;</p>
		<img border="0"  id="images2" name="images2"  src="<%=path %>/upload/art_goods/${art_good.pic }"  width="600px" style="min-height: 50px;min-width: 50px;"  />
		</div>
		  <div style="display: none;padding-left: 300px;" id="jq">
		  <p style="color: #ffffff;">提示：按住鼠标左键往左右拖可调节放大镜面积大小，按住鼠标左键上下拖可调节放大镜放大倍数。</p>
		<img border="0"  id="images1" name="images1"  src="<%=path %>/upload/art_goods/${art_good.pic }"  width="600px" style="min-height: 50px;min-width: 50px;"  onmouseover="TJPzoom(this);" />
		</div>
    <div>&nbsp;</div>
</form>
</body>
</html>
 