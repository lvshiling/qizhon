<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页 - ${siteTitle}</title>
<style type="text/css">
#topContainer {
	text-align: left;
	margin: 20px auto 20px;
	padding: 10px 20px;
	width: 946px;
	border: 1px solid #EAEAEA;
}
#topContainer .video {
	margin-right: 20px;
	width: 265px;
	float: left;
}
#topContainer .title {
	margin-bottom: 5px;
	font-size: 14px;
	color: #424542;
	font-family: "Microsoft Yahei";
}
#topContainer .video a {
	padding-bottom: 10px;
	display: block;
	color: #E37D00;
	text-decoration: none;
	border: 1px solid #EAEAEA;
	position: relative;
}
 #topContainer .video a .bigImg {
	height: 161px;
	display: block;
}
#topContainer .video a span {
	padding: 6px 10px 0 10px;
	display: block;
}
#topContainer .video a .icon {
	margin: 0 20px;
	width: 70px;
	height: 70px;
	display: inline-block;
	vertical-align: top;
	background: url(${domain}/images/video/slide/icon.png) no-repeat left top;
	position: absolute;
	top: 48px;
	left: 70px;
}
#topContainer .video a span .name {
	margin-bottom: 8px;
	font-size: 14px;
	display: block;
}
#topContainer .video a span .grade {
	font-weight: normal;
}
#topContainer .video a span .grade img {
	margin-left: 5px;
	vertical-align: middle;
}
#topContainer .video a span .number {
	float: right;
}
#topContainer .news {
	padding: 10px 0;
	width: 360px;
	float: right;
	border: 1px solid #EAEAEA;
}
#topContainer .news .title {
	margin: 0 0 8px 10px;
	padding: 0 0 0 20px;
	background: url(${domain }/images/video/slide/news.gif) no-repeat left 3px;
}
#marqueebox {
	font-family: Verdana, Arial, Helvetica,"Lucida Grande", "宋体", sans-serif;
	height: 198px;
	overflow: hidden;
}
#topContainer .news ul {
	margin: 0 15px;
	height: 260px;
}
#topContainer .news ul li {
	margin-bottom: 4px;
	padding: 0 0 3px 15px;
	color: #424542;
	line-height: 1.4;
	background: url(${domain }/images/video/slide/list.gif) no-repeat left 5px;
	border-bottom: 1px dashed #D6D6D6;
}
#topContainer .news ul li a {
	color: #E37D00;
}
</style>
</head>
<body>
<!-- 内容 -->
<div id="index">
<div id="content">
	<div id="topContainer" class="clearfix">
		<div class="video">
			<p class="title">推荐直播</p>
			<a href="${domain}/${requestScope.recUser.room.roomNo}">
				<img src="${requestScope.recUser.poster}" onerror="this.src='${domain}/images/poster.jpg';" width="263" height="161" alt="" class="bigImg" />
				<span class="icon"></span>
				<span class="clearfix">
					<strong class="name">${requestScope.recUser.name}</strong>
					<strong class="number">在线人数：${requestScope.recUser.room.occupantsCount}</strong>
					<strong class="grade">等级:<img src="${domain }/images/video/diamond_1.png" alt="" /><img src="${domain }/images/video/diamond_1.png" alt="" /><img src="${domain }/images/video/diamond_1.png" alt="" /></strong>
				</span>
			</a>
		</div>
		<div class="video">
			<p class="title">最热"求包养"美眉</p>
			<a href="${domain}/task/center.do">
				<img src="${domain }/images/video/slide/photo02.jpg" alt="" class="bigImg" />
				<span class="clearfix">
					<strong class="name">☜开芯格格☞</strong>
					<strong class="number">有89人包养她</strong>
					<strong class="grade">陪玩游戏名: 兵王</strong>
				</span>
			</a>
		</div>
		<div class="news">
			<p class="title">最新动态</p>
			<div id="marqueebox">
				<ul>
					<s:iterator value="#request.publicUserNews" status="status">
						<s:if test="type==3">
							<li><a href="${domain}/user/index.do?uid=${userId}" target="_blank">${userName} </a>${content}</li>
						</s:if>
						<s:elseif test="type==5">
							<li><a href="${domain}/user/index.do?uid=${userId}" target="_blank">${userName} </a>关注了 <a href="${domain}/user/index.do?uid=${refUid}" target="_blank">${content}</a></li>
						</s:elseif>
						<s:elseif test="type==7">
							<li><a href="${domain}/user/index.do?uid=${userId}" target="_blank">${userName} </a>发布了新任务 <a href="${domain}/task/detail.do?id=${refId}" target="_blank">${content}</a></li>
						</s:elseif>
						<s:elseif test="type==8">
							<li><a href="${domain}/user/index.do?uid=${userId}" target="_blank">${userName} </a>接收了任务 <a href="${domain}/task/detail.do?id=${refId}" target="_blank">${content}</a></li>
						</s:elseif>
						<s:elseif test="type==9">
							<li><a href="${domain}/user/index.do?uid=${userId}" target="_blank">${userName} </a>中标了任务 <a href="${domain}/task/detail.do?id=${refId}" target="_blank">${content}</a></li>
						</s:elseif>
					</s:iterator>
				</ul>
			</div>
		</div>
	</div>
	<div id="mainContainer">
		<div id="leftSider">
			<div class="showBoxTop"></div>
			<div class="showBox">
				<div class="showBoxTitle">
					<span class="liveTitle">正在进行的直播</span>
					<a href="" class="morespan"></a>
				</div>
				<div class="showBoxSep">
					<span class="showBoxline1"></span><span class="showBoxline2"></span>
				</div>
				<div class="showBoxMain">
					<s:iterator value="#request.liveList" status="status">
					<div class="boxOuter">
						<div class="boxInner">
							<a class="boxImg" href="${domain}/${room.roomNo }"><img src="${poster}" width="124" height="74" onerror="this.src='${domain}/images/poster.jpg';" /></a>
							<div class="boxName"><img src="${domain }/images/video/diamond_1.png" /><a href="${domain}/${room.roomNo }">${name}</a></div>
						</div>
						<div class="boxTitle">明星等级：<s:if test="userCredit!=null"><script>document.write(getStarGradeText(${userCredit.starGrade}));</script></s:if><br/>魅力值：${userCredit.visits}</div>
					</div>
					</s:iterator>
				</div>
			</div>
			<div class="showboxgap"></div>
			<div class="showBoxTop"></div>
			<div class="showBox">
				<div class="showBoxTitle">
					<span class="photoTitle">会员照片</span>
					<a href="" class="morespan"></a>
				</div>
				<div class="showBoxSep">
					<span class="showBoxline3"></span><span class="showBoxline4"></span>
				</div>
				<div class="showBoxMain">
					<s:iterator value="#request.photos" status="status">
						<s:set name="p" />
						<div class="boxOuter">
							<div class="boxInner">
								<a class="boxImg" href=""><img src="${domain }/images/video/random/${p[0]}.jpg" /></a>
								<div class="boxName"><img src="${domain }/images/video/diamond_1.png" /><a href="">${p[1]}</a></div>
							</div>
							<div class="boxTitle"><span class="fleft">上海徐汇</span><span class="fright">点击:${p[0]*100-p[0]}</span></div>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
		<div id="rightSider">
			<div class="listBox">
				<div class="listBoxTop">
					<span class="listBoxTitle">明星排行榜</span>
				</div>
				<s:iterator value="#request.starList" status="status">
					<s:if test="#status.odd">
						<div class="rowOdd">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/index.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
					<s:if test="#status.even">
						<div class="rowEven">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/index.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
				</s:iterator>
			</div>
			<div class="listBox">
				<div class="listBoxTop">
					<span class="listBoxTitle">富豪排行榜</span>
				</div>
				<s:iterator value="#request.richList" status="status">
					<s:if test="#status.odd">
						<div class="rowOdd">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/index.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
					<s:if test="#status.even">
						<div class="rowEven">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/index.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
				</s:iterator>
			</div>
			<div class="listBox">
				<div class="listBoxTop">
					<span class="listBoxTitle">人气排行榜</span>
				</div>
				<s:iterator value="#request.popList" status="status">
					<s:if test="#status.odd">
						<div class="rowOdd">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/index.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
					<s:if test="#status.even">
						<div class="rowEven">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/index.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
				</s:iterator>
			</div>
		</div>
	</div>
