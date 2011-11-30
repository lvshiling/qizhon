<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="${domain }/js/video/calendar.js"></script>
<title>任务首页</title>
<style type="text/css">
#release {
	margin: 20px auto 20px;
	width: 988px;
	font-family: "Microsoft Yahei";
}
#release .highlit {
	color: #DC3E00;
	font-weight:bold;
}
#release .main {
	width: 760px;
	float: right;
}
#release .main h1 {
	margin-bottom: 5px;
	padding: 5px 10px;
	font-size: 16px;
	color: #666;
	border-bottom: 1px solid #EAEAEA;
	border-left: 5px solid #FF9000;
}
#release .main .comBox {
	display: none;
}
#release .main .comBox table {
	margin-bottom: 20px;
	width: 100%;
	text-align:left;
}
#release .main .comBox .list th {
	padding: 15px;
	border-bottom: 1px dashed #EAEAEA;
	text-align:center;
}
#release .main .comBox .list td {
	padding: 10px;
	border-bottom: 1px dashed #EAEAEA;
	text-align:center;
}
#release .main .comBox .list tr:hover td {
	background-color: #FFFEED;
}
#release .main .comBox .list td select {
    border: 1px solid #D2D2D2;
    color: #666;
    width: 70px;
    font-family: Arial,Helvetica,sans-serif;
    padding: 1px;
    background: url(${domain }/images/video/release/form-input.png) no-repeat left top;
}
#release .main .showdiv_1 {
	display: block;
}

#release .main .showdiv_1 h1 {
	margin-bottom: 30px;
}
#release .main .showdiv_1 .title {
	margin-bottom: 30px;
}
#release .main .showdiv_1 table {
	margin: 0 0 20px 0;
}
#release .main .showdiv_1 th {
	padding: 5px;
	vertical-align: top;
}
#release .main .showdiv_1 td {
	padding: 5px;
}
#release .main .showdiv_1 td input,
#release .main .showdiv_1 td textarea,
#release .main .showdiv_1 td select {
    border: 1px solid #D2D2D2;
    color: #666;
    width: 500px;
    font-family: Arial,Helvetica,sans-serif;
    padding: 4px;
    background: url(${domain }/images/video/release/form-input.png) no-repeat left top;
}

#release .main .showdiv_1 td .s_time,
#release .main .showdiv_1 td .e_time {
	padding: 0 0 0 4px;
	width: 180px;
	height: 28px;
	line-height: 28px;
	border: none;
	cursor:pointer;
	background: url(${domain }/images/video/release/form-time.gif) no-repeat left top;
}
#release .main .showdiv_1 td select {
    width: 179px;
}
#release .main .showdiv_1 .submit {
	margin-left: 82px;
}
#release .main .showdiv_1 .submit li {
	margin-right: 15px;
	float: left;
}
#release .main .showdiv_1 .submit li input {
	border: none;
	width: 95px;
	font-size: 14px;
	cursor: pointer;
	line-height: 30px;
	background-color: #EFEFEF;
	border-radius: 2px;
}

#release .main .showdiv_1 .submit .subm input {
	color: #FFF;
	background-color: #FF9000;
}

#release .sideBar {
	padding: 10px 0 300px 0;
	width: 200px;
	float: left;
	border: 1px solid #EAEAEA;
}
#release .sideBar .s_top {
	margin-bottom: 10px;
	text-align: center;
}
#release .sideBar .s_top p {
	margin: 0 0 10px 10px;
	font-size: 14px;
	line-height:1.6;
	text-align: left;
	font-weight: bold;
}
#release .sideBar .s_top p strong {
	margin: 0 5px 0 35px;
	font-size: 18px;
	color: #FF9000;
    font-weight: bold;
}
#release .sideBar .s_top p span {
	font-size: 12px;
    font-weight: normal;
}
#release .sideBar .s_top a {
	display: block;
	line-height:1.7;
	color: #FFF;
	font-size: 18px;
	font-weight: bold;
	background-color: #FF9000; 
}
#release .sideBar .s_top a:hover {
 	text-decoration: none;
	background-color: #ffba00; 
}
#release .sideBar ul {
	margin: 0 10px 0 10px;
}
#release .sideBar ul li {
	border-bottom: 1px solid #EAEAEA;
}
#release .sideBar ul li a {
	padding: 7px 10px;
	font-size: 14px;
	display: block;
	color: #424542;
	text-align: left;
}
#release .sideBar ul li a:hover {
 	text-decoration: none;
	background-color: #EFEFEF;
}
#release .sideBar ul li a:hover {
 	text-decoration: none;
	background-color: #EFEFEF;
}

