<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户中心 - ${siteTitle}</title>
<script type="text/javascript" src="${domain }/js/lib/jquery.embed.js"></script>
<style type="text/css">
#userInfoTable td{padding: 10px;}
</style>



</head>




<body>
<!-- 内容 -->
<div id="content" class="clearfix">
  <div id="userContent">
	<div id="user" class="w450 fleft">
		<div>
			<div class="lh200 small_title" ><div class="fleft">修改用户资料</div><a class="fright" href="${domain }/user/id.do">预览我的首页</a> </div>
			<div class="clear"></div>
			<div id="userInfoContainer" class="small_content small_buttom" style="background-color: #DDF3F7;">
				<form action="${domain }/user/ajaxChangeUserPasswordApi.do" method="post" id="changePasswordForm">
				<table class="ml10 mr10 mb10 w410" id="topicCreaterTable">
					<s:if test="userToken.user.mail.indexOf('@')!=-1">
						<tr><td align="right" class="w80 pt10" valign="top">昵称：</td><td>${userToken.user.name }　<a href="javascript:;" onclick="changeUserName();">[修改昵称]</a></td></tr>
						<tr><td align="right" class="w80 pt10" valign="top">注册邮箱：</td><td>${userToken.user.mail }</td></tr>
						<tr><td align="right" class="w80 pt10" valign="top"></td><td class="alert" id="changePasswordTips">修改密码</td></tr>
						<tr><td align="right" class="w80 pt10" valign="top">旧密码：</td><td><input type="password" class="text pd05 wp95" style="border: 0px;width: 290px" name="oldpassword" id="oldpassword"></td></tr>
						<tr><td align="right" class="w80 pt10" valign="top">新密码：</td><td><input type="password" class="text pd05 wp95" style="border: 0px;width: 290px" name="newpassword" id="newpassword"></td></tr>
						<tr><td align="right" class="w80 pt10" valign="top">新密码：</td><td><input type="password" class="text pd05 wp95" style="border: 0px;width: 290px" name="chkpassword" id="chkpassword"></td></tr>
						<tr><td align="right" class="w80 pt10" valign="top"></td><td>
							<input type="submit" value=" 修改登录密码 " />
							<input type="button" value=" 更多资料 " onclick='$("#moreUserInfo").dialog("open");' />
							<input type="button" value=" 发送消息 " onclick='sendMsgTo(${userToken.user.id});' />
						</td></tr>
					</s:if>
					<s:else>
						<tr><td align="right" class="w80 pt10" valign="top">昵称：</td><td>${userToken.user.name }　<a href="javascript:;" onclick="alert('新浪登录用户不能修改昵称');">[修改昵称]</a></td></tr>
						<tr><td align="right" class="w80 pt10" valign="top">注册标识：</td><td>${userToken.user.mail }</td></tr>
					</s:else>
				</table>
				</form>
			</div>
		</div>
		<!-- 微博 -->
		<div>
			<div class="lh200 small_title" ><div class="fleft">绑定新浪微博</div><a class="fright" href="javascript:;"></a> </div>
			<div class="clear"></div>
			<div style="background-color: #DDF3F7;" class="pd10 small_content small_buttom">
				<s:if test="#request.UserLink != null">
					<div>
						<a href="http://t.sina.com.cn/${requestScope.UserLink.linkField4 }" target="_blank">
							<img border="0" id="sinaUserLogo" src="http://tp2.sinaimg.cn/${requestScope.UserLink.linkField4 }/50/1/1" align="absMiddle" /> 
						</a>
						<a href="http://t.sina.com.cn/${requestScope.UserLink.linkField4 }" target="_blank">
							${requestScope.UserLink.linkField1 } [ <img border="0" src="http://www.sinaimg.cn/blog/developer/wiki/LOGO_16x16.png" align="absMiddle" /> 已绑定 ]
						</a>
						<a href="javascript:;" onclick="$('#userIcon').val($('#sinaUserLogo').attr('src'));$('#changeUserIconForm').submit();">[ 同步头像 ]</a>
						<s:if test="userToken.user.id == 7">
							<a href="${domain }/bind/sina/ajaxSyncWeiboApi.do" target="_blank">[ 同步新浪数据 ]</a>
						</s:if> 
						<s:if test="userToken.user.mail.indexOf('@')!=-1">
							<a href="${domain }/bind/sina/index.do?opt=1"> [ 重新绑定 ] </a>
						</s:if>
					</div>
				</s:if>
				<s:else>
					<div>
						<a href="${domain }/bind/sina/index.do?opt=1">
							<img src="http://www.sinaimg.cn/blog/developer/wiki/32.png" align="absMiddle" border="0" />
						</a> 
						<a href="${domain }/bind/sina/index.do?opt=1"> [ 现在就去绑定 ] </a>
					</div>
				</s:else>
			</div>
		</div>
		<div>
			<div class="lh200 small_title" ><div class="fleft">帐户信息</div><a class="fright" href="javascript:;"></a> </div>
			<div class="clear"></div>
			<div style="background-color: #DDF3F7;" class="pd10 small_content small_buttom">
				余额：${requestScope.userCredit.credit }
				<div class="pd10">
					<form action="${domain }/pay/payPage.do" target="_blank">
						<input type="text" name="amount" value="" />
						<input type="submit" value="充值" width="30"/>
					</form>
				</div>
				<div>
					<ul>
						<s:iterator value="#request.logList">
							<li>
								<s:date name="addTime" format="yyyy-MM-dd HH:mm" ></s:date>：
								<s:if test="type==0">发起充值</s:if>
								<s:if test="type==10">支付成功</s:if>
								<s:if test="type==20">消费</s:if>
								<s:if test="type==99">支付失败</s:if>
								<font color="red">${credit }</font>
							</li>
						</s:iterator>
					</ul>
				</div>
			</div>
		</div>
		
	</div>
	<div id="userMore" class="rightRow">
		<div class="lh200 wp100 small_title"><div class="fleft">修改头像</div><div class="fright"></div></div>
		<div class="small_content small_buttom" style="background-color: #EEE;">
			<form action="${domain }/user/ajaxChangeUserIconApi.do" method="post" id="changeUserIconForm">
			<table class="ml10 mr10 mb10 w450" id="topicCreaterTable">
				<tr>
				   <td align="right" class="w60 pt10" valign="top"></td><td>
					   <div class="fleft" style="width:50px;height: 50px; background-color: #999; margin-right: 5px; cursor: pointer;" onclick="uploadHead();">
						    <img src="${userToken.user.icon }?_=${_ }" id="iconPreview" width="48" height="48" style="margin-top: 1px;margin-left: 1px;" />
					   </div>
				    </td>
				</tr>
				<tr><td align="right" class="w60 pt10" valign="top"></td><td class="alert" id="changeIconTips">修改头像，图片尺寸 48*48，尽量不要选择太大的图片</td></tr>
				<tr><td align="right" class="w60 pt10" valign="top">图片网址：</td><td><input type="text" value="http://" class="text pd05 wp95" style="border: 0px;" name="userIcon" id="userIcon" onclick="___c(this);"></td></tr>
				<tr><td align="right" class="w60 pt10" valign="top"></td><td>
					<input type="submit" value=" 修改头像 " />
					<input type="button" value=" 上传头像 " onclick="uploadHead();" />
					<input type="button" value=" 上传照片 " onclick="multUpload();" />
					<input type="button" value=" 我的照片 " onclick="getMyPics();" />
				</td></tr>
				<tr><td align="right" class="w60 pt10" valign="top" colspan="2">
					<div class="pd10"><a href="javascript:;" onclick="getRecommend();">[下一页]</a></div>
					<ul id="recommendIconCon" class="wp100"></ul>
				</td></tr>
			</table>
			</form>
		</div>
	</div>
  </div>
