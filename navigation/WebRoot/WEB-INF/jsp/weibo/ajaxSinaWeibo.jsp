<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
新浪微博：
<ul class="lh160" id="statusList">
	<%@ include file="/WEB-INF/jsp/weibo/ajaxGetStatus.jsp" %>
</ul>
<script type="text/javascript">
function getSianReply(id,el){	//读取新浪评论
	global_replayPage[id] ++;
	//初始化页数
	if(el == null){
		global_replayPage[id] = 1;
		$("#sinaReplyList_"+id).html('');
	}else $(el).parent().hide();
	
	if(id != null && id != ''){
		$("#sinaReplyList_"+id).append(globla_loading).parent().show();
		$.post("${domain }/bind/sina/ajaxGetSinaReplyPage.do", {"sid":id,"p":global_replayPage[id]}, function(d){
			$(".loading").remove();
			$("#sinaReplyList_"+id).append(d);
			WB.widget.atWhere.searchAndAt(document.getElementById("content"));
		},'html');
	}
}
function scrollEvent(){	//滚动时触发的事件
	var dis = page_height-page_top;
	if(!loadingFlag && dis < window_height*3 && load_status_count > 0){
		loadingFlag = true;
		getMoreStatus();
	}
}
function getMoreStatus(){	//取下一页微博
	$("#statusList").append(globla_loading);
	$.post("${domain }/weibo/ajaxGetStatusPage.do", {"p":global_page+1,"bindType":weibo_type}, function(d){
		$("#statusList").append(d);
		scrollFun();
		global_page++;
		$(".loading").remove();
		WB.widget.atWhere.searchAndAt(document.getElementById("content"));
	},'html');
}
$(function(){
	window.clearInterval(timer);
	timer = window.setInterval("scrollEvent();",500);
	WB.core.load(['connect', 'client', 'widget.base', 'widget.atWhere'], function() {
		var cfg = {
			key: '3565538371',//720033393
			xdpath: 'http://www.qule.com/xd.html'
		};
		WB.connect.init(cfg);
		WB.client.init(cfg);
		WB.widget.atWhere.searchAndAt(document.getElementById("content"));
	});
});
</script>