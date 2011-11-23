<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<ul class="news_list">
 	<s:iterator value="#request.topicPageBean.recordList">
		<li>
			<span><img src="${static}/styles/images/point.jpg" /></span>
			<span class="date"><s:date name="addTime" format="[yyyy-MM-dd]" /></span>
			<a href="javascript:getReply(${id });" >${title }</a>
			<div style="padding:0px 10px; margin-bottom: 5px;">
				<div style="display: none;background: #EEE; padding:0px 10px;"></div>
				<div id="faqReply_${id }" style="display: none; padding: 10px; background: #EEE;">
					<form class="createFaqReplyForm" id="replyForm_${id }" method="post" action="${domain }/topic/ajaxCreateReplyApi.do">
						<div style="background-color: #eee;">
							<input type="hidden" value="${id }" name="topicId">
							<textarea id="faqReplyContent_${id }" cols="50" style="border: 0px;" name="content"></textarea>
							<input type="submit" value="回复">
							<input type="button" value="关闭" onclick="$('#faqReply_${id }').hide().prev().hide();">
						</div>
					</form>
				</div>
			</div>
		</li>
 	</s:iterator>
</ul>
<script type="text/javascript">
var global_currentPage = parseInt('${p}');
var global_pageSize = parseInt('${pageSize}');
var global_count = parseInt('<s:property value="#request.topicPageBean.recordCount" default="0"/>');
$(function(){
	$("#pageContent").addClass("pager").pager({ pagenumber: global_currentPage,listpage:6, pagecount:Math.ceil(global_count/global_pageSize) , buttonClickCallback: getFaqs});
});
</script>