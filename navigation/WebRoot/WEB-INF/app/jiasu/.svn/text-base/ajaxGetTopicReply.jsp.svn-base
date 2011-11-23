<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<div class="ml10 mr10 pb05 pt10 pb20">
	${requestScope.topic.content }
	<div>
		( ${requestScope.topic.userByAuthorId.name} 
		发表于 <commons:dateformat value="${requestScope.topic.addTime}"/> | 
		<a href="javascript:;" onclick="replyIt(${topicId },'回复 ${requestScope.topic.userByAuthorId.name }：');">[回复]</a> )
	</div>
</div>
<s:iterator value="#request.topicReplyList" status="u">
<div id="reply_${id }" class="ml10 mr10 pb05 pt10" style="border-top: 1px solid #ccc;">
	<div class="fb">
		<a href="javascript:;" >${user.name }</a> <span class="ml10 gray fn">
		<commons:dateformat value="${addTime}"/> | 
		<a href="javascript:;" onclick="replyIt(${topicId },'回复 ${replyUserName }：');">[回复]</a></span>
	</div>
	<div class="mt10 lh150">${content }&nbsp;</div>
</div>
</s:iterator>
<script type="text/javascript">
$(function(){
	$(".createFaqReplyForm").ajaxForm({	//创建回复
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
	    		alertClose();
				getReply(d['values']['topicId']);
			}else alert( d['message']||"失败");
        },
        beforeSubmit:function(){
        	alert(globla_loading);
        }
    });
});
</script> 