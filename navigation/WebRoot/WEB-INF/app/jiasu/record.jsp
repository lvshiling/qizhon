<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>联网时间查询 - ${jiasuTitle}</title>
<link rel="stylesheet" type="text/css" media="screen"  href="${static}/styles/jiasu/style.css" /> 
</head>
<body>
<!-- 内容 -->
<div id="wrap">
	<%@ include file="/commons/jiasu/jiasu_userPad.jsp" %>
    <ul id="menu">
    	<li style="width:380px; height:41px;background:url(${static}/styles/images/bg_nav_l.jpg) no-repeat;"></li>
    	<li>
        	<%@ include file="/commons/jiasu/menu.jsp" %>
   		</li>
        <li style="width:58px;height:41px;background:url(${static}/styles/images/bg_nav_r.jpg) no-repeat;"></li>
	</ul>
    <p class="middle_blank clear"></p>
	<div id="main">
    	<div id="m_top">
        	<div id="container">
            	<div class="leftside">
                	<p class="p_title"><img src="${static}/styles/images/title_personal.jpg" alt="个人中心"/></p>
                    <br />
                    <%@ include file="/commons/jiasu/jiasu_homeMenu.jsp" %>
                </div>
                <div class="rightside">
                	<p class="r_title"><img src="${static}/styles/images/title_search.jpg" /></p>
                    <p class="bet"></p>
                    <br/>
                  	<ul id="searchbar">
                        <li class="time_start"><input style="width: 100px;" readonly="readonly" type="text" class="datepick" id="startDate" value="${startDate }" /></li>
                        <li class="time_over"><input style="width: 100px;" readonly="readonly" type="text" class="datepick" id="endDate" value="${endDate }" /></li>
                        <li class="btn_sear"><button onclick="getRecords(1);" class="btn_search"></button></li>
                        <li class="time"><input type="text" id="timeCount" readonly="readonly" disabled="disabled"></li>
                    </ul>
                    <br/>
                    <table class="s_table" width="100%" border="0" cellpadding="0" cellspacing="1">
                    	<thead>
                        	<tr>
                            	<th><img src="${static}/styles/images/th01.jpg" /></th>
                                <th><img src="${static}/styles/images/th02.jpg" /></th>
                                <th><img src="${static}/styles/images/th03.jpg" /></th>
                                <th><img src="${static}/styles/images/th04.jpg" /></th>
                        	</tr>
                        </thead>
                        <tbody id="recordContent">
                        	<%@ include file="/WEB-INF/app/jiasu/ajaxGetRecordsList.jsp" %>
                        </tbody>
                    </table>
                    <div id="record_fy"></div>
              	</div>
                <p class="clear"></p>
            </div>
        </div>
    </div>
    </div>

<script type="text/javascript">
$(document).ready(function(){
	highLight();
});
function highLight(){
	$('.s_table tbody tr:odd').css({background: "#e6e6e6" });
	$('.s_table tbody tr:even').css({background: "#f4f4f4" });
}
function getRecords(p){
	var start = $("#startDate").val();
	var end = $("#endDate").val();
	var name = "${userToken.user.name }";
	name = "wangxin";
	if(start == "") {al('请选择开始时间');return false;}
	if(end == "") {al('请选择结束时间');return false;}
	alert(globla_loading);
	if(p==1)$("#timeCount").val('');
	$.post("${domain}/jiasu/ajaxGetRecordsList.do", {"p":p,"startDate":start,"endDate":end,}, function(d){
		$("#recordContent").html(d);
		highLight();
		alertClose();
	},'html');
}

</script>
<!-- END for 内容 -->
</body> 
</html> 