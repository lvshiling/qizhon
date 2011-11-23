<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>用户中心 - ${siteTitle}</title>
		<link href="${static}/styles/video/index.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${domain }/js/lib/jquery.embed.js"></script>
		<script type="text/javascript" src="${domain }/js/video/userinfo.js"></script>
		<style type="text/css">
			#userInfoTable td {padding: 10px;}
			#contentMain input.btn {width:85px;height:22px;line-height:22px;padding-bottom:3px !important;padding-bottom:auto;border:1px solid #ccc;cursor:pointer;}
		</style>
	</head>
	<body>
		<!-- 内容 -->
		<div id="contentMain" class="layout clearfix">
			<div class="columnleft">
				<div class="idx-synopsis">
					<h1>
						${requestScope.user.name} <a href="javascript:;" onclick="changeUserName();">[修改昵称]</a>
					</h1>
					
					<div class="pt fix">
						<p class="pic">
							<a href="javascript:showDIV(4);void(0);"><img src="${requestScope.user.icon1}" onerror="this.src='${requestScope.user.icon}'" /></a>
						</p>
						<p>
							明星：<script>document.write(getStarGradeText(${requestScope.user.userCredit.starGrade}));</script>
						</p>
						<p>
							富豪：<script>document.write(getRichGradeText(${requestScope.user.userCredit.richGrade}));</script>
						</p>
						<p>
							<s:if test="#request.user.userLogState.liveState==1">
								正在直播
							</s:if>
							<s:else>
								目前不在直播
							</s:else>
						</p>
						<p>
							<a href="${domain}/${requestScope.user.room.roomNo }"><img src="${static}/styles/images/room.png" /></a>
						</p>
						<p onclick="javascript:showDIV(3);" class="w70"><a href="#"><img src="${static}/styles/images/avatar.png" /></a>
						</p>
					</div>
					<!--/.pt-->
					<p>
						房号：
						<span class="rnum">${requestScope.user.id}</span>
					</p>
					<p>
						所属家族：
					</p>
					<table>
						<tbody>
							<tr>
								<td>
									<span class="num">${requestScope.user.userCredit.visits }</span>访问
								</td>
								<td>
									<span class="num">${requestScope.user.userCredit.fansNum }</span>粉丝
								</td>
								<td>
									<span class="num date">
										<s:if test="#request.user.userLogState.lastLiveTime!=null">
											<script>document.write("${requestScope.user.userLogState.lastLiveTime}".substring(0,16));</script>
											<br/>上次直播
										</s:if>
										<s:else>
											目前没有直播
										</s:else>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
				</div>
			</div>
			<ul class="userUl">
				<li onclick="javascript:showDIV(1);" class="li01">个人动态</li>
				<li onclick="javascript:showDIV(2);" class="li02">个人资料</li>
				<li onclick="javascript:showDIV(3);" class="li03">修改头像</li>
				<!-- <li onclick="javascript:showDIV(4);" class="li04">绑定新浪微博</li> -->
				<li onclick="javascript:showDIV(5);" class="li05">帐户信息</li>
				<li onclick="javascript:showDIV(6);" class="li06">修改密码</li>
			</ul>
			<div  id="showdiv_1"  class="columnRight">
				<ul class="topTitle clearfix">
					<li>主播动态</li>
					<li>对我的评论</li>
				</ul>
				<div class="box01">
				<div class="formBox fix">
					<form action="" method="get">
						<textarea name="" cols="" rows="4"></textarea>
						<ul>							
							<li class="bg01"><a href="#">照片</a></li>
							<li class="bg02"><a href="#">歌曲</a></li>
							<li class="bg03"><a href="#">视频</a></li>	
							<li class="rignt"><input type="image" src="${static}/styles/images/form_btn02.gif" value="" name="" /></li>	
							<li class="rignt" id="onClick"><img src="${static}/styles/images/form_btn01.gif" />
								<div class="expression">
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>
									<span><img src="${static}/styles/images/expression/01.gif" alt="" /></span>					
								</div>
							</li>
						</ul>		
					</form>
				</div>
				<p class="hTitle">个人动态</p>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>你很完美当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。当一个事件传到一个元素上，所有绑定在上面的针对哪个事件的处理函数都会触发。</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<div class="dynamic fix">
					<p><a href="#">╰★`馨儿☆’</a>上传了1张照片</p>
					<div class="photo"><img src="${static}/styles/images/img01.jpg" alt="" /></div>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
					</ul>
				</div>
				<ul class="page">				
					<li class="on"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">后页</a></li>
				</ul>
				</div>
				
				<div class="box02">
					<p class="noComments">您没有新评论！</p>
					<div class="dynamic fix" style="display:none">
					<p><a href="#">╰★`馨儿☆’</a>你很完美</p>
					<ul class="fix">
						<li class="fLeft">11-01 19:33</li>		
						<li><a href="#">删除</a></li>
						<li><a href="#">评论</a>|</li>
						<li><a href="#">转发</a>|</li>
						</ul>
					</div>
				<ul class="page" style="display:none">				
					<li class="on"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">后页</a></li>
				</ul>
				</div>
				
			</div>
			<div  id="showdiv_2"  class="columnRight nodisplay">
				<form action="" method="get" class="fix">
					<dl class="left">
						<dt>年龄</dt>
						<dd onclick="javascript:info(1);" class="dd01"><p>28</p><input name="" type="text" value="28" /></dd>
						<dt>身高</dt>
						<dd onclick="javascript:info(2);" class="dd02"><p>210cm</p>
						<select name="">
							<option>210cm</option>
							<option>205cm</option>
							<option>200cm</option>
							<option>195cm</option>
							<option>190cm</option>
							<option>185cm</option>
							<option>180cm</option>
							<option>175cm</option>
							<option>170cm</option>
							<option>165cm</option>
							<option>160cm</option>
							<option>155cm</option>
							<option>150cm</option>
							<option>145cm</option>
							<option>140cm</option>
							<option>135cm</option>
							<option>130cm</option>
							<option>125cm</option>
							<option>120cm</option>
						</select></dd>
						<dt>来自</dt>
						<dd onclick="javascript:info(3);" class="dd03 fix"><p>---请选择---</p>
						<select name="userInfo.userProvince" id="selProvince" onchange="getCity(this.options[this.selectedIndex].value)"> 
						        <option value="0">---请选择---</option> 
						        <option value="100">北京市</option> 
						        <option value="200">上海市</option> 
						        <option value="300">天津市</option> 
						        <option value="400">重庆市</option> 
						        <option value="500">河北省</option> 
						        <option value="600">山西省</option> 
						        <option value="700">内蒙古自治区</option> 
						        <option value="800">辽宁省</option> 
						        <option value="900">吉林省</option> 
						        <option value="1000">黑龙江省</option> 
						        <option value="1100">江苏省</option> 
						        <option value="1200">浙江省</option> 
						        <option value="1300">安徽省</option> 
						        <option value="1400">福建省</option> 
						        <option value="1500">江西省</option> 
						        <option value="1600">山东省</option> 
						        <option value="1700">河南省</option> 
						        <option value="1800">湖北省</option> 
						        <option value="1900">湖南省</option> 
						        <option value="2000">广东省</option> 
						        <option value="2100">广西壮族自治区</option> 
						        <option value="2200">海南省</option> 
						        <option value="2300">四川省</option> 
						        <option value="2400">贵州省</option> 
						        <option value="2500">云南省</option> 
						        <option value="2600">西藏自治区</option> 
						        <option value="2700">陕西省</option> 
						        <option value="2800">甘肃省</option> 
						        <option value="2900">宁夏回族自治区</option> 
						        <option value="3000">青海省</option> 
						        <option value="3100">新疆维吾尔族自治区</option> 
						        <option value="3200">香港特别行政区</option> 
						        <option value="3300">澳门特别行政区</option> 
						        <option value="3400">台湾省</option> 
							</select>
							<select name="userInfo.userCity" id="selCity"> 
								<option value="0">--请选择--</option> 
							</select>
