<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<div id="searchGpassHistoryContent">
	<ul>
	<s:iterator value="#request.gpassHistoryResult">
		<li class="m15">
			<div class="pb05">
				<a style="text-decoration: underline; color: #0000CC; font-size: 16px;" href="javascript:;">
					[<s:date name="addTime" format="yyyy-MM-dd"/>] ${fileName }
				</a>
			</div>
			<div class="pathUrl">历史记录 无路径 - <a href="javascript:;" disabled="disabled" >趣乐快照</a></div>
		</li>
	</s:iterator>
	</ul>
	<form class="pd15" action="${domain }/file/ajaxSearchGpassHistoryPage.do" method="post" id="GpassHistorySearchFrom" onsubmit="return false;">
		<input type="hidden" name="keyWord" value="${keyWord }">
		<input name="p" value="${p+1 }" id="gpassHistoryPagenation" type="hidden">
		<s:if test="p>1">
			<input value=" 首页 " type="button" class="pd05" onclick="$('#gpassHistoryPagenation').val(1).parent().submit();">
			<input value=" <<< 上一页 " type="button" class="pd05" onclick="$('#gpassHistoryPagenation').val(${p-1}).parent().submit();">
		</s:if>
		<s:if test="#request.gpassHistoryResult.size == pageSize">
			<input value=" 第 ${p } 页 下一页 >>> " type="submit" class="pd05">
		</s:if>
	</form>
	<script type="text/javascript">
		$('#GpassHistorySearchFrom').ajaxForm({
	        dataType:  'html', 
	        success:   function(d){
		    	$("#searchGpassHistoryContent").html(d);
		    	alertClose();
	        },
	        beforeSubmit:function(){
	        	alert(globla_loading);
	        }
	    });
	</script>
</div>