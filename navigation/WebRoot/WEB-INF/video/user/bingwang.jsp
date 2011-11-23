<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>兵王选美大赛</title>
<style type="text/css">
body {
	background-color: #FFF;
}
.top{
	padding: 10px 0;
	margin: auto;
    width: 989px;
}
.top ul {
	margin-left: 10px;
}
.top ul li {
	margin: 0 7px 5px 0;
	float: left;
}
.top ul li a {
	display: block;
	height: 230px;
	color: #666;
	text-decoration: none;
	border: 1px solid #EAEAEA;
}
.top ul li span {
	margin-left: 5px;
	display: block;
	line-height: 1.4;
}
.top ul li .name {
	font-size: 14px;
	color: #F90;
	font-weight: bold;
}
.top ul li .name strong {
	padding-left: 10px;
	font-size: 12px;
	color: #F90;
	font-weight: normal;
}

.top ul li a .score strong {
	color: #900;
}

.top ul li a:hover {
	color: #FFF;
	background-color: #FF0099;
}
.top ul li a:hover .name,
.top ul li a:hover .name strong,
.top ul li a:hover .score strong {
	color: #FFF;
}

.top ul li img {
	width: 180px;
	height: 180px;
	padding: 3px 3px 5px;
	display: block;
}
</style>
</head>
<body>
<!-- 内容 -->
<div class="top clearfix">
	<ul class="clearfix">
		<s:iterator value="#request.userList" status="status">
			<li><a href="${domain}/user/score.do?uid=${id}"><img src="${icon1}" onerror="this.src='${domain}/images/default.jpg';" alt="" />
			<span class="name">${name}<s:if test="userCredit.scoreNum>0"><strong>(${userCredit.scoreNum})</strong></s:if></span><span class="score">网友评分： <strong>${userCredit.score}/10</strong></span>
			</a></li>
		</s:iterator>
	</ul>
</div>
<!-- END for 内容 -->
</body>
</html>
