<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"  %>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title /></title>
<link href="${static}/styles/video/commons.css" rel="stylesheet" type="text/css" />
<link href="${static}/styles/video/layout.css" rel="stylesheet" type="text/css" />
<link href="${static}/styles/video/module.css" rel="stylesheet" type="text/css" />
<link href="${static}/styles/video/pager.css" rel="stylesheet" type="text/css" />
<link href="${static}/styles/video/legacy.css" rel="stylesheet" type="text/css" />
<link href="${static}/js/lib/css/blitzer/jquery-ui-1.7.3.custom.css" rel="stylesheet" type="text/css" />	
<script type="text/javascript" src="${static}/js/lib/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${static}/js/lib/jquery-ui-1.7.3.custom.min.js"></script>
<script type="text/javascript" src="${static}/js/lib/group.pager.js"></script>
<script type="text/javascript" src="${static}/js/lib/md5.min.js"></script>
<script type="text/javascript">
var Path={'static':'${static}','domain':'${domain}','upload':'${upload}'};
var globla_loading = '<div class="w100 mauto loading"><img src="'+Path.domain+'/images/module/loading-1.gif" width="24" height="24" />载入中...</div><p class="tcenter"></p>';
function ___c(o){o = $(o);if(o.attr('t')!='t'){o.val('')};o.attr("t",'t');}
window.al=window.alert;
$(function(){
	var alert=window.alert=function(c){$("#se").html(c).dialog('open');}
	alertClose = function(){$("#se").dialog('close');}
	$("#se").dialog({modal:true,autoOpen:false,width:450,position: ['',127],buttons:{" 确 定 ": function(){$(this).dialog('close');}}});
	$(".datepick").datepicker({buttonImageOnly: false, dateFormat: 'yymmdd',minDate: '-2M'});
});
</script>
<decorator:head />
</head>
<body>
  <div id="wrapper" class="">
  	<!-- 最外层容器，增强扩展性 -->
	<!-- jsp:directive.include file="/commons/video/header_user.jsp" /> -->
	<decorator:body />
	<jsp:directive.include file="/commons/video/footer.jsp" />
	<div id="se" class="none alert" title="提 示" ></div>
	<!-- END for 最外层容器 -->
  </div>
</body>
</html>