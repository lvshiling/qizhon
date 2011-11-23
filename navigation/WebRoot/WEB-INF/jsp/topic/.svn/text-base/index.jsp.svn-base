<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="alternate" type="application/rss+xml" title="趣乐主题订阅" href="http://www.qule.com/topic/rss.do">
		<title>讨论区 - ${siteTitle}</title>
		<script type="text/javascript" src="${static}/js/lib/xheditor-1.1.8.-zh-cn.js"></script>
		<style type="text/css">
		.topicContent img{max-width:460px;_width:460px;}
		</style>
	</head>
	<body>
		<!-- 内容 -->
		<div id="content" class="clearfix">
			<div id="topicContent">
				<div id="topic" class="w450 fleft">
					<div class="small_title lh200"> 
						<div class="fleft" id="topicDes">
							话题列表
						</div>
						<div class="fleft" style="margin-top: 3px;" id="topicSortList">
							<select id="topicSortId" name="topicSortId" onchange="getTopicListBySort(this.value);">
								<option value="">所有分类</option>
								<s:iterator value="#request.publicSortList">
									<option value="${id }">${sortName }</option>
								</s:iterator>
								<s:iterator value="#request.userSortList">
									<option value="${id }">[专有]${sortName }</option>
								</s:iterator>
							</select>
						</div>
						<div class="fright">
							<a href="${domain }/file/index.do" >
								<img src="${static }/images/skin/pn_search.png" border="0" align="absmiddle">
							</a>
							<a href="javascript:;" onclick="initGetTopic();">
								<img
									src="${static }/images/skin/pn_fresh.png" border="0"
									align="absmiddle">
							</a>
							<a href="javascript:closeReply();void(0);"><img
									src="${static }/images/skin/pn_post.png" border="0"
									align="absmiddle">
							</a>
							<a href="${domain }/topic/rss.do" target="_blank"><img src="${static }/images/icon/feedIcon.png" width="23" border="0" align="absmiddle"></a>
						</div>
					</div>
					<div class="clear"></div>
					<div id="topicContainer" class="small_content small_buttom">
						<%@ include file="/WEB-INF/jsp/topic/ajaxGetTopicList.jsp"%>
					</div>
				</div>
				<div id="topicReply" class="none rightRow">
					<div class="small_title lh200 wp100" style="">
						<div class="fleft">
							评论
						</div>
						<a class="fright" href="javascript:closeReply();void(0);">[关闭]</a>
					</div>
					<div id="replyContainer" class="small_content small_buttom"
						style="background-color: #DDF3F7; min-height: 100px; _height: 100px;"></div>
				</div>
				<div id="topicCreate" class="rightRow">
					<div class="small_title lh200 wp100" style="">
						<div class="fleft">
							发表
						</div>
						<div class="fright">
							&nbsp;
						</div>
					</div>
					<div class="small_content small_buttom"
						style="min-height: 500px; _height: 500px; background-color: #DDF3F7;">
						<form id="createTopicForm" name="createTopicForm"
							action="${domain }/topic/ajaxCreateTopicApi.do" method="post">
							<table class="wp100" id="topicCreaterTable">
								<tr>
									<td align="right" class="w40 pt10" valign="top"></td>
									<td class="alert" id="createTopicTips">
										发表新的讨论
									</td>
								</tr>
								<tr>
									<td align="right" class="w40 pt10" valign="top">
										分类
									</td>
									<td>
										<div class="fleft" id="sendTopicSortList">
											<select id="sendTopicSortId" name="topicSortId">
												<s:iterator value="#request.publicSortList">
													<s:if test="sortDegree == 0">
														<option value="${id }">${sortName }</option>
													</s:if>
												</s:iterator>
												<s:iterator value="#request.userSortList">
													<option value="${id }">[专有]${sortName }</option>
												</s:iterator>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td align="right" class="w40 pt10" valign="top">
										标题
									</td>
									<td>
										<input type="text" class="text pd05" style="border: 0px; width: 400px;"
											name="title" maxlength="200">
									</td>
								</tr>
								<tr>
									<td align="right" class="w40 pt10" valign="top">
										内容
									</td>
									<td>
										<div class="pd05" style="background-color: #FFF; border: 1px solid #CCC; width: 398px; margin-bottom: 2px;">
											<a href="javascript:;" onclick="insertOCS('#createTopicContent');">[插入OC]</a>
										</div>
										<textarea id="createTopicContent" name="content" style="border: 0px;width: 410px; height: 260px;"></textarea>
									</td>
								</tr>
								<s:if test="userToken.user != null">
								<tr>
									<td align="right" class="w40 pt10" valign="top"></td>
									<td>
										<label for="subscribe" title="有人回复时是否发消息提醒">
											<input type="checkbox" value="true" name="_" id="subscribe" />
											是否订阅 (有人回复时是否发消息提醒)
										</label>
									</td>
								</tr>
								</s:if>
								<tr>
									<td align="right" class="w40 pt10" valign="top"></td>
									<td>
										<label for="isFake" title="匿名发表">
											<input ${userToken.user ==null ? "checked='checked'":"" } type="checkbox" value="1" name="isFake" id="isFake" />
											匿名发表
										</label>
									</td>
								</tr>
								<s:if test="#request.sinaLink != null">
									<tr>
										<td align="right" class="w40 pt10" valign="top"></td>
										<td>
											<label for="sendSinaFlag" title="是否推送到新浪微博?">
												<input type="checkbox" value="true"
													name="sendSinaFlag" id="sendSinaFlag" />
												是否推送到新浪微博?
											</label>
										</td>
									</tr>
								</s:if>
								<tr>
									<td align="right" class="w40 pt10" valign="top"></td>
									<td>
										<label title="同时发表 至 ＧＰＡＳＳ" for="sendGpassFlag">
											<input type="checkbox" value="1" name="sendGpassFlag" id="sendGpassFlag" checked="checked" />
											是否同时发表 至 ＧＰＡＳＳ
										</label>
									</td>
								</tr>
								<tr>
									<td align="right" class="w40 pt10" valign="top"></td>
									<td>
										<input id="postTopic" type="submit" value=" 创 建 " />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="reply_topic_form" class="none" title="发表回复">
			<p class="validateTips" id="reply_tips">
				回复：
			</p>
			<form id="replyTopicForm"
				action="${domain }/topic/ajaxCreateReplyApi.do" method="post">
				<fieldset>
					<div class="pd05" style="background-color: #FFF; border: 1px solid #CCC; width: 458px; margin-bottom: 2px;">
						<a href="javascript:;" onclick="insertOCS('#topicReplyTextarea');">[插入OC]</a>
					</div>
					<textarea style="width: 470px; height: 150px;" name="content" id="topicReplyTextarea" ></textarea>
					<input type="hidden" name="topicId" value="0" id="replyTopicId" />
					<label for="isFakeReply" title="匿名发表">
						<input type="checkbox" value="1" name="isFake" id="isFakeReply" ${userToken.user ==null ? "checked='checked'":"" } />
						匿名发表
					</label>
				</fieldset>
			</form>
		</div>
