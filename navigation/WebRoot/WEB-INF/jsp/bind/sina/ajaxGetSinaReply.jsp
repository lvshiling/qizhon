<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<s:if test="#request.commentList.size>0">
	<s:iterator value="#request.commentList" status="u">
		<div id="reply_${id }" class="ml10 mr10 pb05 pt10" style="border-top: 1px solid #ccc;">
			<div class="fleft" style="width:34px;height: 34px; background-color: #FFC0CB; margin-right: 5px;">
				<a href="http://t.sina.com.cn/${user.id }" target="_blank"><img src="${user.profileImageURL }" width="32" height="32" style="margin-top: 1px;margin-left: 1px;"></a>
			</div>
			<div class="fb">
				<a href="http://t.sina.com.cn/${user.id }" target="_blank">@${user.screenName }</a> <span class="ml10 gray fn">
				<commons:dateformat value="${createdAt}"/>
				<s:if test="topicId == null">
					 | <a href="javascript:;" onclick="replyIt('${sid}','回复 @${user.screenName }：');">[回复]</a>
				</s:if>
				<s:else>
					 | <a href="javascript:;" onclick="replyIt('${topicId}','回复 @${user.screenName }：');">[回复]</a>
				</s:else>
				</span>
			</div>
			<div class="mt05">${text }&nbsp;</div>
		</div>
	</s:iterator>
	<div class="pd10 tright" style="border-top: 1px #ddd dotted;">
		<a href="javascript:;" onclick="$('#sinaReplyContent_${sid }').hide();$('#sinaReplyContent').html('');">关闭</a>
		<s:if test="#request.commentList.size == pageSize">
			 | <a href="javascript:;" onclick="getSianReply('${sid}',this,'${topicId}');">读取下一页</a>
		</s:if>
	</div>
</s:if>
<s:else>
	<div class="pd10">暂无评论!</div>
</s:else>