<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML><HEAD>
<link rel="stylesheet" href="<%=path %>/css/front/bbs/manage/css.css" type="text/css">

<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY bgColor=#d6dff7 leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD class=txlHeaderBackgroundAlternate id=TableTitleLink vAlign=center width="43%" height=23>→ 欢迎进入论坛管理中心</TD>
    <TD class=txlHeaderBackgroundAlternate id=TableTitleLink vAlign=center width="21%">&nbsp;</TD>
    <TD class=txlHeaderBackgroundAlternate id=TableTitleLink vAlign=center align=right width="36%"><A href="<%=path %>/bbs.do?methede=toBbs" target="_parent">返回主窗口</A></TD>
  </TR></TBODY></TABLE></BODY></HTML>
