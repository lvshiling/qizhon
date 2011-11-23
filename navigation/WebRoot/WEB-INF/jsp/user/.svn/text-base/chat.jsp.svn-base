<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>在线聊天 多人 - ${siteTitle}</title>
<script type="text/javascript" src="${domain }/js/lib/swfobject.js"></script>
<script type="text/javascript" src="${domain }/js/lib/flowplayer-3.2.6.min.js"></script>
<style type="text/css">
#userInfoTable td,#userInfoTableShow td{padding: 10px; font-size: 14px;}
#userInfoTableShow{ width: 100%;}
#ShowStageManager{position:absolute; height:500px; width:940px; z-index:106; background-color-alpha:1;}
</style>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix" onmousedown="rclick()" oncontextmenu="nocontextmenu()">
<div id="altContent"></div>
  <div id="userContent" style="height: 600px;">
		<div class="fleft pd05" style="border-right: 1px solid #ccc; height: 400px; width:465px;">
			<div class="ft14">
				${requestScope.user.name } 的房间 ID:${requestScope.user.id } <span style="color: #ffffff;">${userId } ${hostId }</span>
				<hr />
				<div id="flashContent" style="width: 460px; height: 350px;"></div>
				<s:if test="#request.userId == #request.hostId">
					<script type="text/javascript">
					//主要模块 
					$(function(){
						var swfVersionStr_public = "10.1.0"; 
					    var xiSwfUrlStr_public = "${domain}/images/swf/expressInstall.swf"; 
						var attributes_public = {};
						var params_public = {};
						params_public.wmode = "transparent";
						var flashvars_public = {};
						flashvars_public.key = "${requestScope.roomKey}";
						flashvars_public.rtmpUrl = "${requestScope.red5Server}";
						flashvars_public.saveUrl = "${requestScope.red5Server}";
						flashvars_public.uid = "${userToken.user.id }";
						flashvars_public.saveUrl = "${domain}/user/ajaxUploadHeadPage.do";
						swfobject.embedSWF("${domain}/images/swf/TVShow.swf", "flashContent", "460", "350", swfVersionStr_public, 
						      xiSwfUrlStr_public, flashvars_public, params_public, attributes_public); 
					});
					</script>
				</s:if>
				<s:else>
					<script type="text/javascript">
					//客户模块
					$f("flashContent", {src:"${domain}/images/swf/flowplayer.swf",wmode:"transparent"}, {
					clip: {
						url: '${requestScope.roomKey}me',
						live: true,
						bufferLength: 0.1,
						provider: 'qule',
						backBufferLength: 20
					},
					debug: false,
					log : {
						level  : 'debug',
						//filter : '*'
						//filter : 'org.flowplayer.view.Launcher',
						//filter : 'org.flowplayer.controls.*',
						//filter : 'org.flowplayer.controller.*',
						filter : 'org.flowplayer.rtmp.*'
					},
					onFullscreenExit : function(){
					},
					onBufferEmpty : function(){
						//al("直播中断");
					},
					onError : function(code){
						al("出错了:"+code);
					},
					plugins: {
						controls: {
							// display properties
							bottom:0,
							right:180,
							width:170,
							rotation:60, 
							//height:24,
							zIndex:1,
							//backgroundColor: '#2d3e46',
							//backgroundGradient: 'low',
							// controlbar-specific configuration
							//fontColor: '#ffffff',
							//timeFontColor: '#333333',
							// which buttons are visible and which are not?
							play:true,
							volume:true,
							mute:true,
							time:false,
							stop:false,
							playlist:false,
							fullscreen:true,
							// scrubber is a well-known nickname for the timeline/playhead combination
							scrubber: false,
							autoHide: 'always'
						},
						qule: {
								url: "org.flowplayer.rtmp.RTMPStreamProvider",
								netConnectionUrl: '${requestScope.red5Server}'
						}
					},
					width: "420",
					height:"350"
					});
					</script>
				</s:else>
				<div>
					<hr />
					余额：<span id="creditAmount">${requestScope.credit.credit }</span>
					<hr />
					<input type="button" value="送我爱你" onclick="sendGift('rose');" />
					<input type="button" value="送玫瑰花" onclick="sendGift('rose');" />
					<hr />
					<form action="${domain }/pay/payPage.do" target="_blank">
						<input name="amount" value="10" />
						<input type="submit" value="充值" />
					</form>
					<hr />
				</div>
				<img class="pt10" src="${requestScope.user.icon1 }" width="180" />
			</div>
		</div>
		<div class="pd05" style="margin-left: 475px;">
			<div id="userInfo">
				<div>
					<span class="ft14">聊天室</span>
					<hr />
					<div>
						<div id="roomChatContent" class="wp60 fleft pd05" style="background-color: #eee; height: 250px; overflow: auto; line-height: 150%;">
						</div>
						<div id="roomMateContent" class="wp30 fright mr10 pd05" style="background-color: #eee; height: 250px;">
							人员列表
						</div>
						<div class="wp60 fleft mt10 pd05" style="background-color: #eee; height: 100px;">
							<form id="chatForm" onsubmit="sendGroupMsg();return false;">
								<input id="chatContent" class="wp50 pd05"></input>
								<input type="submit" value="发送" />
								<input type="button" value="clear" onclick="$('#roomChatContent').html('');" />
							</form>
							<div id="chatRoomContent" class="none"></div>
							<div id="logger" style="height: 100px; overflow: auto;">1111</div>
						</div>
					</div>
				</div>
			</div>
		</div>
  </div>
