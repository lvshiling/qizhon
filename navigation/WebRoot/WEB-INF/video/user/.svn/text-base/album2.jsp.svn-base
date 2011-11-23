<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> - ${requestScope.user.name}</title>
<style type="text/css">
#albumBox {
	margin: 20px auto 20px;
	width: 988px;
	border: 1px solid #DBDBDB;
}
img {display:block;}
#albumBox .btn {margin: 0 10px;padding: 0 0 10px 0;border-bottom: 1px dotted #CCCCCC;}
#albumBox .btn a {
	background: url("${domain }/images/video/album/btn_up_ph.png") repeat scroll 0 0 transparent;
    border: none;
    color: #528ACC;
    font-size: 16px;
    font-weight: 700;
    line-height: 37px;
    text-align: center;
    margin: 10px 10px 0;
    width: 123px;
    text-decoration: none;
    display: block;
    text-shadow: 1px 1px #FFFFFF;
}

#albumBox .phoBox {
	margin: 0 auto;
	width: 946px;
}
#albumBox .phoBox ul {
	margin-bottom: 10px;
	padding: 0 0 20px 5px;
 	border-bottom: 1px dotted #CCCCCC;
}
#albumBox .phoBox ul li {
	margin: 0 7px 0 0;
	width: 228px;
	float: left;
}
#albumBox .phoBox ul li a {
    text-decoration: none;
    position:relative;
}
#albumBox .phoBox ul li a .s_photo {
    width: 226px;
	overflow: hidden;
	border: 1px solid #CCC;
	border-bottom: none;
}
#albumBox .phoBox ul li a img {
	margin: 0 auto;
	height: 192px;
	display: block;
}
#albumBox .phoBox ul li p.title {
 	color: #999999;
    font-size: 14px;
    padding: 4px 0;
    font-weight: bold;
}
#albumBox .phoBox ul li p.title span {
 	float:right;
}
#albumBox .phoBox ul li p.title span a {
	margin-left: 5px;
	padding: 1px 2px;
	width: auto;
    font-size: 12px;
    font-weight: normal;
    color: #E37D00;
}
#albumBox .phoBox ul li p.title span a:hover {
    color: #FFF;
    background-color: #E37D00;
}
#albumBox .phoBox ul li a .bgRed {
	padding: 5px 0;
	width: 228px;
	color: #FFF;
	overflow: hidden;
	background-color: #E37D00;
}
#albumBox .phoBox ul li a .bgRed em {
	padding: 0 0 0 5px;
    white-space: nowrap;
    font: 18px/1.4 "Microsoft Yahei",Tahoma,Simsun,Arial,Helvetica,sans-serif;
}
#albumBox .phoBox ul li a .bgRed span {
	padding-left: 5px;
	line-height: 1.5;
}
#albumBox .phoBox ul li a .t {
	width: 228px;
	height: 246px;
	background-color: #000;
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	filter:alpha(opacity=0);
}
#albumBox .phoBox ul li a:hover .t {
	opacity: 0.2;
	filter:alpha(opacity=20);
}
#albumBox .page {margin: 0 30px 20px;}
#albumBox .page li {margin-left: 10px;float:right;}
#albumBox .page li a {padding: 3px 4px;text-decoration: none;}
#albumBox .page li a.on,#albumBox .page li a:hover {color:#FFF;background-color:#E37D00;}
</style>
<script type="text/javascript">
jQuery.fn.imageAutoSize = function(width,height)
{
    $("img",this).each(function()
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
$(function(){ $(".albumlist li").imageAutoSize(228,192)});
</script>
</head>
<body>
<!-- 内容 -->
<div id="albumBox" class="clearfix">
<p class="btn"><a href="#" onclick="multUpload();">上传照片</a></p>
<div class="phoBox">
	<ul class="albumlist clearfix">
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm01f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff35be8df6207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm02f.jpg" alt="" /></div>
				<div class="bgRed"><em>完美生活.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm03f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff35be8df6207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm04f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff35be8df6207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
	</ul>
	<ul class="albumlist clearfix">
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm05f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm06f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm07f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm08f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
	</ul>
	<ul class="albumlist clearfix">
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm09f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm10f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm11f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${domain }/images/video/album/picm12f.jpg" alt="" /></div>
				<div class="bgRed"><em>59e8aff36207.jpg</em>
				<p><span>点击(2)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
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
<!-- END for 内容 -->
</body>
</html>