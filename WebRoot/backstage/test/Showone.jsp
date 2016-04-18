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

</head>

   <body>
   		 <div  class="chartContainer" id="show1">
	   			 <div id="chartContainer1">FusionCharts XT will load here!</div>
   			 </div>
   </body>
   
     <script type="text/javascript">

      var myChart = new FusionCharts( "MyFirstChart.swf", 
      "myChartId1", "800", "550", "0", "1" );
      myChart.setXMLUrl("Data.xml");
      myChart.render("chartContainer1");
	  
	  
    </script>

  </html>
