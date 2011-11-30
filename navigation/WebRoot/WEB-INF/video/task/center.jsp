<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>任务大厅 - ${requestScope.user.name}</title>
<style type="text/css">
#top {
	margin: 20px auto 50px;
	padding: 15px 15px 20px;
	width: 959px;
	border: 1px solid #EDEDED;
	border-radius: 3px;
}
#top h1 {
	margin-bottom: 20px;
	font-size: 14px;
	color: #424542;
	font-family: "Microsoft Yahei";
}
#top h1 span {
	padding-left: 10px;
	font-size: 12px;
	color: #CCC;
	font-weight: normal;
}
#top .list {
}
#top ul.none {
	border-bottom: none;
}
#top .list li {
	margin-bottom: 31px;
	width: 180px;
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
	padding-left: 8px;
	width: 100px;
	_width: 95px;
	overflow:hidden;
}
#top .list li dd .name {
	margin-bottom: 7px;
	color: #FF9000;
	display: block;
}
 #top .list li dd span {
 	padding: 4px 0 9px;
 	padding: 7px 0 10px\9;
 	*padding: 5px 0 8px;
 	display: block;
	white-space:nowrap;
}
#top .list li dd input {
	border: none;
	width: 60px;
	font-size: 12px;
	cursor: pointer;
	line-height: 20px;
	background-color: #EFEFEF;
	border-radius: 2px;
}
#top .list li dd input {
	margin-right: 5px;
	vertical-align: -2px;
}
#top .inner {
	clear: both;
}
#top .tabUl {
	width: 626px;
	z-index: 10;
	text-align: left;
	position: relative;
}
#top .tabUl li {
	margin-right: 10px;
	padding: 0 10px;
	float: left;
	line-height: 26px;
	font-size: 12px;
	display: inline;
	border: 1px solid #E1E1E1;
	cursor: pointer;
	background-color: #FFF;
	border-radius: 4px 4px 0 0;
	font-family: "Microsoft Yahei";
}
#top .tabUl .li01 {
	border-bottom: 1px solid #FFF;
}
#top .comBox {
	margin: -1px 0 15px 0;
    padding: 20px 20px 0;
	display: none;
    z-index: 1;
	border: 1px solid #E1E1E1;
}
#top .showdiv_1 {
	display: block;
}
#top .page {margin: 0 30px 0;}
#top .page li {margin-left: 5px;float:right;}
#top .page li a {padding: 2px 6px;text-decoration: none;}
#top .page li a.on,#top .page li a:hover {color:#FFF;background-color:#FF9000;}

img {display:block;}
</style>
<script type="text/javascript">
$(function(){
	$('#navbar a.lit').removeClass('lit');
	$('#navbar #nv_task').addClass('lit');
	$('#navbar #nv_task').attr('target','_self');
});
function showdiv(type){
	$('[class^="showdiv_"]').hide();
	$('.showdiv_'+type).show();
	$('.tabUl li').css('border-bottom','');
	$('.tabUl .li01').css('border-bottom','1px solid #E1E1E1');
	$('.tabUl .li0'+type).css('border-bottom','1px solid #FFF');
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="top" class="clearfix">
<form action="" method="get">
<div class="topBox">
	<h1>任务大厅<span>点发布人头像查看任务详情</span></h1>
</div>
<div class="inner clearfix">
<ul class="tabUl clearfix">
	<li onclick="javascript:showdiv(1);" class="li01"> 全部任务 </li>
	<li onclick="javascript:showdiv(2);" class="li02"> 兵王任务 </li>
</ul>
<div class="showdiv_1 comBox">		
<ul class="list clearfix">
	<s:iterator value="#request.taskList" status="status">
		<li>
			<dl>
				<dt><a href="${domain }/task/detail.do?id=${id }" target="_blank"><img src="${domain}/upload/avatar/${userId}_1.jpg" onerror="this.src='${domain }/images/default.jpg';" alt="" /></a></dt>
				<dd>
					<a href="${domain }/task/detail.do?id=${id }" target="_blank" class="name">${userName }</a>
					<span class="price">金额：${offerPrice }</span>
					<input onclick="location.href='${domain }/task/detail.do?id=${id }';" type="button" value="任务详情" />
				</dd>
			</dl>
		</li>
	</s:iterator>
</ul>
</div>
<div class="showdiv_2 comBox">
<ul class="list clearfix">
	<s:iterator value="#request.taskList" status="status">
		<li>
			<dl>
				<dt><a href="${domain }/task/detail.do?id=${id }" target="_blank"><img src="${domain}/upload/avatar/${userId}_1.jpg" onerror="this.src='${domain }/images/default.jpg';" alt="" /></a></dt>
				<dd>
					<a href="${domain }/task/detail.do?id=${id }" target="_blank" class="name">${userName }</a>
					<span class="price">金额：${offerPrice }</span>
					<input onclick="location.href='${domain }/task/detail.do?id=${id }';" type="button" value="任务详情" />
				</dd>
			</dl>
		</li>
	</s:iterator>
</ul>
</div>
<ul class="page clearfix">
		<li><a href="#">下一页</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#" class="on">1</a></li>		
</ul>	
</div>	
</form>
</div>
<!-- END for 内容 -->

<script type="text/javascript">
</script>
</body>
</html>