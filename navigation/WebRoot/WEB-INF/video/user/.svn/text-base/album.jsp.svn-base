<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>相册 - ${requestScope.user.name}</title>
<script type="text/javascript" src="${domain }/js/lib/jquery.embed.js"></script>
<style type="text/css">
#albumBox {
	margin: 0 auto 20px;
	padding-top: 10px;
	width: 988px;
	border: 1px solid #DBDBDB;
}
img {display:block;}
#albumBox .btn {margin: 0 10px 10px;padding: 0 0 10px 0;border-bottom: 1px dotted #CCCCCC;}
#albumBox .btn a {
	background: url("${domain }/images/video/album/btn_up_ph.png") repeat scroll 0 0 transparent;
    border: none;
    color: #528ACC;
    font-size: 16px;
    font-weight: 700;
    line-height: 37px;
    text-align: center;
    margin: 0 10px 0;
    width: 123px;
    text-decoration: none;
    display: block;
    text-shadow: 1px 1px #FFFFFF;
}
#albumBox .phoBox {
	margin: 0 auto;
	width: 946px;
}
#albumBox .phoBox ul {
	padding: 0 0 0 5px;
	background: url("${domain }/images/video/album/line01.gif") repeat left top;
}
#albumBox .phoBox ul li {
	margin: 0 7px 30px 0;
	width: 228px;
	float: left;
}
#albumBox .phoBox ul li a {
    text-decoration: none;
    position:relative;
}
#albumBox .phoBox ul li a .s_photo {
    width: 226px;
	overflow: hidden;
	border: 1px solid #CCC;
	border-bottom: none;
}
#albumBox .phoBox ul li a img {
	margin: 0 auto;
	height: 192px;
	display: block;
}
#albumBox .phoBox ul li p.title {
	margin-bottom: 4px;
 	color: #999999;
    font-size: 14px;
    font-weight: bold;
}
#albumBox .phoBox ul li p.title span {
 	float:right;
}
#albumBox .phoBox ul li p.title span a {
	margin-left: 5px;
	padding: 1px 2px;
	width: auto;
    font-size: 12px;
    font-weight: normal;
    color: #E37D00;
}
#albumBox .phoBox ul li p.title span a:hover {
    color: #FFF;
    background-color: #E37D00;
}
#albumBox .phoBox ul li a .bgRed {
	padding: 5px 0;
	width: 228px;
	color: #FFF;
	overflow: hidden;
	background-color: #E37D00;
}
#albumBox .phoBox ul li a .bgRed em {
	padding: 0 0 0 5px;
    white-space: nowrap;
    font: 18px/1.4 "Microsoft Yahei",Tahoma,Simsun,Arial,Helvetica,sans-serif;
}
#albumBox .phoBox ul li a .bgRed span {
	padding-left: 5px;
	line-height: 1.5;
}
#albumBox .phoBox ul li a .t {
	width: 228px;
	height: 246px;
	background-color: #000;
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	filter:alpha(opacity=0);
}
#albumBox .phoBox ul li a:hover .t {
	opacity: 0.2;
	filter:alpha(opacity=20);
}
#albumBox .page {margin: 0 30px 20px;}
#albumBox .page li {margin-left: 10px;float:right;}
#albumBox .page li a {padding: 3px 4px;text-decoration: none;}
#albumBox .page li a.on,#albumBox .page li a:hover {color:#FFF;background-color:#E37D00;}
</style>
<script type="text/javascript">
jQuery.fn.imageAutoSize = function(width,height)
{
    $("img",this).each(function()
    {
        var image = $(this);

        if(image.width()>width)
        {
			image.width(width);
            image.height(width/image.width()*image.height());
        }
		if(image.height()>height)
        {
            image.width(height/image.height()*image.width());
            image.height(height);
        }
    });
}
$(function(){ $(".albumlist li").imageAutoSize(228,192)});
</script>
</head>
<body>
<!-- 内容 -->
<div style="margin:12px auto 3px;"><jsp:include page="gnavi.jsp" /></div>
<div id="albumBox" class="clearfix">
<s:if test="#request.isSelf">
<p class="btn"><a href="#" onclick="multUpload();">上传照片</a></p>
<div id="multUploader" title="批量上传" class="none">
	<div id="uploader" style="width:670px; height:450px;"></div>
</div>
</s:if>
<div style="color:#666; margin:60px auto; text-align:center; display:none;">还没有上传任何内容</div>
<div id="picsContent">
<%@ include file="ajaxUserPics.jsp"%>
</div>
<div id="pageContent" style="margin:-20px 25px 15px; float:right;"></div>
</div>
<script type="text/javascript">
$(function(){
	$('[id^="sbar_"]').removeClass('fb');
    $('#sbar_album').addClass('fb');
    $('#sbar_album').attr('target','_self');
    
    $("#multUploader").dialog({
		width:700,height:560,position: ['',50],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).dialog('close');window.location.reload();},
			" 继续上传 ": function(){multUpload();}
		}
	});
});
function multUpload(){
	$('#uploader').multiupload({
		src: '${domain}/images/swf/multiupload.swf',
		version: [10, 0],
		expressInstall: '${domain}/images/swf/expressInstall.swf',
		onFail: function(e) {alert('failure');}
	}, {
		uploadUrl: '${domain}/file/ajaxMultUploadApi.do?target=${requestScope.target}',
		maxNum: 64,
		imgFormat: '图片文件|*.jpg;*.jpeg;*.png;*.gif;*.bmp'
	}).css("height","450px").parent().dialog("open");
}
function getUserPicsList(p){
	$.post("${domain}/user/ajaxUserPics.do", {"uid":'${requestScope.userId}',"p":p}, function(d){
		$("#picsContent").html(d);
	},'html');
}
</script>
<!-- END for 内容 -->
</body>
</html>
