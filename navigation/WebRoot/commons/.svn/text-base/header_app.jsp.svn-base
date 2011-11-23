<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ include file="/commons/taglib.jsp" %>
<!-- 头部 -->
<div id="header">
	<div class="top">
		<div class="fleft pt10">
		<marquee onclick="openNoice();" class="w300 hand alert" id="notifyContent" behavior="scroll" direction="left" scrollamount="3"></marquee> 
		</div>
		<div id="userInfo" class="fright mr10">
			<s:if test="userToken.user != null">
				<a href="${domain }/user/index.do" title="用户中心。修改密码，修改头像，修改昵称">${userToken.user.name } [ 用户中心 ]</a> <a href="javascript:logout();" title="登出">[ 登出 ]</a>
			</s:if>
			<s:else>
				<a href="javascript:login();void(0);" title="帐户登录">[ 登录 ]</a> <a href="javascript:register();void(0);" title="注册本站用户">[ +注册 ]</a> 
			</s:else>
		</div>
	</div>
</div>
<div id="user_login_form" class="none" title="用户登录">
	<p class="validateTips" id="login_tips">请输入用户信息。可直接使用 <b>域帐号</b> 登录</p>
	<fieldset>
		<form class="fleft w300 pr20" style="border-right: 1px #eee solid;" onsubmit="checkLogin();return false;">
			<input type="submit" class="none">
			<label for="nav_email">邮件地址</label>
			<input type="text" name="user.mail" id="nav_email" value="" class="text ui-widget-content ui-corner-all wp95" maxlength="50" />
			<label for="nav_password">密码</label>
			<input type="password" name="user.password" id="nav_password" value="" class="text ui-widget-content ui-corner-all wp95" />
			<label ><a href="javascript:;" onclick="register();" title="注册用户">注册本站用户</a></label>
		</form>
		<div class="fleft pd10 ml20">
			<div><a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪登录"><img src="http://www.sinaimg.cn/blog/developer/wiki/240.png" border="0"></a></div>
			<div class="mt10"><a href="javascript:;" onclick="adLogin();" title="域帐号登录"><img src="${static }/images/skin/ad_login.png" border="0"></a></div>
		</div>
	</fieldset>
</div>
<div id="ad_login_form" class="none" title="域用户登录">
	<p class="validateTips" id="ad_login_tips">请输入 <b>域帐号</b> 信息 </p>
	<fieldset>
		<form class="fleft w300 pr20" style="border-right: 1px #eee solid;" onsubmit="checkAdLogin();return false;">
			<input type="submit" class="none">
			<label for="adEmail">域邮件地址</label>
			<input type="text" name="user.mail" id="adEmail" value="" class="text ui-widget-content ui-corner-all wp95" maxlength="50" />
			<label for="adPassword">域密码</label>
			<input type="password" name="user.password" id="adPassword" value="" class="text ui-widget-content ui-corner-all wp95" />
			<label ><a href="javascript:;" onclick="login();" title="本站用户登录">本站用户登录</a>　<a href="javascript:;" onclick="register();" title="注册用户">注册本站用户</a></label>
		</form>
		<div class="fleft pd10 ml20">
			<a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪登录"><img src="http://www.sinaimg.cn/blog/developer/wiki/240.png" border="0"></a>　
		</div>
	</fieldset>
</div>
<div id="user_register_form" class="none" title="用户注册">
	<p class="validateTips" id="register_tips">请填写下列资料</p>
	<fieldset>
		<form class="fleft w300 pr20" style="border-right: 1px #eee solid;" id="userRegisterForm" action="${domain }/user/ajaxRegisterApi.do" method="post">
			<input type="submit" class="none">
			<label for="email">邮件地址</label>
			<input type="text" name="user.mail" value="" class="text ui-widget-content ui-corner-all wp95" maxlength="50" />
			<label for="password">密码</label>
			<input type="password" name="user.password" id="registerPassword" value="" class="text ui-widget-content ui-corner-all wp95" />
			<label for="password">昵称</label>
			<input type="text" name="user.name" value="" class="text ui-widget-content ui-corner-all wp95" />
			<label class="mt10"><a href="javascript:;" onclick="login();" title="本站用户登录">本站用户登录</a></label>
		</form>
		<div class="fleft pd10 ml20">
			<div><a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪登录"><img src="http://www.sinaimg.cn/blog/developer/wiki/240.png" border="0"></a></div>
			<div class="mt10"><a href="javascript:;" onclick="adLogin();" title="域帐号登录"><img src="${static }/images/skin/ad_login.png" border="0"></a></div>
		</div>
	</fieldset>
</div>
<div id="user_notice_form" class="none" title="收件箱">
	<p class="validateTips" id="notice_tips"></p>
	<fieldset>
		<ul id="noticeContainer"></ul>
	</fieldset>
</div>
<div id="system_change_log" class="none" title="系统开发日志"></div>
<script type="text/javascript">
var global_userId = parseInt('${userToken.user.id}');
</script>
<script type="text/javascript" src="${static}/js/header.js"></script>
<!-- END for 头部 -->