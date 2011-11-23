<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公司内搜索 - ${siteTitle}</title>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
	<div class="wp99 pt10">
		<fieldset class="pd10">
		<form id="searchFileForm" action="./file/ajaxSearchFilePage.do" method="post" target="_blank">
			<div class="pd05">关键字：<input name="keyWord" id="keyWord" type="text" /></div>
			<div class="pd05 lh200">
			<s:iterator value="#request.FileSearchConfigList">
				<input type="checkbox" name="folders" checked="checked" value="${id }" /> ${folderName }
			</s:iterator>
			</div>
			<input class="pd05" type="submit" value="提交" />
		</form>
		</fieldset>
		<fieldset class="mt10 pd10">
		<form id="addNewConfig" action="./file/ajaxAddConfigApi.do" method="post">
			<div class="pd05">名称：<input name="fileConfigName" id="fileConfigName" type="text" /></div>
			<div class="pd05">真实路径：<input name="fileConfigRealPath" id="fileConfigRealPath" type="text" /> 例：/mnt/dst/电影</div>
			<div class="pd05">显示路径：<input name="fileConfigPath" id="fileConfigPath" type="text" /> 例：\\192.168.35.50\fas270\电影</div>
			<input class="pd05" type="submit" value="提交" />
		</form>
		</fieldset>
		<fieldset class="mt10 pd10">
			<legend>文件夹列表</legend>
			<ul>
				<s:iterator value="#request.FileSearchConfigList">
					<li class="pd10">
						${id }:${folderName } - <font color="red">${folderRealPath }</font>("<font color="green">${folderPath }</font>")
						<hr style="border-style: dashed; border-top: 0px;">
						<a href="javascript:updateConfig(${id });void(0);">[完整更新]</a> - 
						<a href="javascript:;void(0);">[增量完整更新]</a> - 
						<input type="text" id="addOnPath_${id }" /> <a href="javascript:updateManualConfig(${id });void(0);">[增量手动更新]</a>
					</li>
				</s:iterator>
			</ul>
		</fieldset>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('#addNewConfig').ajaxForm({	//创建
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				alert("创建成功，页面正在刷新！");
				window.setTimeout("window.location.reload();");
			}else alert( d['message']||"失败");
        }
    });
});
function updateConfig(id){
	alert(globla_loading);
	$.post("${domain }/file/ajaxUpdatePathApi.do", {"fileConfigId":id}, function(d){
		if(d['status'] == 1){
			alert(d['message']||"成功");
		}else alert(d['message']||"失败");
	},'json');
}
function updateManualConfig(id){
	var addOn = $("#addOnPath_"+id).val();
	if(addOn != null && addOn != ''){
		alert(globla_loading);
		$.post("${domain }/file/ajaxAddOnUpdatePathApi.do", {"fileConfigId":id,"fileConfigPath":addOn}, function(d){
			if(d['status'] == 1){
				alert(d['message']||"成功");
			}else alert(d['message']||"失败");
		},'json');
	}else al('增量路径为空');
}
</script>

<!-- 内容 -->
</body>
</html>