<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<ul>
	<s:iterator value="#request.noticeList" status="u">
		<li>
			<s:if test="noticeType == 0">
				 [邮件] <a href="javascript:viewMail(this,${id })">您有新的邮件</a>
			</s:if>
			<s:elseif test="noticeType == 1">
				 [贴子] <a href="javascript:viewTopic(this,${refId },${id });">您订阅的贴子,有新的回复</a>
			</s:elseif>
			<s:elseif test="noticeType == 2">
				 [站内信] ${refTitle } <a href="javascript:sendMsgTo(${refId});">[回复]</a>
			</s:elseif>
		</li>
	</s:iterator>
</ul>