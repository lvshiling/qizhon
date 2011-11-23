<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>GPASS WEB - ${siteTitle}</title>
<script type="text/javascript" src="${domain }/js/lib/jquery.contextmenu.r2.packed.js"></script>
</head>
<body>
<div id="content" class="clearfix">
	<div class="lh200 wp99">
		<s:if test="#request.indexPermit">
			<div class="small_title">
				<div class="fleft">GPASS　<span class="ft12 fn alert"> 新增 重命名、删除、创建文件、创建文件夹 功能!</span></div>
				<div class="fright">
					<a href="${domain }/gpass/index.do?targetDirectory=&_=${_}">回首页</a> | <a href="javascript:window.location.reload();">手动刷新</a> | 自动刷新(<span id="showContainer"></span>秒)
					<select onchange="autoReload(this.value);" id="autoValue">
						<option value="0" >不自动刷新</option>
						<option value="10" <s:if test="_==10">selected="selected"</s:if>>10秒</option>
						<option value="30" <s:if test="_==30">selected="selected"</s:if>>30秒</option>
						<option value="60" <s:if test="_==60">selected="selected"</s:if>>1分钟</option>
					</select>
					 | <a href="#" onclick="if(document.all){window.external.addFavorite(document.location.href,document.title);return false;}" title="GPASS WEB" rel="sidebar">加入收藏</a>
				</div>
			</div>
			<div class="clear"></div>
			<div class="lh160 small_content small_buttom pt05">
				<div class="pd05 mb15 ft14" title="创建文件，不填写后缀名则创建目录"><img src="${static }/images/icon/add.png" align="absmiddle" /> 
					<a href="javascript:;" class="mr30" onclick="createFile('${targetDirectory }');">[ 创建空文件/空文件夹 ]</a> 鼠标右键点击文件可以重命名或删除</div>
				<s:iterator value="#request.fileList" var="file">
				<div style="background-color: #eee;" class="mb05 ml05 mr05" <s:if test="fileName != '...'">onclick="goReName(event||window.event)"</s:if> >
					<s:if test="#file.fileType == 'dir'">
						<img border="0" src="${domain }/images/commons/file.jpg" alt="absmiddle" class="mr05"></img>
						<a class="file_one" href="${domain }/gpass/index.do?targetDirectory=${link}&_=${_}" link="${link }" title="${fileName }">
							<font color="#000">${fileName }</font>
						</a> 
					</s:if>
					<s:else>
						<a class="file_one" href="${domain }/gpass/download.do?fileName=${link}&_=${_}" link="${link }" title="${fileName }">
							<font color="#000">${fileName }</font>
						</a> 
					</s:else>
				</div>
				</s:iterator>
			</div>
		</s:if>
		<s:else>
			<div class="small_title">
				<div class="fleft">登录提示</div>
				<div class="fright">
				</div>
			</div>
			<div class="clear"></div>
			<div class="lh160 small_content small_buttom pd15">
				${msg }
			</div>
		</s:else>
		<div class="clear"></div> 
	</div>
<div class="contextMenu none" id="myMenu1">
	<ul>
		<li id="renameFile"><img src="${static }/images/icon/arrow_redo.png" align="absmiddle"> 重命名</li>
		<li id="deleteFile"><img src="${static }/images/icon/cancel.png" align="absmiddle"> 删除</li>
	</ul>
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

/* 重命名 */
function rename(target){
	target = $(target);
	target.after('<input type="button" onclick="cancleRename(this);" value="取消">');
	target.after('<input type="button" onclick="renameIt(this,$(\'#'+target.attr('link')+'\').val());" value="重命名">');
	target.after('<input class="wp85" type="text" id="'+target.attr('link')+'" value="'+target.attr('title')+'"  >');
	target.hide();
}
function renameIt(target,newName){
	target = $(target).parent().children('a');
	if(newName != null && newName != '' && newName != target.attr('title') ){
		$.post("${domain }/gpass/ajaxRenameFileApi.do", {"fileName":target.attr('link'),"target":newName}, function(d){
			if(d.status == 1) window.location.reload();
		},'json');
	}
}
function deleteFile(target){
	if(window.confirm('确定要删除吗？')){
		target = $(target);
		if(target.attr('link') != null && target.attr('link')!=''){
			$.post("${domain }/gpass/ajaxRenameFileApi.do", {"fileName":target.attr('link'),"target":'DBC962202E7D4A840734FEB86E6F791D'}, function(d){
				if(d.status == 1) {
					alert('修改成功，页面正在刷新...');
					window.location.reload();
				}else alert('修改失败');
			},'json');
		}
	}
}
function goReName(evt){
	if(evt){
		evt=evt?evt:(window.event?window.event:null);
		var source = evt.target||evt.srcElement;
		if(source.tagName == "DIV"){
			source = $(source);
			var aEl = source.children('a');
			var inputEl = $("#"+aEl.attr('link'))
			if(inputEl.length==0){
				rename(aEl);
			}
		}else return;
	}
}
function cancleRename(el){
	el = $(el).parent();
	el.children('a').show();
	el.children('input').remove();
}
function createFile(fileName){
	var target = window.prompt("请输入文件名，不填写后缀名则创建目录","新建文件夹");
	if(target != null && target!=''){
		$.post("${domain }/gpass/ajaxCreateFileApi.do", {"fileName":fileName,"target":target}, function(d){
			if(d.status == 1) {
				alert('创建成功，页面正在刷新...');
				window.location.reload();
			} else alert('创建失败');
		},'json');
	}
}
$(function(){
	$('.file_one').contextMenu('myMenu1', {bindings: {
			'renameFile': function(t) {
				rename(t);
			},
			'deleteFile': function(t) {
				deleteFile(t);
			}
		}
	});
});
</script>
</div>
</body>
</html>