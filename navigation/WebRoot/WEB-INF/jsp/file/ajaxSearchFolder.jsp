<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<div id="searchFolderContent">
	<ul>
	<s:iterator value="#request.fileList">
		<li class="m15">
			<div class="pb05">
				<a style="text-decoration: underline; color: #0000CC; font-size: 16px;" href="javascript:;" onclick="copyToClipboard('${fn:replace(filePath,"\\","&#92;&#92;")}');">${fileName }</a>
			</div>
			<div class="pathUrl">${filePath } - <a href="javascript:;" onclick="copyToClipboard('${fn:replace(filePath,"\\","&#92;&#92;")}');">复制路径</a></div>
		</li>
	</s:iterator>
	</ul>
	<form class="pd15" action="${domain }/file/ajaxSearchFolderPage.do" method="post" id="folderSearchFrom" onsubmit="return false;">
		<input type="hidden" name="keyWord" value="${keyWord }">
		<s:iterator value="folders" var="value" >
			<input type="hidden" value="${value }" name="folders" >
		</s:iterator>
		<input name="p" value="${p+1 }" id="folderPagenation" type="hidden">
		<s:if test="p>1">
			<input value=" 首页 " type="button" class="pd05" onclick="$('#folderPagenation').val(1).parent().submit();">
			<input value=" <<< 上一页 " type="button" class="pd05" onclick="$('#folderPagenation').val(${p-1}).parent().submit();">
		</s:if>
		<s:if test="#request.fileList.size == 20">
			<input value=" 第 ${p } 页 下一页 >>> " type="submit" class="pd05">
		</s:if>
	</form>
	<script type="text/javascript">
		$('#folderSearchFrom').ajaxForm({
	        dataType:  'html', 
	        success:   function(d){
		    	$("#searchFolderContent").html(d);
		    	alertClose();
	        },
	        beforeSubmit:function(){
	        	alert(globla_loading);
	        }
	    });
	</script>
</div>