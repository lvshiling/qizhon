<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<s:if test="#request.commentList.size>0">
	<s:iterator value="#request.commentList" status="u">
		<div id="reply_${id }" class="ml10 mr10 pb05 pt10" style="border-top: 1px solid #ccc;">
			<div class="fleft" style="width:34px;height: 34px; background-color: #FFC0CB; margin-right: 5px;">
				<a href="http://t.qq.com/${user.name }" target="_blank">
					<img src="${user.profileImageURL }" width="32" height="32" style="margin-top: 1px;margin-left: 1px;">
				</a>
			</div>
			<div class="fb">
				<a href="http://t.qq.com/${user.name }" target="_blank">@${user.screenName }</a> <span class="ml10 gray fn">
				<commons:dateformat value="${createdAt}"/>
					 | <a href="javascript:;" onclick="replyIt('${sid}','回复 @${user.screenName }：');">[回复]</a>
				</span>
			</div>
			<div class="mt05">${text }&nbsp;</div>
			<input type="hidden" value="${timestamp }" class="reply_time_${sid }" />
		</div>
	</s:iterator>
	<div class="pd10 tright" style="border-top: 1px #ddd dotted;">
		<a href="javascript:;" onclick="$('#qqReplyContent_${sid }').hide();">关闭</a>
		<s:if test="#request.commentList.size == pageSize">
			 | <a href="javascript:;" onclick="getQqReply('${sid}',this);">读取下一页</a>
		</s:if>
	</div>
</s:if>
<s:else>
	<div class="pd10">暂无评论!</div>
</s:else>