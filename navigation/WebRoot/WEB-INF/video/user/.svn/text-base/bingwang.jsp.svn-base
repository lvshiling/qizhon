<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>兵王选美大赛</title>
<style type="text/css">
#top {
	margin: 20px auto 20px;
	padding: 15px 15px 20px;
	width: 959px;
	border: 2px solid #EDEDED;
	border-radius: 3px;
}
#top h1 {
	margin-bottom: 20px;
	font-size: 14px;
	color: #424542;
	font-family: "Microsoft Yahei";
}
#top .list {
	background: url(${domain }/images/video/top/ul_bg.gif) repeat;
}
#top ul.none {
	border-bottom: none;
}
#top .list li {
	margin-bottom: 31px;
	width: 190px;
	float: left;
}
#top .list li dt {
	width: 72px;
	float: left;
}

#top .list li dt img {
	width: 72px;
	height: 72px;
	border-radius: 3px;
}
#top .list li dd {
	padding-left: 80px;
}
#top .list li dd .name {
	margin-bottom: 40px;
	color: #FF9000;
	display: block;
}

#top .page {margin: 0 30px 0;}
#top .page li {margin-left: 5px;float:right;}
#top .page li a {padding: 2px 6px;text-decoration: none;}
#top .page li a.on,#top .page li a:hover {color:#FFF;background-color:#FF9000;}

img {display:block;}
</style>
</head>
<body>
<!-- 内容 -->
<div id="top" class="clearfix">
<h1>兵王选美大赛</h1>
<ul class="list clearfix">
	<s:iterator value="#request.userList" status="status">
		<li>
			<dl>
				<dt><a href="${domain}/user/score.do?uid=${id}" title="给她打分"><img src="${icon1}" onerror="this.src='${domain}/images/default.jpg';" alt="" /></a></dt>
				<dd>
					<a href="${domain}/user/index.do?uid=${id}" title="进她的主页" class="name">${name}</a>
					<a href="${domain}/user/score.do?uid=${id}" title="给她打分">网友评分:${userCredit.score}</a>
				</dd>
			</dl>
		</li>
	</s:iterator>
</ul>
<!--
<ul class="page clearfix">
		<li><a href="#">下一页</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#" class="on">1</a></li>		
</ul>
-->
</div>
<script type="text/javascript">
$(function(){
	$('#navbar a.lit').removeClass('lit');
	$('#navbar #nv_contest').addClass('lit');
	$('#navbar #nv_contest').attr('target','_self');
});
</script>
<!-- END for 内容 -->
</body>
</html>
