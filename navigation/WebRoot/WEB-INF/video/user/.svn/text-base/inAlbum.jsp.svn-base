<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="${domain }/js/video/snimages.js"></script>
<title> - ${requestScope.user.name}</title>
<style type="text/css">
#album {margin:20px auto;padding: 0 0 20px 0;width:988px;border: 1px solid #DBDBDB;}
#album .info {margin-bottom: 20px;padding: 0 10px;border-bottom: 1px dotted #CCC;}
#album .info li {margin-right: 20px;padding: 8px 0;float: left;}
#album .info li p {padding: 1px 0 0;color: #E37D00;color:#666;}
#album .info li.name {font-weight: bold;color: #09CBFE;font-size: 16px;}
#album .info li.comment {margin-right: 0;float: right;width: 53px;background:url(${domain }/images/video/album/comment.png) no-repeat left 4px;}
#album .info li.comment a {display: block;color: #E37D00;font-weight: bold;font-size: 14px;text-align: center;}
#album .inner {margin-bottom: 15px;padding: 0 20px 20px;clear: both;border-bottom: 1px dotted #CCC;}
#album .rBox {width:820px;height:550px;line-height:550px;text-align:center;border: 1px solid #DBDBDB;overflow:hidden;}
#album .rBox table {margin: 0 auto;width:820px;height:550px;line-height:550px;text-align:center;}
#album .rBox table td {vertical-align:middle;}
#album .switch {width:97px;height:550px; float: right;}
#album .onBtn {margin-bottom:3px;}
#album .onBtn a{display: block;height: 25px;text-indent: -9999px;background:url(${domain }/images/video/album/detailBtn.gif) no-repeat left -51px;}
#album .onBtn a:hover {background:url(${domain }/images/video/album/detailBtn.gif) no-repeat left top;}
#album .nextBtn {margin-top:3px;}
#album .nextBtn a{display: block;height: 25px;text-indent: -9999px;background:url(${domain }/images/video/album/detailBtn.gif) no-repeat left -70px;}
#album .nextBtn a:hover{background:url(${domain }/images/video/album/detailBtn.gif) no-repeat left -25px;}
#album .switch_center {width:97px;height:498px;overflow:hidden;}
#album .switch_center li {margin-bottom:3px;*margin-bottom:1px;width:95px;height:95px;border:1px solid #C7C7C7;}
#album .switch_center li a {display:block;border:2px solid #fff;}
#album .switch_center li a img {display:block;margin: 0 auto;}
#album .switch_center li a.on {border: 2px solid #2E94D4;}
#album .switch_center li a:hover {border:2px solid #2E94D4;}
#album .switch_center li img {width: 91px;height: 91px;}
#album .loading {width:850px;height:520px;line-height:520px;background:#333 url(images/four_find/loading.gif) no-repeat center center;}
#album p.title {margin: 0 0 15px 20px;font-weight: bold;color: #09CBFE;font-size: 14px;}
#album .commentBox {margin: 0 40px;}
#album .commentBox form {margin-bottom: 30px;width: 650px;}
#album .commentBox form textarea {margin:0 0 10px 0;width: 100%;border: 1px solid #B1B1B1;float:right;}
#album .commentBox form p {margin-bottom: 5px;font-size:14px;}
#album .commentBox form ul {clear:both;}
#album .commentBox form ul li {margin-left: 5px;float:right;}
#album .commentBox form ul li.button button {background: url(${static}/styles/images/form_btn02.gif) no-repeat;border:none;width:52px;height: 20px;cursor: pointer;}
#album .commentBox form ul li.checkbox {margin-left: 0px;float:left;}
#album .commentBox form ul #expr {position: relative;}
#album .commentBox form ul li .expression {padding:5px;width: 306px;border: 1px solid #DEE5F7;background-color: #FFF;position: absolute;top: -216px;left: -269px;z-index: 100;display: none;cursor:pointer;}
#album .commentBox form ul li .expression span {display: block;float: left;height: 26px;margin: 1px;overflow: hidden;padding: 2px;width: 26px;border: 1px solid #EEE;cursor:pointer;}
#album .commentBox form ul li label input {margin-right:2px;vertical-align:-1px;}
#album .commentBox .text {margin-bottom: 15px;padding: 0 10px 10px;border-bottom: 1px dashed #CDCDCD;}
#album .commentBox .text dl dt {width: 48px;float:left;}
#album .commentBox .text dl dt img {width: 48px;height: 48px;}
#album .commentBox .text dl dd {padding: 0 0 0 56px;}
#album .commentBox .text dl dd p a {margin-right:10px;color:#E37D00;font-weight:bold;}
#album .commentBox .text dl dd p.name {margin-bottom: 10px;}
#album .commentBox .text dl dd p.content {word-wrap: break-word;word-break: normal;line-height: 1.5;color:#666;}
#album .commentBox .text dl dd p.content img {vertical-align:middle;}
#album .commentBox .text .reply {text-align:right;}
#album .commentBox .page li {margin-left: 10px;float:right;}
#album .commentBox .page li a {padding: 3px 4px;text-decoration: none;}
#album .commentBox .page li a.on,#album .commentBox .page li a:hover {color:#FFF;background-color:#E37D00;}
</style>
<script type="text/javascript">
jQuery.fn.imageAutoSize = function(width,height)
{
    $('img',this).each(function()
    {
        var image = $(this);

        if(image.width()>width)
        {
			image.width(width);
            image.height(width/image.width()*image.height());
        }
		if(image.height()>height)
        {
            image.width(height/image.height()*image.width());
            image.height(height);
        }
    });
}
$(function(){
	$('td').imageAutoSize(820,550);
	$('#expr').mousemove(function(){
	$('.expression').show();});
	$('#expr').mouseout(function(){
	$('.expression').hide()});
});
</script>
</head>
<body>
<!-- 内容 -->
<div id="album">
<ul class="info clearfix">
	<li class="name">150A.jpg</li>
	<li><p>点击(537)</p></li>
	<li><p>评论(0)</p></li>
	<li><p>创建于：2011-10-24 02:48</p></li>
	<li class="comment"><a href="#watch_comment">评 论</a></li>
