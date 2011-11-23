<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:if test="#request.weiboList.size > 0">
	<s:if test="bindType == 0">
		<%@ include file="/WEB-INF/jsp/weibo/sinaPage.jsp" %>
	</s:if>
	<s:elseif test="bindType == 3">
		<%@ include file="/WEB-INF/jsp/weibo/qqPage.jsp" %> 
	</s:elseif>
	<s:elseif test="bindType == 4">
		<%@ include file="/WEB-INF/jsp/weibo/neteasyPage.jsp" %> 
	</s:elseif>
</s:if>
<s:else>
	<li class="mt05">暂无</li>
	<script type="text/javascript" >
		loadingFlag = true;
		load_status_count = 0;
	</script>
</s:else>