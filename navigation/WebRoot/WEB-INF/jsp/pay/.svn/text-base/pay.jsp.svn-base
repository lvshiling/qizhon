<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<!-- 在线支付 -->
<!-- 内容 -->
<div id="content" class="clearfix">
	<div class="payment clearfix">
		<s:if test="pageFlag">
			<h3>提示信息</h3>
			<div class="box1">
				<p><span>${_}</span>　　<a href="javascript:history.go(-1);">返回</a> | <a href="${domain }/index.do">返回首页</a></p>
			</div>
		</s:if>
		<s:else>
			<h3>支付信息</h3>
			<div class="box1">
				<p>正在为您转入支付网关，如在<span class="yushou">3 </span>秒内未进行跳转请手动点击以下链接　</p>
				<p><a style="text-decoration: underline;font-size: 14px;" href="${requestScope.strUrl}">点击该处进行在线支付...</a>
				<script>window.location='${requestScope.strUrl}';</script></p>
			</div>
		</s:else>
	</div>
</div>
<!-- END for 内容 -->
<!-- END for 在线支付 -->
</body>
</html>
