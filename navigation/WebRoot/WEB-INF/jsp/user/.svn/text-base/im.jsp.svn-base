<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>IM - ${siteTitle}</title>
<script type="text/javascript" src="${domain }/js/lib/swfobject.js"></script>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
	<div id="contactContent" class="fleft w100 pd05"></div>
	<div id="imChatContent" class="wp60 fleft pd05" style="background-color: #eee; height: 250px; overflow: auto; line-height: 150%;"></div>
	<div class="clear"></div>
	<form id="imForm" onsubmit="sendImMsg();return false;" style="margin-left: 100px;" class="pd10">
		<input id="imTextContent" class="w200 pd05" type="text"></input>
		<input type="submit" value="发送" />
		<input type="button" value="clear" onclick="$('#imChatContent').html('');" />
	</form>
	<div id="imContent" class="none"></div>
	<div id="logger" style="height: 100px; overflow: auto;">1111</div>
</div>
<script type="text/javascript">
var ct = "quleIm";
var target = "${target}";
var global_to = target.substr(0,target.indexOf(","));
var global_to_name = target.substr(target.indexOf(",")+1);
var global_contacts = [];
$(function(){
	var swfVersionStr = "10.1.0"; 
    var xiSwfUrlStr = "${domain}/images/swf/expressInstall.swf"; 
	var attributes = {};
	attributes.id = ct;
	var params = {};
	params.wmode = "transparent";
	var flashvars = {};
	flashvars.nickName = "${userToken.user.name }";
	flashvars.groupName = "${requestScope.user.id }";
	flashvars.anonymous = "NO";
	flashvars.userName = "${userToken.user.id }";
	flashvars.password = "${userToken.user.password }";
	flashvars.connectionType = "socket";
	flashvars.server = "${requestScope.xamppServer}";
	flashvars.domain = "";
	flashvars.resource = "im"+flashvars.userName+"_"+global_to;
	flashvars.priority = "99";
	swfobject.embedSWF("${domain}/images/swf/Room.swf", "imContent", "1", "1", swfVersionStr, 
	      xiSwfUrlStr, flashvars, params, attributes); 
	global_contacts.push(global_to_name);
	parseContactList();
});

function onRoomComplete(){
	log("JSLOG：","初始化成功！");
}
function getRoom(){return document.getElementById(ct);}
function error(errorCondition, errorMessage){
	al("Error: " + errorCondition + " " + errorMessage);
}
function log(errorCondition, errorMessage){
	$('#logger').append('<ul>'+'<li>'+errorCondition+''+errorMessage+'</li>'+'</ul>');
}
function scrollToBottom() {
    var scrollTop = $("#imChatContent")[0].scrollHeight;
    $("#imChatContent").scrollTop(scrollTop);
}
function sendImMsg(){
	var txt = $("#imTextContent").val();
	if(txt){
		var room = getRoom();
		room.sendPrivate(global_to,txt);
		document.getElementById("imForm").reset();
	}
}
function onReceivedPrivateMsg(from,txt,type){
	$("#imChatContent").append("FROM "+from+":"+txt+"<br />");
	scrollToBottom();
}
function onOutGoing(to,txt){
	$("#imChatContent").append("TO "+to+":"+txt+"<br />");
	scrollToBottom();
}
function parseContactList(){
	var t = "<ul>";
	$.each(global_contacts,function(i,n){
		t += "<li>"+n+"</li>"
	});
	t += "</ul>";
	$("#contactContent").html(t);
}
</script>
<!-- END for 内容 -->
</body>
</html>