<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>GPASS WEB</title>
</head>
<body>
<a href="${domain }/gpassPage.do?targetDirectory=&_=${_}">回首页</a> | <a href="javascript:window.location.reload();">手动刷新</a> | 自动刷新(<span id="showContainer"></span>秒)
<select onchange="autoReload(this.value);" id="autoValue">
<option value="0" >不自动刷新</option>
<option value="10" <s:if test="_==10">selected="selected"</s:if>> 10秒</option>
<option value="30" <s:if test="_==30">selected="selected"</s:if>>30秒</option>
<option value="60" <s:if test="_==60">selected="selected"</s:if>>1分钟</option>
<option value="300" <s:if test="_==300">selected="selected"</s:if>>5分钟</option>
</select>
 | <a href="#" onclick="if(document.all){window.external.addFavorite(document.location.href,document.title);return false;}" title="GPASS WEB" rel="sidebar">加入收藏</a>
<div>
</div>
<br></br>
<div style="background-color: #eee; padding: 10px; font-size: 12px;">
<s:iterator value="#request.fileList" var="file">
<div>
	<s:if test="#file.fileType == 'dir'">
		<a href="${domain }/gpassPage.do?targetDirectory=${link}&_=${_}"><img border="0" src="${domain }/images/commons/file.jpg" alt="absMiddle"></img>${fileName }</a>
	</s:if>
	<s:else>
		<a href="${domain }/download.do?fileName=${link}&_=${_}">${fileName }</a>
	</s:else>
</div>
</s:iterator>
</div>
<script>
var timer = window.setTimeout("reload()", 100*1000);
var autoTime = parseInt("${_}");
var global_time = autoTime;
var showTime = window.setInterval("showT();", 1000);
function showT(){
	if(global_time >0 ){
		var second = document.getElementById("showContainer");
		if(second) second.innerHTML = global_time-1;
		global_time --;
	}
}
function reload(p){
	p = p||0;
	var len = window.location.href.indexOf("&");
	var href = window.location.href;
	if(len>0) href = window.location.href.substring(0,len);
	var parLen = href.indexOf("?");
	if(parLen > 0) href += "&_="+p;
	else href += "?targetDirectory=&_="+p;
	window.location.href = href;
}
function autoReload(time){
	if(time != autoTime) {
		reload(time);return;
	}else timer = window.setTimeout("autoReload("+time+");reload("+time+");", time*1000);
}
if(autoTime && autoTime>0) autoReload(autoTime);

</script>
</body>
</html>