</div>
<script type="text/javascript">
var ct = "quleRoom";
var flashvars = {};
$(function(){
	var swfVersionStr = "10.1.0"; 
    var xiSwfUrlStr = "${domain}/images/swf/expressInstall.swf"; 
	var attributes = {};
	attributes.id = ct;
	var params = {};
	params.wmode = "transparent";
	flashvars.nickName = "${userToken.user.name }";
	flashvars.groupName = "${requestScope.user.id }";
	flashvars.anonymous = "NO";
	flashvars.userName = "${userToken.user.id }";
	flashvars.password = "${userToken.user.password }";
	flashvars.connectionType = "socket";
	flashvars.server = "${requestScope.xamppServer}";
	flashvars.domain = "";
	flashvars.resource = "web";
	flashvars.priority = "0";
	swfobject.embedSWF("${domain}/images/swf/Room.swf", "chatRoomContent", "100%", "100%", swfVersionStr, 
	      xiSwfUrlStr, flashvars, params, attributes);
});
$(function(){
	var flashvars = {};
	var params = {
		menu: "false",
		scale: "noScale",
		allowFullscreen: "true",
		allowScriptAccess: "always",
		bgcolor: "",
		wmode: "transparent"
	};
	var attributes = {
		id:"ShowStageManager",
		style:"visibility: hidden; z-index: 200; "
	};
	swfobject.embedSWF("${domain}/images/swf/ShowStageManager.swf?_="+Math.random(), "altContent", "100%", "100%", "10.0.0",
		 "expressInstall.swf", flashvars, params, attributes);
});
function nocontextmenu(){ 
	if(document.all){
		event.cancelBubble=true;
		event.returnvalue=false; 
		return false; 
	}
}
function rclick(){
	if(document.all && event.button == 2)
		event.returnvalue=false;
}
function OnBeginShowGift(){
}
function onEndShowGift(){
	$("#logfla").append(Math.random()+"load<br>");
	$('#ShowStageManager').css("visibility","hidden");
}
function sendGroupMsg(){
	var txt = $("#chatContent").val();
	if(txt){
		var room = getRoom();
		room.sendGroupMsg(txt);
		document.getElementById("chatForm").reset();
	}
}
function onReceivedGroupMsg(from,txt){
	if(from == "null") from = "系统";
	if(txt.indexOf("__gift__") == -1){
		$("#roomChatContent").append(from+":"+txt+"<br />");
	}else{
		var pos = txt.indexOf("__gift__");
		var str = txt.substring(8).split(",");
		if(str.length == 2){
			//alert("<img src='${static}/images/gift/"+str[0]+".gif'>");
			//$("#giftStage").css("display", "block");
			//document.getElementById("playStage").sendGift("rose",100,"RAND_POINT","v");
			$('#ShowStageManager').css("visibility","visible");
			window.setTimeout("sendShapeGift();",500);
		}
	}
	scrollToBottom();
}
function sendShapeGift(){
	var obj = document.getElementById("ShowStageManager");
	if(obj) obj.sendGift('rose', 100, "RAND_POINT","v");
}
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
    var scrollTop = $("#roomChatContent")[0].scrollHeight;
    $("#roomChatContent").scrollTop(scrollTop);
}
function onRoomJoin(){}
function onRoomLeave(){}
function getRoomates(){
	var list = getRoom().getPartList().split(";");
	var t = '<ul>';
	$.each(list,function(i,n){
		var nick = n.substr(0,n.indexOf(","));
		var jid = n.substr(n.indexOf(",")+1);
		if(nick != flashvars.nickName){
			var uid = jid.substr(0,jid.indexOf("@"));
			t += "<li><a href='javascript:openIm(\""+uid+","+nick+"\");' >"+nick+"</a></li>";
		}else t += "<li>"+nick+"</li>";
	});
	$("#roomMateContent").html(t+"</ul>");
}
function onUserJoin(){getRoomates();}
function onUserDeparture(){getRoomates();}
function sendGift(gift,count){
	$.post("${domain}/user/ajaxSendGiftApi.do", {"target":gift,"_":"${requestScope.user.id }"}, function(d){
		if(d['status'] == 1){
			onReceivedGroupMsg("system","送成功了");
			if(d.values){
				if(d.values.credit) $("#creditAmount").html(d.values.credit);
			}
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"修改失败");
	},'json');
}	
function openIm(to){
	imWindow = window.open("${domain}/user/imPage.do?target="+ to, "quleIm"+ to, "height=550,width=750,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,location=no,status=no");
	imWindow.focus();
}
function onReceivedPrivateMsg(from,txt,type){
	if(type != "groupchat"){
		alert("收到私信"+from+" "+txt);
	}
}
function getRecordName(){
	return "${requestScope.roomKey}me";
}
function onRecordEnd(df){
	//alert("录制成功回调___"+df);
	$.post("${domain}/user/ajaxRecordEndApi.do", {"recordFileName":df}, function(d){
		if(d['status'] == 1){
			alert("视频录制上传成功");
		}else if(d['status'] == -2){
			login();
		}else{
			alert(d['message']||"视频上传失败");
		}
	},'json');
}
function onliveStart(){}
function onliveEnd(){}
</script>
<div id="logfla" style="height:100px; overflow:auto;"></div>
<!-- END for 内容 -->
</body>
</html>