<%@ page language="java"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
     
  <head>
  <title>欢迎进入dbc管理后台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
  
<body>
<div align="center"><font style="font-size: 20px;font-weight: bold">EDBC后台管理系统介绍</font></div>

<p>
	&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family:lisu;">&nbsp;<span style="font-size:18.0px;">&nbsp;<span style="font-family:kaiti_gb2312;"><span style="color:#ff0000;">E</span><span><span><span><span style="color:#ff0000;">DBC后台管理系统(DBC的extjs版本)是一个为适合开发人员进行快速开发系统而建立的一个系统，不仅如此，还是专门为刚踏入用java进行系统开发的新手的参考系统，你可以在次系统的源代码基础上二次开发，节省了一些不必要的开发程序，你也可以利用此系统学校现在是如何使用三大框架来开发一个系统的，不管你是为了赚钱，还是为了学习技术，这个系统都会很适合您。还有很重要的一点，此系统无论是oracle，还是sql2000，还是mysql都是可以支持的。edbc后台系统一共有以下几个模块</span></span></span></span></span></span></span></p>
<p>
	<span style="font-family:lisu;"><span style="font-size:18.0px;"><span style="font-family:kaiti_gb2312;"><span><span><span><span style="color:#ff0000;">注意：EDBC比DBC系统技术含量更高，更加美观以及人性化，但是在执行效率上个人认为没有DBC高，这也可能是extjs不适合做前台的原因吧！所以如果您是一位对extjs不感兴趣的人，建议您选择DBC系统。</span></span></span></span></span></span></span></p>
<p>
	<strong><span style="color:#000000;">模块1：互动平台</span></strong></p>
<p>
	<span style="color:#38761d;"><span style="font-size:18.0px;"><span style="font-family:kaiti_gb2312;"><span>互动平台分为：</span><span>未读消息，已读消息，给管理员留言，发送消息，已发送四个小模块，类似于一个站内的邮件管理，非常适合此系统的用户之间的站内交流。下图为互动平台中的发送消息功能</span></span></span></span></p>
<p>
	<span style="color:#000000;"><img align="absMiddle" src="<%=path %>/images/help/msgext.JPG" /></span></p>
<p>
	<strong><span style="color:#000000;">模块2：用户管理</span></strong></p>
<p>
	<span style="font-size:18.0px;"><span style="color:#38761d;"><span style="font-family:kaiti_gb2312;"><span>拥有用户管理权限的用户，可对指定用户进行权限配置，角色配置，基本信息的修改，以及一些基本的增删改查的操作。</span></span></span></span></p>
<p>
	<strong><span style="color:#000000;"><img align="absMiddle" src="<%=path %>/images/help/userext.JPG" /></span></strong></p>
<p>
	<strong><span style="color:#000000;">模块3</span></strong><strong><span style="color:#000000;">日志管理</span></strong></p>
<p>
	<span style="font-size:18.0px;"><span style="font-family:kaiti_gb2312;"><span style="color:#38761d;">此功能是记录此系统的一些操作日志，具体内容不进行展开，看图即可知道其意思。</span></span></span></p>
<p>
	&nbsp;<img align="absMiddle" src="<%=path %>/images/help/logext.JPG" /></p>
<p>
	<strong><span style="color:#000000;">模块4 权限</span></strong><strong><span style="color:#000000;">管理</span></strong></p>
<p>
	<span style="font-family:kaiti_gb2312;"><span style="color:#38761d;"><span style="font-size:18.0px;">用户可为系统对应的模块增加指定的权限</span></span></span></p>
<p>
	<strong><span style="color:#000000;"><img align="absMiddle" src="<%=path %>/images/help/permit.JPG" style="margin:0.0px;width:750.0px;float:none;height:195.0px;" /></span></strong></p>
<p>
	&nbsp;</p>
<p>
	<strong><span style="color:#000000;">模块5 角色</span></strong><strong><span style="color:#000000;">管理</span></strong></p>
<p>
	<span style="font-size:18.0px;"><span style="font-family:kaiti_gb2312;"><span style="color:#38761d;">可添加，修改，删除用户，并对指定用户配置权限</span></span></span></p>
<p>
	<span style="color:#000000;"><img align="absMiddle" src="<%=path %>/images/help/roleext.JPG" /></span></p>
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>
<p>
	<strong><span style="color:#000000;">模块6 单位部门管理</span></strong></p>
<p>
	<span style="font-size:18.0px;"><span style="font-family:kaiti_gb2312;"><span style="color:#38761d;">此模块分单位管理，部门管理，职位管理，其中不同的职位可分配不同的系统权限，拥有该职位的用户也就同时拥有配置的权限。具体的细节就不展开细讲了。</span></span></span></p>
<p>
	<span style="color:#000000;"><img align="absMiddle" src="<%=path %>/images/help/companyext.JPG" /></span></p>
<p>
	<span style="color:#000000;"><strong><span style="color:#000000;">模块6 代码生成器</span></strong></span></p>
<p>
	<span style="color:#000000;"><span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:18.0px;"><span style="font-family:kaiti_gb2312;"><span style="color:#38761d;">是专门为本系统设计的代码生成器，您只要设计好你想要的生成数据库的表字段，系统可自动生成适合本系统需要的pojo类，dao类和dao接口类，form类，action类以及其它一些配置文件，生成好的文件复制到程序对应的地方后，您只需重启web服务器，对应的数据库表就会自动建立，您无需再建数据库表，另外，您在设计字段时，有一些字段是无需您填写的【id（主键），deletemark（删除标识），sortcode（排序码），createdate（创建日期）】，系统会自动生成的。</span></span></span></span></span></p>
<p>
	<span style="color:#000000;">&nbsp;<img align="absMiddle" src="<%=path %>/images/help/code.JPG" style="margin:0.0px;width:750.0px;float:none;height:279.0px;" /></span></p>
<p>
	&nbsp;</p>
<p>
	&nbsp;<img align="absMiddle" src="<%=path %>/images/help/code2.JPG" style="margin:0.0px;width:750.0px;float:none;height:95.0px;" /></p>
<p>
	&nbsp;</p>


</body>
</html>
