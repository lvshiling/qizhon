<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ include file="/commons/taglib.jsp" %>
<p class="top">
	<s:if test="userToken.user != null">
		欢迎您：${userToken.user.name } <a href="javascript:void(0);" onclick="logout();">登出</a>
	</s:if>
	<s:else>
		<a href="${domain }/jiasu/home.do">登录</a>
	</s:else>
</p>