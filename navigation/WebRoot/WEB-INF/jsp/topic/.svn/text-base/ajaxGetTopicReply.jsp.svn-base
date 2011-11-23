<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:set name="lastId" value="lastReplyId"></s:set>
<s:if test="#request.topic != null">
	<div id="topicCopy" class="pd10">
		<s:if test="#request.topic.isFake == 1 || 1 == #request.topic.userByAuthorId.id">
			<%-- 匿名访问 START --%>
			<div class="fleft" style="width:50px;height: 50px; background-color: #999; margin-right: 5px;">
				<img src="${static }/images/anonymous.gif" width="48" height="48" style="margin-top: 1px;margin-left: 1px;" />
			</div>
			<div class="lh150 fb" style="position:relative;">
				匿名
				<span class="ml10 gray fn">
					<commons:dateformat value="${requestScope.topic.addTime}"/>
					<span class="topicOperate"> | 
						<a href="javascript:;" onclick="replyIt(${requestScope.topic.id });">[回复]</a> | <a href="javascript:;" onclick="topicNotice(${requestScope.topic.id });">[订阅]</a>
						<s:if test="1 == userToken.user.id">
						| <a href="javascript:;" onclick="deleteTopic(${requestScope.topic.id });">[删除]</a>
						| <a href="javascript:;" onclick="createGpassTopic(${requestScope.topic.id });" title="同步发表至GPASS">[同步GAPSS]</a>
						</s:if>
						| <a href="javascript:;" onclick="copyToClipboard('${absDomain }/topic/index.do?topicId=${topicId }');">[拷贝地址]</a>
					</span>
				</span> 
			</div>
			<%-- 匿名访问 END --%>
		</s:if>
		<s:else>
			<div class="fleft" style="width:50px;height: 50px; background-color: #999; margin-right: 5px;">
				<a href="javascript:;" onclick="getTopic(1,parseInt('${requestScope.topic.userByAuthorId.id }'))" title="查看Ta发起的讨论"><img src="${requestScope.topic.userByAuthorId.icon }" width="48" height="48" style="margin-top: 1px;margin-left: 1px;" /></a>
			</div>
			<div class="lh150 fb" style="position:relative;"><a href="javascript:;" onclick="getTopic(1,parseInt('${requestScope.topic.userByAuthorId.id }'))" title="查看Ta发起的讨论">${requestScope.topic.userByAuthorId.name }</a>
				<span class="ml10 gray fn">
					<commons:dateformat value="${requestScope.topic.addTime}"/>
					<span class="topicOperate"> | 
						<a href="javascript:;" onclick="replyIt(${requestScope.topic.id });">[回复]</a> | <a href="javascript:;" onclick="topicNotice(${requestScope.topic.id });">[订阅]</a>
						<s:if test="#request.topic.userByAuthorId.id == userToken.user.id">
						| <a href="javascript:;" onclick="deleteTopic(${requestScope.topic.id });">[删除]</a>
						| <a href="javascript:;" onclick="createGpassTopic(${requestScope.topic.id });" title="同步发表至GPASS">[同步GAPSS]</a>
						</s:if>
						<s:if test="1 == userToken.user.id">
						| <a href="javascript:;" onclick="createGpassTopic(${requestScope.topic.id });" title="同步发表至GPASS">[同步GAPSS]</a>
						</s:if>
						| <a href="javascript:;" onclick="copyToClipboard('${absDomain }/topic/index.do?topicId=${topicId }');">[拷贝地址]</a>
					</span>
				</span> 
			</div>
		</s:else>
		<div class="lh150 mt10">
			<span id="topic_title_${requestScope.topic.id }">${requestScope.topic.title }</span>
			<p class="mt10 lh150 topicContent">${requestScope.topic.content }</p>
		</div>
		<!-- 新浪回复 START -->
		<s:if test="#request.topic.syncId != null">
		<div style="background-color:#F3FCFD;" class="mt10">
			<div style="height: 16px;" class="pd10">
				<div class="fleft">
					<a href="javascript:;" onclick="getSianReply('${requestScope.topic.syncId }',null,${topicId });">[读取新浪回复]</a> 
				</div>
				<div class="fright">
					<a href="javascript:;" onclick="$('#sinaReplyContent').html('');">[关闭]</a>
				</div>
				<div class="clear"></div>
			</div>
			<div id="sinaReplyContent" style="background-color:#F3FCFD"></div>
		</div>
		</s:if>
		<!-- 新浪回复 END -->
	</div>
</s:if>
<s:iterator value="#request.topicReplyList" status="u">
<div id="reply_${id }" class="ml10 mr10 pb05 pt10" style="border-top: 1px solid #ccc;">
	<s:if test="isFake == 1 || 1 == user.id">
		<div class="fleft" style="width:34px;height: 34px; background-color: #FFC0CB; margin-right: 5px;">
			<img src="${static }/images/anonymous.gif" width="32" height="32" style="margin-top: 1px;margin-left: 1px;">
		</div>
		<div class="fb">
			匿名
			<span class="ml10 gray fn">
				<commons:dateformat value="${addTime}"/> | 
				<a href="javascript:;" onclick="replyIt(${topicId },'回复 匿名：');">[回复]</a>
			</span>
		</div>
	</s:if>
	<s:else>
		<div class="fleft" style="width:34px;height: 34px; background-color: #FFC0CB; margin-right: 5px;">
			<a href="javascript:;" onclick="getTopic(1,parseInt('${user.id }'))" title="查看Ta发起的讨论"><img src="${user.icon }" width="32" height="32" style="margin-top: 1px;margin-left: 1px;"></a>
		</div>
		<div class="fb">
			<a href="javascript:;" onclick="getTopic(1,parseInt('${user.id }'))" title="查看Ta发起的讨论">${user.name }</a> <span class="ml10 gray fn">
			<commons:dateformat value="${addTime}"/> | 
			<a href="javascript:;" onclick="replyIt(${topicId },'回复 ${replyUserName }：');">[回复]</a></span>
		</div>
	</s:else>
	<div class="mt10 lh150">${content }&nbsp;</div>
	<s:if test="#u.index+1 == #request.topicReplyList.size"><s:set name="lastReplyId" value="id"></s:set></s:if>
</div>
</s:iterator>
<div style="background-color:#F2EFB5 " class="m10 pd10 hand refreshReply" onclick="getTopicReply(${topicId },parseInt('${lastReplyId }'),this)">
	<a>[点击刷新]</a>
</div>
<script type="text/javascript">
global_lastReplyId = parseInt('${lastReplyId}');
global_sina_page = 0;
$(function(){
	if(global_lastReplyId == parseInt('${lastId}')){
		$(".refreshReply").append(" &nbsp; <span class='noneReply'>暂无回复</span>");
		window.setTimeout('$(".noneReply").fadeOut();',5000);
	}else {
		var count = parseInt("<s:property value="#request.topicReplyList.size"/>");
		$(".refreshReply").append(" &nbsp; <span class='noneReply'> "+count+" 回复</span>");
		window.setTimeout('$(".noneReply").fadeOut();',5000);
	}
});
</script> 