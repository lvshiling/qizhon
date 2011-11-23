<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>微博 - ${siteTitle}</title>
<link type="text/css" rel="stylesheet" href="http://js.wcdn.cn/t3/style/css/common/card.css" />
<script type="text/javascript" src="${static }/js/lib/wb.js"></script>
<style type="text/css">
#statusList a,#statusList a:link {color: #268DD3;}
.weiboType{height: 34px;}
.weiboType a{
	display: block;
	float: left;
	padding: 10px;
	border: solid #CCC;
	border-width: 1px 1px 0px 1px;
	margin-right: 5px;
}
</style>
<script type="text/javascript">
var timer;
var page_top = 0;
var page_height = 0;
var window_height = 0;
var loadingFlag = false;
var global_page = 1;
var global_replayPage = {};
var load_status_count = parseInt('${pageSize}');
var weibo_type = parseInt('${bindType}');
_window = $(window);
function imgAction(el){	//图片切换
	el = $(el);
	if(el.attr("src") == el.attr("thu")) {
		el.attr("src","${static}/images/module/loading-1.gif").attr("src",el.attr("mid"));
	}else el.attr("src",el.attr("thu"));
}
function cutStr(el){	//字数检查
	el = $(el);
	var now = 140-el.val().length;
	if(now <= 0){el.val(el.val().substr(0,140));now=0;}
	el.parent().find("#ccNum").html(now);
}
function rePost(id){	//转发微博
	var el = $("#statusComment_"+id);
	var alz = el.attr("al");
	if("1" != alz){
		el.val((el.val()+"//"+$("#status_text_"+id).text()).substr(0,140)).focus();
	}
	if(typeof document.selection != "undefined"){
		var rng = document.selection.createRange();
		rng.moveStart("character",0);
		rng.select();
	}else{
		var txtarea = document.getElementById("statusComment_"+id);
		txtarea.selectionStart = 0;
		txtarea.selectionEnd = 0;
	}
	el.attr("al","1");
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
	<div class="wp60 fleft">
		<s:if test="#request.sinaUserLink == null && #request.qqUserLink == null ">
			<div class="lh200 small_title">
				<div class="fleft">需要先绑定微博</div>
				<div class="fright"><a href="./index.do?_=${sinaUserLink.id }"></a></div>
				<div class="clear"></div>
				<div class="small_content small_buttom pd10" style="height: 100px;">
					还没有绑定微博帐号!
				</div>
			</div>
		</s:if>
		<s:else>
			<div id="postWeibo">
				<div class="mt10">
					<div style="background-color: #eee;" class="pd10">
						<form method="post" id="postStatusForm" action="${domain }/weibo/ajaxPostStatusPage.do">
							<div>
								<div class="fright ft16 mb05">还可以输入 <span id="ccNum" class="ft21" style="font-family: Constantia,Georgia;">140</span> 字</div>
							</div>
							<textarea name="content" rows="3" cols="" class="pd05 wp98" onclick="___c(this);" onkeyup="cutStr(this);">说点啥吧.</textarea>
							<div class="tright mt10" style="height: 50px;">
								<div class="fleft tleft pd05 lh200">
									
									<!-- 新浪微博 -->
									<s:if test="#request.sinaUserLink != null">
										<label>
											<input id="postFlag_${requestScope.sinaUserLink.linkType }" type="checkbox" name="postSinaFlag" value="1" checked="checked" /> 新浪微博
										</label>
									</s:if>
									
									<!-- 腾讯微博 -->
									<s:if test="#request.qqUserLink != null">
										<label>
											<input id="postFlag_${requestScope.qqUserLink.linkType }" type="checkbox" name="postQqFlag" value="1" checked="checked" /> 腾讯微博
										</label>
									</s:if>

									<!-- 网易微博 -->
									<s:if test="#request.qqUserLink != null">
										<label>
											<input id="postFlag_${requestScope.NeteasyUserLink.linkType }" type="checkbox" name="postNeteasyFlag" value="1" checked="checked" /> 网易微博
										</label>
									</s:if>
									
									<!-- 发表贴子 GPASS  -->
									<label>
										<input onclick="$('#sendTopicSortId').toggle();" type="checkbox" name="postTopic" value="1" /> 发表到讨论区
									</label>
									<select id="sendTopicSortId" name="topicSortId" class="none">
										<s:iterator value="#request.publicSortList">
											<s:if test="sortDegree == 0">
												<option value="${id }">${sortName }</option>
											</s:if>
										</s:iterator>
									</select>
									<br />
									<label>
										<input type="checkbox" name="postGpassFlag" value="1" /> 发表到GPASS
									</label>
								</div>
								<input type="submit" value="发 表" class="pd05 w70" />
							</div>
						</form>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="small_buttom weiboType mt10">
				<s:if test="#request.sinaUserLink != null">
					<a id="botton_${requestScope.sinaUserLink.linkType }" class="bottons" href="javascript:loadWeiBo(${requestScope.sinaUserLink.linkType });">新浪微博</a>
				</s:if>
				<s:if test="#request.qqUserLink != null">
					<a id="botton_${requestScope.qqUserLink.linkType }" class="bottons" href="javascript:loadWeiBo(${requestScope.qqUserLink.linkType });">腾讯微博</a>
				</s:if>
				<s:if test="#request.NeteasyUserLink != null">
					<a id="botton_${requestScope.NeteasyUserLink.linkType }" class="bottons" href="javascript:loadWeiBo(${requestScope.NeteasyUserLink.linkType });">网易微博</a>
				</s:if>
			</div>
			<!-- 微博 容器 -->
			<div id="weiboContent" class="small_content small_buttom pd10">
			</div>
		</s:else>
	</div>
	<div id="right_4" style="margin-left: 580px; width: 365px;">
		<div class="small_title lh200">
			<div class="fleft">帐号状态</div>
			<div class="fright"></div>
		</div>
		<div class="small_content small_buttom pd05" >
			<ul>
				<li class="pd10 " style="background-color: #EEE;">
					<s:if test="#request.sinaUserLink != null">
						<div>
							<img src="http://www.sinaimg.cn/blog/developer/wiki/LOGO_32x32.png" align="absMiddle" />
							<a href="http://t.sina.com.cn/${requestScope.sinaUserLink.linkField4 }" target="_blank">
								${requestScope.sinaUserLink.linkField1 } [ 已绑定 ]
							</a>
							<a href="${domain }/bind/sina/index.do?opt=1"> [ 重新绑定 ] </a>
						</div>
					</s:if>
					<s:else>
						<div>
							<img src="http://www.sinaimg.cn/blog/developer/wiki/LOGO_32x32.png" align="absMiddle" />
							<a href="${domain }/bind/sina/index.do?opt=1">点击绑定 新浪微博</a>
						</div>
					</s:else>
				</li>
				<li class="pd10 mt05" style="background-color: #EEE;">
					<s:if test="#request.qqUserLink != null">
						<img src="http://open.t.qq.com/images/resource/weiboicon32.png" align="absmiddle" />
						<a href="http://t.qq.com/${requestScope.qqUserLink.linkField1 }" target="_blank">
							${requestScope.qqUserLink.linkField1 } [ 已绑定 ]
						</a>
						<a href="${domain }/weibo/qq/index.do?opt=1"> [ 重新绑定 ] </a>
					</s:if>
					<s:else>
						<img src="http://open.t.qq.com/images/resource/weiboicon32.png" align="absmiddle" />
						<a href="${domain }/weibo/qq/index.do?opt=1">点击绑定 腾讯微博</a>
					</s:else>
				</li>
				<li class="pd10 mt05" style="background-color: #EEE;">
					<s:if test="#request.NeteasyUserLink != null">
						<img src="http://img1.cache.netease.com/cnews/img/wblogostandard/weblogo32.png" align="absmiddle" />
						<a href="http://t.163.com/${requestScope.NeteasyUserLink.linkField1 }" target="_blank">
							${requestScope.NeteasyUserLink.linkField4 } [ 已绑定 ]
						</a>
						<a href="${domain }/weibo/163/index.do?opt=1"> [ 重新绑定 ] </a>
					</s:if>
					<s:else>
						<img src="http://img1.cache.netease.com/cnews/img/wblogostandard/weblogo32.png" align="absmiddle" />
						<a href="${domain }/weibo/163/index.do?opt=1">点击绑定 网易微博</a>
					</s:else>
				</li>
				<li class="pd10 mt05" style="background-color: #EEE;">
					其它微博 敬请期待
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- 内容 -->
<script type="text/javascript">
$("#postStatusForm").ajaxForm({	//创建微博
     dataType:  'json', 
     success:   function(d){
	  	 if(d['status'] == 1){
	  		alertClose();
			if(d.values){
				var t = '';
				$.each(d.values,function(i,n){t += "<p>"+n+"</p>";});
				alert(t);
			}
			if($("#postFlag_"+weibo_type).attr("checked"))getStatusPre();
	  		document.getElementById("postStatusForm").reset();
		 }else alert( d['message']||"失败");
     },
     beforeSubmit:function(){
     	alert(globla_loading);
     }
});
function replyIt(sid,text){	//回复
	$("#statusComment_"+sid).val(text).focus();
}
function scrollFun(){	//定位宽高
	page_top = _window.scrollTop();
	page_height = $("#content").height();
	window_height = _window.height();
}
function getStatusPre(){	//获取新增微博
	if($(".statusIds").length > 0 ){
  		var sinceId = $(".statusIds")[0].value;
  		$("#statusList").prepend(globla_loading);
		$.post("${domain }/weibo/ajaxGetStatusPage.do", {"p":1,"target":sinceId,"bindType":weibo_type}, function(d){
			$("#statusList").prepend(d);
			scrollFun();
			$(".loading").remove();
			if(weibo_type==0)WB.widget.atWhere.searchAndAt(document.getElementById("content"));
		},'html');
 	}
}
$(function(){
	_window.scroll(function(){scrollFun();});
	loadWeiBo(weibo_type);
});
function loadWeiBo(type){
	$("#weiboContent").html(globla_loading);
	weibo_type = type;
	global_page = 1;
	switch(type){
		case 0:
			$.post("${domain }/weibo/ajaxSinaWeiboPage.do", {"p":1,"bindType":type}, function(d){
				$("#weiboContent").html(d);
				$(".bottons").css("backgroundColor","#EEE");
				$("#botton_"+type).css("backgroundColor","#FFF");
			},'html');
		break;
		case 3:
			$.post("${domain }/weibo/ajaxQqWeiboPage.do", {"p":1,"bindType":type}, function(d){
				$("#weiboContent").html(d);
				$(".bottons").css("backgroundColor","#EEE");
				$("#botton_"+type).css("backgroundColor","#FFF");
			},'html');
		break;
		case 4:
			$.post("${domain }/weibo/ajaxNeteasyWeiboPage.do", {"p":1,"bindType":type}, function(d){
				$("#weiboContent").html(d);
				$(".bottons").css("backgroundColor","#EEE");
				$("#botton_"+type).css("backgroundColor","#FFF");
			},'html');
		break;
	}
}
</script>
</body>
</html>