</div>
<div id="avatarWrapper" title="上传头像" style="width: 700px; height: 480px" class="none"></div>
<div id="multUploader" title="批量上传" class="none">
	<div id="uploader" style="width: 670px; height: 450px;" ></div>
</div>
<div id="picGallery" title="相片列表" class="none"></div>
<div id="moreUserInfo" title="更多资料" class="none">
<form method="post" id="userMoreInfoForm" action="${domain }/user/ajaxUpdateUserInfoApi.do">
	<table id="userInfoTable">
		<tr>
			<td>年龄：</td>
			<td><input type="text" name="userInfo.userAge" /></td>
		</tr>
		
		<tr>
			<td>性别：</td>
			<td>
				<input type="radio" name="userInfo.userSex" value="1" /> 男
				<input type="radio" name="userInfo.userSex" value="0" /> 女
			</td>
		</tr>
		
		<tr>
			<td>省份：</td>
			<td>
				<select name="userInfo.userProvince">
					<option value="0">请选择</option>
					<option value="1">上海</option>
				</select> 
			</td>
		</tr>
		
		<tr>
			<td>市/区：</td>
			<td>
				<select name="userInfo.userCity">
					<option value="0">请选择</option>
					<option value="1">黄浦区</option>
				</select> 
			</td>
		</tr>
		
		<tr>
			<td>学历：</td>
			<td>
				<select name="userInfo.userDegree">
					<option value="0">请选择</option>
					<option value="2">初中及以下</option>
					<option value="3">高中</option>
					<option value="4">中专</option>
					<option value="5">大专</option>
					<option value="6">大学</option>
					<option value="7">硕士</option>
					<option value="8">博士及以上</option>
				</select> 
			</td>
		</tr>
		
		<tr>
			<td>身高：</td>
			<td><input type="text" name="userInfo.userHeight" /></td>
		</tr>
		
		<tr>
			<td>体型：</td>
			<td>
				<select name="userInfo.userWeight">
					<option value="0">请选择</option>
					<option value="1">偏瘦</option>
					<option value="2">标准</option>
					<option value="3">偏胖</option>
				</select> 
			</td>
		</tr>
		
		<tr>
			<td>密码找回答案：</td>
			<td><input type="text" name="userInfo.userAnswer" /></td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
			<td><input type="submit" value=" 提交修改 " /></td>
		</tr>
		
	</table>
