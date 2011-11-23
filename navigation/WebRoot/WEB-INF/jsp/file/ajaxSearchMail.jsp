<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<div id="mailContent">
	<ul>
	<s:iterator value="#request.mailResult">
		<li class="m15">
			<div class="pb05">
				<a style="text-decoration: underline; color: #0000CC; font-size: 16px;" target="_blank" 
					href="${domain }/mail/ajaxLoadMailPage.do?targetId=${accountId }">
					${mailTitle }
				</a>
			</div>
			<div class="pathUrl">http://www.qule.com/mail/ajaxLoadMailPage.do?targetId=${accountId } - <a href="javascript:copyToClipboard('http://www.qule.com/mail/ajaxLoadMailPage.do?targetId=${accountId }');" disabled="disabled" >复制地址</a></div>
		</li>
	</s:iterator>
	</ul>
	<form class="pd15" action="${domain }/file/ajaxSearchMailPage.do" method="post" id="mailSearchFrom" onsubmit="return false;">
		<input type="hidden" name="keyWord" value="${keyWord }">
		<input name="p" value="${p+1 }" id="mailPagenation" type="hidden">
		<s:if test="p>1">
			<input value=" 首页 " type="button" class="pd05" onclick="$('#mailPagenation').val(1).parent().submit();">
			<input value=" <<< 上一页 " type="button" class="pd05" onclick="$('#mailPagenation').val(${p-1}).parent().submit();">
		</s:if>
		<s:if test="#request.mailResult.size == pageSize">
			<input value=" 第 ${p } 页 下一页 >>> " type="submit" class="pd05">
		</s:if>
	</form>
	<script type="text/javascript">
		$('#mailSearchFrom').ajaxForm({
	        dataType:  'html', 
	        success:   function(d){
		    	$("#mailContent").html(d);
		    	alertClose();
	        },
	        beforeSubmit:function(){
	        	alert(globla_loading);
	        }
	    });
	</script>
</div>