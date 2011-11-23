var global_login_callback = 0;
var global_timeout = 0;
var imWindow = false;
$(function(){
	$("#user_login_form").dialog({	//本站用户登录
		width:600,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			},
			" 点击登录 ": function(){
				checkLogin();
			}
		}
	});
	$("#ad_login_form").dialog({	//域登录
		width:600,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			},
			" 点击登录 ": function(){
				checkAdLogin();
			}
		}
	});
	$('#userRegisterForm').ajaxForm({
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				$("#register_tips").html(d['message']);
				switchLogin(true,d.values.name,d.values.id);
				window.setTimeout('$("#user_register_form").dialog("close");',200);
			}else $("#register_tips").html( d['message']||"失败");
        },beforeSubmit: function(){
        	$("#registerPassword").val(hex_md5($("#registerPassword").val()));
        }
    });
	$('#userMsgForm').ajaxForm({	//发消息
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				alert(d['message']);
			}else if(d['status'] == -2){
				login();			
			}else alert( d['message']||"失败");
        },beforeSubmit: function(){
        	if($("#msgToUserId").val == '') {
        		al("ID不存在");
        		return false;
        	}
        }
    });
    $("#user_register_form").dialog({
		width:600,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			},
			" 点击注册 ": function(){
				$("#userRegisterForm").submit();
			}
		}
	});
    $("#user_notice_form").dialog({
		width:500,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			},
			" 点击刷新 ": function(){
				getUserNotice();
			}
		}
	});
    $("#system_change_log").dialog({
		width:960,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			}
		}
	});
    $("#user_msg_form").dialog({
		width:500,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			}
		}
	});
	getUserNotice();	//取消息
});
function sendMsgTo(id){dialogClose();$("#msgToUserId").val(id);$('#user_msg_form').dialog('open');}
function register(){dialogClose();$('#user_register_form').dialog('open');}
function login(){dialogClose();$('#user_login_form').dialog('open');}
function adLogin(){dialogClose();$('#ad_login_form').dialog('open');}
function checkLogin(){		//本站用户登录
	//$("#password").val(hex_md5($("#password").val()));
	var email = $("#nav_email").val();
	var password = $("#nav_password").val();
	//切换域用户登录
	//if(email.toLowerCase().indexOf("@ztgame.com") != -1){
	//	$("#adEmail").val(email);
	//	$("#adPassword").val(password);
	//	adLogin();
	//	checkAdLogin();
	//	return;
	//}
	$("#login_tips").html("正在登录中，请稍候...");
	$.post(Path.domain+"/user/ajaxLoginApi.do", {"user.mail":email,"user.password":password}, function(d){
		if(d['status'] == 1){
			$("#login_tips").html(d['message']+"，请稍候");
			switchLogin(true,d.values.name,d.values.id);
			//window.setTimeout('$("#user_login_form").dialog("close");alert(globla_loading);',200);
			$("#user_login_form").dialog("close");alert(globla_loading);
		}else $("#login_tips").html( d['message']||"失败");
	},'json');
}
function checkPageLogin(){		//本站用户页面登录
	var email = $("#pg_email").val();
	var password = $("#pg_password").val();
	alert("正在登录中，请稍候...");
	$.post(Path.domain+"/user/ajaxLoginApi.do", {"user.mail":email,"user.password":password}, function(d){
		if(d['status'] == 1){
			alert(d['message']+"，请稍候");
			window.location.href = Path.domain+"/user/index.do";
			alert(globla_loading);
		}else{
			alert(d['message']||"登录失败");
		}
	},'json');
}
function checkAdLogin(){	//域用户登录
	var email = $("#adEmail").val();
	var password = $("#adPassword").val();
	$("#ad_login_tips").html("正在登录中，请稍候...");
	$.post(Path.domain+"/user/ajaxAdLoginApi.do", {"user.mail":email,"user.password":password}, function(d){
		if(d['status'] == 1){
			$("#ad_login_tips").html(d['message']+"，请稍候");
			window.setTimeout('$("#ad_login_form").dialog("close");alert(globla_loading);',200);
			switchLogin(true,d.values.name,d.values.id);
		}else $("#ad_login_tips").html( d['message']||"失败");
	},'json');
}
function logout(){	//登出
	$.post(Path.domain+"/user/ajaxLogoutApi.do", {}, function(d){
		if(d['status'] == 1){
			alert((d['message']||"登出成功")+"，请稍候");
			switchLogin(false);
			window.setTimeout('alertClose();',1000);
		}else alert( d['message']||"登出失败");
	},'json');
}
function isLogin(){return global_userId>0?true:false;}
function switchLogin(flag,userName,userId){		//登录后操作
	window.location.reload();
	/*
	if(flag){
		global_userId = userId||global_userId;
		$("#userInfo").html('<a href="${domain }/user/index.do">'+userName+' [ 用户中心 ]</a> <a href="javascript:logout();">[ 登出 ]</a>');
		if(global_login_callback) {global_login_callback();global_login_callback=0;}
		getUserNotice();
	}else{
		global_userId = 0;
		$("#userInfo").html('<a href="javascript:login();void(0);">[ 登录 ]</a> <a href="javascript:register();void(0);">[ +注册 ]</a> ');
		$("#noticeContainer").html('');
		$("#noticeNum").html('');
	}
	*/
}
function getUserNotice(getFlag){	//取用户消息
	$.post(Path.domain+"/user/ajaxGetNoticePage.do", {"isUnRead":true}, function(d){
		//TODO
	},"html");
}
function getUserNoticeOld(getFlag){	//取用户消息
	if((global_userId && global_userId>0) || getFlag){
		$.post(Path.domain+"/user/ajaxGetNoticeApi.do", {"isUnRead":true}, function(d){
			if(d['status'] == -1){
				$("#noticeContainer").html(d['message']||"获取失败");
				//$("#noticeNum").html('');
				$("#notifyContent").html('');
				if(typeof(window['brown_title']) != 'undefined')document.title = window['brown_title'];
			}else if(d['status'] == -2){
				login();
				global_userId = 0;
			}else {
				if(d && d.length > 0){	//有新的消息
					//$("#noticeNum").html(d.length);
					var t_default = '<li><a href="javascript:;" onclick="noticeAllReaded();">[设置所有已读]</a></li>';
					var t = '';
					var txt = '';
					$.each(d,function(i,n){
						//几种提醒类型，处理方法不一样
						switch(n.noticeType){
							case 0:
								t += '<li><a href="javascript:;" onclick="viewMail(this,'+n.id+')">您有新的邮件...[查看邮件]</a></li>';
								txt += '#您有新的邮件... ';
								break;
							case 1:
								t += '<li><a href="javascript:;" onclick="viewTopic(this,'+n.refId+','+n.id+');">帖子:'+n.refTitle+'('+n.isRead+'条回复) [查看帖子]</a> | <a href="javascript:;" onclick="cancleTopicNotice('+n.id+',this);">[取消订阅]</a></li>';
								txt += '#您订阅的贴子['+n.refTitle+'],有'+n.isRead+'条新的回复 ';
								break;
						}
					});
					$("#noticeContainer").html(t_default+t);
					$("#notifyContent").html(txt);
					document.title = txt;
				}else {
					$("#notifyContent").html('');
					document.title = window['brown_title'];
				}
			}
		},'json');
	}
	if(global_timeout==0)global_timeout = window.setInterval("getUserNotice();",60000);
	if(typeof(window['brown_title']) == 'undefined') window['brown_title'] = document.title;
}
function cancleTopicNotice(targetId,el){	//取消订阅
	$.post(Path.domain+"/user/ajaxCancleSubTopicApi.do", {"targetId":targetId}, function(d){
		if(d['status'] == 1){
			window.setTimeout("alertClose();",1000);
			alert(d['message']||"取消订阅成功");
			if(el){
				$(el).parent().remove();
				getUserNotice();
			}
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"取消订阅失败");
	},'json');
}
function openNoice() {	//打开收件箱
	getUserNotice(true);
	$("#user_notice_form").dialog('open');
}
function getReply(a,id,b){	//跳转至具体贴子
	window.location.href = Path.domain+"/topic/index.do?topicId="+id;
}
function viewTopic(el,topicId,noticeId){	//打开订阅的帖子，并标记已读
	$("#user_notice_form").dialog('close');
	noticeReaded(noticeId,function(el){
		if(el)$(el).parent().remove();
		//getReply(false,topicId,false);
		window.location.href = Path.domain+"/topic/index.do?topicId="+topicId;
	});
}
function viewMail(el,noticeId){	//进入邮件列表，并标题已读
	noticeReaded(noticeId,function(){
		window.location.href = Path.domain+"/mail/index.do";
	});
}
function noticeReaded(noticeId,fn){	//设置消息为已读
	if(noticeId && noticeId!='')$.post(Path.domain+"/user/ajaxReadNoticeApi.do", {"targetId":noticeId}, function(d){
		if(d['status'] == 1) {
			//var newNum = parseInt($("#noticeNum").html()) -1;
			//$("#noticeNum").html((newNum > 0)?newNum:'');
			if(fn)fn();
		}
	},'json');
}
function noticeAllReaded(){	//全部已读
	$.post(Path.domain+"/user/ajaxReadNoticeApi.do", {"targetId":-1}, function(d){},'json');
	$("#noticeContainer").html('');
	//$("#noticeNum").html('');
	$("#notifyContent").html('');
	document.title = window['brown_title'];
}
function addBookmark(url, title) {	//加入收藏
	var notice = "加入收藏失败，请手工（按 Ctrl + d）加入。<p class='pt20'><img src='"+Path.domain+"/images/commons/ctrl_d.gif'></p>";
	if(document.all) {
		try{
			window.external.addFavorite(url, title);
		}
		catch (e1){
			try{
			 	window.external.addToFavoritesBar(url, title);
			}catch (e2){
				alert(notice)
			}
		}
	} else if (window.external) {
		try{
			window.sidebar.addPanel(title,url,"");
		}catch (e2){
			alert(notice)
		}
	} else {
		alert(notice)
	}
}
function getChangeLog(){	//系统日志
	var obj = $("#system_change_log").html(globla_loading);
	$.post(Path.domain+"/ajaxGetChangeLogPage.do",{},function(d){
		obj.html(d).dialog('open');
	},'html');
}
function ce(){	//手动检查新邮件
	alert(globla_loading);
	$.post(Path.domain+"/mail/ajaxCheckMailApi.do", {}, function(d){
		if(d['status'] == 1){
			window.setTimeout("alertClose();freshMail();",1000);
			alert("获取成功，请等待刷新");
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"获取失败");
	},'json');
}
function freshMail(){	//刷新邮件
	var obj = $("#mailContent");
	if(obj){
		obj.html(globla_loading);
		$.post(Path.domain+"/mail/ajaxGetUserMailPage.do", {}, function(d){
			obj.html(d);
		},'html');
	}
}
function navOver(el,flag){	//切换图标状态
	var obj = $(el);
	if(flag)obj.attr('src',obj.attr('ovr'));
	else obj.attr('src',obj.attr('def'));
}
function dialogClose(){	//关闭所有.DIALOG
	$(".ui-dialog-content").dialog('close');
}
function copyToClipboard(txt) {	//复制
	var help = "<p class='pt10 pb10'><a href='javascript:$(\"#help_c\").toggle();void(0);' style='color: #666666; text-decoration: underline;'>查看使用帮助</a><img id='help_c' class='pt10 none' src='"+Path.domain+"/images/commons/help.gif' /></p>";
	var html = "<input type='text' class='w410 mt10 pd05' value='"+txt+"' />"+help;
    if(window.clipboardData) {
            window.clipboardData.clearData();
            window.clipboardData.setData("Text", txt);
            alert('地址复制入剪贴板 成功!'+help);
    } else if(navigator.userAgent.indexOf("Opera") != -1) {
        window.location = txt;
    } else if (window.netscape) {
        try {
             netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
             alert("复制操作被浏览器拒绝！<br>请在浏览器地址栏输入'about:config'并回车<br>然后将'signed.applets.codebase_principal_support'<br>设置为'true'<br><br>或 手动复制下列地址：<br>"+html);
             return;
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip) return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans) return;
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt;
        str.data = copytext;
        trans.setTransferData("text/unicode",str,copytext.length*2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip) return false;
        clip.setData(trans,null,clipid.kGlobalClipboard);
        alert("地址复制入剪贴板 成功！"+help)
    } else {
		alert("复制地址 <font color='red'>失败</font>，请手动复制以下 地址！<br>"+html);
    }
}
function getStarGradeText(grade){
	var txt = "";
	if(grade<11){
	}else if(grade<21){
		txt = getNumText(grade-10)+"星新秀";
	}else if(grade<31){
		txt = getNumText(grade-20)+"星红人";
	}else if(grade<41){
		txt = getNumText(grade-30)+"星明星";
	}else if(grade<51){
		txt = getNumText(grade-40)+"星巨星";
	}else if(grade<61){
		txt = getNumText(grade-50)+"星天后";
	}
	return txt;
}
function getRichGradeText(grade){
	var txt = "";
	if(grade<11){
	}else if(grade<21){
		txt = getNumText(grade-10)+"星普通富豪";
	}else if(grade<31){
		txt = getNumText(grade-20)+"星百万富豪";
	}else if(grade<41){
		txt = getNumText(grade-30)+"星千万富豪";
	}else if(grade<51){
		txt = getNumText(grade-40)+"星亿万富豪";
	}else if(grade<61){
		txt = getNumText(grade-50)+"星超级富豪";
	}
	return txt;
}
function getNumText(num){
	var txt;
	switch(num){
		case 1:
		  txt = "一";
		  break;
		case 2:
		  txt = "二";
		  break;
		case 3:
		  txt = "三";
		  break;
		case 4:
		  txt = "四";
		  break;
		case 5:
		  txt = "五";
		  break;
		case 6:
		  txt = "六";
		  break;
		case 7:
		  txt = "七";
		  break;
		case 8:
		  txt = "八";
		  break;
		case 9:
		  txt = "九";
		  break;
		case 10:
		  txt = "十";
		  break;
	}
	return txt;
}
function setCookie(name,value){
	var days = 1;
    var exp  = new Date();
    exp.setTime(exp.getTime() + days*24*60*60*1000);
    document.cookie = name + "=" + value + ";expires=" + exp.toGMTString();
}
function getCookie(name){
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if(arr != null)
		return arr[2];
	return null;
}
function cookieContains(val1,val2){
	if(val1!=null){
		var arr = val1.split("|");
		for(i in arr){
			if(arr[i]==val2) return true;
		}
	}
	return false;
}
function getCurTime(){
	var now = new Date();
	var h = now.getHours();
	var hh = h < 10 ? '0'+h : h;
	var m = now.getMinutes();
	var mm = m < 10 ? '0'+m : m;
	return hh + ":" + mm;
}
function bubbleSort(array, n) { //由高到低
	var temp = null;
	var length = array.length;
	for(var i=0; i<=length-2; i++) {
		for(var j=length-1; j>=1; j--) {
			if(array[j][n] > array[j-1][n]) {
				temp = array[j];
				array[j] = array[j-1];
				array[j-1] = temp;
			}
		}
	}
}