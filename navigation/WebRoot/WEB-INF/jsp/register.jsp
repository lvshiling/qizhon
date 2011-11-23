<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页 - ${siteTitle}</title>
</head>
<body>
<!-- 内容 -->
<div id="content" style="height: 200px;" >
	<s:if test="userToken.user != null">
		<script type="text/javascript">
		$(function(){
			alert("${userToken.user.name } 已登录");
		});
		</script>
	</s:if>
	<s:else>
		<script type="text/javascript">
		$(function(){
			register();
		});
		</script>
	</s:else>
</div>
<!-- END for 内容 -->
</body>
</html>