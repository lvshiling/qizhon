<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="${domain }/js/video/calendar.js"></script>
<title> - ${requestScope.user.name}</title>
<style type="text/css">
#reInfo {
	margin: 20px auto 50px;
	width: 988px;
	font-family: "Microsoft Yahei";
}
#reInfo .main {
	width: 690px;
	float: right;
}
#reInfo .main h1 {
	margin-bottom: 25px;
	padding: 0 0 5px 10px;
	color: #666;
	font-size: 16px;
	font-weight: normal;
	border-bottom: 1px solid #EAEAEA;
	border-left: 5px solid #FF9000;
}
#reInfo .main form ul {
	margin: 0 0 40px 10px;
}
#reInfo .main form ul li {
	margin-right: 20px;
	float: left;
	font-size: 14px;
	line-height: 32px;
}
#reInfo .main form ul li.li01 {
	_padding-top: 5px;
}
#reInfo .main form ul li.mr0 {
	margin-right: 0;
}
#reInfo .main form ul li input,
#reInfo .main form ul li select {
	border: 1px solid #D2D2D2;
	color: #666;
	width: 130px;
	font-family: Arial, Helvetica, sans-serif;
	padding: 4px;
	background: url(${domain }/images/video/release/form-input.png) no-repeat left top;
}
#reInfo .main form ul li button {
	border: none;
	width: 95px;
	font-size: 14px;
	cursor: pointer;
	line-height: 32px; 
	*line-height: 28px;
	color: #FFF;
	background-color: #FF9000;
	border-radius: 2px;
}
#reInfo .main form ul li a {
	width: 95px;
	display: block;
	text-align: center;
	font-size: 14px;
	height: 34px;
	color: #666;
	line-height: 33px;
	background-color: #EFEFEF;
	border-radius: 2px;
}
#reInfo .main dl {
	margin: 0 0 40px 10px;
	line-height: 3;
}
#reInfo .main dl dt {
	width: 100px;
	float: left;
	clear: left;
}
#reInfo .main dl dd {
	padding-left: 100px;
	border-bottom: 1px dashed #ccc;
}
#reInfo .main dl dd strong {
	font-size: 14px;
	color: #DC3E00;
}
#reInfo .main .tabUl {
	margin-bottom: 20px;
	border-bottom: 3px solid #FF9000;
}
#reInfo .main .tabUl li {
	float: left;
}
#reInfo .main .tabUl li a {
	margin-right: -1px;
	_margin-right: 0;
	padding: 6px 10px;
	display: inline-block;
	font-size: 14px;
    border: 1px solid #D1D1D1;
    border-bottom: none;
}
#reInfo .main .tabUl li a span {
	font-size: 12px;
	font-weight: normal;
}
#reInfo .main .tabUl li a.on {
	background: #FF8A00;
    border: 1px solid #FF8A00;
    color: #FFF;
    font-weight: bold;
}
#reInfo .main .tabList {
	width: 100%;
	font-size: 14px;
	text-align: center;
}
#reInfo .main .tabList td {
	padding: 10px 0;
	font-size: 14px;
}
#reInfo .main .tabList td strong {
    color: #DC3E00;
}
#reInfo .main .tabList td ul li {
	padding-left: 16px;
	float: left;
	display: inline;
}
#reInfo .main .tabList td button {
	border: none;
	width: 50px;
	font-size: 12px;
	cursor: pointer;
	line-height: 20px; 
	color: #FFF;
	background-color: #FF9000;
	border-radius: 2px;
}

#reInfo .main .noQuotation {
	padding: 30px 0;
	text-align: center;
	border: 1px solid #ccc;
}

#reInfo .main .tab02,
#reInfo .main .tab03 {
	display: none;
}


