<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>照片打分</title>
<script type="text/javascript" src="${domain }/js/lib/swfobject.js"></script>
<script type="text/javascript" src="${domain }/js/video/userinfo.js"></script>
<script type="text/javascript">
function getScoreText(rating, avg){
	if(rating!='' && avg!=''){
		var r = parseFloat(rating);
		var a = parseFloat(avg);
		if(r > a){
			return "谢谢哦！";
		}else if(r < a){
			return "神马啊！";
		}else{
			return "评得真准！";
		}
	}else{
		return "";
	}
}
</script>
<style type="text/css">
body {
	background-color: #FFF;
}
.photoRate {
	margin: 0 auto;
	width: 560px;
	padding: 20px 0 100px;
}
.photoRate p.title {
	margin-bottom: 10px;
	color: #000;
	font-size: 24px;
	font-weight: normal;
	line-height: 1;
}
.photoRate .flash {
	margin: 10px 0 0 150px;
	width: 240px;
	height: 70px;
}
.photoRate .flash .fl {
	float: left;
	width: 210px;
}
.photoRate .flash .sound {
	padding-top: 30px;
	float: right;
	width: 15px;
}
.photoRate .photo_box {
	clear: both;
}
.photoRate .s_photo_left {
	padding-top: 10px;
	width: 76px;
	float: left;
}

.photoRate .s_photo_left p.list {
	margin-left: 20px;
}

.photoRate .s_photo_left ul li img {
	border:2px solid #FFF;
	border-bottom: none;
	vertical-align: bottom;
}

.photoRate .s_photo_left ul li.list img {
	border:2px solid #F90;
}

.photoRate .b_photo_right {
	width: 484px;
	float: right;
}

.photoRate .b_photo_right .box_t {
	width:100%;
}
.photoRate .b_photo_right .box_t_l {
	width:290px;
	height: 320px;
	margin:0 30px;
	float:left;
	display: inline;
}

.photoRate .b_photo_right .box_t_l p {
	width:100%;
	text-align:center;
}
.photoRate .b_photo_right .box_t_l p.list {
	width:100%;
	margin-bottom:5px;
	overflow:hidden;
	text-align:center;
}
.photoRate .b_photo_right .box_t_l p.list a img {
	border:2px solid #fff;
	max-height: 240px;
}
.photoRate .b_photo_right .box_t_l p.list a img:hover {
	border:2px solid #F90;
}
.photoRate .b_photo_right .info_box {
	padding-top: 20px;
	width:132px;
	float:left;
}
.photoRate .b_photo_right .info_box ul {
	padding-top: 30px;
}
.photoRate .b_photo_right .info_box ul li {
	margin-bottom: 10px;
	font-size: 14px;
	color: #676767;
}
.photoRate .b_photo_right .info_box ul li span {
	font-size: 12px;
}
.photoRate .b_photo_right .info_box ul li strong {
	color: #000;
}
.photoRate .b_photo_right .info_box ul li.bg {
	width: 101px;
	text-align: center;
	line-height: 75px;
	background:url("${domain}/images/video/question_02.gif") no-repeat left top;
}

.photoRate .b_photo_right .info_box p.img_b {
	width:78px;
	text-align:center;
	margin-bottom:5px;
}
.photoRate .b_photo_right .info_box p.img_b img {
	border:1px solid #c9c9c9;
	padding:2px;
}
.photoRate .b_photo_right .info_box .tipbg {
	width:68px;
	height:23px;
	padding:5px;
	font-size:12px;
	font-weight:bolder;
	color:#F60;
	background:url("${domain}/images/video/tipbg.png") no-repeat left top;
}
.photoRate .b_photo_right .box_b {
	width:484px;
	height:72px;
	background:#fff;
	overflow: hidden;
}
.photoRate .b_photo_right .box_b ul {
	width: 530px;
}

.photoRate .b_photo_right .box_b li {
	float:left;
}

.photoRate .b_photo_right .box_b li a {
	border: 1px solid #FFF;
}

.photoRate .fb_13 {
	font-size: 13px;
	font-weight: bold;
}
.photoRate .mb10 {
	margin-bottom: 10px;
}

.photoRate .fs_12 {
	font-size: 13px;
}

.photoRate .yellow {
	color: #F60;
}

.photoRate a {
	color: #1A4DC1;
	text-decoration: underline;
}

