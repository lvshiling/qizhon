<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>AMT待办事项 - ${siteTitle}</title>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
	<div class="wp99">
		<div class="lh200 small_title">
			<s:if test="#request.amtLink == null">
				<div class="fleft">需要先绑定域帐户</div>
				<div class="clear"></div>
				<div class="small_content small_buttom pd10" style="height: 100px;">
					[<a href="${domain }/bind/giant/index.do">点击绑定域帐户</a>]
				</div>
			</s:if>
			<s:else>
				<div>
					<div class="fleft">域帐户：${amtLink.linkField1 }</div>
					<div class="fright"><a href="./index.do?_=${amtLink.id }">[ - 解除绑定]</a></div>
				</div>
				<div class="clear"></div>
				<div class="small_content small_buttom pd10">
					<ul class="lh160 pd05">
					<s:if test="#request.amtList.length > 0">
						<s:iterator value="#request.amtList" status="sta" >
							<li>${fn:substring(lastmodify,5,16) }　<a href="http://workflow.ztgame.com${url }" target="_blank" title="${workflowname }">[ ${systemname } ${humresname} ] ${fn:substring(workflowname,0,24) }</a></li> 
						</s:iterator>
					</s:if>
					<s:else>
						<li class="mt05">暂无待办事宜 </li>
					</s:else>
					</ul>
				</div>
			</s:else>
		</div>
	</div>
</div>
<!-- 内容 -->
</body>
</html>