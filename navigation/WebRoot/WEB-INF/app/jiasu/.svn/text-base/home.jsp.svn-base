<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人中心 - ${jiasuTitle}</title>
<link rel="stylesheet" type="text/css" media="screen"  href="${static}/styles/jiasu/style.css" /> 
</head>
<body>
<!-- 内容 -->
<div id="wrap">
	<%@ include file="/commons/jiasu/jiasu_userPad.jsp" %>
    <ul id="menu">
    	<li style="width:380px; height:41px;background:url(${static}/styles/images/bg_nav_l.jpg) no-repeat;"></li>
    	<li>
        	<%@ include file="/commons/jiasu/menu.jsp" %>
   		</li>
        <li style="width:58px;height:41px;background:url(${static}/styles/images/bg_nav_r.jpg) no-repeat;"></li>
	</ul>
    <p class="middle_blank clear"></p>
	<div id="main">
    	<div id="m_top">
        	<div id="container">
            	<div class="leftside">
                	<p class="p_title"><img src="${static}/styles/images/title_personal.jpg" alt="个人中心"/></p>
                    <br />
                    <%@ include file="/commons/jiasu/jiasu_homeMenu.jsp" %>
                </div>
                <div class="rightside">
	                <s:if test="userToken.user != null">
	                	欢迎您：${userToken.user.name }
	                </s:if>
	                <s:else>
                	<p class="r_title"><img src="${static}/styles/images/title_login.jpg" /></p>
                    <p class="bet"></p>
                    <br/>
                  	<br/>
                  	<form onsubmit="checkLogin();return false;">
                    <ul id="login" style="background-image: url('');">
                    	<li class="normal" id="login_tips" style="color: red;"></li>
                    	<li class="normal"><font style="font-size: 14px;">邮件地址：</font><input id="nav_email" type="user.mail"></li>
                        <li class="normal"><font style="font-size: 14px;">登录密码：</font><input type="password" id="nav_password" type="user.password"></li>
                        <li>
                        	<input type="submit" style="display: none;" />
                        	<button onclick="checkLogin();" class="btn_login p_btn"></button> 
                        	<button onclick="window.location.href='${domain }/jiasu/register.do';return false;" class="btn_reg p_btn"></button>
                        </li>
                    </ul>
                    </form>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
	              	</s:else>
              	</div>
                <p class="clear"></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function checkLogin(){		//本站用户登录
	var email = $("#nav_email").val();
	var password = $("#nav_password").val();
	$("#login_tips").html("正在登录中，请稍候...");
	$.post(Path.domain+"/user/ajaxLoginApi.do", {"user.mail":email,"user.password":password}, function(d){
		if(d['status'] == 1){
			$("#login_tips").html(d['message']+"，请稍候");
			window.location.reload();
		}else $("#login_tips").html( d['message']||"失败");
	},'json');
}
</script>
<!-- END for 内容 -->
</body> 
</html> 