.photoRate a:hover {
	color: #F60;
}
</style>
</head>
<body>
<!-- 内容 -->
<div class="photoRate clearfix">
	<p class="title">凭感觉给下面的人打分！</p>
	<div class="flash clearfix">
		<div class="fl" id="ratingbar"></div>
		<script type="text/javascript">
		$(function(){
			var swfVersionStr_public = "10.1.0"; 
		    var xiSwfUrlStr_public = "${domain}/images/swf/expressInstall.swf"; 
			var attributes_public = {};
			var params_public = {};
			params_public.wmode = "transparent";
			var flashvars_public = {};
			flashvars_public.postUrl = "${domain}/user/ajaxGiveScoreApi.do";
			flashvars_public.uid = "${scuser.id}";
			flashvars_public.callBack = "giveScore";
			swfobject.embedSWF("${domain}/images/swf/RatingBar.swf", "ratingbar", "210", "70", swfVersionStr_public, 
			      xiSwfUrlStr_public, flashvars_public, params_public, attributes_public); 
		});
		</script>
		<div class="sound"><a href="#"><img src="${domain}/images/video/ico_sound.png" alt="" /></a></div>
	</div>
	<div class="photo_box">
		<div class="s_photo_left">
			<p class="list"><img src="${domain}/images/video/ico_img2.gif" alt="" /></p>
			<ul>
				<s:iterator value="#request.userList1" status="status">
					<s:if test="#status.index==0">
						<li class="list"><a href="${domain}/user/score.do?uid=${id}"><img width="72" height="72" src="${icon1}" onerror="this.src='${domain}/images/default.jpg';" alt="" /></a></li>
					</s:if>
					<s:else>
						<li class="list2"><a href="${domain}/user/score.do?uid=${id}"><img width="72" height="72" src="${icon1}" onerror="this.src='${domain}/images/default.jpg';" alt="" /></a></li>
					</s:else>
				</s:iterator>
			</ul>
		</div>
		<div class="b_photo_right">
			<div class="box_t">
				<div class="box_t_l">
						<p class="list"><a href="${domain}/user/index.do?uid=${scuser.id}" target="_blank" title="点击查看更多资料，照片"><img id="current_user_img" src="" alt="" /></a></p>
						<p class="list2"><a href="#" target="_blank">${scuser.name}</a> <s:if test="#request.userInfo.userAge>0">${userInfo.userAge}岁</s:if> <script type="text/javascript">document.write(getProvAndCity('${userInfo.userCity}'));</script> <a href="#" target="_blank">详细资料</a></p>
						<p><span class="fb_13">"</span><span>想和一个男生,25岁-35岁去看海</span><span class="fb_13 f_0">"</span></p>
				</div>
				<div class="info_box">
					<s:if test="#request.rating==null || #request.rating==''">
						<ul>
							<li><img src="${domain}/images/video/question_01.gif" alt="" /></li>
							<li><strong>您的评分: </strong><span>暂无</span></li>
							<li class="bg">得分待评</li>
						</ul>
					</s:if>
					<s:else>
						<div class="info">
							<p class="fb_13">您给她打：<span class="yellow">${requestScope.rating}分</span></p>
							<p class="fb_13 mb10">她的平均分：<span class="yellow">${requestScope.avg}分</span></p>
							<p class="tipbg"><script type="text/javascript">document.write(getScoreText('${requestScope.rating}','${requestScope.avg}'));</script></p>
							<p class="img_b" id="last_ping_img"><a href="#" target="_blank"><img width="72" height="72" src="${requestScope.lastUser.icon1 }" alt="" /></a></p>
							<p class="f_6"><a href="#" target="_blank">${requestScope.lastUser.name }</a> </p>
							<p class="fs_12"><a href="#" target="_blank" class="f_6">查看我打过的人</a></p>
						</div>
					</s:else>
				</div>
			</div>
			<div class="box_b clear">
					<ul>
						<s:iterator value="#request.userList2" status="status">
							<li><a href="${domain}/user/score.do?uid=${id}"><img width="72" height="72" src="${icon1}" onerror="this.src='${domain}/images/default.jpg';" alt="" /></a></li>
						</s:iterator>
						<li><a href="javascript:;"><img src="${domain}/images/video/11.jpg" alt="" /></a></li>
					</ul>
			</div>
		</div>
	</div>
</div>
<!-- END for 内容 -->
<script type="text/javascript">
$(function(){
	var img = new Image();
	var imgUI = $('#current_user_img');
	img.src = '${scuser.picPath}';
	var h = (img.height*296)/img.width;
	var w = (img.width*240)/img.height;
	if(img.width>296 && img.height<241){
		imgUI.attr('width','296');
		imgUI.attr('height', h.toString());
	}else if(img.height>240 && img.width<297){
		imgUI.attr('height' ,'240');
		imgUI.attr('width', w.toString());
	}else if(img.height>240 && img.width>296){
		if(h < 241){
			imgUI.attr('width','296');
			imgUI.attr('height', h.toString());
		}else if(w < 297){
			imgUI.attr('height','240');
			imgUI.attr('width', w.toString());
		}else{
			imgUI.attr('width','296');
			imgUI.attr('height','240');
		}
	}
	imgUI.attr('src','${scuser.picPath}');	
});

function giveScore(res){
	var json = eval('('+res+')');
	var status = json.status;
	if(status == 1){
		var rating = json.values.rating;
		var avg = json.values.avg;
		var lastId = json.values.lastId;
		location.href = "${domain}/user/score.do?rating="+rating+"&avg="+avg+"&lastId="+lastId;
	}else if(status == -2){
		login();
	}
}
</script>
</body>
</html>
