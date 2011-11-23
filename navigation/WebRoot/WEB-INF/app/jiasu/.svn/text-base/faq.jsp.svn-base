<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>论坛 - ${jiasuTitle}</title>
<link rel="stylesheet" type="text/css" media="screen"  href="${static}/styles/jiasu/style.css" /> 
<style type="text/css">
.ui-dialog fieldset{border-width: 0px;}
.ui-dialog fieldset LABEL{width:100%;display: block; padding-left: 1px; padding-top: 12px; margin-bottom:3px; font-size: 12px;}
.ui-dialog INPUT{padding: 3px;}
.ui-dialog INPUT:HOVER{border-color: #FF4500;}
.ui-dialog fieldset li{padding: 5px 0px; line-height: 150%;}
.validateTips{color: #FF4500; margin-top: 10px; margin-bottom: 5px;}
</style>
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
                	<p class="r_title"><img src="${static}/styles/images/faq.gif" />
                	<s:if test="userToken.user != null">
                		<a style="float: right;" href="javascript:;" onclick="post();"><img align="absmiddle" src="${staitc }/styles/images/post.gif" /></a>
                	</s:if>
                	<s:else>
                		<a style="float: right;" href="${domain }/jiasu/home.do">登录后才能发表，<img align="absmiddle" src="${staitc }/styles/images/login.gif" /></a>
                	</s:else>
                	</p>
                    <p class="bet"></p>
                    <p style="padding: 10px 20px; text-align: center;">
                    	<a href="./acctHelp.do">
                    		<font color="red" style="text-decoration: underline; font-size: 14px; font-weight: bold;">趣乐加速器使用帮助</font>
                    	</a>
                    	 | 
                    	<a href="${domain }/images/swf/yanshi.swf" target="_blank">
                    		<font color="red" style="text-decoration: underline; font-size: 14px; font-weight: bold;">趣乐加速器使用视频演示</font>
                    	</a>
                    	 | 
                    	<a href="http://v.youku.com/v_show/id_XMjkyNTgxNTg0.html" target="_blank">
                    		<font color="red" style="text-decoration: underline; font-size: 14px; font-weight: bold;">优酷版</font>
                    	</a>
                    	 | 
                    	<a href="${domain }/jiasu/gamezone.do">
                    		<font color="red" style="text-decoration: underline; font-size: 14px; font-weight: bold;">用户提交处理结果</font>
                    	</a>
                    </p>
                    <p class="bet"></p>
                    <div id="newsContent">
	                    <%@ include file="/WEB-INF/app/jiasu/ajaxGetTopicList.jsp" %>
                    </div>
	                <div id="pageContent"></div>
	                <p class="clear"></p>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="post_faq_form" class="" title="发表问题">
	<p class="validateTips" id="validateTips">
		发表您的问题：
	</p>
	<form id="postFaqForm"
		action="${domain }/topic/ajaxCreateTopicApi.do" method="post">
		<fieldset>
			<ul>
				<li>
					标题：<input name="title" type="text" class="text ui-widget-content ui-corner-all pd05" />
				</li>
				<li>
					内容：<textarea style="width: 380px;" rows="5" name="content" id="faqTextarea" class="text ui-widget-content ui-corner-all pd05"></textarea>
					<input name="areaId" value="${requestScope.nowArea }" type="hidden" />
					<select name="topicSortId" style="visibility: hidden;">
						<s:iterator value="#request.sortList">
							<option value="${id }">${sortName }</option>
						</s:iterator>
					</select>
				</li>
			</ul>
		</fieldset>
	</form>
</div>

<script type="text/javascript">
var areaId = "${areaId}";
function getFaqs(p){
	$.post("${domain}/jiasu/ajaxGetTopicList.do", {"p":p}, function(d){
		$("#newsContent").html(d);
	},'html');
}
function post(){$("#post_faq_form").dialog("open");}
function getReply(id){
	if(id != null && id != ''){
		$.post("${domain}/jiasu/ajaxGetTopicReply.do", {"topicId":id}, function(d){
			$("#faqReply_"+id).show().prev().show().html(d);
		},'html');
	}
}
function replyIt(id,text){
	$("#faqReplyContent_"+id).val(text);
}
$(function(){
	$("#post_faq_form").dialog({	//浮层
		width:500,position: ['',127],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){
				$(this).dialog('close');
			},
			" 发表 ": function(){
				$("#postFaqForm").submit();
			}
		},beforeclose:function(){
			document.getElementById("postFaqForm").reset();
		}
	});
	$('#postFaqForm').ajaxForm({	//创建问题
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				$("#validateTips").html("发表成功，请稍候...");
				window.location.reload();
			}else if(d['status'] == -2){
				login();
			}else $("#validateTips").html( d['message']||"失败");
			alertClose();
        },
        beforeSubmit:function(){
        	alert(globla_loading);
        }
    });
});
</script>
<!-- END for 内容 -->
</body> 
</html> 