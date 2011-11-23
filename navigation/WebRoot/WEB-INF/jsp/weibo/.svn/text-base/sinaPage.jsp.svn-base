<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:iterator value="#request.weiboList" status="sta" >
	<li style="border-bottom: 1px dotted #ddd; padding: 15px 0px; display: block;">
		<div style="float: left;padding: 2px; border: 1px solid #ddd;">
			<img alt="@${user.screenName }" src="${user.profileImageURL }"></img>
		</div>
		<div style="margin-left: 65px;">
			<div class="mr05"><span id="status_text_${id }">@${user.screenName }：${text }</span>
				<s:if test="thumbnail_pic != ''">
					<br><img onclick="imgAction(this);" thu="${thumbnail_pic }" mid="${bmiddle_pic }" class="mt05 hand imgAction" src="${thumbnail_pic }" >
				</s:if>
			</div>
			<s:if test="retweetDetails.text != ''">
				<div style="border: 1px solid #eee; background-color: #FBFBE7;" class="mt10 pd05">
					@${retweetDetails.user.screenName }：${retweetDetails.text }
					<s:if test="retweetDetails.thumbnail_pic != ''">
						<br><img onclick="imgAction(this);" thu="${retweetDetails.thumbnail_pic }" mid="${retweetDetails.bmiddle_pic }" class="mt05 hand imgAction" src="${retweetDetails.thumbnail_pic }" >
					</s:if>
				</div>
			</s:if>
			<div class="tright mt05">
				<commons:dateformat value="${createdAt}"/>&nbsp; | &nbsp;<a href="javascript:;" onclick="getSianReply('${id }',null);">评论</a>
			</div>
			<div id="sinaReplyContent_${id }" style="border: 1px solid #eee;" class="none">
				<form class="createCommentForm" method="post" onsubmit="return false;" action="${domain }/weibo/ajaxPostCommentApi.do">
					<div style="background-color: #eee;" class="pd10 m10">
						<input type="hidden" value="${id }" name="sid" class="statusIds">
						<textarea onkeyup="cutStr(this);" id="statusComment_${id }" cols="2" class="wp75 pd05" style="border: 0px;" name="content"></textarea>
						<input type="submit" value="发表">
						<input type="button" value="取消" onclick="$('#sinaReplyContent_${id }').hide();">
						<div class="mt05">
							<label for="recomment_${id }"><input onclick="rePost('${id }');" type="checkbox" name="createFlag" value="1" id="recomment_${id }"> 同时转发到我的微博</label>
						</div>
					</div>
				</form>
				<div id="sinaReplyList_${id }"></div>
			</div>
		</div>
		<div class="clear"></div>
	</li> 
</s:iterator>
<script type="text/javascript" >
	loadingFlag = false;	//load状态
	load_status_count = parseInt('<s:property default="0" value="#request.weiboList.size"/>');	//当前数量
	$(function(){
		$('.createCommentForm').ajaxForm({	//创建回复
	        dataType:  'json', 
	        success:   function(d){
		    	if(d['status'] == 1){
		    		alertClose();
					getSianReply(d['values']['sid'],null);
				}else alert( d['message']||"失败");
	        },
	        beforeSubmit:function(){
	        	alert(globla_loading);
	        }
	    });
	});
</script>