<script type="text/javascript">
var reply_editor;
var global_topic = 0;
var global_lastReplyId = 0;
var global_onload_topic = parseInt("${topicId}");
var global_targetUserId = parseInt("${targetUserId}");
function getReply(el,topicId,evt){	//取得帖子回复
	if(evt){
		evt=evt?evt:(window.event?window.event:null);
		var source = evt.target||evt.srcElement;
		if(source == "javascript:;")return;
	}
	if(el){
		//点击帖子列表的情况 
		if(topicId == global_topic) {
			closeReply();
			el.className = 'highlight';
			return;
		}
		el.className='highlight2';
	}else{
		//回复完成增量更新的情况
		if(topicId == global_topic) {
			$(".refreshReply").remove();
			getTopicReply(topicId,global_lastReplyId);
			return;
		}
	}
	//回复完成后刷新回复列表 及点击帖子列表的情况 
	$("#topicReply").fadeIn();
	getTopicReply(topicId);
	$("#topicCreate").hide();
}
function getTopicReply(topicId,lastReplyId,el){	//取得帖子回复，若点帖子才整个刷新，如增量获取则APPEND
	global_topic = topicId;
	$("#replyContainer").append(globla_loading);
	$.post("${domain}/topic/ajaxGetTopicReplyPage.do", {"topicId":topicId,"lastReplyId":lastReplyId||0}, function(d){
		if(lastReplyId)$("#replyContainer").append(d).find(".loading").remove();
		else $("#replyContainer").html(d).find(".loading").remove();
		if(el)$(el).remove();
	},'html');
}
function closeReply(){	//关闭帖子详细，显示创建帖子内容
	global_topic=0;
	$("#topicReply").hide();
	$("#topicCreate").show();
}
function highlight(el,flag,topicId){	//帖子列表高亮操作
	if(flag){
		if(topicId == global_topic) el.className='highlight2';
		else el.className='highlight';
	}else el.className='odd';
}
function getTopic(p,targetUserId){	//取得帖子列表
	var date = {"p":p||1};
	//作者模式
	if(targetUserId) global_targetUserId = targetUserId;
	if(global_targetUserId > 0 ) {
		date.targetUserId = global_targetUserId;
		$("#topicDes").html("个人列表模式 <a href='javascript:;' onclick='initGetTopic();'>[取消]</a>");
	}
	//分类模式
	var topicSortId = $("#topicSortId").val();
	if(topicSortId != '') date['topicSortId'] = topicSortId;
	$.post("${domain}/topic/ajaxGetTopicListPage.do", date, function(d){
		$("#topicContainer").html(d);
	},'html');
}
function getTopicListBySort(sortId){
	getTopic(1);
}
function initGetTopic(){	//清除查询条件
	global_targetUserId = 0;
	getTopic(1);
	$("#topicDes").html("话题列表");
}
function replyIt(topicId,content){	//打开回复窗口
	$("#reply_tips").html("回复："+$("#topic_title_"+topicId).text());
	$("#replyTopicId").val(topicId);
	if(content) $("#topicReplyTextarea").val(content);
	$("#reply_topic_form").dialog('open');
	return false;
}
function resetReplyTopicForm(){
	getReply(false,$('#replyTopicId').val(),false);
	$('#reply_topic_form').dialog('close');
}
function topicNotice(topicId,title){	//订阅贴子
	title = title||$("#topic_title_"+topicId).text();
	$.post("${domain}/user/ajaxSubTopicApi.do", {"topicId":topicId,"title":title||''}, function(d){
		if(d['status'] == 1){
			window.setTimeout("alertClose();",1000);
			alert(d['message']||"订阅成功");
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"订阅失败");
	},'json');
}

