<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:iterator value="#request.pageBean.recordList">
<tr>
   	<td><s:date name="acctstarttime" format="yyyy-MM-dd" /></td>
       <td><s:date name="acctstarttime" format="HH:mm" /></td>
       <td><s:date name="acctstoptime" format="HH:mm"/></td>
       <td>${acctsessiontime }</td>
   </tr>
</s:iterator>
<script type="text/javascript">
var global_currentPage = parseInt('${p}');
var global_pageSize = parseInt('${pageSize}');
var global_count = parseInt('<s:property value="#request.pageBean.recordCount" default="0"/>');
var timeCount = "${count}";
$(function(){
	if(timeCount != '') $("#timeCount").val(timeCount);
	$("#record_fy").addClass("pager").pager({ pagenumber: global_currentPage,listpage:6, pagecount:Math.ceil(global_count/global_pageSize) , buttonClickCallback: getRecords});
});
</script>