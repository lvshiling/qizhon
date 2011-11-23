<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<ul class="news_list">
 	<s:iterator value="#request.newsPageBean.recordList">
		<li><span><img src="${static}/styles/images/point.jpg" /></span>
			<span class="date"><s:date name="addTime" format="[yyyy-MM-dd]" /></span>
			<a href="${domain }/jiasu/newsDetail.do?targetId=${id }" target="_blank" >${title }</a>
		</li>
 	</s:iterator>
</ul>
<script type="text/javascript">
var global_currentPage = parseInt('${p}');
var global_pageSize = parseInt('${pageSize}');
var global_count = parseInt('<s:property value="#request.newsPageBean.recordCount" default="0"/>');
$(function(){
	$("#pageContent").addClass("pager").pager({ pagenumber: global_currentPage,listpage:6, pagecount:Math.ceil(global_count/global_pageSize) , buttonClickCallback: getNews});
});
</script>