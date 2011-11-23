<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<div id="searchGpassContent">
	<ul>
	<s:iterator value="#request.gpassResult">
		<li class="m15">
			<div class="pb05">
				<a style="text-decoration: underline; color: #0000CC; font-size: 16px;" href="javascript:;" onclick="copyToClipboard('\\\\192.168.39.11\\G_pass');">${fileName }</a>
			</div>
			<div class="pathUrl">\\192.168.39.11\G_pass - <a href="javascript:;" onclick="copyToClipboard('\\\\192.168.39.11\\G_pass');">复制路径</a></div>
		</li>
	</s:iterator>
	</ul>
</div>