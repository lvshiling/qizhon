<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理员审核页</title>
<style type="text/css">
#release {
	margin: 20px auto 50px;
	width: 988px;
	font-family: "Microsoft Yahei";
}
#release .main h1 {
	margin-bottom: 5px;
	padding: 5px 10px;
	font-size: 16px;
	color: #666;
	border-bottom: 1px solid #EAEAEA;
	border-left: 5px solid #FF9000;
}
#release .main table {
	margin-bottom: 20px;
	width: 100%;
	text-align:left;
}
#release .main .list th {
	padding: 15px 10px;
	text-align: left;
	border-bottom: 1px dashed #EAEAEA;
}
#release .main .list td {
	padding: 10px;
	border-bottom: 1px dashed #EAEAEA;
}
#release .main .list tr:hover td {
	background-color: #FFFEED;
}
#release .button {
	text-align: right;
}
#release .button li {
	margin-left: 10px;
	float: right;
}
#release .button li input {
  	border: none;
	width: 90px;
	cursor: pointer;
	height: 30px;
	line-height: 30px;
	display: block;
	background-color: #EFEFEF;
	border-radius: 2px;
}
#release .button li.btn input {
	color: #FFF;
	background-color: #FF9000;
}
</style>
<script type="text/javascript">
$(function(){
	//var oCheck=$("input:checkbox");
	var oCheck0=$("input:checkbox:eq(0)");
	oCheck0.click(function(){		
		$('input[name="acceptIds"]').attr("checked",$(this).attr('checked')); 
	});
});
function getAcceptStTxt(st){
	if(st=='1'){
		return "已出价";
	}else if(st=='2'){
		return "已中标";
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
function submitPass(){
	var sel = false;
	$('input[name="acceptIds"]').each(function(){
		if($(this).attr('checked')==true)
			sel = true;
	});
	if(!sel){
		alert('请至少勾选一项');
		return false;
	}
	$('#postform').attr('action','${domain}/task/passAccept.do');
	$('#postform').submit();
}
function submitUnpass(){
	var sel = false;
	$('input[name="acceptIds"]').each(function(){
		if($(this).attr('checked')==true)
			sel = true;
	});
	if(!sel){
		alert('请至少勾选一项');
		return false;
	}
	$('#postform').attr('action','${domain}/task/unpassAccept.do');
	$('#postform').submit();
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="release" class="clearfix">
	<div class="main">
			<h1>管理员审核页 <span style="font-size:12px;font-weight:normal;">(审核提交的订单是否已付款)</span></h1>
			<form id="postform" method="post">
				<table cellspacing="0" cellpadding="0" summary="" class="list">
					<col width="18%" />
					<col width="18%" />
					<col width="18%" />
					<col width="18%" />
					<col width="18%" />
					<col width="10%" />
					<tr>
						<th>时 间</th>
						<th>报 价</th>
						<th>用户名</th>
						<th>付款帐号</th>
						<th>状 态</th>
						<th><label><input type="checkbox" value="" /> 全选</label></th>
					</tr>
					<s:iterator value="#request.acceptList" status="status">
						<tr>
							<td><script>document.write(getDateTimeHHmm('${updateTime}'));</script></td>
							<td>￥${quotePrice }</td>
							<td>${userName }</td>
							<td>${userAcct }</td>
							<td><script>document.write(getAcceptStTxt('${status }'));</script></td>
							<td><input name="acceptIds" type="checkbox" value="${id}" /></td>
						</tr>
					</s:iterator>
				</table>
			</form>
	</div>
	<ul class="button clearfix">
		<li><input type="button" onclick="submitUnpass();" value="不通过" /></li>
		<li class="btn"><input type="button" onclick="submitPass();" value="通 过" /></li>
	</ul>
</div>
<!-- END for 内容 -->
</body>
</html>