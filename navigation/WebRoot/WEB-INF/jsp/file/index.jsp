<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公司内搜索 - ${siteTitle}</title>
<style type="text/css">
.fileTable td{padding: 5px; font-size: 14px; }
.fileTable th{text-align: right; font-weight: normal; font-size: 14px;}
.fileTable{width: 600px; margin: 0px auto;}
.searchText{
	font-family: Verdana, Arial, Helvetica,"Lucida Grande", "宋体", sans-serif; 
	padding: 5px; width: 250px;
}
.searchResult th{
	font-size: 20px;
	font-family: Verdana,"黑体";
	width: 35px;
	color: #F60;
	line-height: 130%;
	padding-top: 10px;
	background-color: #eee;
}
.searchResult{ border: #ccc solid 1px; width: 100%; margin: 10px auto;}
.searchResult td{
	line-height: 150%;
}
.pathUrl{color: green;}
.pathUrl a:link{ color: #666666; text-decoration: underline;}
</style>
</head>
<body>
<!-- 内容 -->
<div id="content" class="clearfix">
	<div class="wp99 pt10">
		<s:if test="#request.indexPermit">
		
		<div style="background-color: #DDF3F7; background-position: 10px ; background-repeat: no-repeat; background-image: url('${domain }/images/commons/geilisearch.gif');">
		<form id="searchFileForm" action="${domain }/file/ajaxSearchFilePage.do" method="post">
		<table class="fileTable">
			<tr>
				<th>给力搜索：</th> 
				<td>
					<input class="searchText" type="text" name="keyWord" value="趣乐" onclick="___c(this);" /> 
					<input type="submit" class="pd05" value=" 搜 索 " />
					<input type="reset" class="pd05" onclick="$('#searchContent').empty();" value=" 重 置 " />　
					<span style="border-bottom: 1px dashed red; padding: 1px; ">
						<a href="http://zt.qule.com/topic/index.do?topicId=1090" class="ft16" style="color: red;">意见建议反馈</a></span>
				</td>
			</tr>
			<tr>
				<th>搜文件资源：</th>
				<td>
					<s:iterator value="#request.FileSearchConfigList">
						<label><input type="checkbox" name="folders" checked="checked" value="${id }" /> ${folderName }</label>
					</s:iterator>
					<font color="gray">不断丰富中..</font>
				</td>
			</tr>
			<tr>
				<th>搜GPASS：</th>
				<td>
					<label><input type="checkbox" checked="checked" name="gpassFlag" value="1" /> 实时</label> <label><input type="checkbox" name="gpassHistoryFlag" value="1" disabled="disabled" /> 快照 </label>
				</td>
			</tr>
			<tr>
				<th>搜贴子：</th>
				<td>
					<input type="checkbox" checked="checked" name="topicFlag" value="1" />
				</td>
			</tr>
			<tr>
				<th>搜邮件：</th>
				<td>
					<s:if test="userToken.user != null">
						<input type="checkbox" name="mailFlag" value="1"  /> 域用户可以直接使用，如若不是 请先绑定邮件地址！
					</s:if>
					<s:else>
						请先 <a href="javascript:login();">登 录</a>
					</s:else>
				</td>
			</tr>
			<tr>
				<th>搜AMT：</th>
				<td>
					<input type="checkbox" disabled="disabled" /> 敬请期待
				</td>
			</tr>
		</table>
		</form>
		</div>
		<div id="searchContent"></div>
		</s:if>
		<s:else>
			<div class="small_title">
				<div class="fleft">登录提示</div>
				<div class="fright">
				</div>
			</div>
			<div class="clear"></div>
			<div class="lh160 small_content small_buttom pd15">
				${msg }
			</div>
		</s:else>
	</div>
</div>
<!-- 内容 -->
<script type="text/javascript">
$('#searchFileForm').ajaxForm({
    dataType:  'html', 
    success:   function(d){
 		$("#searchContent").html(d);
    	alertClose();
    },
    beforeSubmit:function(){
    	alert(globla_loading);
    }
});
</script>
</body>
</html>