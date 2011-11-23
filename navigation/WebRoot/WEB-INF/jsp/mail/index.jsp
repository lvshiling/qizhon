<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>邮件 - ${siteTitle}</title>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
	<div class="wp99 small_title">
		<s:if test="#request.mailLink == null">
		<div class="fleft lh200">未设置邮箱地址。请先绑定邮箱</div><div class="fright"></div>
		<div class="clear"></div>
		<div style="background-color: #DDF3F7;" class="small_content small_buttom pd10">
			<form action="${domain }/mail/ajaxBindMailApi.do" method="post" id="bind_user_mail_from">
				<table class="wp100 ml10 mr10 mb10" >
					<tr>
						<td class="pd05" >&nbsp;</td>
						<td class="alert" id="bindMailTips">
							填写邮箱信息
						</td>
					</tr>
					<tr>
						<td align="right" class="w120 pt10 pd05" valign="top">选择邮箱类型：</td>
						<td>
							<select class="text pd05 w180" style="border: 0px;" name="mailMode" onchange="switchMailMode(this.value);" >
								<option value="">请选择</option>
								<option value="ztgame" selected="selected">巨人网络公司邮箱</option>
								<option value="163">网易邮箱</option>
								<option value="sina">新浪邮箱</option>
							</select>
							<input id="protocol" name="protocol" value="SSL" type="hidden" />
						</td>
					</tr>
					<tr>
						<td align="right" class="w150 pt10 pd05" valign="top">填写服务器地址：</td>
						<td>
							<input class="text pd05 wp65 onDisabled" style="border: 0px; background: #ddd" readonly="readonly" name="host" id="host" value="pop3.ztgame.com:995" type="text" /> *
						</td>
					</tr>
					<tr>
						<td align="right" class="w120 pt10 pd05" valign="top">用户名：</td>
						<td>
							<input class="text pd05 wp65" style="border: 0px;" name="account" id="account" value="" type="text" /> * 如:wanghui2
						</td>
					</tr>
					<tr>
						<td align="right" class="w120 pt10 pd05" valign="top">密码：</td>
						<td>
							<input class="text pd05 wp65" style="border: 0px;" name="password" id="password" value="" type="password" /> *
						</td>
					</tr>
					<tr>
						<td align="right" class="w120 pt10 pd05" valign="top">&nbsp;</td>
						<td>
							
							<input type="submit" value=" 设定 " />
						</td>
					</tr>
				</table>
			</form>
			
		</div>
		</s:if>
		<s:else>
			<div class="lh200" ><div class="fleft" id="topicDes">邮箱地址：${requestScope.userMailAddress } </div><div class="fright"><s:if test="#request.mailList.size>0"><a href="javascript:;" onclick="ce();">[收取邮件]</a></s:if> <a href="./index.do?_=un&targetId=${requestScope.mailLink.id }">[ - 解除绑定 ]</a></div></div>
			<div class="clear"></div>
			<ul id="mailContent" style="background-color: #eee;" class="lh160 small_content small_buttom pd10">
				<s:if test="#request.mailList.size>0">
					<%@ include file="/WEB-INF/jsp/mail/ajaxGetUserMail.jsp" %>
				</s:if>
				<s:else>
					<li style="background-color: #fff;" class="mb05 pd05"><a href="javascript:;" onclick="ce();">[ 首次收邮件 ]</a></li>
				</s:else>
			</ul>
			
		</s:else>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('#bind_user_mail_from').ajaxForm({	//创建贴子表单
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				document.getElementById("bind_user_mail_from").reset();
				$("#bindMailTips").html("绑定成功，页面正在刷新！");
				window.setTimeout("window.location.reload();");
			}else if(d['status'] == -2){
				login();
			}else $("#bindMailTips").html( d['message']||"失败");
			alertClose();
        },
        beforeSubmit:function(){
        	var flag = true;
        	if($("#protocol").val()=="")flag = false;
        	if($("#host").val()=="")flag =  false;
        	if($("#account").val()=="")flag =  false;
        	if($("#password").val()=="")flag =  false;
        	if(!flag) $("#bindMailTips").html("带星标 * 的必须填写!");
        	if(flag) alert(globla_loading);
        	return flag;
        }
    });
});
function switchMailMode(mode){
	switch(mode){
		case "ztgame":
			$("#protocol").val("SSL");
			$("#host").val("pop3.ztgame.com:995");
			break;
		case "163":
			$("#protocol").val("NO");
			$("#host").val("imap.163.com:143");
			break;
		case "sina":
			$("#protocol").val("NO");
			$("#host").val("pop.sina.com:110");
			break;
		default:
			$("#protocol").val("NO");
			$("#host").val("");
			break;
	}
}
</script>

<!-- 内容 -->
</body>
</html>