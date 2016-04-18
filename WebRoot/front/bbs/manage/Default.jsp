<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${bbs_params.bbs_name }-管理中心</title>
</head>
<frameset rows="*" cols="180,*" frameborder="no" border="0" framespacing="0">
  <frame src="left.jsp" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame"  />
  <frameset rows="50,*" frameborder="no" border="0" framespacing="0">
    <frame src="head.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
    <frame src="list.jsp" name="mainFrame" id="mainFrame"  />
  </frameset>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>