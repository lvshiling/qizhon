<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人首页 - ${siteTitle}</title>
<script type="text/javascript" src="${domain }/js/lib/jquery.embed.js"></script>
<style type="text/css">
#userInfoTable td,#userInfoTableShow td{padding: 10px; font-size: 14px;}
#userInfoTableShow{ width: 100%;}
</style>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
  <div id="userContent">
		<div class="w200 fleft pd05" style="border-right: 1px solid #ccc; height: 400px;">
			<div>
				<s:if test="#request.isSelf">
					<img src="${requestScope.user.icon1 }" width="180" onclick="uploadHead();" class="hand" />
					<hr />${requestScope.user.name }　
					<input type="button" value=" 上传头像 " onclick='uploadHead(${userId});' />
					<a href="${domain }/user/chat.do">进入我的聊天室</a>
				</s:if>
				<s:else>
					<img src="${requestScope.user.icon1 }" width="180" />
					<hr />${requestScope.user.name }　
					<input type="button" value=" 发送消息 " onclick='sendMsgTo(${userId});' />
					<a href="${domain }/user/chat.do?uid=${requestScope.user.id }">进入他的聊天室</a>
				</s:else>
				
			</div>
		</div>
		<div class="pd05" style="margin-left: 240px;">
			<div id="userInfo">
				<div>
					<span class="ft14">游戏资料</span>
					<s:if test="#request.isSelf">
						<div class="fright"><a>[编辑]</a></div>
					</s:if>			
				</div>
				
				<hr />
				<table class="mb30"></table>
				<div>
					<span class="ft14">用户资料</span>
					<s:if test="#request.isSelf">
						<div class="fright"><a href="javascript:void(0);" onclick="$('#moreUserInfo').dialog('open');">[编辑]</a></div>
					</s:if>			
				</div>
				<hr />
				<table id="userInfoTableShow" class="mb30">
					<tr>
						<td>年龄：${requestScope.userInfo.userAge }</td>
						<td>性别：
							${requestScope.userInfo.userSex == 0? '女':'' }
							${requestScope.userInfo.userSex == 1? '男':'' }
						</td>
					</tr>
					<tr>
						<td>省/直辖市：${requestScope.userInfo.userProvince == 1?'上海':'' }</td>
						<td>市/区：${requestScope.userInfo.userCity == 1?'黄浦区':'' }</td>
					</tr>
					<tr>
						<td>学历：
							${requestScope.userInfo.userDegree == 0?'':'' }
							${requestScope.userInfo.userDegree == 2?'初中及以下':'' }
							${requestScope.userInfo.userDegree == 3?'高中':'' }
							${requestScope.userInfo.userDegree == 4?'中专':'' }
							${requestScope.userInfo.userDegree == 5?'大专':'' }
							${requestScope.userInfo.userDegree == 6?'大学':'' }
							${requestScope.userInfo.userDegree == 7?'硕士':'' }
							${requestScope.userInfo.userDegree == 8?'博士及以上':'' }
						</td>
						<td></td>
					</tr>
					<tr>
						<td>身高：${requestScope.userInfo.userHeight }</td>
						<td>体型：
							${requestScope.userInfo.userWeight == 1?'偏瘦':'' }
							${requestScope.userInfo.userWeight == 2?'标准':'' }
							${requestScope.userInfo.userWeight == 3?'偏胖':'' }
						</td>
					</tr>
				</table>
				
				
				<div>
					<span class="ft14">用户照片</span>
					<s:if test="#request.isSelf">
						<div class="fright"><a href="javascript:void(0);" onclick="multUpload();">[上传]</a></div>
					</s:if>			
				</div>
				<hr />
				<div>
					<ul>
						<li><a onclick="getMyPics();" href="javascript:void(0);">点击查看</a></li>
					</ul>
				</div>
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
	$.post("${domain}/user/ajaxGetUserPicsPage.do", {"p":p||1,"uid":"${userId}"}, function(d){
		$("#picGallery").html(d).dialog("open");
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