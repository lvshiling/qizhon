<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页 - ${siteTitle}</title>
<script type="text/javascript" src="${static}/js/lib/easySlider1.7.js"></script>
<style type="text/css">
</style>
</head>
<body>
<!-- 内容 -->
<div id="index">
<div id="content">
	<div id="loginBar">
		<form name="pageLoginForm">
			<span>用户名：<input type="text" id="pg_email" name="user.mail" />密 码：<input type="password" id="pg_password" name="user.password" /></span>
			<a id="loginlnk" href="javascript:checkPageLogin();void(0);"><img src="${domain }/images/video/login_button.png" /></a><a href="javascript:register();void(0);"><img src="${domain }/images/video/reg_button.png" /></a>
		</form>
	</div>
	<div id="topContainer">
		<div id="slider">
			<ul>				
				<li><a href="/"><img src="${domain }/images/video/slide/banner1.gif" width="734" height="243" /></a></li>
				<li><a href="/"><img src="${domain }/images/video/slide/banner2.gif" width="734" height="243" /></a></li>
				<li><a href="/"><img src="${domain }/images/video/slide/banner3.gif" width="734" height="243" /></a></li>
				<li><a href="/"><img src="${domain }/images/video/slide/banner1.gif" width="734" height="243" /></a></li>
			</ul>
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
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/id.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
					<s:if test="#status.even">
						<div class="rowEven">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/id.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
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
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/id.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
					<s:if test="#status.even">
						<div class="rowEven">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/id.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
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
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/id.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
							<span class="fright"><img src="${domain }/images/video/arrow_up.png" class="incrIcon" /></span>
						</div>
					</s:if>
					<s:if test="#status.even">
						<div class="rowEven">
							<span class="fleft"><img src="${domain }/images/video/rank_<s:property value='#status.count'/>.png" class="rankIcon"/><a href="${domain }/user/id.do?uid=${user.id }">${user.name }</a><img src="${domain }/images/video/diamond_1.png" class="medalIcon" /></span>
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
document.onkeydown = function(evt){
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	if(key == 13){
		var act = document.activeElement.id;
		if(act=="pg_password" || act=="pg_email"){
			document.getElementById("loginlnk").click();
			event.returnValue = false;
		}else if(act=="nav_password" || act=="nav_email"){
			checkLogin();
			event.returnValue = false;
		}
	}
};
$(document).ready(function(){	
	$("#slider").easySlider({
		auto: true,
		continuous: true,
		numeric: true,
		controlsBefore: '<div id="slideControl">',
		controlsAfter: '</div>',
		speed: 500
	});
	$('#controls li').mouseover(function(){
		$(this).css('cursor','pointer');
		$(this).click();
	});
	$("#controls a[rel='0']").text('美女面对面邀您玩游戏');
	$("#controls a[rel='1']").text('美女面对面教女玩兵王');
	$("#controls a[rel='2']").text('美女主播火热招募中');
	$("#controls a[rel='3']").text('中国互动娱乐社区');
});
</script>
<!-- END for 内容 -->
</body>
</html>