</dd>
						<dt>邮箱</dt>
						<dd onclick="javascript:info(4);" class="dd04"><p>111@111.com</p><input name="" type="text" value="111@111.com" /></dd>
					</dl>
					<dl class="right">
						<dt>性别</dt>
						<dd onclick="javascript:info(5);" class="dd05"><p>男</p>
						<select name="">
							<option>男</option>
							<option>女</option>
						</select></dd>
						<dt>体型</dt>
						<dd onclick="javascript:info(6);" class="dd06"><p>--请选择--</p>
						<select name="">
							<option value="">未填</option>
							<option value="标准">标准</option>
							<option value="匀称">匀称</option>
							<option value="丰满">丰满</option>
							<option value="性感">性感</option>
							<option value="苗条">苗条</option>
							<option value="精炼">精炼</option>
							<option value="高挑">高挑</option>
							<option value="小鸟依人">小鸟依人</option>
							<option value="较瘦">较瘦</option>
							<option value="较胖">较胖</option>
							<option value="健壮">健壮</option>
							<option value="残缺之美">残缺之美</option>
						</select></dd>
						<dt>VIP用户</dt>
						<dd onclick="javascript:info(7);" class="dd07"><p>--请选择--</p>
						<select name="">
							<option>是</option>
							<option>否</option>
						</select></dd>
						<dt>问题</dt>
						<dd onclick="javascript:info(8);" class="dd08"><p>我的名字?</p><input name="" type="text" value="我的名字?" /></dd>
					</dl>
				</form>
			</div>	
			<div  id="showdiv_6"  class="columnRight nodisplay">
				<!-- <div class="lh200 small_title">
					<div class="fleft">
						修改用户资料
					</div>
					<a class="fright"
						href="${domain }/user/id.do?uid=${userToken.user.id }">预览我的首页</a>
				</div>-->
				<div class="clear"></div>
				<div id="userInfoContainer" class="small_content small_buttom">
					<form action="${domain }/user/ajaxChangeUserPasswordApi.do"
						method="post" id="changePasswordForm">
						<table class="w410" id="topicCreaterTable">
							<s:if test="userToken.user.mail.indexOf('@')!=-1">
								<tr>
									<td align="right" class="w80 pt10" valign="top">
										昵称：
									</td>
									<td>
										${userToken.user.name }
										<a href="javascript:;" onclick="changeUserName();">[修改昵称]</a>
									</td>
								</tr>
								<tr>
									<td align="right" class="w80 pt10" valign="top">
										注册邮箱：
									</td>
									<td>
										${userToken.user.mail }
									</td>
								</tr>
								<tr>
									<td align="right" class="w80 pt10" valign="top"></td>
									<td class="alert" id="changePasswordTips">
										修改密码
									</td>
								</tr>
								<tr>
									<td align="right" class="w80 pt10" valign="top">
										旧密码：
									</td>
									<td>
										<input type="password" class="text pd05 wp95" name="oldpassword" id="oldpassword"/>
									</td>
								</tr>
								<tr>
									<td align="right" class="w80 pt10" valign="top">
										新密码：
									</td>
									<td>
										<input type="password" class="text pd05 wp95" name="newpassword" id="newpassword"/>
									</td>
								</tr>
								<tr>
									<td align="right" class="w80 pt10" valign="top">
										新密码：
									</td>
									<td>
										<input type="password" class="text pd05 wp95" name="chkpassword" id="chkpassword"/>
									</td>
								</tr>
								<tr>
									<td align="right" class="w80 pt10" valign="top"></td>
									<td>
										<input class="btn" type="submit" value=" 修改登录密码 " />
										<input class="btn" type="button" value=" 更多资料 "
											onclick='$("#moreUserInfo").dialog("open");' />
										<input class="btn" type="button" value=" 发送消息 "
											onclick='sendMsgTo(${userToken.user.id});' />
									</td>
								</tr>
							</s:if>
							<s:else>
								<tr>
									<td align="right" class="w80 pt10" valign="top">
										昵称：
									</td>
									<td>
										${userToken.user.name }
										<a href="javascript:;" onclick="alert('新浪登录用户不能修改昵称');">[修改昵称]</a>
									</td>
								</tr>
								<tr>
									<td align="right" class="w80 pt10" valign="top">
										注册标识：
									</td>
									<td>
										${userToken.user.mail }
									</td>
								</tr>
							</s:else>
						</table>
					</form>
				</div>
			</div>
			<!-- 微博 -->
			<div id="showdiv_4" class="columnRight nodisplay">
				<!--<div class="lh200 small_title">
					<div class="fleft">
						绑定新浪微博
					</div>
					<a class="fright" href="javascript:;"></a>
				</div>-->
				<div class="clear"></div>
				<div class="small_content small_buttom">
					<s:if test="#request.UserLink != null">
						<div>
							<a
								href="http://t.sina.com.cn/${requestScope.UserLink.linkField4 }"
								target="_blank"> <img border="0" id="sinaUserLogo"
									src="http://tp2.sinaimg.cn/${requestScope.UserLink.linkField4 }/50/1/1"
									align="absMiddle" /> </a>
							<a
								href="http://t.sina.com.cn/${requestScope.UserLink.linkField4 }"
								target="_blank"> ${requestScope.UserLink.linkField1 } [ <img
									border="0"
									src="http://www.sinaimg.cn/blog/developer/wiki/LOGO_16x16.png"
									align="absMiddle" /> 已绑定 ] </a>
							<a href="javascript:;"
								onclick="$('#userIcon').val($('#sinaUserLogo').attr('src'));$('#changeUserIconForm').submit();">[
								同步头像 ]</a>
							<s:if test="userToken.user.id == 7">
								<a href="${domain }/bind/sina/ajaxSyncWeiboApi.do"
									target="_blank">[ 同步新浪数据 ]</a>
							</s:if>
							<s:if test="userToken.user.mail.indexOf('@')!=-1">
								<a href="${domain }/bind/sina/index.do?opt=1"> [ 重新绑定 ] </a>
							</s:if>
						</div>
					</s:if>
					<s:else>
						<div>
							<a href="${domain }/bind/sina/index.do?opt=1"> <img
									src="http://www.sinaimg.cn/blog/developer/wiki/32.png"
									align="absMiddle" border="0" /> </a>
							<a href="${domain }/bind/sina/index.do?opt=1"> [ 现在就去绑定 ] </a>
						</div>
					</s:else>
				</div>
			</div>
			<div id="showdiv_5" class="columnRight nodisplay">
				<!-- <div class="lh200 small_title">
					<div class="fleft">
						帐户信息
					</div>
					<a class="fright" href="javascript:;"></a>
				</div>-->
				<div class="clear"></div>
				<div class="small_content small_buttom">
					<span style="float:left;margin-right:15px;">余额：${requestScope.user.userCredit.credit }</span>
					<form action="${domain }/pay/topay.do" target="_blank">
						<input class="btn" type="submit" value="充值" />
					</form>
					<div>
						<ul>
							<s:iterator value="#request.logList">
								<s:if test="type==10||type==20||type==30">
									<li>
										<s:date name="addTime" format="yyyy-MM-dd HH:mm"></s:date>
										--
										<s:if test="type==10">充值
										<font color="red">￥${cash }元 =</font>
										<font color="red">${credit }乐币</font>
										</s:if>
										<s:elseif test="type==20">消费
										<font color="red">${credit }乐币</font>
										</s:elseif>
										<s:elseif test="type==30">赚得
										<font color="red">${credit }乐币</font>
										</s:elseif>
									</li>
								</s:if>
							</s:iterator>
						</ul>
					</div>
				</div>
			</div>

			<div id="showdiv_3" class="columnRight nodisplay">
				<!-- <div class="lh200 wp100 small_title">
					<div class="fleft">
						修改头像
					</div>
					<div class="fright"></div>
				</div>-->
				<div class="small_content small_buttom">
					<form action="${domain }/user/ajaxChangeUserIconApi.do"
						method="post" id="changeUserIconForm">
						<table class="w450" id="topicCreaterTable">
							<tr>
								<td align="right" class="w60 pt10" valign="top"></td>
								<td>
									<div class="fleft"
										style="width: 50px; height: 50px; background-color: #999; margin-right: 5px; cursor: pointer;"
										onclick="uploadHead();">
										<img src="${userToken.user.icon }?_=${_ }" id="iconPreview"
											width="48" height="48"
											style="margin-top: 1px; margin-left: 1px;" />
									</div>
								</td>
							</tr>
							<tr>
								<td align="right" class="w60 pt10" valign="top"></td>
								<td class="alert" id="changeIconTips">
									修改头像，图片尺寸 48*48，尽量不要选择太大的图片
								</td>
							</tr>
							<tr>
								<td align="right" class="w60 pt10" valign="top">
									图片网址：
								</td>
								<td>
									<input type="text" value="http://" class="text pd05 wp95" name="userIcon" id="userIcon"
										onclick="___c(this);"/>
								</td>
							</tr>
							<tr>
								<td align="right" class="w60 pt10" valign="top"></td>
								<td>
									<input class="btn" type="submit" value=" 修改头像 " />
									<input class="btn" type="button" value=" 上传头像 " onclick="uploadHead();" />
									<input class="btn" type="button" value=" 上传照片 " onclick="multUpload();" />
									<input class="btn" type="button" value=" 我的照片 " onclick="getMyPics();" />
								</td>
							</tr>
							<tr>
								<td align="right" class="w60 pt10" valign="top" colspan="2">
									<div class="pd10 aRight">
										<a href="javascript:;" onclick="getRecommend();">[下一页]</a>
									</div>
									<ul id="recommendIconCon" class="wp100"></ul>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="avatarWrapper" title="上传头像"
			style="width: 700px; height: 480px" class="none"></div>
		<div id="multUploader" title="批量上传" class="none">
			<div id="uploader" style="width: 670px; height: 450px;"></div>
		</div>
		<div id="picGallery" title="相片列表" class="none"></div>
		<div id="moreUserInfo" title="更多资料" class="none">
			<form method="post" id="userMoreInfoForm" action="${domain }/user/ajaxUpdateUserInfoApi.do">
				<table id="userInfoTable">
					<tr>
						<td>
							年龄：
						</td>
						<td>
							<input type="text" name="userInfo.userAge" value="${requestScope.userInfo.userAge }" />
						</td>
					</tr>

					<tr>
						<td>
							性别：
						</td>
						<td>
							<input class="rad fleft" type="radio" name="userInfo.userSex" value="1" <s:if test="#request.userInfo.userSex==1">checked</s:if> />
							男&nbsp;&nbsp;&nbsp;
							<input class="rad" type="radio" name="userInfo.userSex" value="0" <s:if test="#request.userInfo.userSex==0">checked</s:if> />
							女
						</td>
					</tr>
					<tr>
						<td>
							省份：
						</td>
						<td>
							<select name="userInfo.userProvince" id="selProvince" onchange="getCity(this.options[this.selectedIndex].value)"> 
						        <option value="0">---请选择---</option> 
						        <option value="100">北京市</option> 
						        <option value="200">上海市</option> 
						        <option value="300">天津市</option> 
						        <option value="400">重庆市</option> 
						        <option value="500">河北省</option> 
						        <option value="600">山西省</option> 
						        <option value="700">内蒙古自治区</option> 
						        <option value="800">辽宁省</option> 
						        <option value="900">吉林省</option> 
						        <option value="1000">黑龙江省</option> 
						        <option value="1100">江苏省</option> 
						        <option value="1200">浙江省</option> 
						        <option value="1300">安徽省</option> 
						        <option value="1400">福建省</option> 
						        <option value="1500">江西省</option> 
						        <option value="1600">山东省</option> 
						        <option value="1700">河南省</option> 
						        <option value="1800">湖北省</option> 
						        <option value="1900">湖南省</option> 
						        <option value="2000">广东省</option> 
						        <option value="2100">广西壮族自治区</option> 
						        <option value="2200">海南省</option> 
						        <option value="2300">四川省</option> 
						        <option value="2400">贵州省</option> 
						        <option value="2500">云南省</option> 
						        <option value="2600">西藏自治区</option> 
						        <option value="2700">陕西省</option> 
						        <option value="2800">甘肃省</option> 
						        <option value="2900">宁夏回族自治区</option> 
						        <option value="3000">青海省</option> 
						        <option value="3100">新疆维吾尔族自治区</option> 
						        <option value="3200">香港特别行政区</option> 
						        <option value="3300">澳门特别行政区</option> 
						        <option value="3400">台湾省</option> 
							</select>
						</td>
					</tr>
					<tr>
						<td>
							市/区：
						</td>
						<td>
							<select name="userInfo.userCity" id="selCity"> 
								<option value="0">--请选择--</option> 
							</select> 
						</td>
					</tr>

					<tr>
						<td>
							学历：
						</td>
						<td>
							<select id="selDegree" name="userInfo.userDegree">
								<option value="0">
									请选择
								</option>
								<option value="2">
									初中及以下
								</option>
								<option value="3">
									高中
								</option>
								<option value="4">
									中专
								</option>
								<option value="5">
									大专
								</option>
								<option value="6">
									大学本科
								</option>
								<option value="7">
									硕士
								</option>
								<option value="8">
									博士及以上
								</option>
							</select>
						</td>
					</tr>

					<tr>
						<td>
							身高：
						</td>
						<td>
							<input type="text" name="userInfo.userHeight" value="${requestScope.userInfo.userHeight}" />
						</td>
					</tr>

					<tr>
						<td>
							体型：
						</td>
						<td>
							<select id="selWeight" name="userInfo.userWeight">
								<option value="0">
									请选择
								</option>
								<option value="1">
									偏瘦
								</option>
								<option value="2">
									标准
								</option>
								<option value="3">
									偏胖
								</option>
							</select>
						</td>
					</tr>

					<tr>
						<td>
							密码找回答案：
						</td>
						<td>
							<input type="text" name="userInfo.userAnswer" value="${requestScope.userInfo.userAnswer}" />
						</td>
					</tr>

					<tr>
						<td>&nbsp;
							
						</td>
						<td>
							<input style="width:85px;height:22px;padding-bottom:3px;" type="submit" value=" 提交修改 " />
						</td>
					</tr>

				</table>
			</form>
		</div>
		<script type="text/javascript">
