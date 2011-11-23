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
				<!-- <a id="noticetps" style="display:none;" href="">[ 新消息(<span></span>) ]</a> -->
				<s:if test="userToken.user != null">
					<a href="${domain }/user/index.do" title="修改密码，修改头像，修改昵称">${userToken.user.name }用户中心</a>|<a href="javascript:logout();" title="登出">登出</a>|<a href="/">视频客服</a>
				</s:if>
				<s:else>
					<a href="javascript:login();void(0);" title="帐户登录">登录</a>|<a href="javascript:register();void(0);" title="注册本站用户">注册</a>|<a href="/">视频客服</a>
				</s:else>
			</div>
			<div id="navbar"><a id="nv_index" href="/" class="lit">首页</a>|<a id="nv_rank" href="/rank/rank.do">排行榜</a>|<a id="nv_task" href="/">任务</a>|<a id="nv_family" href="/">家族</a>|<a id="nv_game" href="/">小游戏</a>|<a id="nv_charge" href="${domain }/pay/topay.do" target="_blank">充值乐币</a></div>
		</div>
	</div>
</div>
<div id="user_login_form" class="none" title="用户登录">
	<p class="validateTips" id="login_tips">请输入用户信息。右侧使用 <b>微博帐号</b> 登录</p>
	<fieldset>
		<form class="fleft w300 pr20" style="border-right: 1px #eee solid;" onsubmit="checkLogin();return false;">
			<input type="submit" class="none">
			<label for="nav_email">邮件地址</label>
			<input type="text" name="user.mail" id="nav_email" value="" class="text wp95" maxlength="50" />
			<label for="nav_password">密码</label>
			<input type="password" name="user.password" id="nav_password" value="" class="text wp95" />
			<label><a href="javascript:;" onclick="register();" title="注册用户">注册本站用户</a></label>
		</form>
		<div class="fleft pd10 ml20">
			<div class="mb10"><a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪微博登录"><img src="${domain }/images/video/icon/sina_login.png" /></a></div>
			<!-- <div><a href="javascript:;" title="腾讯微博登录"><img src="${domain }/images/video/icon/tencent_login.png" /></a></div>-->
		</div>
	</fieldset>
</div>
<div id="user_register_form" class="none" title="用户注册">
	<p class="validateTips" id="register_tips">请填写下列资料。右侧使用 <b>微博帐号</b> 登录</p>
	<fieldset>
		<form class="fleft w300 pr20" style="border-right: 1px #eee solid;" id="userRegisterForm" action="${domain }/user/ajaxRegisterApi.do" method="post">
			<input type="submit" class="none">
			<label for="email">邮件地址</label>
			<input type="text" name="user.mail" value="" class="text wp95" maxlength="50" />
			<label for="password">密码</label>
			<input type="password" name="user.password" id="registerPassword" value="" class="text wp95" />
			<label for="password">昵称</label>
			<input type="text" name="user.name" value="" class="text wp95" />
			<label class="mt10">已有帐号 <a href="javascript:;" onclick="login();" title="本站用户登录">立即登录</a></label>
		</form>
		<div class="fleft pd10 ml20">
			<div class="mb10"><a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪微博登录"><img src="${domain }/images/video/icon/sina_login.png" /></a></div>
			<!-- <div><a href="javascript:;" title="腾讯微博登录"><img src="${domain }/images/video/icon/tencent_login.png" /></a></div>-->
		</div>
	</fieldset>
</div>
<!-- div id="user_notice_form" class="none" title="收件箱">
	<p class="validateTips" id="notice_tips"></p>
	<fieldset>
		<ul id="noticeContainer">
			<s:iterator value="#request.noticeList">
				<li>${refTitle}</li>
			</s:iterator>
		</ul>
	</fieldset>
</div> -->
<script type="text/javascript">
var global_userId = parseInt('${userToken.user.id}');
</script>
<script type="text/javascript" src="${static}/js/video/header.js"></script>
<!-- END for 头部 -->