function deleteTopic(topicId){	//删除帖子
	if(!window.confirm("确定要删除吗？")) return ;
	$.post("${domain}/topic/ajaxDeleteTopicApi.do", {"topicId":topicId}, function(d){
		if(d['status'] == 1){
			window.setTimeout("alertClose();",1000);
			alert(d['message']||"删除帖子成功");
			$("#topicList_"+topicId).parent().remove();
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"删除帖子失败");
	},'json');
}
function getTopicr(){	//双击方法
	$.post("${domain}/topic/ajaxGetTopicReplyPage.do", {}, function(d){
		$("#topicReply").fadeIn();
		$("#replyContainer").html(d).find(".loading").remove();
		$("#topicCreate").hide();
	},'html');
}
$(function(){
	$('#createTopicForm').ajaxForm({	//创建贴子表单
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				getTopic(1);
				document.getElementById("createTopicForm").reset();
				$("#createTopicTips").html("发表新的帖子");
			}else if(d['status'] == -2){
				login();
			}else $("#createTopicTips").html( d['message']||"失败");
			alertClose();
        },
        beforeSubmit:function(){
        	/*
        	if(!isLogin()){
        		global_login_callback = function(){$('#createTopicForm').submit();}
        		login();
        		return false;
        	}
        	*/
        	alert(globla_loading);
        }
    });
	$('#replyTopicForm').ajaxForm({	//创建回复
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				window.setTimeout("resetReplyTopicForm();",500);
				$("#reply_tips").html("回复成功");
			}else if(d['status'] == -2){
				login();
			}else $("#createTopicTips").html( d['message']||"失败");
			alertClose();
        },
        beforeSubmit:function(){
        	alert(globla_loading);
        }
    });
    $("#reply_topic_form").dialog({	//回复浮层
		width:500,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			},
			" 发表回复 ": function(){
				$("#topicReplyTextarea").val(reply_editor.getSource());
				$("#replyTopicForm").submit();
			}
		},beforeclose:function(){
			$('#topicReplyTextarea').xheditor(false);
			document.getElementById("replyTopicForm").reset();
		},open:function(){
			reply_editor = $('#topicReplyTextarea').xheditor({skin:'nostyle',tools:'Cut,Copy,Paste,|,Source,Fullscreen,About'});
		}
	});
	if(global_onload_topic>0) getReply(false,global_onload_topic,false);
	if(global_targetUserId>0) $("#topicDes").html("个人列表模式 <a href='javascript:;' onclick='initGetTopic();'>[取消]</a>");
	$('#createTopicContent').xheditor({skin:'nostyle',submitID:'postTopic',html5Upload:false,
		upImgUrl:"${domain}/user/ajaxUploadApi.do",upImgExt:"bmp,jpg,png,jpeg,gif"});
	//$("body").bind('dblclick',function(){getTopicr();clearSelection();});
});
var clearSelection = function () { 	//取消	双击选择
    if(document.selection && document.selection.empty) { 
        document.selection.empty();
    }else if(window.getSelection) { 
        var sel = window.getSelection(); 
        sel.removeAllRanges();
    }
}
var global_sina_page = 1;
function getSianReply(id,el,topicId){
	global_sina_page ++;
	if(el == null) {
		global_sina_page = 1;
		$("#sinaReplyContent").html('');
	}else $(el).parent().remove();
	if(id != null && id != ''){
		$("#sinaReplyContent").append(globla_loading);
		$.post("${domain }/bind/sina/ajaxGetSinaReplyPage.do", {"sid":id,"p":global_sina_page,"topicId":topicId}, function(d){
			$("#sinaReplyContent").append(d);
			$(".loading").remove();
		},'html');
	}
}
function insertOCS(target){	//插入OCS
	var OCString = window.prompt("请输入OCS名，由英文及数字组成")
	if(OCString != null && OCString != ''){
		target = $(target);
		target.val(target.val()+"[OCS:"+OCString+"]");
	}
}
function createGpassTopic(id){
	if(id != null && id != ''){
		$("#sinaReplyContent").append(globla_loading);
		$.post("${domain }/topic/ajaxCreateGpassTopicApi.do", {"topicId":id}, function(d){
			if(d['status'] == 1){
				alert(d['message']||"同步成功");
			}else alert(d['message']||"同步失败");
		},'json');
	}
}
</script>
<!-- END for 内容 -->
<link href="http://sjs.sinajs.cn/uc/chatroom/css/chatroom.css" rel="stylesheet" type="text/css" />
<script src="http://sjs.sinajs.cn/uc/chatroom/common/base_min.js" charset="UTF-8"></script>
<script src="http://sjs.sinajs.cn/uc/chatroom/common/chatroom_min.js" charset="UTF-8"></script>
<script type="text/javascript" charset="UTF-8">
var wuc_chatroom = new WUCChatroom({id: 505737, name: '趣乐', siteApi : '${domain}/user/ajaxGetUserApi.do'});
jQuery.noConflict();
</script>
</body>
</html>