</ul>
<div class="inner clearfix">
	<div class="switch">
    	<div class="onBtn"><a href="#" title="上一张" onfocus="this.blur();">上一张</a></div>
        <div class="switch_center" id="pics">
        	<ul>
        		<li><a href="#" class="on"><img src="${domain }/images/video/album/picm10f.jpg" /></a></li>
        	 	<li><a href="#"><img src="${domain }/images/video/album/picm01f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm02f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm03f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm04f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm05f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm06f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm07f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm08f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm09f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm10f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm11f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm12f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm13f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm02f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm03f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm04f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm05f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm06f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm07f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm08f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm09f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm10f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm11f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm12f.jpg" /></a></li>
                <li><a href="#"><img src="${domain }/images/video/album/picm13f.jpg" /></a></li>
            </ul>
      </div>
        <div class="nextBtn"><a href="#" title="下一张" onfocus="this.blur();">下一张</a></div>
    </div>
    <div class="rBox">
	    <table cellspacing="0" cellpadding="0">
		<tr>
			<td id="bigpics"><img src="${domain }/images/video/album/picm10f.jpg" /></td>
		</tr>
		</table>
	</div>
</div>
<p class="title" id="watch_comment">评 论</p>
<div class="commentBox">
	<form action="" method="get">
		<p>您的评论:</p>
		<textarea name="" cols="4" rows="4"></textarea>
		<ul class="clearfix">						
			<li class="button"><button type="submit">&nbsp;</button></li>	
			<li id="expr"><img src="${static}/styles/images/form_btn01.gif" />
				<div class="expression">
					<span><img src="${static}/styles/images/expression/0.gif" title="狂笑" /></span>
					<span><img src="${static}/styles/images/expression/1.gif" title="大笑" /></span>
					<span><img src="${static}/styles/images/expression/2.gif" title="惊讶" /></span>
					<span><img src="${static}/styles/images/expression/3.gif" title="害羞" /></span>
					<span><img src="${static}/styles/images/expression/4.gif" title="窃笑" /></span>
					<span><img src="${static}/styles/images/expression/5.gif" title="发怒" /></span>
					<span><img src="${static}/styles/images/expression/6.gif" title="大哭" /></span>
					<span><img src="${static}/styles/images/expression/7.gif" title="色色" /></span>
					<span><img src="${static}/styles/images/expression/8.gif" title="坏笑" /></span>
					<span><img src="${static}/styles/images/expression/9.gif" title="火大" /></span>
					<span><img src="${static}/styles/images/expression/10.gif" title="汗" /></span>
					<span><img src="${static}/styles/images/expression/11.gif" title="奸笑" /></span>
					<span><img src="${static}/styles/images/expression/12.gif" title="欢迎" /></span>
					<span><img src="${static}/styles/images/expression/13.gif" title="再见" /></span>
					<span><img src="${static}/styles/images/expression/14.gif" title="白眼" /></span>
					<span><img src="${static}/styles/images/expression/15.gif" title="挖鼻" /></span>
					<span><img src="${static}/styles/images/expression/16.gif" title="顶" /></span>
					<span><img src="${static}/styles/images/expression/17.gif" title="胜利" /></span>
					<span><img src="${static}/styles/images/expression/18.gif" title="欧耶" /></span>
					<span><img src="${static}/styles/images/expression/19.gif" title="抱拳" /></span>
					<span><img src="${static}/styles/images/expression/20.gif" title="囧" /></span>
					<span><img src="${static}/styles/images/expression/21.gif" title="淡定" /></span>
					<span><img src="${static}/styles/images/expression/22.gif" title="美女" /></span>
					<span><img src="${static}/styles/images/expression/23.gif" title="靓仔" /></span>
					<span><img src="${static}/styles/images/expression/24.gif" title="神马" /></span>
					<span><img src="${static}/styles/images/expression/25.gif" title="开心" /></span>
					<span><img src="${static}/styles/images/expression/26.gif" title="给力" /></span>
					<span><img src="${static}/styles/images/expression/27.gif" title="飞吻" /></span>
					<span><img src="${static}/styles/images/expression/28.gif" title="眨眼" /></span>
					<span><img src="${static}/styles/images/expression/29.gif" title="V5" /></span>
					<span><img src="${static}/styles/images/expression/30.gif" title="来吧" /></span>
					<span><img src="${static}/styles/images/expression/31.gif" title="围观" /></span>
					<span><img src="${static}/styles/images/expression/32.gif" title="狂吐" /></span>
					<span><img src="${static}/styles/images/expression/33.gif" title="飘过" /></span>
					<span><img src="${static}/styles/images/expression/34.gif" title="地雷" /></span>
					<span><img src="${static}/styles/images/expression/35.gif" title="菜刀" /></span>
					<span><img src="${static}/styles/images/expression/36.gif" title="帅" /></span>
					<span><img src="${static}/styles/images/expression/37.gif" title="审视" /></span>
					<span><img src="${static}/styles/images/expression/38.gif" title="无语" /></span>
					<span><img src="${static}/styles/images/expression/39.gif" title="无奈" /></span>
					<span><img src="${static}/styles/images/expression/40.gif" title="亲亲" /></span>
					<span><img src="${static}/styles/images/expression/41.gif" title="勾引" /></span>
					<span><img src="${static}/styles/images/expression/42.gif" title="后后" /></span>
					<span><img src="${static}/styles/images/expression/43.gif" title="吐血" /></span>
					<span><img src="${static}/styles/images/expression/44.gif" title="啊哦" /></span>
					<span><img src="${static}/styles/images/expression/45.gif" title="媚眼" /></span>
					<span><img src="${static}/styles/images/expression/46.gif" title="愁人" /></span>
					<span><img src="${static}/styles/images/expression/47.gif" title="肿么了" /></span>
					<span><img src="${static}/styles/images/expression/48.gif" title="调戏" /></span>	
				</div>
			</li>
			<li class="checkbox"><label><input name="" type="checkbox" value="" />同时转发到我的动态</label></li>
		</ul>
	</form>
	<div class="text">
		<dl class="clearfix">
			<dt><img src="${domain }/images/video/album/picm01f.jpg" /></dt>
			<dd>
				<p class="name"><a href="#">~妮妮！/</a><span>10-28 07:54</span></p>
				<p class="content">回复 <a href="#">~许墨！</a>：<img src="${static}/styles/images/expression/48.gif" alt="" />回复成功dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
			</dd>
		</dl>
		<p class="reply"><a href="#">回复</a></p>
	</div>
	<div class="text">
		<dl class="clearfix">
			<dt><img src="${domain }/images/video/album/picm01f.jpg" /></dt>
			<dd>
				<p class="name"><a href="#">~妮妮！/</a><span>10-28 07:54</span></p>
				<p class="content">转发</p>
			</dd>
		</dl>
		<p class="reply"><a href="#">回复</a></p>
	</div>
	<div class="text">
		<dl class="clearfix">
			<dt><img src="${domain }/images/video/album/picm01f.jpg" /></dt>
			<dd>
				<p class="name"><a href="#">~妮妮！/</a><span>10-28 07:54</span></p>
				<p class="content">回复 <a href="#">~许墨！</a>：<img src="${static}/styles/images/expression/48.gif" alt="" />回复成功</p>
			</dd>
		</dl>
		<p class="reply"><a href="#">回复</a></p>
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
</div>
<!-- END for 内容 -->
</body>
</html>