<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页 - ${jiasuTitle}</title>
<link href="${static}/styles/jiasu/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 内容 -->
<div id="wrap">
	<%@ include file="/commons/jiasu/jiasu_userPad.jsp" %>
    <ul id="menu">
    	<li style="width:380px; height:41px;background:url(${static}/styles/images/index/bg_navl.jpg) no-repeat;"></li>
    	<li>
        	<%@ include file="/commons/jiasu/menu.jsp" %>
   		</li>
        <li style="width:58px;height:41px;background:url(${static}/styles/images/index/bg_navr.jpg) no-repeat;"></li>
	</ul>
	<div id="banner" class="clear">
    	<ul>
        	<li><a class="reg" href="${domain }/jiasu/register.do" >注册账号</a></li>
            <li><a class="down" href="${domain }/jiasu/down.do" target="_blank">立即下载</a></li>
       	</ul>	
    </div>
	<div id="msg">
		<ul id="download">
        	<li class="more"><a href="${domain }/jiasu/games.do">更多</a></li>
            <li class="logo"><a target="_blank" href="http://zt2.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_01.jpg" alt="征途2"/></a></li>
            <li class="logo"><a target="_blank" href="http://els.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_02.jpg" alt="艾尔之光"/></a></li>
            <li class="logo"><a target="_blank" href="http://zt.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_05.jpg" alt="征途"/></a></li>
            <li class="logo"><a target="_blank" href="http://xt.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_04.jpg" alt="仙途"/></a></li>
            <li class="logo"><a target="_blank" href="http://zthj.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_10.jpg" alt="征途怀旧版"/></a></li>
            <li class="logo"><a target="_blank" href="http://allods.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_07.jpg" alt="巫师之怒"/></a></li>
            <li class="logo"><a target="_blank" href="http://dudu.ztgame.com/"><img src="${static}/styles/images/index/logo/dudu.jpg" alt="嘟嘟"/></a></li>
            <li class="logo"><a target="_blank" href="http://kok3.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_09.jpg" alt="万王之王3"/></a></li>
            <li class="logo"><a target="_blank" href="http://ls.ztgame.com/"><img src="${static}/styles/images/index/logo/logo_11.jpg" alt="征途绿色版"/></li>
       	</ul>
        <ul id="news">
        	<li class="more"><a href="${domain }/jiasu/news.do">更多</a></li>
        	<s:iterator value="#request.newsList">
	            <li class="list">
	            	<span class="date"><s:date name="addTime" format="[MM/dd]"/></span>
	            	<a href="${domain }/jiasu/newsDetail.do?targetId=${id }" target="_blank" >${title }</a>
	            </li>
        	</s:iterator>
       	</ul>
	</div>
	<div id="main">
    	<div class="m_top">
        	<div class="m_bot">
            	<p>趣乐加速器是一款具有卓越专业表现力的网络加速软件。通过动态路由调整、测速和数据中转等技术进行下载请求重定向，同时实现带宽扩容和应用加速两大提速体验！帮助您突破电信、网通、移动、联通、教育网、铁通、有线通和小区宽带之间的互联瓶颈，使您畅快淋漓地享受上网乐趣，不会再因网络延时大而抓狂！颠覆了过去那些插件过多、使用复杂、加速效果不透明的传统加速器，“趣乐加速器”以一键加速的简洁操作、绿色环保强大功能算得上是同类产品中的明星！从你下载安装的第一秒开始，就将为你带来前所未有的网络体验。 </p>
            </div>
        </div>    
	</div>
</div>
<!-- END for 内容 -->
</body>
</html>