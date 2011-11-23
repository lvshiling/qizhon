<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>DETECTIVE WEB</title>
<style type="text/css">a:visited{padding-left:1px;}</style>
</head>
<body>
<script src="${domain }/js/lib/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
var list = [
	{name:'淘宝',link:'taobao.com'},{name:'腾讯',link:'qq.com'},{name:'网易',link:'163.com'},{name:'搜狐',link:'sohu.com'},{name:'中国人',link:'chinaren.com'},{name:'太平洋电脑',link:'pconline.com.cn'},{name:'电脑之家',link:'pchome.net'},
	{name:'支付宝',link:'alipay.com'},{name:'百度',link:'baidu.com'},{name:'谷歌',link:'google.com'},{name:'凤凰网',link:'ifeng.com'},{name:'新华社',link:'xinhuanet.com'},{name:'人民网',link:'people.com.cn'},{name:'开心网',link:'kaixin001.com'},{name:'人人网',link:'renren.com'},
	{name:'易车网',link:'bitauto.com'},{name:'搜搜',link:'soso.com'},{name:'优酷',link:'youku.com'},{name:'东方财富',link:'eastmoney.com'},{name:'工商银行',link:'icbc.com.cn'},{name:'招商银行',link:'cmbchina.com'},{name:'大众点评',link:'dianping.com'},{name:'美团网',link:'meituan.com'},
	{name:'58同城',link:'58.com'},{name:'赶集网',link:'ganji.com'},{name:'安居客',link:'anjuke.com'}
];
$(function(){$.detective.de(list);});
</script>
</body>
</html>