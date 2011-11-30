<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- <script type="text/javascript" src="${domain }/js/video/calendar.js"></script> -->
<title>任务详情</title>
<style type="text/css">
#reInfo {
	margin: 20px auto 50px;
	width: 988px;
	font-family: "Microsoft Yahei";
}
#reInfo .highlit {
	color: #DC3E00;
	font-weight:bold;
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
#reInfo .main form ul li input {
	border: 1px solid #D2D2D2;
	color: #666;
	width: 130px;
	font-family: Arial, Helvetica, sans-serif;
	padding: 4px;
	background: url(${domain }/images/video/release/form-input.png) no-repeat left top;
}
#reInfo .main form ul li input.button {
	border: none;
	width: 95px;
	font-size: 14px;
	cursor: pointer;
	line-height: 32px; 
	*line-height: 28px;
	line-height: 23px\9;
	color: #FFF;
	background: #FF9000 none;
	border-radius: 2px;
}

#reInfo .main dl {
	margin: 0 0 30px 10px;
	line-height: 3;
}
#reInfo .main dl dt {
	width: 100px;
	float: left;
	clear: left;
}
#reInfo .main .red7 {
	margin: 0 0 10px 10px;
	color: #ccc;
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
#reInfo .main .tabList td input.btn2 {
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
document.onkeydown = function(evt){
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	var act = document.activeElement.id;
	if(act == "qtpr"){
		if((key >= 48 && key <=57) || key == 8){
    		//do nothing
	    }else{
	        if(window.event){ //ie
	            event.returnValue = false;   
	        }else{ //firefox
	            evt.preventDefault();
	        }
	    }
	}
	return true;
};
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
$(function(){
	$('#navbar a.lit').removeClass('lit');
	$('#navbar #nv_task').addClass('lit');
	$('#navbar #nv_task').attr('target','_self');
	 
	$(".sideBar .name img").imageAutoSize(180,220)
});

function showdiv(type){
	$('.comBox').hide();
	$('.tab0'+type).show();
	$('.tabUl li a').removeClass("on");
	$('.tabUl li .li0'+type).addClass("on");
}

