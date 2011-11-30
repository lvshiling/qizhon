<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<div class="phoBox">
	<ul class="albumlist clearfix">
		<s:iterator value="#request.pageBean.recordList" status="status">
		<li>
			<p class="title clearfix"><span><a href="#">编辑</a><a href="#">删除</a></span>2011/10/31</p>
			<a href="#">
				<div class="s_photo"><img src="${path}" alt="" /></div>
				<div class="bgRed"><em>${picturePath}</em>
				<p><span>点击(34)</span><span>评论(0)</span></p></div>
				<div class="t"></div>
			</a>
		</li>
		</s:iterator>
	</ul>
	<div></div>
</div>
<script type="text/javascript">
  var global_currentPage = parseInt('${p}');
  var global_pageSize = parseInt('${pageSize}');
  var global_count = parseInt('<s:property value="#request.pageBean.recordCount" default="0"/>');
  $(function(){
	  $("#pageContent").addClass("pager").pager({ pagenumber: global_currentPage,listpage:6, pagecount:Math.ceil(global_count/global_pageSize) , buttonClickCallback: getUserPicsList});
  });
</script>
