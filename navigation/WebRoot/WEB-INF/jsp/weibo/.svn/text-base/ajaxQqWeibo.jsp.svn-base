<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
腾讯微博：
<ul class="lh160" id="statusList">
	<%@ include file="/WEB-INF/jsp/weibo/ajaxGetStatus.jsp" %>
</ul>
<script type="text/javascript">
function scrollEvent(){	//滚动时触发的事件
	var dis = page_height-page_top;
	if(!loadingFlag && dis < window_height*3 && load_status_count > 0){
		loadingFlag = true;
		getMoreStatus();
	}
}
function getMoreStatus(){	//取下一页微博
	var sinceId = 0;
	var timeobj = $(".timestamp")
	if(timeobj.length >0) sinceId = timeobj[timeobj.length-1].value;
	$("#statusList").append(globla_loading);
	$.post("${domain }/weibo/ajaxGetStatusPage.do", {"p":global_page+1,"bindType":weibo_type,"target":sinceId}, function(d){
		$("#statusList").append(d);
		scrollFun();
		global_page++;
		$(".loading").remove();
	},'html');
}
function getQqReply(id,el){			//读取腾讯评论
	global_replayPage["qq_"+id] ++;
	//初始化页数
	if(el == null){					//初次获取评论
		global_replayPage["qq_"+id] = 1;
		$("#qqReplyList_"+id).html('');
	}else $(el).parent().hide();	//下一页的情况
	
	if(id != null && id != ''){
		$("#qqReplyList_"+id).append(globla_loading).parent().show();
		var sinceId = '';
		var timeobj = $(".reply_time_"+id);
		if(timeobj.length > 0) sinceId=timeobj[timeobj.length-1].value;
		$.post("${domain }/weibo/ajaxGetQqReplyPage.do", {"sid":id,"p":global_replayPage["qq_"+id],"target":sinceId}, function(d){
			$(".loading").remove();
			$("#qqReplyList_"+id).append(d);
		},'html');
	}
}
$(function(){
	window.clearInterval(timer);
	timer = window.setInterval("scrollEvent();",500);
});
</script>