$(function(){
	$("#moreUserInfo").dialog({
		width:700,height:560,position: ['',50],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).dialog('close');}
		}
	});
	$("#avatarWrapper").dialog({
		width:700,height:560,position: ['',50],modal:false,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).dialog('close');}
		}
	});
	$("#picGallery").dialog({
		width:620,height:580,position: ['',50],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).html('').dialog('close');},
			" 上传相片 ": function(){
				$(this).dialog("close");
				multUpload();
			}
		}
	});
	$("#multUploader").dialog({
		width:700,height:560,position: ['',50],modal:true,autoOpen:false,buttons:{
			" 关闭 ": function(){$(this).dialog('close');},
			" 继续上传 ": function(){multUpload();}
		}
	});
	$('#userMoreInfoForm').ajaxForm({	//修改用户资料
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				alert("修改成功");
			}else if(d['status'] == -2){
				login();
			}else alert( d['message']||"失败");
        },
        beforeSubmit:function(f){
        }
    });
	$('#changePasswordForm').ajaxForm({	//创建回复
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
	    		document.getElementById("changePasswordForm").reset();
				$("#changePasswordTips").html("修改成功");
			}else if(d['status'] == -2){
				login();
			}else $("#changePasswordTips").html( d['message']||"失败");
        },
        beforeSubmit:function(f){
        	var old = $("#oldpassword").val();
        	var newp = $("#newpassword").val();
        	var chk = $("#chkpassword").val();
        	if(old == '') {$("#changePasswordTips").html('旧密码不得为空');return false;}
        	if(newp == '') {$("#changePasswordTips").html('新密码不得为空');return false;}
        	if(chk == '') {$("#changePasswordTips").html('请再输入新密码');return false;}
        	if(chk != newp) {$("#changePasswordTips").html('两次密码不符');return false;}
        	return true;
        }
    });
	$('#changeUserIconForm').ajaxForm({	//创建回复
        dataType:  'json', 
        success:   function(d){
	    	if(d['status'] == 1){
				$("#iconPreview").attr("src",$("#userIcon").val());
	    		document.getElementById("changeUserIconForm").reset();
				$("#changeIconTips").html("修改成功");
				window.location.reload();
			}else if(d['status'] == -2){
				login();
			}else $("#changeIconTips").html( d['message']||"失败");
        },
        beforeSubmit:function(f){
        	var userIcon = $("#userIcon").val();
        	if(userIcon.length>200){alert('图片地址太长啦，最长200个字符');return false;};
        	if(userIcon == '' || userIcon=='http://' ) {$("#changeIconTips").html('图片地址不得为空');return false;}
        	return true;
        }
    });
    getRecommend();
    
    var prov = '${requestScope.userInfo.userProvince}';
    if(prov!='' && prov!='0') $('#selProvince').attr("value", prov);
    var cit = '${requestScope.userInfo.userCity}';
    if(cit!='' && cit!='0') $('#selCity').html("<option value='"+cit+"'>"+getCityText(cit)+"</option>");
    var degr = '${requestScope.userInfo.userDegree}';
    if(degr!='' && degr!='0') $('#selDegree').attr("value", degr);
    var wgt = '${requestScope.userInfo.userWeight}';
    if(wgt!='' && wgt!='0') $('#selWeight').attr("value", wgt);
});
function uploadHead(){
	$('#avatarWrapper').avatar(
		{src: "${domain}/images/swf/AvatarEditor.swf?v=1.5", expressInstall: "${domain}/images/swf/expressInstall.swf"},
		{photoUrl: "${domain}/images/default.jpg", saveUrl: "${domain}/user/ajaxUploadHeadApi.do",uid :"${userToken.user.id}"}
	).dialog('open');
}
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
function getMyPics(p){
	$.post("${domain}/user/ajaxGetUserPicsPage.do", {"p":p||1}, function(d){
		$("#picGallery").html(d).dialog("open");
	},'html');
}
//修改用户名
function changeUserName(){
	var name = window.prompt('请输入新的昵称');
	if(name != null && name != ''){
		alert(globla_loading);
		$.post("${domain}/user/ajaxChangeUserNameApi.do", {"title":name}, function(d){
			if(d['status'] == 1){
				window.setTimeout("window.location.reload();",1000);
				alert("修改成功，请等待刷新");
			}else if(d['status'] == -2){
				login();
			}else alert(d['message']||"修改失败");
		},'json');
	}
}
//推荐
var global_recommend_page = 1;
function getRecommend(){
	$.post("${domain}/user/ajaxRecommendIconPage.do", {"p":global_recommend_page}, function(d){
		global_recommend_page ++;
		$("#recommendIconCon").html(d);
	},'html');
}
var App = window.App || {};
App.swfCall = function(result) {
	var code = result['code'];
	if(code == "M00001"){
		al("出错了 "+result['data']);
	}else if(code == "A00001"){
		alert("操作成功");
		window.location.reload();
	}else{al("未知错误!");}
}

