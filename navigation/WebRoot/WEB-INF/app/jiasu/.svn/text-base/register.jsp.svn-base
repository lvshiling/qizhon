<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册 - ${jiasuTitle}</title>
<link rel="stylesheet" type="text/css" media="screen"  href="${static}/styles/jiasu/style.css" /> 
<script type="text/javascript" src="${static}/js/lib/md5.min.js"></script>
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
            		<%@ include file="/commons/jiasu/jiasu_download.jsp" %>
                </div>
                <div class="rightside">
                	<p class="r_title"><img src="${static}/styles/images/title_reg.jpg" /></p>
                    <div id="reg">
                    	<form id="userRegisterForm" action="${domain }/user/ajaxRegisterApi.do" method="post">
                    	<ul> 
                    		<li id="register_tips" style="padding-left: 50px; color: red;"></li>
                        	<li class="normal" style="font-size: 14px;"><font >邮件地址：</font><input type="text" name="user.mail"> <font style="color:red;">* 此项为登录帐号</font></li>
                            <li class="normal"><font style="font-size: 14px;">输入密码：</font><input type="password" name="user.password" id="registerPassword"></li>
                            <li class="normal"><font style="font-size: 14px;">确认密码：</font><input type="password" id="rePassword"></li>
                            <li class="normal"><font style="font-size: 14px;">昵　　称：</font><input type="text" name="user.name"></li>
                            <li>
                            	<input type="hidden" name="areaId" value="2" />
                            	<input style="border: 0px; width: 111px; height: 42px;" type="image" src="${static }/styles/images/btn_reg.jpg"  />
                            </li>
                        </ul>
                        </form>
                    </div>
                    <br/>
                    <br/>
              </div>
                <p class="clear"></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	$('#userRegisterForm').ajaxForm({
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				$("#register_tips").html(d['message']);
				window.location.href = Path.domain+"/jiasu/home.do";
			}else $("#register_tips").html( d['message']||"失败");
        },beforeSubmit: function(){
        	var password = $("#registerPassword").val();
        	var repassword = $("#rePassword").val();
        	if(repassword != password) {
        		$("#register_tips").html('两次输入的密码不一致！');
        		return false;
        	}
        }
    });
});
</script>
<!-- END for 内容 -->
</body> 
</html> 