#release .main .page li {margin-left: 5px;float:right;}
#release .main .page li a {padding: 2px 6px;text-decoration: none;}
#release .main .page li a.on,#release .main .page li a:hover {color:#FFF;background-color:#FF9000;}
</style>
<script type="text/javascript">
document.onkeydown = function(evt){
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	var act = document.activeElement.id;
	if(act == "pubprice"){
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
$(function(){
	$('#navbar a.lit').removeClass('lit');
	$('#navbar #nv_task').addClass('lit');
	$('#navbar #nv_task').attr('target','_self');
	
	if('${requestScope.successFlag}'=='1'){
		alert('提交成功！');
		$('#pubprice').focus();
	}
});
function showdiv(type){
	$('.comBox').hide();
	$('.showdiv_'+type).show();
	$('.tab li a').removeClass("on");
	$('.tab li .li0'+type).addClass("on");
}
function getTaskStTxt(st){
	if(st=='1'){
		return "已发布";
	}else if(st=='2'){
		return "已中标";
	}else if(st=='3'){
		return "已结束";
	}else if(st=='-1'){
		return "未付款";
	}else if(st=='-2'){
		return "<span class='highlit'>已付款</span>";
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
	}else if(st=='-1'){
		return "未中标";
	}else if(st=='-2'){
		return "未付款";
	}else if(st=='-3'){
		return "已失效";
	}else{
		return "";
	}
}
function setStatusPayed(t){
	var id = $('#aid_'+t).val();
	$.post("${domain}/task/ajaxUpdateAcceptStatusApi.do?", {"id":id,"status":"3"}, function(d){
		if(d['status'] == 1){
			$('#ast_'+t).text('已付款待确认');
		}else if(d['status'] == -2){
			login();
		}else alert("状态修改失败：" + d['message']);
	},'json');
}
function setStatusClose(t){
	var id = $('#tid_'+t).val();
	$.post("${domain}/task/ajaxUpdateTaskStatusApi.do?", {"id":id,"status":"3"}, function(d){
		if(d['status'] == 1){
			$('#tst_'+t).text('已结束');
		}else if(d['status'] == -2){
			login();
		}else alert("状态修改失败：" + d['message']);
	},'json');
}
function setStatusReopen(t){
	var id = $('#tid_'+t).val();
	$.post("${domain}/task/ajaxUpdateTaskStatusApi.do?", {"id":id,"status":"1"}, function(d){
		if(d['status'] == 1){
			$('#tst_'+t).text('已发布');
		}else if(d['status'] == -2){
			login();
		}else alert("状态修改失败：" + d['message']);
	},'json');
}
function publishTask(){
	if(!checkDateTime($('#pubsdate').val())){
		alert('请输入开始时间');
		return false;
	}
	if(!checkDateTime($('#pubedate').val())){
		alert('请输入结束时间');
		return false;
	}
	if($('#pubprice').val()==''){
		alert('请输入价格');
		return false;
	}
	var title = trim($('#pubtitle').val());
	if(title.length<1){
		alert('请输入任务标题');
		return false;
	}else if(title.length>20){
		alert('标题超长');
		return false;
	}
	var content = trim($('#pubcontent').val());
	if(content.length<1){
		alert('请输入任务内容');
		return false;
	}else if(content.length>350){
		alert('内容超长');
		return false;
	}
	$('#pubform').submit();
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="release" class="clearfix">
	<div class="main">
			<div class="comBox showdiv_1 clearfix">
			<form id="pubform" action="${domain}/task/publish.do" method="post">
				<h1>发布任务</h1>
				<p class="title">为了您的快速交易,请尽量填写详细</p>
				<table cellspacing="0" cellpadding="0" summary="">
					<col width="10%" />
					<col width="90%" />
					<tr>
						<th>时 间</th>
						<td><input class="s_time" id="pubsdate" name="startDate" type="text" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss',0,-1)" readonly="readonly" value="请选择开始时间" /> - <input class="e_time" id="pubedate" name="endDate" type="text" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss',0,-1)" readonly="readonly" value="请选择结束时间" />
						</td>
					</tr>
					<tr>
						<th>价 格</th>
						<td><input type="text" id="pubprice" name="price" style="width:160px;" /> 元人民币</td>
					</tr>
					<tr>
						<th>标 题</th>
						<td><input name="title" id="pubtitle" type="text" /></td>
					</tr>
					<tr>
						<th>内 容</th>
						<td><textarea name="content" id="pubcontent" cols="" rows="5"></textarea></td>
					</tr>
				</table>
				<ul class="submit">
					<li class="subm"><input type="button" onclick="publishTask();" value="提 交" /></li>
					<li><input type="reset" value="重 置" /></li>
				</ul>
			</form>
			</div>
			<div class="comBox showdiv_2 clearfix">
			<h1>我发布的任务</h1>
				<table cellspacing="0" cellpadding="0" summary="" class="list">
					<col width="29%" />
					<col width="30%" />
					<col width="17%" />
					<col width="12%" />
					<col width="12%" />
					<tr>
						<th>时 间</th>
						<th>标 题</th>
						<th>发布人</th>
						<th>价 格</th>
						<th>状 态</th>
					</tr>
					<s:iterator value="#request.pubList" status="status">
						<tr>
							<td>开始时间：<script>document.write(getDateTimeHHmm('${startDate}'));</script><br />
								 结束时间：<script>document.write(getDateTimeHHmm('${endDate}'));</script></td>
							<td><a href="${domain }/task/detail.do?id=${id }" style="text-decoration:underline;" target="_blank">${name }</a></td>
							<td>${userName}</td>
							<td>￥${offerPrice }<input type="hidden" value="${id}" id="tid_<s:property value='#status.index'/>" /></td>
							<s:if test="status==1"><td id="tst_<s:property value='#status.index'/>">已发布<br/>[<a href="javascript:setStatusClose('<s:property value="#status.index"/>');void(0);">结束任务</a>]</td></s:if>
							<s:elseif test="status==-1"><td id="tst_<s:property value='#status.index'/>">中标未付款<br/>[<a href="javascript:setStatusClose('<s:property value="#status.index"/>');void(0);">结束任务</a>]<br/>[<a href="javascript:setStatusReopen('<s:property value="#status.index"/>');void(0);">重新打开</a>]</td></s:elseif>
							<s:else><td id="tst_<s:property value='#status.index'/>"><script>document.write(getTaskStTxt('${status}'));</script></td></s:else>
						</tr>
					</s:iterator>
				</table>
				<!-- <ul class="page clearfix">
						<li><a href="#">下一页</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#" class="on">1</a></li>		
				</ul> -->
			</div>
			<div class="comBox showdiv_3 clearfix">
			<h1>我接受的任务</h1>
				<table cellspacing="0" cellpadding="0" summary="" class="list">
					<col width="29%" />
					<col width="28%" />
					<col width="17%" />
					<col width="12%" />
					<col width="14%" />
					<tr>
						<th>任务时间</th>
						<th>任务标题</th>
						<th>任务发布人</th>
						<th>我的出价</th>
						<th>订单状态</th>
					</tr>
					<s:iterator value="#request.acceptList" status="status">
						<tr>
							<td>开始时间：<script>document.write(getDateTimeHHmm('${task.startDate}'));</script><br />
								 结束时间：<script>document.write(getDateTimeHHmm('${task.endDate}'));</script></td>
							<td><a href="${domain }/task/detail.do?id=${task.id }" style="text-decoration:underline;" target="_blank">${task.name }</a></td>
							<td>${task.userName}</td>
							<td>￥${quotePrice }<input type="hidden" value="${id}" id="aid_<s:property value='#status.index'/>" /></td>
							<s:if test="status==2"><td id="ast_<s:property value='#status.index'/>"><span class='highlit'>已中标</span><br/>[<a href="javascript:setStatusPayed('<s:property value="#status.index"/>');void(0);">置为已付款</a>]</td></s:if>
							<s:else><td id="ast_<s:property value='#status.index'/>"><script>document.write(getAcceptStTxt('${status}'));</script></td></s:else>
						</tr>
					</s:iterator>
				</table>
				<!-- <ul class="page clearfix">
						<li><a href="#">下一页</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#" class="on">1</a></li>		
				</ul> -->
			</div>
	</div>
	<div class="sideBar">
		<div class="s_top">
			<p>当前共有<br /><strong>${requestScope.taskCount }</strong><span>个任务</span></p>
			<a href="${domain }/task/center.do">任务大厅</a>
		</div>
		<ul>
			<li><a onclick="javascript:showdiv(1);" class="li01" href="#">发布任务</a></li>
			<li><a onclick="javascript:showdiv(2);" class="li02" href="#">我发布的任务</a></li>
			<li><a onclick="javascript:showdiv(3);" class="li03" href="#">我接受的任务</a></li>	
		</ul>
	</div>
</div>

<!-- END for 内容 -->
</body>
</html>