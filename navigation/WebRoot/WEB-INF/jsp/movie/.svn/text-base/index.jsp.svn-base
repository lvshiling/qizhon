<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资源共享 - ${siteTitle}</title>
<script type="text/javascript" src="${static}/js/lib/ZeroClipboard.js"></script>
</head>
<body>
<div id="content" class="clearfix">
	<div class="wp99">
		<div class="lh200 small_title">
			<div class="fleft">文件库：<span class="ft12 fn alert"> 目前只能拷贝文件地址，请自行在 资源管理器 或 播放器 中打开，稍晚些我们会更新浏览器插件，可解决以上问题</span></div><div class="fright"><a href="${domain }/movie/index.do?targetDirectory=&_=${_}">[回首页]</a> | <a href="javascript:window.location.reload();">[手动刷新]</a></div>
		</div>
		<div class="clear"></div>
		<div class="lh160 small_content small_buttom pt05">
			<s:iterator value="#request.fileList" var="file">
			<div style="background-color: #eee;" class="ml05 mb05 mr05">
				<s:if test="#file.fileType == 'dir'">
					<s:if test="fileName != '...'">
						<a href="javascript:copyUrl('${fn:replace(floder,"\\","&#92;&#92;")}','${fileName }');void(0);">
							<font style="text-decoration: underline;">[复制文件夹地址]</font> 
						</a> 
					</s:if>
					<a href="${domain }/movie/index.do?targetDirectory=${link}&_=${_}">
						<img border="0" src="${domain }/images/commons/file.jpg" alt="absmiddle" class="mr05"></img>
						<font color="#000">${fileName }</font>
					</a>
				</s:if>
				<s:else>
					<a href="javascript:;void(0);" onclick="copyUrl('${fn:replace(floder,"\\","&#92;&#92;")}','${fileName }');">
						<font style="text-decoration: underline;">[复制文件地址]</font> 
						<font color="#000">${fileName }</font>
					</a> 
				</s:else>
			</div>
			</s:iterator>
		</div>
	</div>
</div>
<div id="copyCli" title="文件地址">
</div>
<script type="text/javascript">
var clip = null;
function copyUrl(pre,url){
	url = '\\\\192.168.35.50\\fas270\\'+(pre?pre+"\\":"")+url;
	copyToClipboard(url)
}
</script>
</body>
</html>