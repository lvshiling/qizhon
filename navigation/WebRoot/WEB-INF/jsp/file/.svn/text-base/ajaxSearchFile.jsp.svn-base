<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:if test="folders.length >0 ">
	<table class="searchResult">
		<tr>
			<th valign="top">文件资源</th>
			<td>
				<%@ include file="/WEB-INF/jsp/file/ajaxSearchFolder.jsp" %>
			</td>
		</tr>
	</table>
</s:if>
<s:if test="gpassFlag!=null">
	<table class="searchResult">
		<tr>
			<th valign="top">G<br>P<br>A<br>S<br>S</th>
			<td>
				<%@ include file="/WEB-INF/jsp/file/ajaxSearchGpass.jsp" %>
			</td>
		</tr>
	</table>
</s:if>
<s:if test="topicFlag!=null">
	<table class="searchResult">
		<tr>
			<th valign="top">贴子</th>
			<td>
				<%@ include file="/WEB-INF/jsp/file/ajaxSearchTopic.jsp" %>
			</td>
		</tr>
	</table>
</s:if>
<s:if test="gpassHistoryFlag!=null">
	<table class="searchResult">
		<tr>
			<th valign="top">G<br>P<br>A<br>S<br>S<br>快照</th>
			<td>
				<%@ include file="/WEB-INF/jsp/file/ajaxSearchGpassHistory.jsp" %>
			</td>
		</tr>
	</table>
</s:if>
<s:if test="mailFlag!=null">
	<table class="searchResult">
		<tr>
			<th valign="top">邮件搜索</th>
			<td>
				<%@ include file="/WEB-INF/jsp/file/ajaxSearchMail.jsp" %>
			</td>
		</tr>
	</table>
</s:if>