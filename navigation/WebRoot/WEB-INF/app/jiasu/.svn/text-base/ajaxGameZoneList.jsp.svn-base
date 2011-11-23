<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<table id="mytable" class="s_table" width="100%" cellpadding="0" cellspacing="1">
	<tr>
		<th>ID</th>
		<th>游戏公司</th>
		<th>游戏名</th>
		<th>游戏区</th>
		<th>服务器地址</th>
		<th>服务器端口</th>
		<th>用户</th>
		<th>状态</th>
	</tr>
	<s:iterator value="#request.pageBean.recordList" status="gstatus" id="gameid">
		<tr>
			<td>
				<s:property value="id" />
			</td>
			<td>
				<s:property value="company" />
			</td>
			<td>
				<s:property value="game" />
			</td>
			<td>
				<s:property value="zone" />
			</td>
			<td>
				<s:property value="gateway" />
			</td>
			<td>
				<s:property value="port" />
			</td>
			<td>
				<s:property value="user" />
			</td>
			<s:if test="#request.login_role=='FAIL'">
				<td>
					<s:if test="status==0">无效</s:if>
					<s:elseif test="status==2">已处理</s:elseif>
					<s:else>未处理</s:else>
				</td>
			</s:if>
			<s:elseif test="#request.login_role=='SUCCESS'">
				<td>
					<select name="selectname" id="sel_<s:property value='id'/>"
						onchange="changeStatus(this);">
						<s:if test="status==2">
							<option value="2" selected>已处理</option>
							<option value="1">未处理</option>
							<option value="0">无效</option>
						</s:if>
						<s:elseif test="status==0">
							<option value="0" selected>无效</option>
							<option value="2">已处理</option>
							<option value="1">未处理</option>
						</s:elseif>
						<s:else>
							<option value="1" selected>未处理</option>
							<option value="2">已处理</option>
							<option value="0">无效</option>
						</s:else>
					</select>
				</td>
			</s:elseif>
		</tr>
	</s:iterator>
</table>
<script type="text/javascript">
  var global_currentPage = parseInt('${p}');
  var global_pageSize = parseInt('${pageSize}');
  var global_count = parseInt('<s:property value="#request.pageBean.recordCount" default="0"/>');
  $(function(){
	  $("#pageContent").addClass("pager").pager({ pagenumber: global_currentPage,listpage:6, pagecount:Math.ceil(global_count/global_pageSize) , buttonClickCallback: getGameZoneList});
  });
</script>
