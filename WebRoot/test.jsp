<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
/**
 * 新浪微博mid与url互转实用工具
 * 作者: XiNGRZ (http://weibo.com/xingrz)
 */

var WeiboUtility = {};

/**
 * 62进制字典
 */
WeiboUtility.str62keys = [
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
];

/**
 * 62进制字典
 */
WeiboUtility.str62keys2 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

/**
 * 62进制值转换为10进制
 * @param {String} str62 62进制值
 * @return {String} 10进制值
 */
WeiboUtility.str62to10 = function(str62) {
	var i10 = 0;
	for (var i = 0; i < str62.length; i++)
	{
		var n = str62.length - i - 1;
		var s = str62.substr(i,i+1);
		i10 += WeiboUtility.str62keys2.indexOf(s) * Math.pow(62, n);
		alert(i10);
	}
	return i10;
};

/**
 * 10进制值转换为62进制
 * @param {String} int10 10进制值
 * @return {String} 62进制值
 */
WeiboUtility.int10to62 = function(int10) {
	var s62 = '';
	var r = 0;
	while (int10 != 0)
	{
		r = int10 % 62;
		s62 = WeiboUtility.str62keys[r] + s62;
		int10 = Math.floor(int10 / 62);
		alert(int10);
	}
	return s62;
};

/**
 * URL字符转换为mid
 * @param {String} url 微博URL字符，如 "wr4mOFqpbO"
 * @return {String} 微博mid，如 "201110410216293360"
 */
WeiboUtility.url2mid = function(url) {
	var mid = '';
	
	for (var i = url.length - 4; i > -4; i = i - 4)	//从最后往前以4字节为一组读取URL字符
	{
		var offset1 = i < 0 ? 0 : i;
		var offset2 = i + 4;
		var str = url.substring(offset1, offset2);
		
		str = WeiboUtility.str62to10(str);
		if (offset1 > 0)	//若不是第一组，则不足7位补0
		{
			while (str.length < 7)
			{
				str = '0' + str;
			}
		}
		
		mid = str + mid;
	}
	
	return mid;
};

/**
 * mid转换为URL字符
 * @param {String} mid 微博mid，如 "201110410216293360"
 * @return {String} 微博URL字符，如 "wr4mOFqpbO"
 */
WeiboUtility.mid2url = function(mid) {

	if (typeof(mid) != 'string') return false;	//mid数值较大，必须为字符串！
	
	var url = '';
	
	for (var i = mid.length - 7; i > -7; i = i - 7)	//从最后往前以7字节为一组读取mid
	{
		var offset1 = i < 0 ? 0 : i;
		var offset2 = i + 7;
		var num = mid.substring(offset1, offset2);
		num = WeiboUtility.int10to62(num);
		url = num + url;
	}
	
	return url;
};

WeiboUtility.sss=function(mid){
alert('dd');
return mid;
}
function goto()
{
   var midd=document.getElementById('midd');
   var uurl=document.getElementById('uurl');
   midd.value=WeiboUtility.url2mid(uurl.value);
}

function goto2()
{
   var midd=document.getElementById('midd');
   var uurl=document.getElementById('uurl');
   uurl.value=WeiboUtility.mid2url(midd.value);
}
</script>
  </head>
  
  <body>
    <input type="text" id="uurl" name="uurl">
    <input type="button" onclick="goto()" value="转化">
     <input type="button" onclick="goto2()" value="反转化">
    <input type="text" id="midd" name="mmid">
  </body>
</html>
