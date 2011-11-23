<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<s:if test="#request.pics.size > 0 || p>1">
	<style type="text/css">
	#slideshow {
	    position:relative;
	    height:450px;
	    overflow: hidden;
	}
	#slideshow IMG{
	    position:absolute;
	    top:0;
	    left:0;
	    z-index:9908;
	    opacity:0.0;
	    max-width: 600px;
	    cursor:pointer;
	}
	#slideshow IMG.active{z-index:9910;opacity:1.0;}
	#slideshow IMG.last-active{z-index:9909;}
	</style>
	<div class="fleft">
		( <span id="picsCount">1</span> / <s:property value="#request.pics.size" default="0"/> )
	</div>
	<div class="fright mb05">
		第 ${p } 辑
		<s:if test="p>1">
			<a href="javascript:getMyPics(${p-1 });">[上一辑]</a>
		</s:if>
		<s:if test="#request.pics.size ==  10">
			<a href="javascript:getMyPics(${p+1 });">[下一辑]</a>
		</s:if>
	</div>
	<div id="slideshow" class="clear">
	    <s:iterator value="#request.pics" status="u">
		    <img src="${static }/upload/picture/${user.id }/${picturePath }" 
		    	alt="Slideshow Image ${u.index+1 }" 
		    	${u.index==0?'class="active"':'' } onclick="slideSwitch();" />
		</s:iterator>
	</div>
	<script type="text/javascript">
	var index = 1;
	function slideSwitch() {
	    var $active = $('#slideshow IMG.active');
	    var pageSize = parseInt('<s:property value="#request.pics.size"/>');
	    if($active.length == 0) $active = $('#slideshow IMG:last');
	    var $next =  $active.next().length ? $active.next():$('#slideshow IMG:first');
	    $active.addClass('last-active');
	    $next.css({opacity: 1.0}).addClass('active');
	    $active.removeClass('active last-active');
	    index ++;
	    if(index>pageSize) index = index-pageSize;
	    $("#picsCount").html(index);
	}
	</script>
</s:if>
<s:else>
	<p class="ft14 pb20">
		还没有照片哦
	</p>
	<a href='javascript:void(0);' onclick='$("#picGallery").dialog("close");multUpload();'>
		<img src="${domain }/images/commons/upload.png" />
	</a>
</s:else>