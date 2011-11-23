<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><jsp:directive.page 
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ include file="/commons/taglib.jsp" %>
<html>
<head>
<title>温馨提示 - ${siteTitle }</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
<meta http-equiv="description" content="this is my page"/>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<style>
body{font-size: 12px;}
</style>
</head>
<body>
<div id="content" class="clearfix" >
	<div class="lh200 wp99">
		<div class="small_title">
			<div class="fleft">温馨提示:</div><div class="fright">
			</div>
		</div>
		<div class="clear"></div>
		<div class="lh160 small_content small_buttom pd15">
			<p class="pt10">
				<s:property value="exception.message" />
			</p>
			<p class="pt10">
				<s:if test="userToken.user != null">
					<a href="${domain }/">返回首页</a>
				</s:if>
				<s:else>
					<a href="javascript:login();void(0);" title="帐户登录">[ <b>登录</b> ]（除本站用户外，还支持 微博帐号 登录）</a>　或　<a href="javascript:register();void(0);" title="注册本站用户">[ <b>+注册本站用户</b> ]</a> 
				</s:else>
			</p>
		</div>
		
		
		<div id="msg" style="display:none;">
			<s:property value="exceptionStack"/>
		</div>
	</div>
</div>
</body> 
</html>