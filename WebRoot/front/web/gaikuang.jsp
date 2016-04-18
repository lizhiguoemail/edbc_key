<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>艺术考古数字博物馆-博物馆概况</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=path %>/css/front/web/css.css" rel="stylesheet" type="text/css" />
   <SCRIPT LANGUAGE="JavaScript" src="<%=path %>/js/front/web/index.js"></SCRIPT>

  </head>
  
  <body>

<jsp:include page="common/top.jsp"/> 

<!--搜索-->
<div class="containt">
  <div class="main">
    <div class="search">
      <form action="" method="post">
        <input type="text" name="textfield" />
        <input name="image" type="image" class="search_button" src="<%=path %>/images/front/web/images/search.gif" />
      </form>
    </div>
  </div>
</div>
<!--主体-->
<div class="containt">
	<div class="main">
	<!--框架左体部分-->
		<div class="left_side">
				<!--1.博物馆介绍-->
			<div class="nobg_frame notice_listframe">
					<div class="nobg_frametop notice_listtop">
						博物馆介绍
					</div>
					<div class="nobg_framecontent">
						<div class="notice_list">
							<li><img src="<%=path %>/images/front/web/images/dian.gif"><a href="#">博物馆简介</a></li>
							<li><img src="<%=path %>/images/front/web/images/dian.gif"><a href="#">博物馆特点</a></li>
							<li><img src="<%=path %>/images/front/web/images/dian.gif"><a href="#">博物馆介绍</a></li>
						</div>
					</div>
		  </div>


			<!--机构设置-->
<div class="bg_frame crfc">
				<div class="bg_frametop crfc_top">
					机构设置		
				</div>
				<div class="nobg_framecontent">
						<div class="notice_list">
							<li><img src="<%=path %>/images/front/web/images/dian.gif"><a href="#">支持机构.doc</a></li>
							<li><img src="<%=path %>/images/front/web/images/dian.gif"><a href="#">人员规划和部门设置</a></li>
						</div>
					</div>
		  </div>
		
	  </div>
		
	<!--框架右体部分-->
	<div class="right_side">
		<div class="list_kj">
				<div class="list_kjtop"><img src="<%=path %>/images/front/web/images/news.gif"></div>
				<div class="list_kjcontent">
						<div style="height: 30px;padding-top: 20px;" align="center">博物馆介绍——总说（简介）</div>
					<div class="list">
					<p style="line-height: 25px;font-family: 宋体;">
					浙江大学艺术与考古博物馆（英文名Zhejiang University Museum of Art and Archaeology, 英文简称ZUMAA），是一座正规的“教学博物馆”（teaching museum）。其计划的设立是基于浙江大学教学、研究的迫切需求。在长期的实践中，浙大深感对人文社科的教学、研究而言，“物”——或视觉材料——中蕴含的信息，与文字所记录的信息，是同等重要的。忽略“物”的研究，或忽略视觉材料之信息的发掘，人文社科的教学与研究，便如鸟之只有一翼，车之只有一轮。浙江大学艺术与考古博物馆的宗旨有四：
1）通过艺术品的实物教学，培养浙大师生“阅读”、使用视觉材料的专业技巧；
2）通过艺术品的收藏、借展，向浙大师生提供文科研究的实物材料；
3）通过学术展览，向浙大师生提供最新研究成果发布的新媒介，新平台；
4）通过艺术品陈列与学术特展，向杭州、浙江、全国、乃至全球公众提供视觉素养的教育服务。
浙江大学艺术与考古博物馆期望通过上述努力，培养浙大师生的视觉素养与批判性思维，为浙江大学“增进知识、推广知识”的总目标做出独有的贡献。
浙江大学艺术与考古博物馆项目是2009年初由校长办公会议动议设立的。为使博物馆不仅成为杭州、浙江、全国、以及海外人士进入浙大的首要门户，更成为全球一流的大学博物馆之一，浙江大学已邀请国际著名博物馆设计机构——纽约Gluckman & Mayner设计师事务所主持博物馆设计，并邀请美国大都会博物馆（The Metropolitan Museum of Art）、古根海姆博物馆（Gugenheim Museum）、普林斯顿大学博物馆（Princeton University Art Museum），与耶鲁大学博物馆（Yale University Art Gallery）参与博物馆运行的规划。与此同时，浙江大学还邀请了前美国大都会博物馆东方部顾问主席、普林斯顿大学艺术与考古系教授、美国哲学学会会员、著名美籍华人方闻（Wen C. Fong）教授与其团队加盟浙大，指导、主持并参与博物馆项目的规划、建设与运营。
浙江大学艺术与考古博物馆，将建于浙大紫金港校区，南临余杭河，西毗花蒋路，紧邻西溪湿地国家公园，占地约50亩，建筑面积25000平米，总造价2.2亿元。馆成之后，不仅是目前全国最大、最专业的大学博物馆，也将成为杭州市、浙江省最重要的文化资源之一及旅游观光资源之一。
</p>
													
					</div>
				</div>
		
		</div>
	
	</div>
	
	</div>
</div>


<div class="containt">
	<div class="bottom">
		<img src="<%=path %>/images/front/web/images/bottom.gif" border="0"  />
  </div>
</div>

</body>
</html>