function showDIV(type){
	jQuery('[id^="showdiv_"]').hide();
	jQuery('#showdiv_'+type).show();
	jQuery('.userUl li').css('border-bottom','');
	jQuery('.userUl .li01').css('border-bottom','1px solid #E1E1E1');
	jQuery('.userUl .li0'+type).css('border-bottom','1px solid #FFF');
}

function info(n){
	jQuery('[class^="dd0"]').removeClass("onclick");
	jQuery('#showdiv_2 form dl .dd0'+n).addClass("onclick");
	jQuery('#showdiv_2 form dl .dd0'+n+' p').hide();
	jQuery('#showdiv_2 form dl .dd0'+n+' input').show();
	jQuery('#showdiv_2 form dl .dd0'+n+' select').show();
}

jQuery(document).ready(function(){
	jQuery('#onClick').mousemove(function(){
	jQuery('.formBox .expression').show();});
	jQuery('#onClick').mouseout(function(){
	jQuery('.formBox .expression').hide()});

	jQuery('.topTitle li:eq(1)').click(function(){
	jQuery(this).addClass("on");
	jQuery('.topTitle li:eq(0)').removeClass("on");
	jQuery('.box01').hide();
	jQuery('.box02').show();});
	jQuery('.topTitle li:eq(0)').click(function(){
	jQuery(this).addClass("on");
	jQuery('.topTitle li:eq(1)').removeClass("on");
	jQuery('.box02').hide();
	jQuery('.box01').show();});
	
	jQuery('#showdiv_2 form dl dd input').click(function(){
	jQuery(this).value="";
	jQuery('#showdiv_2 form dl dd').addClass("onclick");
	});

	jQuery('#showdiv_2 form dl dd input').blur(function(){
		jQuery('#showdiv_2 form dl dd').removeClass("onclick");
	});
	
	jQuery('#showdiv_2 form dl dd select').blur(function(){
		jQuery('#showdiv_2 form dl dd').removeClass("onclick");
	});
	
});

</script>
<!-- END for 内容 -->
</body>
</html>