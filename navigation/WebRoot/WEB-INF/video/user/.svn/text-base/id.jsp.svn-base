<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>趣乐--个人信息</title>
		<link href="${static}/styles/video/userinfo.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${domain }/js/video/userinfo.js"></script>
	</head>
	<body>
		<div id="pb" class="layout layout-record fix js_mine_field">
			<div class="column1">
				<div class="idx-synopsis">
					<h1>
						${requestScope.user.name}
					</h1>
					<div class="pt fix">
						<p class="pic">
							<a href="${domain}/${requestScope.user.room.roomNo }"><img src="${requestScope.user.icon1}" onerror="this.src='${requestScope.user.icon}'" /></a>
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
							<span class="actBtn" style="cursor:pointer;">
							<a href="${domain}/${requestScope.user.room.roomNo }"><img src="${static}/styles/images/room.png" /></a>
							</span>
						</p>
						<p id="followStatus" class="actBtn" style="cursor:pointer;">
							<span class="actBtn actBtn-skin-green">
							<a href="javascript:;" onclick="addAttention();"><img src="${static}/styles/images/guanzhu.png"/></a>
							</span>
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
				</div>

			</div>
			<div class="column2">
				<div class="record-mod record-info">
					<h2>
						个人信息
					</h2>
					<div class="ilist">
						<dl>
							<dt>
								年龄
							</dt>
							<dd>
								<p>
								    <s:if test="#request.userInfo.userAge==null||#request.userInfo.userAge==0">
										--
									</s:if>
									<s:else>
										${requestScope.userInfo.userAge }
									</s:else>
									
								</p>
							</dd>
						</dl>
						<dl>
							<dt>
								性别
							</dt>
							<dd>
								<p>
									<s:if test="#request.userInfo.userSex==1">男士</s:if>
									<s:elseif test="#request.userInfo.userSex==0">女士</s:elseif>
									<s:else>--</s:else>
								</p>
							</dd>
						</dl>
						<dl>
							<dt>
								来自
							</dt>
							<dd>
								<p>
									<s:if test="#request.userInfo.userCity==null||#request.userInfo.userCity==''||#request.userInfo.userCity=='0'">
										--
									</s:if>
									<s:else>
										<script>document.write(getProvAndCity(${requestScope.userInfo.userCity}));</script>
									</s:else>
								</p>
							</dd>
						</dl>
						<dl>
							<dt>
								邮箱
							</dt>
							<dd>
								<p>
									<s:if test="#request.user.mail==null||#request.user.mail==''">
										--
									</s:if>
									<s:else>
										${requestScope.user.mail }
									</s:else>	
								</p>
							</dd>
						</dl>
					</div>
					<!--/.ilist-->
				</div>
				<!--/.record-info-->
			</div>
			<div class="column3">

				<div class="record-mod record-fav">
					<h2>
						&nbsp;
					</h2>
					<div class="ilist" style="border-right:0px;">
						<dl>
							<dt>
								身高
							</dt>
							<dd>
								<p>
									<s:if test="#request.userInfo.userHeight==null||#request.userInfo.userHeight==0||#request.userInfo.userHeight==''">
										--
									</s:if>
									<s:else>
										${requestScope.userInfo.userHeight }cm
									</s:else>
								</p>
							</dd>
						</dl>
						<dl>
							<dt>
								体型
							</dt>
							<dd>
								<p>
									<s:if test="#request.userInfo.userWeight==1">
										偏瘦
									</s:if>
									<s:elseif test="#request.userInfo.userWeight==2">
										标准
									</s:elseif>
									<s:elseif test="#request.userInfo.userWeight==3">
										偏胖
									</s:elseif>
									<s:else>
										--
									</s:else>
								</p>
							</dd>
						</dl>
						<dl>
							<dt>
								VIP用户
							</dt>
							<dd>
								<p>
									<s:if test="#request.user.isVip==1">是</s:if>
									<s:else>否</s:else>
								</p>
							</dd>
						</dl>
						<dl>
							<dt>
								问题
							</dt>
							<dd>
								<p>
									<s:if test="#request.userInfo.userAnswer==null||#request.userInfo.userAnswer==''">
										暂无...
									</s:if>
									<s:else>
									    ${requestScope.userInfo.userAnswer }									
									</s:else>
								</p>
							</dd>
						</dl>
					</div>
					<!--/.ilist-->
				</div>
				<!--/.record-info-->

			</div>
		</div>
		
<script>

function addAttention(){
	$.post("${domain}/user/ajaxAddAttentionApi.do?", {"target":"${requestScope.user.id }"}, function(d){
		if(d['status'] == 1){
			alert('关注成功！');
			window.location.reload();
		}else if(d['status'] == -2){
			login();
		}else alert(d['message']||"关注失败");
	},'json');
}		
</script>
</body>
</html>
