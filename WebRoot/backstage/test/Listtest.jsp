<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>Test</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
 
<script type="text/javascript" src="<%=path %>/backstage/test/FusionCharts.js"></script>
<style type="text/css">
.main{
	width:700px;
}
.main .xz{
width:800px;
height:50px;
}
.main .xz .ck{
float:left;
}
.chartContainer{
float:left;
widht:200px;
height:250px;
overflow:hidden;
margin-left:20px;
}
</style>
<script type="text/javascript">
function noshow(a){
	var d=document.getElementById("show"+a.value);
	if(a.checked){
		d.style.display="none";
	}else{
		d.style.display="block";
	}
	
}

function show(a){
	alert(a);
}
</script>
<script type="text/javascript">
		$(document).ready(function() {
			/*
			*   Examples - images
			*/

			$("a#example1").fancybox({
				'titleShow'		: false
			});

			$("a#example2").fancybox({
				'titleShow'		: false,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'
			});

			$("a#example3").fancybox({
				'titleShow'		: false,
				'transitionIn'	: 'none',
				'transitionOut'	: 'none'
			});

			$("a#example4").fancybox();

			$("a#example5").fancybox({
				'titlePosition'	: 'inside'
			});

			$("a#example6").fancybox({
				'titlePosition'	: 'over'
			});

			$("a[rel=example_group]").fancybox({
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'titlePosition' 	: 'over',
				'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
					return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
				}
			});

			/*
			*   Examples - various
			*/

			$("#various1").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});

			$("#various2").fancybox();

			$("#various3").fancybox({
				'width'				: '75%',
				'height'			: '75%',
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'type'				: 'iframe'
			});

			$("#various4").fancybox({
				'padding'			: 0,
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
		});
	</script>
	
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=path %>/backstage/test/fancybox/jquery.mousewheel-3.0.2.pack.js"></script>
	<script type="text/javascript" src="<%=path %>/backstage/test/fancybox/jquery.fancybox-1.3.1.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/backstage/test/fancybox/jquery.fancybox-1.3.1.css" media="screen" />
 	<link rel="stylesheet" href="<%=path %>/backstage/test/style.css" />
 	<script type="text/javascript">
		$(document).ready(function() {
			/*
			*   Examples - images
			*/

			$("a#example1").fancybox({
				'titleShow'		: false
			});

			$("a#example2").fancybox({
				'titleShow'		: false,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'
			});

			$("a#example3").fancybox({
				'titleShow'		: false,
				'transitionIn'	: 'none',
				'transitionOut'	: 'none'
			});

			$("a#example4").fancybox();

			$("a#example5").fancybox({
				'titlePosition'	: 'inside'
			});

			$("a#example6").fancybox({
				'titlePosition'	: 'over'
			});

			$("a[rel=example_group]").fancybox({
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'titlePosition' 	: 'over',
				'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
					return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
				}
			});

			/*
			*   Examples - various
			*/

			$(".various1").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});

			$(".various2").fancybox();

			$(".various3").fancybox({
				'width'				: '70%',
				'height'			: '90%',
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'type'				: 'iframe'
			});

			$(".various4").fancybox({
				'padding'			: 0,
				'autoScale'			: false,
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});
		});
	</script>
</head>

   <body>
   		<div class="main">
   			<div class="xz">
   				<div class="ck"><input type="checkbox" id="1" value="1" onclick="noshow(this)"/>隐藏1号</div>
   				<div class="ck"><input type="checkbox" id="2" value="2" onclick="noshow(this)"/>隐藏2号</div>
   				<div class="ck"><input type="checkbox" id="3" value="3" onclick="noshow(this)"/>隐藏3号</div>
   			</div>
   			 <div  class="chartContainer" id="show1">
	   			 <div id="chartContainer1">FusionCharts XT will load here!</div><!-- flash放次位置 -->
	   			 <div align="center"><a class="various3" href="<%=path %>/backstage/test/Showone.jsp" style="padding-top:5px;text-decoration: none;color:#000000;">查看1号详情</a></div>
   			 </div>
   			  <div  class="chartContainer" id="show2">
	   			 <div id="chartContainer2">FusionCharts XT will load here!</div>
	   			 <div align="center"><a class="various3" href="<%=path %>/backstage/test/Showone.jsp" style="padding-top:5px;text-decoration: none;color:#000000;">查看2号详情</a></div>
   			 </div>
   			  <div  class="chartContainer" id="show3">
	   			 <div id="chartContainer3">FusionCharts XT will load here!</div>
	   			 <div align="center"><a class="various3" href="<%=path %>/backstage/test/Showone.jsp" style="padding-top:5px;text-decoration: none;color:#000000;">查看3号详情</a></div>
   			 </div>
   		</div>
   </body>
   
     <script type="text/javascript">
      var myChart1 = new FusionCharts( "MyFirstChart.swf", 
      "myChartId1", "200", "200", "0", "1" );
       myChart1.setXMLData( "" );		   
     // myChart.setXMLUrl("Data.xml");
      myChart1.render("chartContainer1");
	  
	  var myChart2 = new FusionCharts( "MyFirstChart.swf", 
      "myChartId2", "150", "120", "0", "1" );
      myChart2.setXMLUrl("Data2.xml");
      myChart2.render("chartContainer2");

	  var myChart3 = new FusionCharts( "MyFirstChart.swf", 
      "myChartId3", "150", "150", "0", "1" );
      myChart3.setXMLUrl("Data3.xml");
      myChart3.render("chartContainer3");
	  
    </script>

  </html>
