<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ include file="/commons/taglib.jsp" %>
<!-- 头部 -->
<div id="header">
	<div id="headerMain">
		<div id="logoBar">
			<a href="/" class="logoBox"><img class="logoImg" src="${domain }/images/video/logo.png" /></a>
		</div>
		<div id="rightBar">
			<div id="topbar">
				<s:if test="userToken.user != null">
					<a href="${domain }/user/index.do" title="修改密码，修改头像，修改昵称">${userToken.user.name }用户中心</a>|<a href="javascript:logout();" title="登出">登出</a>|<a href="">视频客服</a>
				</s:if>
				<s:else>
					<a href="javascript:login();void(0);" title="帐户登录">登录</a>|<a href="javascript:register();void(0);" title="注册本站用户">注册</a>|<a href="">视频客服</a>
				</s:else>
			</div>
			<div id="navbar"><a href="/" class="lit">首页</a>|<a href="/rank/rank.do">排行榜</a>|<a href="">任务</a>|<a href="">家族</a>|<a href="">小游戏</a>|<a href="">充值乐币</a></div>
		</div>
	</div>
</div>
<div id="user_login_form" class="none" title="用户登录">
	<fieldset>
		<form onsubmit="checkLogin();return false;">
			<input type="submit" class="none">
			<dl>
				<dt class="pl20 pr20">
					<label class="fleft red">请输入用户信息</label><label class="fright">还没有帐号<a class="pl05" href="javascript:;" onclick="register();">快速注册</a></label>
				</dt>
				<dd>
					<label class="tright w50 pl60 pt08">邮件地址</label>
					<input type="text" name="user.mail" id="nav_email" value="" class="text wp95" maxlength="50" style="width:220px;" />
				</dd>
				<dd class="mb05">
					<label class="tright w50 pl60 pt08">密码</label>
					<input type="password" name="user.password" id="nav_password" value="" class="text wp95" style="width:220px;"/>
				</dd>
			</dl>
		</form>
	</fieldset>
</div>
<div id="user_register_form" class="none" title="用户注册">
	<fieldset>
		<form id="userRegisterForm" action="${domain }/user/ajaxRegisterApi.do" method="post">
			<input type="submit" class="none">
			<dl>
				<dt class="pl20 pr20">
					<label class="fleft red">请填写下列资料</label><label class="fright">已有帐号<a class="pl05" href="javascript:;" onclick="login();">立即登录</a></label>
				</dt>
				<dd>
					<label class="tright w50 pl60 pt08">邮件地址</label>
					<input type="text" name="user.mail" value="" class="text wp95" maxlength="50" style="width:220px;" />
				</dd>
				<dd>
					<label class="tright w50 pl60 pt08">密码</label>
					<input type="password" name="user.password" id="registerPassword" value="" class="text wp95" style="width:220px;"/>
				</dd>
				<dd class="mb05">
					<label class="tright w50 pl60 pt08">昵称</label>
					<input type="text" name="user.name" value="" class="text wp95" style="width:220px;"/>
				</dd>
			</dl>
		</form>
	</fieldset>
</div>
<script type="text/javascript">
var global_userId = parseInt('${userToken.user.id}');
</script>
<script type="text/javascript" src="${static}/js/video/header.js"></script>
<!-- END for 头部 -->