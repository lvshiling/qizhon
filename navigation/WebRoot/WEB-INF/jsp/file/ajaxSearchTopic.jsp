<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<div id="searchTopicContent">
	<ul>
	<s:iterator value="#request.topicResult">
		<li class="m15">
			<div class="pb05">
				<a style="text-decoration: underline; color: #0000CC; font-size: 16px;" href="http://zt.qule.com/topic/indexPage.do?topicId=${id }" target="_blank" >${title }</a>
			</div>
			<div class="pathUrl">http://zt.qule.com/topic/indexPage.do?topicId=${id } - <a href="javascript:;" onclick="copyToClipboard('http://zt.qule.com/topic/index.do?topicId=${id }');">复制路径</a></div>
		</li>
	</s:iterator>
	</ul>
	<form class="pd15" action="${domain }/file/ajaxSearchTopicPage.do" method="post" id="TopicSearchFrom" onsubmit="return false;">
		<input type="hidden" name="keyWord" value="${keyWord }">
		<input name="p" value="${p+1 }" id="topicPagenation" type="hidden">
		<s:if test="p>1">
			<input value=" 首页 " type="button" class="pd05" onclick="$('#topicPagenation').val(1).parent().submit();">
			<input value=" <<< 上一页 " type="button" class="pd05" onclick="$('#topicPagenation').val(${p-1}).parent().submit();">
		</s:if>
		<s:if test="#request.topicResult.size == pageSize">
			<input value=" 第 ${p } 页 下一页 >>> " type="submit" class="pd05">
		</s:if>
	</form>
	<script type="text/javascript">
		$('#TopicSearchFrom').ajaxForm({
	        dataType:  'html', 
	        success:   function(d){
		    	$("#searchTopicContent").html(d);
		    	alertClose();
	        },
	        beforeSubmit:function(){
	        	alert(globla_loading);
	        }
	    });
	</script>
</div>