<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http:/www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>游戏帮助 - ${jiasuTitle}</title>
<link rel="stylesheet" type="text/css" media="screen"  href="${static}/styles/jiasu/style.css" /> 
<style type="text/css">
.acctHelp{margin: 10px 20px;}
.acctHelp li{list-style:decimal;}
.acctHelp li img{padding: 10px 0px;}

.tips{ margin: 10px 20px;}
.tips li{padding: 5px 0px;}
</style>
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
                    <p class="bet"></p>
                   	
                    <ul class="tips">
                    	<li><b>注意事项：</b></li>
                    	<li style="color: red;">
                    		一、由于登录的IP地址会改变，各种绑定帐号的朋友慎用。</li>
                    	<li style="color: red;">二、需要卸载该加速器在注册表的信息和虚拟网卡，可以使用加速器目录下面，名字叫“UninstallDriver”，图标是灰色圆桶的程序进行卸载。</li>
                    	<li style="color: red;">三、win7系统用户，如果出现运行加速器提示不具有管理员权限，而您确认自己已经有管理员权限了，可以尝试鼠标右键点击GameAccGui.exe，然后在弹出菜单中左键“以管理员身份运行”，即可正常启动加速器了。
                    	</li>
                    	<li>四、各种加速器使用后，IP地址会有不同。
                    	</li>
                    	<li>五、木有身份证的朋友，勿用，因为IP地址不同。
                    	</li>
                    	<li>六、没有哪个加速器是绝对高速的。因为不同的加速器，服务器的地区都不同。</li>
                    	<li>七、如果有任何问题，或者BUG，请到该加速器的网站或者论坛进行反馈。</li>
                    	<li>八、《趣乐加速器》是《快游》的升级版</li>
                    </ul>
                    
                    <p class="bet"></p>
                    <ul class="acctHelp">
                    	<li>
                    		双击趣乐加速的图标（GameAccGui.exe），启动趣乐加速器。<br>
                    		<img src="${static }/styles/images/jpg/step1.jpg">
                    	</li>
                    	<li>
                    		启动加速器后，下面三个按钮会显示灰色，这里在更新当前的配置文件，需稍等片刻.....<br>
                    		<img src="${static }/styles/images/jpg/step2.jpg">
                    	</li>
                    	<li>
                    		更新配置完成后将会显示如下图：<br>
                    		<img src="${static }/styles/images/jpg/step3.jpg">
                    	</li>
                    	<li>
                    		此时您可以选择以注册用户或非注册用户登陆（注册用户可以获得更精确的加速体验以及额外的加速模式）<br>
                    	</li>
                    	<li>
                    		注册用户登录后你看到的界面如下<br>
                    		<img src="${static }/styles/images/jpg/step4.jpg"><br>
                    		此时尚无可用加速节点提供给您，您只需按下图做些简单操作就会看到了<br>
                    		<img src="${static }/styles/images/jpg/step5.jpg">
                    		这里点击“游戏选择”按钮后您将看到如下界面，<br>
                    		<img src="${static }/styles/images/jpg/step6.jpg"><br>
                    		<img src="${static }/styles/images/jpg/step7.jpg"><br>
                    		确定后只需要手工选择好某个加速节点或点击“自动分配节点”，再点击“启动加速器”，即启动了加速过程，请耐心等待右下角qule小图标显示绿色（使用模式二您无需等待，马上就可以启动游戏），你就可以打开游戏体验疾速的游戏感觉
                    	</li>
                    	<li>
                    		未注册用户登陆进入后看到的界面如下<br>
                    		<img src="${static }/styles/images/jpg/step8.jpg">
                    	</li>
                    	<li>
                    		该模式直接能看到所有加速节点列表，灰色部分当你以注册用户进入将会解锁。只需要手工选择好某个加速节点或点击“自动分配节点”，再点击“启动加速器”，即启动了加速过程，请耐心等待右下角qule小图标显示绿色，你就可以打开游戏体验疾速的游戏感觉<br>
                    	</li>
                    </ul>
                </div>
                <p class="clear"></p>
            </div>
        </div>
    </div>
</div>
<!-- END for 内容 -->
</body> 
</html> 