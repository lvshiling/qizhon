<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
.roomHeader{margin:0 auto; width:991px;}
.roomHeader .liveRoom{text-align:left; padding-left:30px;width: 91px; float:left;line-height: 47px; font-size: 16px; background: url(/images/video/bg_roomheader-left.png) no-repeat left; display:inline;}
.roomHeader .liveRoom a{color: #212526; }
.roomHeader ul {width: 749px; float: left; background:url(/images/video/bg_roomheader.png) repeat-x top;}
.roomHeader ul li{padding: 0 20px;float:left;line-height: 45px;line-height: 47px\9;background: url(/images/video/bg_li.png) no-repeat right top;}
.roomHeader ul li a{color: #5C5E5D; font-size: 16px;}
.roomHeader .linkBack{padding: 5px 0 11px 30px;width: 91px;text-align:left; float: right; background:url(/images/video/bg_roomheader-right.png) no-repeat left top;}
.roomHeader .linkBack a{padding: 0 0 0 10px; color:#000; line-height: 13px;}
</style>
<div class="roomHeader clearfix">
	<p class="liveRoom"><a id="sbar_room" href="${domain}/${requestScope.user.room.roomNo}" class="fb">直播房间</a></p>
	<ul class="clearfix">
		<li><a id="sbar_index" href="${domain}/user/index.do?uid=${requestScope.user.id}">个人主页</a></li>
		<li><a id="sbar_album" href="${domain}/user/album.do?uid=${requestScope.user.id}">相册</a></li>
		<li><a id="sbar_video" href="javascript:;">视频</a></li>
		<li><a id="sbar_fans" href="javascript:;">粉丝</a></li>
	</ul>
	<p class="linkBack">Back<br /><a href="${domain}/">返回首页</a></p>
</div>

