<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>编辑 - ${jiasuTitle}</title>
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
                	<p class="r_title"><img src="${static}/styles/images/title_edit.jpg" /></p>
                  <p class="bet"></p>
                  	<form action="${domain }/user/ajaxChangeUserPasswordApi.do" method="post" id="changePasswordForm">
	                    <ul id="edit" style="background-image: url(''); font-size: 14px;">
	                    	<li class="normal" id="changePasswordTips" style="color: red; padding-top: 20px;"></li>
	                    	<li class="normal">邮箱：${userToken.user.mail }</li>
	                        <li class="normal">昵称：${userToken.user.name } <a href="javascript:;" onclick="changeUserName();">[修改昵称]</a></li>
	                        <li class="normal">当前密码：<input id="oldpassword" name="oldpassword" type="password"></li>
	                        <li class="normal">新的密码：<input id="newpassword" name="newpassword" type="password"></li>
	                        <li class="normal">再输一次：<input id="chkpassword" name="chkpassword" type="password"></li>
	                        <li><button class="btn_qd p_btn"></button></li>
	                    </ul>
                    </form>
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
	$('#changePasswordForm').ajaxForm({	//创建回复
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
	    		document.getElementById("changePasswordForm").reset();
				$("#changePasswordTips").html("密码修改成功");
				alert("密码修改成功");
			}else if(d['status'] == -2){
				login();
			}else $("#changePasswordTips").html( d['message']||"失败");
        },
        beforeSubmit:function(f){
        	var old = $("#oldpassword").val();
        	var newp = $("#newpassword").val();
        	var chk = $("#chkpassword").val();
        	if(old == '') {$("#changePasswordTips").html('旧密码不得为空');return false;}
        	if(newp == '') {$("#changePasswordTips").html('新密码不得为空');return false;}
        	if(chk == '') {$("#changePasswordTips").html('请再输入新密码');return false;}
        	if(chk != newp) {$("#changePasswordTips").html('两次密码不符');return false;}
        	return true;
        }
    });
});
//修改用户名
function changeUserName(){
	var name = window.prompt('请输入新的昵称');
	if(name != null && name != ''){
		alert(globla_loading);
		$.post("${domain}/user/ajaxChangeUserNameApi.do", {"title":name}, function(d){
			if(d['status'] == 1){
				window.setTimeout("window.location.reload();",1000);
				alert("修改成功，请等待刷新");
			}else if(d['status'] == -2){
				login();
			}else alert(d['message']||"修改失败");
		},'json');
	}
}
</script>
<!-- END for 内容 -->
</body> 
</html> 