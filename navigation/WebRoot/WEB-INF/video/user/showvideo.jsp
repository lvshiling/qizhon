<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" />
<%@ include file="/commons/taglib.jsp" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${domain }/js/lib/swfobject.js"></script>
<script type="text/javascript" src="${domain }/js/lib/flowplayer-3.2.6.min.js"></script>
</head>
<body>
<div id="flashContent" style="display:block;width:450px;height:333px;"></div>
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
</body>
</html>