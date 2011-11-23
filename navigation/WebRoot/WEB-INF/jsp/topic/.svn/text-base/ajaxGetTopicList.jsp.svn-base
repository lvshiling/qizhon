<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<table class="wp100">
	<s:iterator value="#request.topicPageBean.recordList">
		<tr class="odd" onclick="getReply(this,${id },event||window.event);" align="left" onmouseover="highlight(this,true,${id });" onmouseout="highlight(this,false,${id });">
			<td class="hand" id="topicList_${id }">
				<s:if test="isFake == 1 || 1 == userByAuthorId.id">
					<%-- 匿名访问 START --%>
					<div class="fleft" style="width:50px;height: 50px; background-color: #999; margin-right: 5px;">
						<img src="${static }/images/anonymous.gif" width="48" height="48" style="margin-top: 1px;margin-left: 1px;" />
					</div>
					<div class="lh150 fb" style="position:relative;">
						匿名
						<span class="ml05 gray fn">
							<commons:dateformat value="${lastReplyTime}"/> 
							<span>
								<a href="javascript:;" onclick="replyIt(${id });">[<s:property default="0" value="replyCount"/> 回复]</a> 
								<a href="javascript:;" onclick="topicNotice(${id });" title="订阅设置">[<s:property default="0" value="subscribeCount"/> 订阅]</a>
							</span>
							<span class="topicOperate">
								<s:if test="1 == userToken.user.id">
								| <a href="javascript:;" onclick="deleteTopic(${id });">[删除]</a>
								</s:if>
							</span>
						</span> 
						<div class="noticeImg"></div>
					</div>
					<%-- 匿名访问 END --%>
				</s:if>
				<s:else>
					<div class="fleft" style="width:50px;height: 50px; background-color: #999; margin-right: 5px;">
						<a href="javascript:;" onclick="getTopic(1,parseInt('${userByAuthorId.id }'))" title="查看Ta发起的讨论"><img src="${userByAuthorId.icon }" width="48" height="48" style="margin-top: 1px;margin-left: 1px;" /></a>
					</div>
					<div class="lh150 fb" style="position:relative;">
						<a href="javascript:;" onclick="getTopic(1,parseInt('${userByAuthorId.id }'))" title="查看Ta发起的讨论">${userByAuthorId.name }</a>
						<span class="ml05 gray fn">
							<commons:dateformat value="${lastReplyTime}"/> 
							<span>
								<a href="javascript:;" onclick="replyIt(${id });">[<s:property default="0" value="replyCount"/> 回复]</a> 
								<a href="javascript:;" onclick="topicNotice(${id });" title="订阅设置">[<s:property default="0" value="subscribeCount"/> 订阅]</a>
							</span>
							<span class="topicOperate">
								<s:if test="userByAuthorId.id == userToken.user.id">
								| <a href="javascript:;" onclick="deleteTopic(${id });">[删除]</a>
								</s:if>
							</span>
						</span> 
						<div class="noticeImg"></div>
					</div>
				</s:else>
				<div class="lh150 mt05"><span class="topicTitle" id="topic_title_${id }">${title }</span> </div>
			</td>
		</tr>
	</s:iterator>
</table>
<div class="div-pagenation"></div>
<script type="text/javascript">
var global_currentPage = parseInt('${p}');
var global_pageSize = parseInt('${pageSize}');
var global_count = parseInt('<s:property value="#request.topicPageBean.recordCount" default="0"/>');
$(function(){
	$(".div-pagenation").addClass("pager").pager({ pagenumber: global_currentPage,listpage:6, pagecount:Math.ceil(global_count/global_pageSize) , buttonClickCallback: getTopic});
});
</script>