<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:iterator value="#request.mailList">
	<li style="margin-bottom: 6px;">
		<s:date format="MM-dd HH:mm" name="sendTime"  />　<a href="${domain }/mail/ajaxLoadMailPage.do?targetId=${accountId }" target="_blank" title="${mailTitle }">${fn:substring(mailTitle,0,30) } [ 查看 ]</a>
	</li>
</s:iterator>