</div>
</div>
<script>
var timeFlag = '${requestScope.timeFlag}';
document.onkeydown = function(evt){
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	if(key == 13){
		var act = document.activeElement.id;
		if(act=="nav_password" || act=="nav_email"){
			checkLogin();
			event.returnValue = false;
		}
	}
};
$(function(){
	setInterval("getPublicNews();",15000);
});
function getPublicNews(){
	$.post("${domain}/user/ajaxPublicUserNewsApi.do?", {"_":timeFlag}, function(d){
		if(d['status'] == 1){
			var len = d['values'].length;
			for(var i=0; i<len; i++){
				var news = d['values'][i];
				var txt = '';
				if(news['type']==3){
					txt = '<li><a href="${domain}/user/index.do?uid='+news['userId']+'" target="_blank">'+news['userName']+'</a>'+news['content']+'</li>';
				}else if(news['type']==5){
					txt = '<li><a href="${domain}/user/index.do?uid='+news['userId']+'" target="_blank">'+news['userName']+'</a>关注了<a href="${domain}/user/index.do?uid='+news['refUid']+'" target="_blank">'+news['content']+'</a></li>';
				}else if(news['type']==7){
					txt = '<li><a href="${domain}/user/index.do?uid='+news['userId']+'" target="_blank">'+news['userName']+'</a>发布了1个<a href="${domain}/task/detail.do?id='+news['refId']+'" target="_blank">新任务</a></li>';
				}else if(news['type']==8){
					txt = '<li><a href="${domain}/user/index.do?uid='+news['userId']+'" target="_blank">'+news['userName']+'</a>接受了1个<a href="${domain}/task/detail.do?id='+news['refId']+'" target="_blank">任务</a></li>';
				}else if(news['type']==9){
					txt = '<li><a href="${domain}/user/index.do?uid='+news['userId']+'" target="_blank">'+news['userName']+'</a>中标了1个<a href="${domain}/task/detail.do?id='+news['refId']+'" target="_blank">任务</a></li>';
				}
				if(txt!=='') appendNews(txt);
			}
			var flag = d['message'];
			if(flag!=='') timeFlag = flag;
		}
	},'json');
}
function appendNews(txt) {
	var box = $('#marqueebox');
	var boxUl = $("#marqueebox ul");
	$(txt).hide().prependTo(boxUl).show('slow');
	var lastElem = boxUl.find("li:last");
	var elemTop = lastElem.offset().top;
	var boxBtm = box.offset().top + box.height();
	if(elemTop > boxBtm){
		lastElem.remove();
	}
}
</script>
<!-- END for 内容 -->
</body>
</html>