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
				<a href="javascript:addBookmark('http://www.qule.com','趣乐 您身边的工作生活好帮手(www.qule.com)');">[ 加入收藏 ]</a>
		</div>
	</div>
	<div class="content">
		<div class="fleft ml20 mr30"><a href="${domain }/" title="返回首页"><img src="${domain }/images/skin/logo.gif" ></a></div>
		<div id="noticeInfo" class="fleft" style="position: relative;z-index:99;"  >
			<div class="fleft">
				<a title="提醒" href="javascript:;" onclick="openNoice();" ><img def="${domain }/images/skin/top/index1_r2_c2.jpg" ovr="${domain }/images/skin/top/index3_r2_c2.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/index1_r2_c2.jpg"></a>
				<a title="给力搜索，公司内资源索引" href="${domain }/file/index.do"><img def="${domain }/images/skin/top/search_h_1.jpg" ovr="${domain }/images/skin/top/search_h.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/search_h_1.jpg"></a>
				<a title="讨论区" href="${domain }/topic/index.do"><img def="${domain }/images/skin/top/index1_r2_c4.jpg" ovr="${domain }/images/skin/top/index3_r2_c4.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/index1_r2_c4.jpg"></a>
				<!-- 
				<div class="hand fb fleft ml10 lh200" style="padding-top:5px;width: 50px; height: 70px; text-align: center; color: #FF4500; background-repeat: no-repeat;background-position: top left;background-image: url('${domain }/images/skin/top/index1_r2_c2.jpg');" onclick="openNoice();" id="noticeNum" title="收件箱"></div>
				 -->
				<a title="微博" href="${domain }/weibo/index.do"><img def="${domain }/images/skin/top/index1_r2_c16.jpg" ovr="${domain }/images/skin/top/index3_r2_c16.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/index1_r2_c16.jpg"></a>
				<a title="GPASS" href="${domain }/gpass/index.do"><img def="${domain }/images/skin/top/index1_r2_c6.jpg" ovr="${domain }/images/skin/top/index3_r2_c6.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/index1_r2_c6.jpg"></a>
				<a title="电影" href="${domain }/movie/index.do"><img def="${domain }/images/skin/top/index1_r2_c8.jpg" ovr="${domain }/images/skin/top/index3_r2_c8.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/index1_r2_c8.jpg"></a>
				<a title="导航" href="${domain }/urls/index.do"><img def="${domain }/images/skin/top/index1_r2_c10.jpg" ovr="${domain }/images/skin/top/index3_r2_c10.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);"  class="ml10" src="${domain }/images/skin/top/index1_r2_c10.jpg"></a>
				<a title="邮件" href="${domain }/mail/index.do"><img def="${domain }/images/skin/top/index1_r2_c14.jpg" ovr="${domain }/images/skin/top/index3_r2_c14.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/index1_r2_c14.jpg"></a>
				<a title="AMT待办事宜" href="${domain }/app/amt/index.do"><img def="${domain }/images/skin/top/index1_r2_c20.jpg" ovr="${domain }/images/skin/top/index3_r2_c20.jpg" onmouseover="navOver(this,true);" onmouseout="navOver(this,false);" class="ml10" src="${domain }/images/skin/top/index1_r2_c20.jpg"></a>
			</div>
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
			<div><a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪登录">111</a></div>
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
			<a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪登录">111</a>　
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
			<div><a href="${domain }/bind/sina/sinaLoginPage.do?opt=1" title="新浪登录">111</a></div>
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
<div id="user_msg_form" class="none">
	<form action="${domain }/user/ajaxSendMsgApi.do" id="userMsgForm">
		<ul>
			<li><input type="hidden" name="target" id="msgToUserId" /></li>
			<li class="pd05"><textarea rows="3" name="msg" class="w300"></textarea></li>
			<li class="pd05"><input type="submit" value="发送站内信"></li>
		</ul>
	</form>
</div>
<script type="text/javascript">
var global_userId = parseInt('${userToken.user.id}');
</script>
<script type="text/javascript" src="${static}/js/header.js"></script>
<!-- END for 头部 -->