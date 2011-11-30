<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>在线聊天 多人 - ${requestScope.user.name}</title>
<script type="text/javascript" src="${domain }/js/lib/swfobject.js"></script>
<script type="text/javascript" src="${domain }/js/lib/flowplayer-3.2.6.min.js"></script>
<style type="text/css">
#userInfoTable td,#userInfoTableShow td{padding: 10px; font-size: 14px;}
#userInfoTableShow{ width: 100%;}
#ShowStageManager{position:absolute; height:600px; width:940px; z-index:106; background-color-alpha:1;}
</style>
</head>
<body>
<!-- 内容 -->
<div id="chat">
<div style="margin:12px auto 3px;"><jsp:include page="gnavi.jsp" /></div>
<div id="roomContent">
	<div id="altContent"></div>
	<div id="introContainer">
		<div id="introBox">
			<div class="avatarBox">
				<a href="${domain}/user/index.do?uid=${requestScope.userId }"><img src="${requestScope.user.icon1}" onerror="this.src='${requestScope.user.icon}';" width="70" height="68" /></a>
			</div>
			<div class="rightIntroBox">
				<div class="ln1">
					<div class="fleft"><span class="red1"><a href="${domain}/user/index.do?uid=${requestScope.userId }" style="color:#e37d00;">${requestScope.user.name}</a></span><img src="${domain }/images/video/diamond_3.png" /><br />
					明星等级：<span class="gray1"><script>document.write(getStarGradeText(${requestScope.user.userCredit.starGrade}));</script></span><span class="tabs"></span>魅力值：<span class="gray1">${requestScope.user.userCredit.visits}</span></div>
					<s:if test="userToken.user != null">
						<s:if test="!#request.isSelf">
							<div class="fright"><a href="javascript:;" onclick="addAttention();"><img src="${domain }/images/video/att_btn.png" /></a></div>
						</s:if>
					</s:if>
					<s:else>
						<div class="fright"><a href="javascript:;" onclick="login();"><img src="${domain }/images/video/att_btn.png" /></a></div>
					</s:else>
				</div>
				<div class="ln2">没有直播</div>
				<div class="ln3"><span class="ts1">家族<img src="${domain }/images/video/arr_down.png" style="margin-top:3px;" />|&nbsp;&nbsp;分享到&nbsp;</span><span class="ts2"><img src="${domain }/images/video/sh_renren.jpg" /><img src="${domain }/images/video/sh_sina.jpg" /><img src="${domain }/images/video/sh_kaixin.jpg" /><img src="${domain }/images/video/sh_tt.jpg" /><img src="${domain }/images/video/sh_baidu.jpg" /><img src="${domain }/images/video/sh_qzone.jpg" /><img src="${domain }/images/video/sh_weibo.jpg" /></span></div>
			</div>
		</div>
		<div id="infoBox">
			<s:if test="#request.mode=='debug'">
				<div id="logger" style="height: 115px; overflow: auto;">debug</div>
			</s:if>
			<s:else>
				<ul style="padding-top:10px; padding-left:18px; line-height:22px; color:#6c6c6c;">
					<li>系统消息：美女面对面教你玩游戏！</li>
					<li>系统消息：美女主播火热招募中！</li>
					<li>系统消息：美女主播火热招募中！</li>
					<li>系统消息：美女主播火热招募中！</li>
				</ul>
			</s:else>
		</div>
	</div>
	<div id="chatContainer">
		<div id="videoBox">
			<div id="flashContent" class="video"></div>
			<div id="smallfms" class="video2" style="background-color:transparent;width:160px;height:160px;display:block;position:relative;left:290px;top:-160px;"></div>
			<s:if test="#request.isSelf">
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
					flashvars_public.rtmpUrl = "${requestScope.redOrginServer}";
					//flashvars_public.saveUrl = "${requestScope.redOrginServer}";
					flashvars_public.uid = "${userToken.user.id }";
					flashvars_public.saveUrl = "${domain}/user/ajaxUploadHeadPage.do";
					swfobject.embedSWF("${domain}/images/swf/TVShow.swf", "flashContent", "450", "333", swfVersionStr_public, 
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
				canvas: {
					backgroundImage: 'url(${domain}/images/swf/hotspot.jpg)'
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
						right:160,
						width:130,
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
						fullscreen:false,
						// scrubber is a well-known nickname for the timeline/playhead combination
						scrubber: false,
						autoHide: 'always'
					},
					qule: {
							url: "org.flowplayer.rtmp.RTMPStreamProvider",
							netConnectionUrl: '${requestScope.red5Server}'
					}
				},
				width: "450",
				height:"333"
				});
				</script>
				
				<s:if test="#request.user.userLogState.camNum==2">
				<script type="text/javascript">
				//嵌入小视频
				$f("smallfms", 
				{
					src:"${domain}/images/swf/flowplayer.swf",
					id:'picFms',
					wmode: 'transparent'
				},
				{
				clip: {
					url: '${requestScope.roomKey}meSMALL',
					live: true,
					bufferLength: 0.001,
					backBufferLength: 1,
					// configure clip to use influxis as our provider, it uses our rtmp plugin
					provider: 'qule'
				},
				//canvas: {
				//	backgroundImage: 'url(${domain}/images/swf/v160.jpg)'
				//},
				debug: false,
				log : {
					level  : 'debug',
					//filter : '*'
					//filter : 'org.flowplayer.view.Launcher',
					//filter : 'org.flowplayer.controls.*',
					//filter : 'org.flowplayer.controller.*',
					filter : 'org.flowplayer.rtmp.*'
				},
				plugins: {
					controls: {
						// display properties
						bottom:0,
						right:200,
						width:140,
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
						fullscreen:false,
						// scrubber is a well-known nickname for the timeline/playhead combination
						scrubber: false,
						autoHide: 'always'
					},
					qule: {
							url: "org.flowplayer.rtmp.RTMPStreamProvider",
							netConnectionUrl: '${requestScope.red5Server}'
					}
				}
				});
				</script>
				</s:if>
			</s:else>
			<div id="ln1">
				<div class="ln3">沙发空缺中，还不快抢~</div>
				<div class="ln4">
					<img src="${domain }/images/video/seated.gif" /><img src="${domain }/images/video/seated.gif" /><img src="${domain }/images/video/unseated.gif" /><img src="${domain }/images/video/unseated.gif" /><img src="${domain }/images/video/unseated.gif" />
				</div>
			</div>
			<div id="ls1" class="hid">
				<ul>
					<li><a href="javascript:;" id="rose" onclick="selOneGift(this);" title="价值：5个乐币"><img src="${domain }/images/gift/rose.png" width="22" height="22" /><br/><label>玫瑰</label></a></li>
					<li><a href="javascript:;" id="pig" onclick="selOneGift(this);" title="价值：10个乐币"><img src="${domain }/images/gift/pig.png" width="22" height="22" /><br/><label>猪头</label></a></li>
					<li><a href="javascript:;" id="bouquet" onclick="selOneGift(this);" title="价值：10个乐币"><img src="${domain }/images/gift/bouquet.png" width="22" height="22" /><br/><label>花束</label></a></li>
					<li><a href="javascript:;" id="lollipop" onclick="selOneGift(this);" title="价值：20个乐币"><img src="${domain }/images/gift/lollipop.png" width="22" height="22" /><br/><label>棒棒糖</label></a></li>
					<li><a href="javascript:;" id="blueRose2" onclick="selOneGift(this);" title="价值：30个乐币"><img src="${domain }/images/gift/blueRose2.png" width="22" height="22" /><br/><label>蓝玫瑰</label></a></li>
					<li><a href="javascript:;" id="washboard" onclick="selOneGift(this);" title="价值：30个乐币"><img src="${domain }/images/gift/washboard.png" width="22" height="22" /><br/><label>搓板</label></a></li>
					<li><a href="javascript:;" id="cigarette" onclick="selOneGift(this);" title="价值：40个乐币"><img src="${domain }/images/gift/cigarette.png" width="22" height="22" /><br/><label>香烟</label></a></li>
					<li><a href="javascript:;" id="kiss" onclick="selOneGift(this);" title="价值：50个乐币"><img src="${domain }/images/gift/kiss.png" width="22" height="22" /><br/><label>么么</label></a></li>
					<li><a href="javascript:;" id="lozenge" onclick="selOneGift(this);" title="价值：50个乐币"><img src="${domain }/images/gift/lozenge.png" width="22" height="22" /><br/><label>喉宝</label></a></li>
					<li><a href="javascript:;" id="wine" onclick="selOneGift(this);" title="价值：60个乐币"><img src="${domain }/images/gift/wine.png" width="22" height="22" /><br/><label>啤酒</label></a></li>
					<li><a href="javascript:;" id="eyeCream" onclick="selOneGift(this);" title="价值：60个乐币"><img src="${domain }/images/gift/eyeCream.png" width="22" height="22" /><br/><label>眼霜</label></a></li>
					<li><a href="javascript:;" id="cow" onclick="selOneGift(this);" title="价值：80个乐币"><img src="${domain }/images/gift/cow.png" width="22" height="22" /><br/><label>奶牛</label></a></li>
					<li><a href="javascript:;" id="rose99" onclick="selOneGift(this);" title="价值：100个乐币"><img src="${domain }/images/gift/rose99.png" width="22" height="22" /><br/><label>爱心</label></a></li>
				</ul>
			</div>
			<div class="ln2">
				<img id="giftico" src="${domain }/images/video/gift_ico.gif" style="margin-right:8px;" width="15" height="15" />
				<input type="hidden" id="giftId" />
				<a href="javascript:;" onclick="selectGift();"><img src="${domain }/images/video/giftbox_btn.gif" /></a>
				数量<input type="text" class="txt w50" id="giftCount" value="50" />给<select style="height:25px;vertical-align:middle;padding:2px 0;" name="giftwhoid" id="giftwhoid" class="txt w90"><option value="${requestScope.user.id}">${requestScope.user.name}</option></select>
				<a href="javascript:sendGift();"><img src="${domain }/images/video/give_btn.gif" /></a>
				<a href="${domain }/pay/topay.do" target="_blank"><img src="${domain }/images/video/charge_btn.gif" /></a>
			</div>
		</div>
		<div id="chatBox">
			<div class="chatBoxTop">
				<img src="${domain }/images/video/chatbox_tag.gif" />聊天室
			</div>
			<div id="chatRoom">
				<div id="chatMain">
					<div id="chatTop">
						<div id="roomChatFlash"></div>
						<div id="roomChatContent" style="color:#6c6c6c; height:278px; padding-left:8px; padding-top:8px; overflow:auto; line-height:200%;">
						</div>
					</div>
					<div id="chatBot">欢迎您进入房间。<s:if test="#request.anonymous=='YES'">请 <a href="javascript:register();void(0);"><span class="red0">注册</span></a> 或 <a href="javascript:login();void(0);"><span class="red0">登录</span></a>，与主播进行交流和互动。</s:if>
					<br/>系统消息：美女主播火热招募中！<br/></div>
				</div>
				<div id="roomMateContent" style="overflow:auto; height:408px;"></div>
				<div id="userManager">
					<div id="umwrap">
						<p>:</p>
						<div id="adminTool">
							<a href="javascript:;" onclick="kickUser();">• 踢出房间</a>
							<a href="javascript:;" onclick="banUser();">• 禁止发言</a>
							<a href="javascript:;" onclick="allowUser();">• 恢复发言</a>
							<a href="javascript:;" onclick="grantAdmin();">• 设为管理</a>
							<a href="javascript:;" onclick="revokeAdmin();">• 删除管理</a>
						</div>
						<div class="dl"></div>
						<a href="javascript:;" onclick="goSendGift();">• 发送礼物</a>
						<a>• 加为好友</a>
						<a id="lnkScr" href="javascript:;" target="_blank" class="FCRed">• 给Ta打分</a>
						<a href="javascript:;" onclick="goSpeakPub();">• 公开地说</a>
						<a href="javascript:;" onclick="goSpeakPriv();">• 悄悄地说</a>
						<a id="lnkEntRm" href="javascript:;" target="_self">• 进入房间</a>
					</div>
				</div>
			</div>
			<div class="chatBoxBottom">
				<form id="chatForm">
					对<select class="txt w90" style="height:22px;vertical-align:middle;" id="speakToId"><option value="">所有人</option></select>
					<input id="speakPriv" type="checkbox" class="check" disabled="disabled" />悄悄<img src="${domain }/images/video/smile_face.gif" /><input id="chatContent" type="text" class="txt w170" />
					<s:if test="userToken.user != null">
						<a id="speaklnk" href="javascript:void(0);" onclick="return sendMsg();"><img src="${domain }/images/video/speak_btn.png" /></a>
					</s:if>
					<s:else>
						<a id="speaklnk" href="javascript:void(0);" onclick="login();"><img src="${domain }/images/video/speak_btn.png" /></a>
					</s:else>
					<a href="javascript:;" onclick="$('#roomChatContent').html('');return false;"><img src="${domain }/images/video/feip_btn.png" /></a>
				</form>
			</div>
		</div>
	</div>
	<div id="bottomContainer">
		<div class="leftBox">
			<div class="msgBoxTop"></div>
			<div class="msgBox">
				<div class="msgBoxTitle">
					<span class="msgTitle">消息</span>
				</div>
				<div class="msgBoxSep">
					<span class="msgBoxline1"></span><span class="msgBoxline2"></span>
				</div>
				<div class="msgBoxMain">
					<div class="tt"><img src="${domain }/images/video/msg_tg.gif" />系统消息：美女面对面教你玩游戏</div>
					<div class="ln"><img src="${domain }/images/video/msg_tg.gif" />系统消息：美女面对面教你玩游戏</div>
					<div class="ln"><img src="${domain }/images/video/msg_tg.gif" />系统消息：美女主播火热招募中</div>
					<div class="ln"><img src="${domain }/images/video/msg_tg.gif" />系统消息：美女主播火热招募中</div>
					<div class="ln"><img src="${domain }/images/video/msg_tg.gif" />系统消息：美女主播火热招募中</div>
					<div class="ln"><img src="${domain }/images/video/msg_tg.gif" />系统消息：美女主播火热招募中</div>
					<div class="ts">首页 上一页 <span style="color:#e57d02">1</span> | 2 | 3 | 4 | 5 下一页 尾页</div>
				</div>
			</div>
		</div>
		<div class="rightBox">
			<div class="chartBoxTop">
				<img src="${domain }/images/video/chatbox_tag.gif" />富豪排行榜
			</div>
			<div class="chartBoxMain">
				<s:iterator value="#request.richList" status="status">
					<s:set name="richman" />
					<div class="chartBoxItem">
						<img src="${domain }/images/video/rankf_<s:property value='#status.count'/>.jpg" class="rankf" />
						<a href="${domain }/user/index.do?uid=${richman.user.id}"><img class="avatf" src="${richman.user.icon1}" onerror="this.src='${richman.user.icon}';" width="60" height="60" /></a>
						<span class="namef"><script type="text/javascript">document.write(getRichGradeText(${richman.richGrade}));</script><br/><a href="${domain }/user/index.do?uid=${richman.user.id}">${richman.user.name }</a></span>
						<div class="fright w170"><img class="coinf" src="${domain }/images/video/coin.jpg" />
						<span class="credf">${richman.spendCredit }</span></div>
					</div>
				</s:iterator>
			</div>
			<input type="hidden" id="anonymous" value="${anonymous}" />
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
document.onkeydown = function(evt){
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	var act = document.activeElement.id;
	if(key == 13){
		if(act == "chatContent"){
			document.getElementById("speaklnk").click();
			if(window.event){
				event.returnValue = false;
			}else{
				evt.preventDefault();
			}
		}else if(act=="nav_password" || act=="nav_email"){
			checkLogin();
			if(window.event){
				event.returnValue = false;
			}else{
				evt.preventDefault();
			}
		}
	}else if(act == "giftCount"){
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
var ct = "quleRoom";
var flashvars = {};
var towho = '';
var towhoid = '';
var towhonick = '';
var _REGET_ROOM = true;
var userRole = '';
var onload = true;
window.setTimeout('onload=false;',5000);
window.setInterval("_REGET_ROOM=true;", 30000);
$(function(){
	$('#sbar_room').attr('target','_self');

	if($('#anonymous').val()=='YES'){
		flashvars.nickName = encodeGuest();
		flashvars.anonymous = "YES";
		flashvars.userName = "${guestId}";
		flashvars.password = "";
	}else{
		flashvars.nickName = encodeUser();
		flashvars.anonymous = "NO";
		flashvars.userName = "${userToken.user.id }";
		flashvars.password = "${userToken.user.password }";
	}
	var swfVersionStr = "10.1.0"; 
    var xiSwfUrlStr = "${domain}/images/swf/expressInstall.swf"; 
	var attributes = {};
	attributes.id = ct;
	var params = {};
	params.wmode = "transparent";
	flashvars.groupName = "${requestScope.room.roomNo}";
	flashvars.connectionType = "socket";
	flashvars.server = "${requestScope.xamppServer}";
	flashvars.domain = "";
	flashvars.resource = "web";
	flashvars.priority = "0";
	swfobject.embedSWF("${domain}/images/swf/Room.swf", "roomChatFlash", "1", "1", swfVersionStr, 
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
		style:"display: none; z-index: 200;"
	};
	swfobject.embedSWF("${domain}/images/swf/ShowStageManager.swf?_="+Math.random(), "altContent", "100%", "100%", "10.0.0",
		 "expressInstall.swf", flashvars, params, attributes);

	var rk = "${requestScope.roomKey}";
	var uvrm = getCookie("__uvrm");
	if(uvrm!=null){
		if(!cookieContains(uvrm, rk)){
			addVisit();
			setCookie('__uvrm', uvrm + "|" + rk);
		}
	}else{
		addVisit();
		setCookie('__uvrm',rk);
	}
	
	$("#roomMateContent li.uli").live("mouseover", function(){
		if($(this).attr('id') != "${userToken.user.id}"){
			towhoid = $(this).attr('id');
			towho = $(this).find("span.un").text();
			towhonick = towhoid+","+towho+","+$(this).find("span.gg").text();
			$('#userManager p').html(towho+':');
			$('#userManager a#lnkScr').attr('href','${domain}/user/score.do?uid='+towhoid);
			$('#userManager a#lnkEntRm').attr('href','${domain}/user/chat.do?uid='+towhoid);
			var t = $(this).offset().top;
			var l = $(this).offset().left;
			var ll = l - 130;
			$('#userManager').css('top',t.toString()+'px');
			$('#userManager').css('left',ll.toString()+'px');
			$('#userManager').css('display','block');
		}
	});
	$("#roomMateContent li.uli").live("mouseout", function(){
		$('#userManager').mouseout(function(ae){
			var e = window.event || ae;
			var s = e.toElement || e.relatedTarget;
			if(document.all){
				if(!this.contains(s)) $('#userManager').css('display','none');
			}else{
				var res = this.compareDocumentPosition(s);
				if(!(res==20 || res==0)) $('#userManager').css('display','none');
			}
		});
	});
	$('body').css('background','#eaeaea');
	//$('body').css('background','url(http://vi2.6.cn/live/09/92/59e8aff35be8d8e9f452a03601af6207.jpg) repeat left top');
	//$('#header').addClass('op60');
});
function addAttention(){
	$.post("${domain}/user/ajaxAddAttentionApi.do?", {"target":"${requestScope.user.id }"}, function(d){
		if(d['status'] == 1){
			alert('关注成功！');
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"关注失败");
	},'json');
}
function addVisit(){
	$.post("${domain}/user/ajaxAddVisitApi.do?", {"target":"${requestScope.user.id }","pageId":${requestScope.pageId}}, function(d){},'json');
}
function selectGift(){
	$('#videoBox #ln1').toggleClass('hid');
	$('#videoBox #ls1').toggleClass('hid');
}
function selOneGift(obj){
	$('#giftId').val(obj.id);
	selectGift();
}
function grantAdmin(){
	getRoom().setRole('admin',towhoid);
	alert('设置成功！');
}
function revokeAdmin(){
	getRoom().setRole('none',towhoid);
	alert('设置成功！');
}
function kickUser(){
	getRoom().kickUser(towhonick);
	alert('操作成功！');
}
function banUser(){
	getRoom().banUser(towhoid);
	alert('操作成功！');
}
function allowUser(){
	getRoom().allowUser(towhoid);
	alert('操作成功！');
}
function onBaned(nick){
	if(nick==encodeUser()){
		alert('对不起，您已被管理员禁止发言');
	}
}
function onKicked(nick){
	if(nick==encodeUser()){
		alert('对不起，您已被管理员请出房间');
		//location.href="/";
	}
}
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
	$('#ShowStageManager').css("display","none");
}
function sendMsg(){
	var txt = $("#chatContent").val();
	if(txt){
		var room = getRoom();
		var speakto = $('#speakToId').val();
		var speaktoNm = $('#speakToId option:selected').text();
		if(speakto == ""){
			room.sendGroupMsg("1"+txt); //speak to all
		}else{
			if(speakto=="${userToken.user.id}"){
				alert('不能给自己发消息');
				return false;
			}
			if($('#speakPriv').attr('checked')==false){
				room.sendGroupMsg("2"+speakto+","+speaktoNm+"@"+txt); //speak to one in public
				room.sendPrivate(speakto,"1${userToken.user.name}@"+txt);
				$('#chatBot').append('<span class="red0">你</span> 对 <span class="red0">'+speaktoNm+'</span> 说: '+txt+'<br/>');
				scrollToBottom($('#chatBot'));
			}else{
				room.sendPrivate(speakto,"2${userToken.user.name}@"+txt); //speak to one in private
				$('#chatBot').append('<span class="red0">你</span> 悄悄对 <span class="red0">'+speaktoNm+'</span> 说: '+txt+'<br/>');
				scrollToBottom($('#chatBot'));
			}
		}
		$("#chatContent").val("");
	}
	return false;
}
function onReceivedGroupMsg(from,txt){
	if(from == "null") from = "系统";
	if(txt.indexOf("__gift__") == -1){
		if(from == null) $("#roomChatContent").append(getCurTime()+" "+txt+"<br/>");
		else{
			var tt = null, tb = null, tba = null;
			var ta = txt.charAt(0);
			if(ta=="1"){
				tt = txt.substring(1);
			}else if(ta=="2"){
				var i = txt.indexOf("@",1);
				tb = txt.substring(1,i);
				tba = tb.split(",");
				tt = txt.substring(i+1);
			}
			var ff = decodeUser(from);
			if(ff.length>2 && tt!=null){
				if(tb==null) $("#roomChatContent").append(getCurTime()+" <a href='javascript:respOne(\""+ff[0]+"\",\""+ff[1]+"\",\"\");void(0);' class=\"red0\">"+ff[1]+"</a>："+tt+"<br/>");
				else $("#roomChatContent").append(getCurTime()+" <a href='javascript:respOne(\""+ff[0]+"\",\""+ff[1]+"\",\"\");void(0);' class=\"red0\">"+ff[1]+"</a> 对 <a href='javascript:respOne(\""+tba[0]+"\",\""+tba[1]+"\",\"\");void(0);' class=\"red0\">"+tba[1]+"</a> 说："+tt+"<br/>");
			}
		}
	}else{
		var str = txt.substring(8).split(",");
		if(str.length == 6){
			var giftId = str[4];
			var giftCnt = str[5];
			$("#roomChatContent").append(getCurTime()+" <a href='javascript:respOne(\""+str[0]+"\",\""+str[1]+"\",\"\");void(0);' class=\"red0\">"+str[1]+"</a> 送给 <a href='javascript:respOne(\""+str[2]+"\",\""+str[3]+"\",\"\");void(0);' class=\"red0\">"+str[3]+"</a> "+giftCnt+getGiftText(giftId)+"<br/>");
			if(!onload){
				$('#ShowStageManager').css("display","block");
				window.setTimeout("sendShapeGift('"+ giftId +"',"+ giftCnt +");",500);
			}
		}
	}
	scrollToBottom($("#roomChatContent"));
}
function sendShapeGift(gift,count){
	var obj = document.getElementById("ShowStageManager");
	if(obj) obj.sendGift(gift, count, "RAND_POINT","v");
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
function scrollToBottom(obj) {
    var scrollTop = obj[0].scrollHeight;
    obj.scrollTop(scrollTop);
}
function onRoomJoin(){}
function onRoomLeave(){}
function getRoomates(){
	var uarr = new Array(); //user array
	var tarr = new Array(); //tourist array
	var list = getRoom().getPartList().split(";");
	if('${requestScope.isSelf}'=='true'){
		$.post("${domain}/user/ajaxUpdateRoomOccuCntApi.do", {"roomNo":'${requestScope.room.roomNo}',"count":list.length}, function(d){},'json');
	}
	var x = 0, y = 0;
	$.each(list,function(i,n){
		if(n != "qule" && n != ""){
			var ua = decodeUser(n);
			if(ua.length > 2){
				uarr[x++] = new Array(ua[0],ua[1],ua[2]);
			}else{
				tarr[y++] = new Array(ua[0],ua[1]);
			}
		}
	});
	bubbleSort(uarr, 2);
	var tt = '<ul>';
	$.each(uarr,function(i,n){
		var ug = getRichGradeText(n[2]);
		tt += "<li class='uli' id='"+n[0]+"'><span class='un'>"+n[1]+"</span><br/><span class='ug'>"+ug+"</span><span class='gg'>"+n[2]+"</span></li>";
	});
	$.each(tarr,function(i,n){
		tt += "<li class='cli' id='"+n[0]+"'>"+n[1]+"</li>";
	});
	$("#roomMateContent").html(tt+"</ul>");
	freshRoomates();
	_REGET_ROOM = false;
}
function freshRoomates(){
	$("#roomMateContent li:even").css('background','#fff');
	$("#roomMateContent li:odd").css('background','#f5f5f5');
}
function goSendGift(){
	var selObj = $('#giftwhoid');
	if(selObj.find("option[value='"+towhoid+"']").length==0) selObj.append("<option value='"+towhoid+"'>"+towho+"</option>");
	selObj.val(towhoid);
}
function goSpeakPub(){
	var selObj = $('#speakToId');
	if(selObj.find("option[value='"+towhoid+"']").length==0) selObj.append("<option value='"+towhoid+"'>"+towho+"</option>");
	selObj.val(towhoid);
	$('#speakPriv').attr('checked',false);
	$('#speakPriv').attr('disabled',false);
}
function goSpeakPriv(){
	var selObj = $('#speakToId');
	if(selObj.find("option[value='"+towhoid+"']").length==0) selObj.append("<option value='"+towhoid+"'>"+towho+"</option>");
	selObj.val(towhoid);
	$('#speakPriv').attr('checked',true);
	$('#speakPriv').attr('disabled',false);
}
function showAdminTools(){
	//$('#adminTopBar').css('display','block');
	$('#userManager').css('height','270px');
	$('#umwrap').css('height','264px');
	$('#adminTool').css('display','block');
}
function onUserJoin(nick, role){
	if(nick=='qule') return false;
	var ano = true;
	var t = decodeUser(nick);
	if(t.length > 2){
		onReceivedGroupMsg(null,'欢迎&nbsp;&nbsp;&nbsp;"'+t[1]+'"&nbsp;&nbsp;进入房间');
		ano = false;
	}
	if(t[0]=='${userToken.user.id}'){
		userRole = role;
		if(userRole=='owner' || userRole=='admin') showAdminTools();
	}
	if(_REGET_ROOM){
		getRoomates();
	}else{
		if(ano){
			$("#roomMateContent ul").append("<li class='cli' id='"+t[0]+"'>"+t[1]+"</li>");
		}else{
			var g = getRichGradeText(t[2]);
			$("#roomMateContent ul").append("<li class='uli' id='"+t[0]+"'><span class='un'>"+t[1]+"</span><br/><span class='ug'>"+g+"</span></li>");
		}
		freshRoomates();
	}
}
function onUserDeparture(nick){
	var t = decodeUser(nick);
	//if(t.length > 2) onReceivedGroupMsg(null,t[1]+' 离开了房间');
	var e = $("#roomMateContent ul").find("li[id='"+t[0]+"']");
	if(e) e.remove();
	freshRoomates();
}
function encodeUser(){
	return "${userToken.user.id},${userToken.user.name},${requestScope.credit.richGrade}";
}
function encodeGuest(){
	return "${guestId},${guestName}";
}
function decodeUser(str){
	return str.split(",");
}
function sendGift(){
	var gift = $('#giftId').val();
	var count = $('#giftCount').val();
	var touid = $('#giftwhoid').val();
	var tounm = $("#giftwhoid").find("option:selected").text();
	var roomNo = "${requestScope.room.roomNo}";
	$.post("${domain}/user/ajaxSendGiftApi.do", {"roomNo":roomNo,"target":gift,"_":touid,"towho":tounm,"count":count}, function(d){
		if(d['status'] == 1){
			//do nothing
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"送礼物失败");
	},'json');
}
function getGiftText(giftId){
	if(giftId=="rose"){
		return " 朵玫瑰。";
	}else if(giftId=="pig"){
		return " 个猪头。";
	}else if(giftId=="bouquet"){
		return " 束鲜花。";
	}else if(giftId=="cigarette"){
		return " 包香烟。";
	}else if(giftId=="cow"){
		return " 头奶牛。";
	}else if(giftId=="blueRose2"){
		return " 束蓝玫瑰。";
	}else if(giftId=="eyeCream"){
		return " 瓶眼霜。";
	}else if(giftId=="kiss"){
		return " 个么么。";
	}else if(giftId=="lollipop"){
		return " 根棒棒糖。";
	}else if(giftId=="lozenge"){
		return " 个喉宝。";
	}else if(giftId=="wine"){
		return " 瓶啤酒。";
	}else if(giftId=="washboard"){
		return " 个搓板。";
	}else if(giftId=="rose99"){
		return " 个爱心。";
	}else{
		return "";
	}
}
function openIm(to){
	imWindow = window.open("${domain}/user/imPage.do?target="+ to, "", "height=550,width=750,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,location=no,status=no");
	imWindow.focus();
}
function onReceivedPrivateMsg(from,txt,type){
	if(type != "groupchat"){
		var i = txt.indexOf("@",1);
		var ff = txt.substring(1,i);
		var tt = txt.substring(i+1);
		var aa = "";
		if(txt.charAt(0)=="2") aa = "悄悄";
		$("#chatBot").append("<a class='red0' href='javascript:respOne(\""+from+"\",\""+ff+"\",\""+aa+"\");void(0);'>"+ff+"</a> "+aa+"对 <span class='red0'>你</span> 说: "+tt+"<br/>");
		scrollToBottom($("#chatBot"));
	}
}
function respOne(uid, unm, pri){
	towhoid = uid;
	towho = unm;
	if(pri=="") goSpeakPub();
	else goSpeakPriv();
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
function onliveStart(param){
	//alert(param);
	$.post("${domain}/user/ajaxLiveStartApi.do", {"_":param}, function(d){
		if(d['status'] == 1){
			//alert('success');
		}else if(d['status'] == -2){
			login();
		}else{
			//alert("初始化失败: " + d['message']);
		}
	},'json');
}
function onliveEnd(){
	//alert("结束直播");
	$.post("${domain}/user/ajaxLiveEndApi.do", {}, function(d){
		if(d['status'] == 1){
			//success
		}else if(d['status'] == -2){
			login();
		}else{
			//alert("非正常结束: " + d['message']);
		}
	},'json');
}
</script>
<!-- <div id="logfla" style="height:100px; overflow:auto;"></div> -->
<!-- END for 内容 -->
</body>
</html>