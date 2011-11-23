<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>支付提示 - ${siteTitle}</title>
</head>
<body>
<!-- 支付提示 -->
<!-- 内容 -->
<div id="content" class="clearfix">
	<s:if test="pageFlag">
		<div class="payment clearfix">
			<h3>提示信息</h3>
			<div class="box1">
				<p><span>${_} 请与工作人员取得联系!</span>　　<a href="${domain }/index.do">返回首页</a></p>
			</div>
		</div>
	</s:if>
	<s:else>
		<div class="pay-ok">
			<h3 class="icon-success-big mb10"><span class="fc7">${requestScope.buyer_email }</span></h3>
			<h3 class="tcenter"><span class="fc7">${requestScope.out_trade_no }</span> 已支付成功！</h3>
			<h3 class="tcenter">&nbsp;</h3>
			<h3 class="tcenter"><a style="font-size: 14px;" href="${domain }/user/index.do">点此进入用户中心...</a></h3>
		</div>
	</s:else>
</div>
<!-- END for 内容 -->
<!-- END for 支付提示 -->
</body>
</html>