#reInfo .sideBar {
	padding: 0 0 100px 0;
	width: 260px;
	float: left;
}
#reInfo .sideBar .name {
	margin-bottom: 20px;
	color: #999;
	font-size: 13px;
}
#reInfo .sideBar .name a {
	color: #FF9000;
	font-size: 20px;
	font-weight: bold;
}
#reInfo .sideBar .name span {
	padding: 0 0 0 10px;
}
#reInfo .sideBar .name span strong {
	font-weight: normal;
}
#reInfo .sideBar .photo {
	margin: 0 auto 10px;
	width: 260px;
	text-align: center;
}
#reInfo .sideBar .photo img {
	padding: 6px;
	max-width: 240px;
	_width: 240px;
	max-height: 240px;
	box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
	border: 1px solid #EAEAEA\9;
}
#reInfo .sideBar p {
	margin-bottom: 6px;
}
#reInfo .sideBar .grade img {
	margin-left: 3px;
	vertical-align: middle;
}
#reInfo .sideBar .mb20 {
	margin-bottom: 20px;
}
#reInfo .sideBar .sure img {
	vertical-align: bottom;
}
#reInfo .sideBar dl dt {
	margin-bottom: 10px;
	font-size: 14px;
}
#reInfo .sideBar dl li {
	float: left;
}
#reInfo .sideBar dl li a {
	padding: 1px;
	display: block;
	border: 1px solid #FFF;
}
#reInfo .sideBar dl li a:hover {
	border: 1px solid #FF9000;
}
#reInfo .sideBar dl li img {
	width: 60px;
	height: 80px;
}
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
$(function(){ $(".sideBar .name img").imageAutoSize(180,220)});

