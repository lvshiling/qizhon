<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:iterator value="#request.imgArray" status="u">
	<li class="fleft">
		<img alt="点击设为头像" title="点击设为头像" border="0" width="50" height="50" class="pd05 hand ${u.index >17 ?'none':'' }" src="${value }" onclick="$('#userIcon').val('${value }');$('#changeUserIconForm').submit();">
	</li>
</s:iterator>