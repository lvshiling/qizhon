<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>趣乐--排行榜</title> 
<style type="text/css">
body{
	margin:0; 
	padding:0;
	font-family: "Lucida Grande","Lucida Sans Unicode","Lucida Sans",Verdana,Arial,sans-serif;
    font-size: 12px;
	color:#555555;
	width:100%;
	}
ul , li{
	padding:0;
	margin:0;
	}
ul li{
	list-style:none;
	}

.main_div{
	float:left; 
	padding-left:10px;
	}

.main_top{
	background: url('${static}/styles/images/idxBox_v6.png') no-repeat scroll -1640px 0 transparent;
	height: 55px;
	padding-top:1px; 
	width:305px;
	}
.main_top .title{
	margin:20px;
	}

.main_middle{
	background: url('${static}/styles/images/idxBox_v6.png') repeat-y scroll -1945px 0 transparent;
	padding: 0 9px; 
	width:287px; 
	height:360px;
	}
.main_bottom{
	background: url('${static}/styles/images/idxBox_v6.png') no-repeat scroll -1640px -56px transparent;
	font-size: 0; 
	height: 11px; 
	width:305px;
	}
.main_middle ul{
	padding-top:10px;
	}
.main_middle ul li{
	height:25px;
	}
.main_middle .t1{
	display:inline-block;
	width:120px;
	text-align:left;
	}
.main_middle .t2{
	display:inline-block;
	width:50px;
	text-align:left;
	}
.main_middle .t3{
	padding-left:120px;
	}
</style>
</head>
<body>
	<div style="min-height:680px; _height:680px; width:950px; margin:0 auto; overflow:hidden;padding-top:30px;">
        <div class="main_div">
            <div class="main_top">
            	<div class="title">明星排行榜</div>
            </div>
            <div class="main_middle">
            	<ul>
            	<s:iterator value="#request.starList">
                	<li>
                    	<span class="t1"><a href="/user/index.do?uid=${user.id }">${user.name }</a>(${user.id })</span>
                        <span class="t3"><img alt="" src="${static}/styles/images/13_s.gif" align="absmiddle"/></span>
                    </li>
                </s:iterator>    
                </ul>
            </div>
            <div class="main_bottom"></div>
        </div>
        
        <div class="main_div">
            <div class="main_top">
            	<div class="title">富豪排行榜</div>
            </div>
            <div class="main_middle">
            	<ul>
            	<s:iterator value="#request.richList">	
                	<li>
                    	<span class="t1"><a href="/user/index.do?uid=${user.id }">${user.name }</a>(${user.id })</span>
                        <span class="t3"><img alt="" src="${static}/styles/images/13_s.gif" align="absmiddle"/></span>
                    </li>
                </s:iterator>    
                </ul>
            </div>
            <div class="main_bottom"></div>
        </div>
        
        <div class="main_div">
            <div class="main_top">
            	<div class="title">人气排行榜</div>
            </div>
            <div class="main_middle">
            	<ul>
            	<s:iterator value="#request.popList">	
                	<li>
                    	<span class="t1"><a href="/user/index.do?uid=${user.id }">${user.name }</a>(${user.id })</span>
                        <span class="t3"><img alt="" src="${static}/styles/images/13_s.gif" align="absmiddle"/></span>
                    </li>
                </s:iterator>    
                </ul>
            
            </div>
            <div class="main_bottom"></div>
        </div>
    </div>

<script type="text/javascript">
$(function(){
	$('#navbar a.lit').removeClass('lit');
	$('#navbar #nv_rank').addClass('lit');
});
</script>
</body>
</html>
