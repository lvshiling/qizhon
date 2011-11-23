<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新浪登录 - ${siteTitle}</title>
</head>
<body>
<div id="content">
	<div>
		<div class="pt20 alert">
		${_ }
		</div>
		<div class="pt20">
		<a href="${domain }/">[ 返回首页 ]</a> 　<a href="${domain }/user/index.do">[ 用户中心 ]</a>
		</div>
	</div>
</div>
<s:if test="#request.toUrl != null">
	<script type="text/javascript">
		window.location.href = "${requestScope.toUrl}";
	</script>
</s:if>
</body>
</html>