<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新闻 - ${jiasuTitle}</title>
<link rel="stylesheet" type="text/css" media="screen"  href="${static}/styles/jiasu/style.css" /> 
</head>
<body>
<!-- 内容 -->
<div id="wrap">
	<%@ include file="/commons/jiasu/jiasu_userPad.jsp" %>
    <ul id="menu">
    	<li style="width:380px; height:41px;background:url(${static}/styles/images/bg_nav_l.jpg) no-repeat;"></li>
    	<li>
        	<%@ include file="/commons/jiasu/menu.jsp" %>
   		</li>
        <li style="width:58px;height:41px;background:url(${static}/styles/images/bg_nav_r.jpg) no-repeat;"></li>
	</ul>
    <p class="middle_blank clear"></p>
	<div id="main">
    	<div id="m_top">
        	<div id="container">
            	<div class="leftside">
                	<%@ include file="/commons/jiasu/jiasu_download.jsp" %>
                </div>
                <div class="rightside">
                	<p class="r_title"><img src="${static}/styles/images/title_news.jpg" /></p>
                    <p class="bet"></p>
                    <div id="newsContent">
	                   <%@ include file="/WEB-INF/app/jiasu/ajaxGetNewsList.jsp" %>
                    </div>
                <div id="pageContent"></div>
                <p class="clear"></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function getNews(p){
	$.post("${domain}/jiasu/ajaxGetNewsList.do", {"p":p}, function(d){
		$("#newsContent").html(d);
	},'html');
}
</script>
<!-- END for 内容 -->
</body> 
</html> 