<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>视频认证 - ${userToken.user.name}</title>
<script type="text/javascript" src="${domain }/js/lib/jquery.embed.js"></script>
<style type="text/css">
#userAuth {
	padding: 30px 0 50px;
	background-color: #FFF;
}
#userAuth .inner {
	margin: 0 auto;
	padding: 20px 0 0 0;
	width: 950px;
	background: url('${domain}/images/video/user_auth_bg.png') repeat-y 200px top;
	zoom: 1;
}

#userAuth .inner dl {
	width: 250px;
	float: left;
	font-size: 14px;
}

#userAuth .inner dl dt {
	margin-bottom: 15px;
	color: #000;
    font-weight: bold;
}
#userAuth .inner dl dd{
	margin-left: 20px;
}

#userAuth .inner dl dd a {
    margin: 5px 0 5px 0;
    padding: 0 5px 0 10px;
    text-decoration: none;
    width: 192px;
	color: #333;
	display: block;
    height: 32px;
    line-height: 27px;
}

#userAuth .inner dl dd a:hover {
	background: url('${domain}/images/video/on_bg.png') no-repeat left top;
}

#userAuth .inner dl dd.on a {
	font-weight: bold;
	color: #FFF;
	background: url('${domain}/images/video/a_btn.png') no-repeat left top;
}

#userAuth #rBox {
	width: 690px;
	float: right;
}

#userAuth #rBox .startAuth {
	padding: 30px 0 300px;
}

#userAuth #rBox .startAuth p {
	font-size: 14px;
	line-height: 26px;
}

#userAuth #rBox .startAuth p img {
	padding: 0 5px;
	vertical-align: middle;
}

#userAuth #rBox .startAuth .authBtn {
	margin: 50px 0 0 300px;
	width: 202px;
	text-align: center;
}

#userAuth #rBox .startAuth .authBtn a {
	color: #FFF;
	font-size: 13px;
    text-decoration: none;
	line-height: 31px;
	display: block;
	background: url('${domain}/images/video/buttons_bg.png') no-repeat left top;
}
#userAuth #rBox .photoAuth {
	
}
</style>
</head>
<body>
<!-- 内容 -->
<div id="userAuth">
	<div class="inner clearfix">
		<dl>
			<dt>视频认证</dt>
			<dd id="step1" class="on"><a href="javascript:void(0);">开始认证</a></dd>
			<dd id="step2"><a href="javascript:void(0);">上传照片</a></dd>
			<dd id="step3"><a href="javascript:void(0);">视频拍照</a></dd>
		</dl>
		<div id="rBox">
			<div id="showdiv_1" class="startAuth">
				<p>视频认证，是通过与客服人员进行短暂视频连接，来判断您上传照片的真实性！<br />通过认证的用户，因诚信度有保障，将被重点推荐，并获得<img src="${domain}/images/video/ico_videoauth.gif" />图标！</p>
				<p class="authBtn"><a href="javascript:showDiv(2);void(0);">我的电脑有摄像头，开始认证</a></p>
			</div>
			<div id="showdiv_2" class="photoAuth none">
				<div id="multUploader" style="width:700,height:560;">
					<h3>第一步：上传本人照片</h3>
					<div id="uploader" style="width:670px; height:450px;"></div>
				</div>
			</div>
			<div id="showdiv_3" class="none">
				<h3>第二步：视频拍照</h3>
				<div id="avatarWrapper" style="width:700px; height:480px"></div>
			</div>
		</div>
	</div>
</div>
<!-- END for 内容 -->
<script type="text/javascript">
var uid = '${userToken.user.id }';
var nolog = (uid=='') ? true : false;
var photoUrls = '';
$(function(){
});
function showDiv(type){
	if(nolog){
		login();
		return false;
	}
	if(type==2) multUpload();
	else if(type==3) uploadHead();
	$('[id^="showdiv_"]').hide();
	$('#showdiv_'+type).show();
	$('[id^="step"]').removeClass("on");
	$('#step'+type).addClass("on");
}
var App = window.App || {};
App.swfCall = function(result) {
	var code = result['code'];
	if(code == "A00001"){
		alert("提交成功！ 转向首先中...");
		window.location = "/";
	}else if(code == "R00001"){
		alert("不能重复认证");
		window.location = "/";
	}else if(code == "E00001"){
		alert("没发现摄像头，不能进行视频认证");
	}else if(code == "R00001"){
		al("出错了 "+result['data']);
	}
}
function endUpload(result){
	var urls = '';
	var len = result.length;
	for(var i=0; i<len; i++){
		var code = result[i]['code'];
		if(code == "A00001"){
			urls += ',' + result[i]['data'];
		}else if(code == "M00001"){
			al("出错了 "+result[i]['data']);
			return false;
		}else{al("未知错误!");return false;}
	}
	if(i==len){
		photoUrls = urls.substring(1);
		//alert("上传成功！");
		showDiv(3);
	}
}
function multUpload(){
	$('#uploader').multiupload({
		src: '${domain}/images/swf/multiupload.swf',
		version: [10, 0],
		expressInstall: '${domain}/images/swf/expressInstall.swf',
		onFail: function(e) {alert('failure');}
	}, {
		uploadUrl: '${domain}/file/ajaxUploadAuthApi.do?target='+uid,
		maxNum: 64,
		imgFormat: '图片文件|*.jpg;*.jpeg;*.png;*.gif;*.bmp'
	}).css("height","450px");
}
function uploadHead(){
	$('#avatarWrapper').avatar(
		{src: "${domain}/images/swf/VideoAuth.swf?v=1.5", expressInstall: "${domain}/images/swf/expressInstall.swf"},
		{photoUrl: "${domain}/images/default.jpg", saveUrl: "${domain}/user/ajaxSubmitAuthApi.do?target="+photoUrls,
		uid :"${userToken.user.id}"}
	);
}
</script>
</body>
</html>