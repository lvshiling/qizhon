<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页 - ${siteTitle}</title>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
  <div id="topicContent">
  	<div id="left" class="fleft">
		<div id="search" style="width: 555px;">
			<div class="small_title lh200" ><div class="fleft">搜索</div><div class="fright"></div></div>
			<div class="clear"></div>
			<div id="searchContainer" class="small_content small_buttom pd10" style="background-color: #EEE;">
			<form action="http://www.baigoogledu.com/s.php" target="_blank" method="get" accept-charset="gb2312" onsubmit="if($.browser.msie)document.charset='GB2312'">
				<img src="http://www.baigoogledu.com/images/aa.gif" alt="搜索" align="absmiddle" /> <input style="border: 1px solid #eee; width: 300px;" class="pd05" name="q" type="text" id="keyword" />
				<input name="hl" value="zh-CN" type="hidden" />
				<input type="submit" style="padding: 4px;" value=" 搜 索 " />
			</form>
			</div>
		</div>
  		<div id="mail" style="width: 555px;">
			<div class="small_title lh200" ><div class="fleft">邮件收取</div><div class="fright"><s:if test="#request.userMailLink != null"><a href="javascript:;" onclick="ce();">[收取邮件]</a></s:if> <a href="${domain }/mail/index.do"><img class="mt05" src="${domain }/images/skin/more.png" /></a></div></div>
			<div class="clear"></div>
			<div id="mailContainer" class="small_content small_buttom">
					<s:if test="userToken.user != null">
					<ul id="mailContent" class="lh160 pd05" style="height: 104px; overflow: auto;">
						<s:if test="#request.userMailLink != null">
							<%@ include file="/WEB-INF/jsp/mail/ajaxGetUserMail.jsp" %>
						</s:if>
						<s:else>
							<li>
							<a href="${domain }/mail/index.do">[请绑定邮箱地址]</a>
							</li>
						</s:else>
					</ul>
					</s:if>
					<s:else>
					<ul id="mailContent" class="lh160 pd05" style="height: 24px; overflow: auto;">
						<li>
							<a href="javascript:;" onclick="login();">[请登录]</a>
						</li>
					</ul>
					</s:else>
			</div>
		</div>
  		<div id="news" style="width: 555px;">
			<div class="small_title lh200" ><div class="fleft">公司新闻</div><div class="fright"><a href="http://search.sina.com.cn/?range=all&c=news&q=%BE%DE%C8%CB%CD%F8%C2%E7&from=top" target="_blank"><img class="mt05" src="${domain }/images/skin/more.png" /></a></div></div>
			<div class="clear"></div>
			<div id="newsContainer" class="small_content small_buttom pd10">
				<ul>
					<s:iterator value="#request.newsList">
						<li><a href="${content }" target="_blank"><img border="0" align="absmiddle" src="${static }/images/skin/news_title.jpg">${title }</a><span class="gray"><s:date format="yyyy-MM-dd" name="addTime" /></span></li>
					</s:iterator>
				</ul>
			</div>
		</div>
		<div id="topic" style="width: 555px;">
			<div class="small_title lh200" ><div class="fleft">大杂烩</div><div class="fright"><a href="${domain }/topic/index.do"><img class="mt05" src="${domain }/images/skin/more.png" /></a></div></div>
			<div class="clear"></div>
			<div id="topicContainer" class="small_content">
				<table class="wp100" style="margin-top: 5px;">
					<s:iterator value="#request.topicList">
						<tr class="odd" align="left" onmouseover="highlight(this,true);" onmouseout="highlight(this,false);">
							<td class="hand" id="topicList_${id }" onclick="window.location.href='${domain }/topic/index.do?topicId=${id }';">
								<div style="height: 36px; overflow: hidden;">
								<s:if test="isFake == 1 || 1 == userByAuthorId.id">
										<div class="fleft ml05 mr10" style="width:34px;height: 34px; background-color: #999;">
											<img src="${static }/images/anonymous.gif" width="32" height="32" style="margin-top: 1px;margin-left: 1px;" />
										</div>
										<div class="lh150">
											<div style="height: 18px; overflow: hidden;"><span class="fn" id="topic_title_${id }">${title }</span></div>
											<span class="fb">匿名</span> 
											<span style="color:green;">(<s:property default="0" value="replyCount" />回复 <s:property default="0" value="subscribeCount"/>订阅)</span>
											<span class="gray">${lastReplyAuthorName} <commons:dateformat value="${lastReplyTime}"/></span>
										</div>
								</s:if>
								<s:else>
										<div class="fleft ml05 mr10" style="width:34px;height: 34px; background-color: #999;">
											<a href="${domain }/topic/index.do?targetUserId=${userByAuthorId.id }" title="查看Ta发起的讨论"><img src="${userByAuthorId.icon }" width="32" height="32" style="margin-top: 1px;margin-left: 1px;" /></a>
										</div>
										<div class="lh150">
											<div style="height: 18px; overflow: hidden;"><span class="fn" id="topic_title_${id }">${title }</span></div>
											<a class="fb" href="${domain }/topic/index.do?targetUserId=${userByAuthorId.id }" title="查看Ta发起的讨论">${userByAuthorId.name }</a> 
											<span style="color:green;">(<s:property default="0" value="replyCount" />回复 <s:property default="0" value="subscribeCount"/>订阅)</span>
											<span class="gray">${lastReplyAuthorName} <commons:dateformat value="${lastReplyTime}"/></span>
										</div>
								</s:else>
								</div>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
  	</div>
  	<div id="right_5" class="indexRightRow">
		<div class="small_title lh200" >
			<div class="fleft">公司内部导航</div><div class="fright">
				<a href="${domain }/urls/index.do"><img class="mt05" src="${domain }/images/skin/more.png" /></a>
			</div></div>
		<div id="urls" class="small_content small_buttom pd05 lh160" style="background-color: #FFF;">
			<a class="mr10" target="_blank" href="https://mail.ztgame.com/owa/">OWA邮件系统</a>
			<a class="mr10" target="_blank" href="https://im.ztgame.com/">WEB OCS</a>
			<a class="mr10" target="_blank" href="http://workflow.ztgame.com/">AMT工作流</a>
			<a class="mr10" target="_blank" href="http://sso.ztgame.com/wf2change">平台中心</a>
			<a class="mr10" target="_blank" href="http://mantis.ztoa.ztgame.com/mantis_design/login_page.php">设计中心</a>
			<a class="mr10" target="_blank" href="http://192.168.29.25/maximo">运维中心</a>
			<a class="mr10" target="_blank" href="http://itkb.ztgame.com/index.php?user-login">IT知识分享</a>
			<a class="mr10" target="_blank" href="https://192.168.20.2/file_exchange/login/login.php">文件交换</a>
			<a class="mr10" target="_blank" href="http://ztoa.ztoa.ztgame.com/ztoa">公共信息</a>
		</div>
	</div>
	<div id="right_3" class="indexRightRow">
		<div class="small_title lh200 wp100" >
			<div class="fright">
				<a href="${domain }/app/amt/index.do"><img class="mt05" src="${domain }/images/skin/more.png" /></a>
			</div>
			<div class="fleft">
				AMT 待办事项
			</div>
		</div>
			<s:if test="userToken.user != null">
			<div class="small_content small_buttom pd05" style="height: 104px; overflow: auto;" >
				<s:if test="#request.amtLink == null">
					需要绑定域帐户
					<div class="mt20">
						[<a href="${domain }/bind/giant/index.do">点击绑定AMT域帐户</a>]
					</div>
				</s:if>
				<s:else>
					<ul >
						<s:if test="#request.amtList.length > 0">
						<s:iterator value="#request.amtList" status="sta" >
							<li class="mt05">${fn:substring(lastmodify,5,16) }　<a href="http://workflow.ztgame.com${url }" target="_blank" title="【${systemname } ${humresname}】 ${workflowname }">${fn:substring(workflowname,0,24) }</a> </li>
						</s:iterator>
						</s:if>
						<s:else>
							<li class="mt05">暂无待办事宜 </li>
						</s:else>
					</ul>
				</s:else>
			</div>
			</s:if>
			<s:else>
			<div class="small_content small_buttom pd05" style="height: 24px; overflow: auto;" >
				<div>
					<a href="javascript:;" onclick="login();">[请登录]</a>
				</div>
			</div>
			</s:else>
		
	</div>
	<div id="right_4" class="indexRightRow">
		<div class="small_title lh200 wp100">
			<div class="fleft">专业游戏策划</div>
			<div class="fright">
				
			</div>
		</div>
		<div class="small_content small_buttom pd05" style="height: 150px; width:368px; overflow: hidden;">
			<ul id="desighContent">
			<s:iterator value="#request.designList">
				<s:if test="isFake == 1 || 1 == userByAuthorId.id">
					<li><a href="${domain }/topic/index.do?topicId=${id }" title="${title }">匿名 <span style="color: green;">(<commons:dateformat value="${lastReplyTime}"/> <s:property default="0" value="replyCount" />回复 <s:property default="0" value="subscribeCount"/>订阅)</span> ${title }</a></li>
				</s:if>
				<s:else>
					<li><a href="${domain }/topic/index.do?topicId=${id }" title="${title }">${userByAuthorId.name } <span style="color: green;">(<commons:dateformat value="${lastReplyTime}"/> <s:property default="0" value="replyCount" />回复 <s:property default="0" value="subscribeCount"/>订阅)</span> ${title }</a></li>
				</s:else>
			</s:iterator>
			</ul>
		</div>
	</div>
	<div id="right_2" class="indexRightRow">
		<div class="small_title lh200 wp100">
			<div class="fleft">天气</div>
			<div class="fright">
				<a href="javascript:;" onclick="$('#weatherBar').attr('src',$('#weatherBar').attr('src'))">[刷新]</a>
			</div>
		</div>
		<div class="small_content small_buttom pd05" style="height: 120px; width:368px; overflow: hidden;">
			<iframe id="weatherBar" class="mt05 mb05" src="" frameborder="0" scrolling="no" width="500" height="110" allowTransparency="true"></iframe>
		</div>
	</div>
  </div>
</div>
<script type="text/javascript">
function highlight(el,flag){	//帖子列表高亮操作
	if(flag){
		el.className='highlight';
	}else el.className='odd';
}
$(function(){
	//$("#weatherBar").attr("src","http://www.thinkpage.cn/weather/weather.aspx?uid=&c=CHXX0116&l=zh-CHS&p=CMA&a=0&u=C&s=3&m=1&x=1&d=5&fc=&bgc=&bc=&ti=1&in=1&li=2&ct=iframe");
});
</script>
<!-- END for 内容 -->
</body>
</html>