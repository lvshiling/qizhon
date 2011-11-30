<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> - ${requestScope.user.name}</title>
<style type="text/css">
#audit {
	margin: 30px auto 50px;
	width: 988px;
	color: #666;
}
#audit h1 {
	margin-bottom: 20px;
	padding: 5px 10px;
	font-size: 16px;
	border-bottom: 1px solid #EAEAEA;
	border-left: 5px solid #FF9000;
}
#audit table {
	margin-bottom: 40px;
	width: 100%;
	text-align: center;
}
#audit table th {
	padding: 10px 0;
	border-bottom: 1px solid #EDEDED;
}
#audit table td {
	padding: 10px 0;
	border-bottom: 1px solid #EDEDED;
}
#audit table thead input {
	vertical-align: -1px;
}
#audit table tbody td.photo img {
	width: 250px;
}
#audit table tbody img {
	width: 100px;
	border-radius: 3px;
}
#audit table tbody img:hover {
	filter:alpha(opacity=90);
	opacity:0.9;
}
#audit .button {
	text-align: center;
}
#audit .button li {
	margin: 0 10px;
	display: inline;
}
#audit .button li input {
	border: none;
	width: 150px;
	font-size: 14px;
	cursor: pointer;
	height: 30px;
	line-height: 30px;
	background-color: #EFEFEF;
	border-radius: 2px;
}
#audit .button .yes input {
	color: #FFF;
	background-color: #FF9000;
}
#audit .button .yes input:hover {
	filter:alpha(opacity=90);
	opacity:0.9;
}
</style>
<script type="text/javascript">
$(function(){
	//var oCheck=$("input:checkbox");
	var oCheck0=$("thead input:checkbox");
	oCheck0.click(function(){
		$('input[name="authIds"]').attr("checked",$(this).attr("checked"));
	});
});
function submitPass(){
	var sel = false;
	$('input[name="authIds"]').each(function(){
		if($(this).attr('checked')==true)
			sel = true;
	});
	if(!sel){
		alert('请至少勾选一项');
		return false;
	}
	$('#postform').attr('action','${domain}/user/passAuth.do');
	$('#postform').submit();
}
function submitUnpass(){
	var sel = false;
	$('input[name="authIds"]').each(function(){
		if($(this).attr('checked')==true)
			sel = true;
	});
	if(!sel){
		alert('请至少勾选一项');
		return false;
	}
	$('#postform').attr('action','${domain}/user/unpassAuth.do');
	$('#postform').submit();
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="audit" class="clearfix">
<h1>认证审核</h1>
<form id="postform" method="post">
	<table cellspacing="0" cellpadding="0">
		<col width="10%" />
		<col width="30%" />
		<col width="60%" />
		<thead>
		<tr>
			<th><label><input type="checkbox" value="" /> 全选</label></th>
			<th>参照照片</th>
			<th>审核照片</th>
		</tr>
		</thead>
		<tbody>
		<s:iterator value="#request.authList" status="status">
			<tr>
				<td><input name="authIds" type="checkbox" value="${id}" /></td>
				<td><label for="photo01"><img src="${domain}/upload/avatar/${userId}_1.jpg" /></label></td>
				<td class="photo"><label for="photo01"><img src="${domain}/upload/picture/${userId}/${photoName}" /></label></td>
			</tr>
		</s:iterator>
		</tbody>
	</table>
	<ul class="button clearfix">
		<li class="yes"><input type="button" onclick="submitPass();" value="通 过" /></li>
		<li><input type="button" onclick="submitUnpass();" value="不通过" /></li>
	</ul>
</form>
</div>
<!-- END for 内容 -->
</body>
</html>