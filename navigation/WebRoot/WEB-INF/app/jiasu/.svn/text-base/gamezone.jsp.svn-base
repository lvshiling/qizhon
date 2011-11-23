<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>更多游戏 - ${jiasuTitle}</title>
<link rel="stylesheet" type="text/css" media="screen" href="${static}/styles/jiasu/style.css" />
<style>
.s_table{empty-cells:show;border-collapse:collapse;table-layout:fixed;}
.s_table th{padding:2px; border:1px solid #c1dad7; background:#cae8ea; height:24px;}
.s_table td{word-break:break-all;word-wrap:break-word; padding:2px; border:1px solid #c1dad7;}
</style>
<script type="text/javascript">
  function changeStatus(obj){
  	var id = obj.id;
  	var sid = id.substring(4);
  	var val = obj.value;
  	$.post("${domain}/jiasu/ajaxChangeStatus.do?id="+sid+"&status="+val, {}, function(d){
		if(d['status'] == 1){
			alert("状态更新成功");
		}else{
			alert(d['message']||"状态更新失败");
		}
	},'json');
  }
  function getGameZoneList(p){
	$.post("${domain}/jiasu/ajaxGameZoneList.do", {"p":p}, function(d){
		$("#newsContent").html(d);
	},'html');
  }
</script>
</head>
<body>
	<!-- 内容 -->
	<div id="wrap">
		<%@ include file="/commons/jiasu/jiasu_userPad.jsp"%>
		<ul id="menu">
			<li style="width: 380px; height: 41px; background: url(${static}/styles/images/bg_nav_l.jpg) no-repeat;"></li>
			<li><%@ include file="/commons/jiasu/menu.jsp"%></li>
			<li style="width: 58px; height: 41px; background: url(${static}/styles/images/bg_nav_r.jpg) no-repeat;"></li>
		</ul>
		<p class="middle_blank clear"></p>
		<div id="main">
			<div id="m_top">
				<div id="container">
					<div class="leftside">
						<%@ include file="/commons/jiasu/jiasu_download.jsp"%>
					</div>
					<div class="rightside">
						<div id="newsContent">
							<%@ include file="/WEB-INF/app/jiasu/ajaxGameZoneList.jsp"%>
						</div>
						<div id="pageContent"></div>
						<p class="clear"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END for 内容 -->
</body>
</html>
