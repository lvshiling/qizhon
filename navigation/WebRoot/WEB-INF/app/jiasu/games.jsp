<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>更多游戏 - ${jiasuTitle}</title>
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
                	<%@ include file="/commons/jiasu/jiasu_download.jsp" %>
                </div>
                <div class="rightside">
                	<p class="r_title"><img src="${static}/styles/images/title_suportgame.jpg" /></p>
                    <p class="bet"></p>
                    <ul class="logo_list">
                    	<li>
                        	<p>
                            	<a href="http://zt2.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_01.jpg" alt="征途2"></a>
                                <span>征途2</span>
                            </p>
                            <p>
                            	<a href="http://els.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_02.jpg" alt="艾尔之光"></a>
                                <span>艾尔之光</span>
                            </p>
                            <p>
                            	<a href="http://ztsj.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_12.jpg" alt="征途时间版"></a>
                                <span>征途时间版</span>
                            </p>
                            <p>
                            	<a href="http://xt.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_04.jpg" alt="仙途"></a>
                                <span>仙途</span>
                            </p>
                        </li>
                        <li>
                        	<p>
                            	<a href="http://zt.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_05.jpg" alt="征途"></a>
                                <span>征途</span>
                            </p>
                            <p>
                                <a href="http://ls.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_11.jpg" alt="征途绿色版"></a>
                                <span>征途绿色版</span>
                            </p>
                            <p>
                                <a href="http://allods.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_07.jpg" alt="巫师之怒"></a>
                                <span>巫师之怒</span>
                            </p>
                            <p>
                            	<a href="http://sg.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_08.jpg" alt="三国战魂"></a>
                                <span>三国战魂</span>
                            </p>
                        </li>
                        <li>
                        	<p>
                            	<a href="http://kok3.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_09.jpg" alt="万王之王3"></a>
                                <span>万王之王3</span>
                            </p>
                            <p>
                            	<a href="http://zthj.ztgame.com/" target="_blank" ><img src="${static}/styles/images/index/logo/logo_10.jpg" alt="征途怀旧版"></a>
                                <span>征途怀旧版</span>
                            </p>
                        </li>
                    </ul>
                  	<br/>
                    <br/>
              	</div>
                <p class="clear"></p>
            </div>
        </div>
    </div>
</div>
<!-- END for 内容 -->
</body> 
</html> 