function showdiv(type){
	$('.comBox').hide();
	$('.tab0'+type).show();
	$('.tabUl li a').removeClass("on");
	$('.tabUl li .li0'+type).addClass("on");
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="reInfo" class="clearfix">
	<div class="main">
		<h1>任务详情</h1>	
		<dl class="clearfix">
			<dt>状 态</dt><dd><strong>进行中..</strong></dd>
			<dt>价 格</dt><dd><strong>￥500</strong> 人民币</dd>
			<dt>标 题</dt><dd>美女陪玩征途而和什么的艾尔之光</dd>
			<dt>时 间</dt><dd>2011-11-28 22:00:00 到 2011-11-28 24:00:00</dd>
			<dt>内 容</dt><dd>美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光美女陪玩征途而和什么的艾尔之光</dd>
		</dl>
		<form action="">
			<ul class="clearfix">
				<li>付款帐号：<input type="text"  /></li>
				<li class="li01">出价 <select name="">
					<option>￥50</option>
					<option>￥100</option>
					<option>￥150</option>
					<option>￥200</option>
					<option>￥300</option>
					<option>￥400</option>
					<option>￥500</option>
					<option>￥600</option>
					<option>￥700</option>
					<option>￥800</option>
					<option>￥900</option>
					<option>￥1000</option>
					<option>￥2000</option>
					<option>￥3000</option>
					<option>￥4000</option>
					<option>￥5000</option>
				</select> 人民币</li>
				<li><button>确  定</button></li>
				<li class="mr0"><a href="javascript:window.close()">关闭页面</a></li>
			</ul>
		</form>
		<ul class="tabUl clearfix">
			<li><a onclick="javascript:showdiv(1);" class="li01 on" href="#">所有报价 <span>(12)</span></a></li>
			<li><a onclick="javascript:showdiv(2);" class="li02" href="#">中标用户</a></li>
			<li><a onclick="javascript:showdiv(3);" class="li03" href="#">我的报价</a></li>
		</ul>
		<div class="tab01 comBox">
		<table cellspacing="0" cellpadding="0" summary="" class="tabList">
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<tr>
				<th>时 间</th>
				<th>报 价</th>
				<th>用户名</th>
				<th>付款帐号</th>
				<th>状 态</th>
			</tr>
			<tr>
				<td>2011-12-05 12:00:00</td>
				<td><strong>￥2000</strong></td>
				<td><a href="#">~/妮妮*</a></td>
				<td>111@111.com</td>
				<td><button>接受</button></td>
			</tr>
			<tr>
				<td>2011-12-05 12:00:00</td>
				<td><strong>￥2000</strong></td>
				<td><a href="#">~/妮妮*</a></td>
				<td>111@111.com</td>
				<td><button>接受</button></td>
			</tr>
			<tr>
				<td>2011-12-05 12:00:00</td>
				<td><strong>￥2000</strong></td>
				<td><a href="#">~/妮妮*</a></td>
				<td>111@111.com</td>
				<td><button>接受</button></td>
			</tr>
			<tr>
				<td>2011-12-05 12:00:00</td>
				<td><strong>￥2000</strong></td>
				<td><a href="#">~/妮妮*</a></td>
				<td>111@111.com</td>
				<td><button>接受</button></td>
			</tr>	
		</table>
		<table cellspacing="0" cellpadding="0" summary="" class="tabList">
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<tr>
				<th>时 间</th>
				<th>报 价</th>
				<th>用户名</th>
				<th>任 务</th>
				<th>状 态</th>
			</tr>
			<tr>
				<td>2011-12-05 12:00:00</td>
				<td><strong>￥2000</strong></td>
				<td><a href="#">~/妮妮*</a></td>
				<td>包 养</td>
				<td>进行中..</td>
			</tr>
		</table>
		<p class="noQuotation">没有报价</p>
		</div>
		
		<div class="tab02 comBox">
			<table cellspacing="0" cellpadding="0" summary="" class="tabList">
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<tr>
				<th>时 间</th>
				<th>报 价</th>
				<th>用户名</th>
				<th>付款帐号</th>
				<th>状 态</th>
			</tr>
			<tr>
				<td>2011-12-05 12:00:00</td>
				<td><strong>￥2000</strong></td>
				<td><a href="#">~/妮妮*</a></td>
				<td>111@111.com</td>
				<td>中 标</td>
			</tr>
		</table>
		</div>
		
		<div class="tab03 comBox">
			<table cellspacing="0" cellpadding="0" summary="" class="tabList">
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<tr>
				<th>时 间</th>
				<th>报 价</th>
				<th>用户名</th>
				<th>付款帐号</th>
				<th>状 态</th>
			</tr>
			<tr>
				<td>2011-12-05 12:00:00</td>
				<td><strong>￥2000</strong></td>
				<td><a href="#">~/妮妮*</a></td>
				<td>111@111.com</td>
				<td><a href="#">删 除</a></td>
			</tr>
		</table>
	
		</div>
	
		
	</div>
	<div class="sideBar">
		<p class="name"><a href="#">~/妮妮*</a><span>ID:<strong>87428478</strong></span></p>
		<div class="photo"><a href="#"><img src="${domain }/images/video/release/photo01.jpg" alt="" /></a></div>
		<p class="sure"><img src="${domain }/images/video/ico_videosure.gif" alt="认证" />&nbsp;&nbsp;她已通过视频认证</p>
		<p class="grade">信誉等级：<img src="${domain }/images/video/diamond_1.png" alt="" /><img src="${domain }/images/video/diamond_1.png" alt="" /><img src="${domain }/images/video/diamond_1.png" alt="" /></p>
		<p class="mb20"><a href="#">Ta平均分：<strong>9.5</strong> 分</a></p>
		
		<dl>
			<dt>她的个人形象照 </dt>
			<dd>
				<ul class="clearfix">
					<li><a href="#"><img src="${domain }/images/video/release/s_photo01.jpg" alt="" /></a></li>
					<li><a href="#"><img src="${domain }/images/video/release/s_photo02.jpg" alt="" /></a></li>
					<li><a href="#"><img src="${domain }/images/video/release/s_photo03.jpg" alt="" /></a></li>
					<li><a href="#"><img src="${domain }/images/video/release/s_photo04.jpg" alt="" /></a></li>
					<li><a href="#"><img src="${domain }/images/video/release/s_photo03.jpg" alt="" /></a></li>
					<li><a href="#"><img src="${domain }/images/video/release/s_photo01.jpg" alt="" /></a></li>
					<li><a href="#"><img src="${domain }/images/video/release/s_photo02.jpg" alt="" /></a></li>
				</ul>
			
			</dd>
		</dl>
		
		<a href="#">查看更多相册</a>
	</div>
</div>

<!-- END for 内容 -->
</body>
</html>