</form>
</div>
<script type="text/javascript">
$(function(){
	$("#moreUserInfo").dialog({
		width:700,height:560,position: ['',50],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).dialog('close');}
		}
	});
	$("#avatarWrapper").dialog({
		width:700,height:560,position: ['',50],modal:false,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).dialog('close');}
		}
	});
	$("#picGallery").dialog({
		width:620,height:580,position: ['',50],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).html('').dialog('close');},
			" 上传相片 ": function(){
				$(this).dialog("close");
				multUpload();
			}
		}
	});
	$("#multUploader").dialog({
		width:700,height:560,position: ['',50],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).dialog('close');},
			" 继续上传 ": function(){multUpload();}
		}
	});
	$('#userMoreInfoForm').ajaxForm({	//修改用户资料
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				alert("修改成功");
			}else if(d['status'] == -2){
				login();
			}else alert( d['message']||"失败");
        },
        beforeSubmit:function(f){
        }
    });
	$('#changePasswordForm').ajaxForm({	//创建回复
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
	    		document.getElementById("changePasswordForm").reset();
				$("#changePasswordTips").html("修改成功");
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
	$('#changeUserIconForm').ajaxForm({	//创建回复
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				$("#iconPreview").attr("src",$("#userIcon").val());
	    		document.getElementById("changeUserIconForm").reset();
				$("#changeIconTips").html("修改成功");
			}else if(d['status'] == -2){
				login();
			}else $("#changeIconTips").html( d['message']||"失败");
        },
        beforeSubmit:function(f){
        	var userIcon = $("#userIcon").val();
        	if(userIcon.length>200){alert('图片地址太长啦，最长200个字符');return false;};
        	if(userIcon == '' || userIcon=='http://' ) {$("#changeIconTips").html('图片地址不得为空');return false;}
        	return true;
        }
    });
    getRecommend();
});
function uploadHead(){
	$('#avatarWrapper').avatar(
		{src: "${domain}/images/swf/AvatarEditor.swf?v=1.4", expressInstall: "${domain}/images/swf/expressInstall.swf"},
		{photoUrl: "${domain}/images/default.jpg", saveUrl: "${domain}/user/ajaxUploadHeadApi.do",uid :"${userToken.user.id}"}
	).dialog('open');
}
function multUpload(){
	$('#uploader').multiupload({
		src: '${domain}/images/swf/multiupload.swf',
		version: [10, 0],
		expressInstall: '${domain}/images/swf/expressInstall.swf',
		onFail: function(e) {alert('failure');}
	}, {
		uploadUrl: 'ajaxMultUploadApi.do?target=${requestScope.target}',
		maxNum: 64,
		imgFormat: '图片文件|*.jpg;*.jpeg;*.png;*.gif;*.bmp'
	}).css("height","450px").parent().dialog("open");
}
function getMyPics(p){
	$.post("${domain}/user/ajaxGetUserPicsPage.do", {"p":p||1}, function(d){
		$("#picGallery").html(d).dialog("open");
	},'html');
}
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
//推荐
var global_recommend_page = 1;
function getRecommend(){
	$.post("${domain}/user/ajaxRecommendIconPage.do", {"p":global_recommend_page}, function(d){
		global_recommend_page ++;
		$("#recommendIconCon").html(d);
	},'html');
}
var App = window.App || {};
App.swfCall = function(result) {
	var code = result['code'];
	if(code == "M00001"){
		al("出错了 "+result['data']);
	}else if(code == "A00001"){
		alert("操作成功");
		window.location.reload();
	}else{al("未知错误!");}
}
</script>
<!-- END for 内容 -->
</body>
</html>