function getTaskStTxt(st){
	if(st=='1'){
		return "已发布";
	}else if(st=='2'){
		return "<span class='highlit'>已中标</span>";
	}else if(st=='3'){
		return "已结束";
	}else{
		return "";
	}
}
function getAcceptStTxt(st){
	if(st=='1'){
		return "已出价";
	}else if(st=='2'){
		return "<span class='highlit'>已中标</span>";
	}else if(st=='3'){
		return "已付款待确认";
	}else if(st=='4'){
		return "已付款";
	}else if(st=='5'){
		return "已结束";
	}else{
		return "";
	}
}
function submitAccept(){
	if('${requestScope.isLogin}'!='1'){
		login();return false;
	}
	var price = $('#qtpr').val();
	var acct = $('#qtacc').val();
	if(price==''){
		alert('请输入出价');
		return false;
	}
	if(acct==''){
		alert('请输入付款帐号');
		return false;
	}
	$.post("${domain}/task/ajaxAcceptApi.do?", {"price":price,"account":acct,"id":'${requestScope.task.id}'}, function(d){
		if(d['status'] == 1){
			alert('提交成功！');
			window.location.reload();
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"提交失败");
	},'json');
}
function chooseWinner(id){
	$.post("${domain}/task/ajaxWinAcceptApi.do?", {"id":id}, function(d){
		if(d['status'] == 1){
			alert('提交成功！');
			window.location.reload();
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"提交失败");
	},'json');
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="reInfo" class="clearfix">
	<div class="main">
		<h1>任务详情<s:if test='#request.isLogin=="1"'><a href="${domain}/task/index.do" style="float:right;font-size:12px;margin:5px 5px 0;">[我要发布任务]</a></s:if></h1>
		<dl class="clearfix">
			<dt>状 态</dt><dd><strong><script>document.write(getTaskStTxt('${requestScope.task.status}'));</script></strong></dd>
			<dt>价 格</dt><dd><strong>￥${requestScope.task.offerPrice }</strong> 元人民币</dd>
			<dt>标 题</dt><dd>${requestScope.task.name }</dd>
			<dt>时 间</dt><dd><script>document.write(getDateTimeHHmm('${requestScope.task.startDate}'));</script> 到 <script>document.write(getDateTimeHHmm('${requestScope.task.endDate}'));</script></dd>
			<dt>内 容</dt><dd>${requestScope.task.content }</dd>
		</dl>
		<s:if test='#request.isSelf!="1" && #request.task.status==1'>
			<p class="red7">注：请中标后再付款</p>
			<form action="${domain}/task/accept.do" method="post">
				<ul class="clearfix">
					<li class="li01"> 我要出价 <input type="text" id="qtpr" /> 元人民币</li>
					<li>付款帐号 <input type="text" id="qtacc"  /></li>
					<li><input type="button" value="提 交" onclick="submitAccept();" class="button" /></li>
				</ul>
			</form>
		</s:if>
		<ul class="tabUl clearfix">
			<li><a onclick="javascript:showdiv(1);" class="li01 on" href="#">所有出价 <span></span></a></li>
			<li><a onclick="javascript:showdiv(2);" class="li02" href="#">中标用户</a></li>
			<s:if test='#request.isSelf!="1"'><li><a onclick="javascript:showdiv(3);" class="li03" href="#">我的出价</a></li></s:if>
		</ul>
		<div class="tab01 comBox">
		<s:if test="#request.acceptList!=null && #request.acceptList.size()>0">
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
			<s:iterator value="#request.acceptList" status="status">
				<tr>
					<td><script>document.write(getDateTimeHHmm('${updateTime}'));</script></td>
					<td><strong>￥${quotePrice }</strong></td>
					<td><a href="${domain}/user/index.do?uid=${userId}" target="_blank" title="进他的主页">${userName }</a></td>
					<td><s:if test='#request.isSelf=="1"'>${userAcct }</s:if><s:else>保密</s:else></td>
					<td><s:if test='#request.isSelf=="1" && #request.task.taskAcptId==null'><input type="button" value="接 受" onclick="chooseWinner('${id}');" class="btn2" /></s:if><s:else><script>document.write(getAcceptStTxt('${status}'));</script></s:else></td>
				</tr>
			</s:iterator>
		</table>
		</s:if>
		<s:else>
			<p class="noQuotation">没有出价</p>
		</s:else>
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
				<s:if test="#request.winnedAccept!=null">
					<tr>
						<td><script>document.write(getDateTimeHHmm('${requestScope.winnedAccept.updateTime}'));</script></td>
						<td><strong>￥${requestScope.winnedAccept.quotePrice }</strong></td>
						<td><a href="${domain}/user/index.do?uid=${requestScope.winnedAccept.userId}" target="_blank" title="进他的主页">${requestScope.winnedAccept.userName }</a></td>
						<td><s:if test='#request.isSelf=="1"'>${requestScope.winnedAccept.userAcct }</s:if><s:else>保密</s:else></td>
						<td><script>document.write(getAcceptStTxt('${requestScope.winnedAccept.status }'));</script></td>
					</tr>
				</s:if>
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
				<s:if test="#request.myAccept!=null">
					<tr>
						<td><script>document.write(getDateTimeHHmm('${requestScope.myAccept.updateTime}'));</script></td>
						<td><strong>￥${requestScope.myAccept.quotePrice }</strong></td>
						<td><a href="${domain}/user/index.do?uid=${requestScope.myAccept.userId}" target="_blank" title="进他的主页">${requestScope.myAccept.userName }</a></td>
						<td><s:if test='#request.isSelf=="1"'>${requestScope.myAccept.userAcct }</s:if><s:else>保密</s:else></td>
						<td><script>document.write(getAcceptStTxt('${requestScope.myAccept.status }'));</script></td>
					</tr>
				</s:if>
			</table>
		</div>
	</div>
	<div class="sideBar">
		<p class="name"><a href="${domain}/user/index.do?uid=${requestScope.user.id}">${requestScope.user.name }</a><span>ID:<strong>${requestScope.user.id}</strong></span></p>
		<div class="photo"><a href="${domain}/user/index.do?uid=${requestScope.user.id}"><img src="${requestScope.user.icon1}" onerror="this.src='${domain }/images/default.jpg'" /></a></div>
		<p class="sure"><s:if test="#request.user.isAuth==1"><a href="${domain}/user/auth.do" target="_blank"><img src="${domain }/images/video/ico_videosure.gif" /></a>&nbsp;&nbsp;已通过视频认证</s:if>
		<s:else><a href="${domain}/user/auth.do" target="_blank"><img src="${domain}/images/video/ico_videosure1.gif" /></a> 未通过视频认证</s:else></p>
		<p class="grade">信誉等级：<img src="${domain }/images/video/diamond_1.png" alt="" /><img src="${domain }/images/video/diamond_1.png" alt="" /><img src="${domain }/images/video/diamond_1.png" alt="" /></p>
		<p class="mb20"><a href="${domain}/user/score.do?uid=${requestScope.user.id}" target="_blank">用户打分：<strong>${requestScope.user.userCredit.score }</strong> 分</a></p>
		<!-- <dl>
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
		</dl> -->
		<a href="${domain }/user/album.do?uid=${requestScope.user.id }">查看Ta的照片</a>
	</div>
</div>
<!-- END for 内容 -->
</body>
</html>