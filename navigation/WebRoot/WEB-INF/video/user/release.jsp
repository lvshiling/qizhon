<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="${domain }/js/video/calendar.js"></script>
<title> - ${requestScope.user.name}</title>
<style type="text/css">
#release {
	margin: 20px auto 20px;
	width: 988px;
	font-family: "Microsoft Yahei";
}
#release .main {
	width: 760px;
	float: right;
}
#release .main h1 {
	margin-bottom: 5px;
	padding: 5px 10px;
	font-size: 16px;
	color: #666;
	border-bottom: 1px solid #EAEAEA;
	border-left: 5px solid #FF9000;
}
#release .main .comBox {
	display: none;
}
#release .main .comBox table {
	margin-bottom: 20px;
	width: 100%;
	text-align:left;
}
#release .main .comBox .list th {
	padding: 15px;
	border-bottom: 1px dashed #EAEAEA;
}
#release .main .comBox .list td {
	padding: 10px;
	border-bottom: 1px dashed #EAEAEA;
}
#release .main .comBox .list tr:hover td {
	background-color: #FFFEED;
}
#release .main .comBox .list td select {
    border: 1px solid #D2D2D2;
    color: #666;
    width: 70px;
    font-family: Arial,Helvetica,sans-serif;
    padding: 1px;
    background: url(${domain }/images/video/release/form-input.png) no-repeat left top;
}
#release .main .showdiv_1 {
	display: block;
}

#release .main .showdiv_1 h1 {
	margin-bottom: 30px;
}
#release .main .showdiv_1 .title {
	margin-bottom: 30px;
}
#release .main .showdiv_1 table {
	margin: 0 0 20px 0;
}
#release .main .showdiv_1 th {
	padding: 5px;
	vertical-align: top;
}
#release .main .showdiv_1 td {
	padding: 5px;
}
#release .main .showdiv_1 td input,
#release .main .showdiv_1 td textarea,
#release .main .showdiv_1 td select {
    border: 1px solid #D2D2D2;
    color: #666;
    width: 500px;
    font-family: Arial,Helvetica,sans-serif;
    padding: 4px;
    background: url(${domain }/images/video/release/form-input.png) no-repeat left top;
}

#release .main .showdiv_1 td .s_time,
#release .main .showdiv_1 td .e_time {
	padding: 0 0 0 4px;
	width: 180px;
	height: 28px;
	line-height: 28px;
	border: none;
	cursor:pointer;
	background: url(${domain }/images/video/release/form-time.gif) no-repeat left top;
}
#release .main .showdiv_1 td select {
    width: 179px;
}
#release .main .showdiv_1 .submit {
	margin-left: 82px;
}
#release .main .showdiv_1 .submit li {
	margin-right: 15px;
	float: left;
}
#release .main .showdiv_1 .submit li button {
	border: none;
	width: 95px;
	font-size: 14px;
	cursor: pointer;
	line-height: 30px;
	background-color: #EFEFEF;
	border-radius: 2px;
}

#release .main .showdiv_1 .submit .subm button {
	color: #FFF;
	background-color: #FF9000;
}









#release .sideBar {
	padding: 10px 0 300px 0;
	width: 200px;
	float: left;
	border: 1px solid #EAEAEA;
}
#release .sideBar .s_top {
	margin-bottom: 10px;
	text-align: center;
}
#release .sideBar .s_top p {
	margin: 0 0 10px 10px;
	font-size: 14px;
	line-height:1.6;
	text-align: left;
	font-weight: bold;
}
#release .sideBar .s_top p strong {
	margin: 0 5px 0 35px;
	font-size: 18px;
	color: #FF9000;
    font-weight: bold;
}
#release .sideBar .s_top p span {
	font-size: 12px;
    font-weight: normal;
}
#release .sideBar .s_top a {
	display: block;
	line-height:1.7;
	color: #FFF;
	font-size: 18px;
	font-weight: bold;
	background-color: #FF9000; 
}
#release .sideBar .s_top a:hover {
 	text-decoration: none;
	background-color: #ffba00; 
}
#release .sideBar ul {
	margin: 0 10px 0 10px;
}
#release .sideBar ul li {
	border-bottom: 1px solid #EAEAEA;
}
#release .sideBar ul li a {
	padding: 7px 10px;
	font-size: 14px;
	display: block;
	color: #424542;
	text-align: left;
}
#release .sideBar ul li a:hover {
 	text-decoration: none;
	background-color: #EFEFEF;
}
#release .sideBar ul li a:hover {
 	text-decoration: none;
	background-color: #EFEFEF;
}

#release .main .page li {margin-left: 5px;float:right;}
#release .main .page li a {padding: 2px 6px;text-decoration: none;}
#release .main .page li a.on,#release .main .page li a:hover {color:#FFF;background-color:#FF9000;}
</style>
<script type="text/javascript">
function showdiv(type){
	$('.comBox').hide();
	$('.showdiv_'+type).show();
	$('.tab li a').removeClass("on");
	$('.tab li .li0'+type).addClass("on");
}
</script>
</head>
<body>
<!-- 内容 -->
<div id="release" class="clearfix">
	<div class="main">
		<form action="" method="get">
			<div class="comBox showdiv_1 clearfix">
			<h1>发布任务</h1>
			<p class="title">为了您的快速交易,请尽量填写详细</p>
				<table cellspacing="0" cellpadding="0" summary="">
					<col width="10%" />
					<col width="90%" />
					<tr>
						<th>时 间</th>
						<td><input class="s_time" name="" type="text" onclick="SelectDate(this,'yyyy-MM-dd  hh:mm:ss',0,-1)" readonly="true" value="请选择开始时间" /> - <input class="e_time" name="" type="text" onclick="SelectDate(this,'yyyy-MM-dd  hh:mm:ss',0,-1)" readonly="true" value="请选择结束时间" />
						</td>
					</tr>
					<tr>
						<th>价 格</th>
						<td><select name="">
							<option>￥50</option>
							<option>￥100</option>
							<option>￥150</option>
							<option>￥200</option>
							<option>￥300</option>
							<option>￥400</option>
							<option>￥500</option>
							<option>￥600</option>
							<option>￥700</option>
							<option>￥800</option>
							<option>￥900</option>
							<option>￥1000</option>
							<option>￥2000</option>
							<option>￥3000</option>
							<option>￥4000</option>
							<option>￥5000</option>
						</select> 人民币</td>
					</tr>
					<tr>
						<th>标 题</th>
						<td><input name="" type="text" /></td>
					</tr>
					<tr>
						<th>内 容</th>
						<td><textarea name="" cols="" rows="5"></textarea></td>
					</tr>
				</table>
				<ul class="submit">
					<li class="subm"><button>发 布</button></li>
					<li><button>取 消</button></li>
				</ul>
			</div>
			<div class="comBox showdiv_2 clearfix">
			<h1>个人发布列表</h1>
				<table cellspacing="0" cellpadding="0" summary="" class="list">
					<col width="29%" />
					<col width="30%" />
					<col width="17%" />
					<col width="12%" />
					<col width="12%" />
					<tr>
						<th>时 间</th>
						<th>任务详情</th>
						<th>发布人</th>
						<th>价 格</th>
						<th>状 态</th>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
				</table>
				<ul class="page clearfix">
						<li><a href="#">下一页</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#" class="on">1</a></li>		
				</ul>
			</div>
			<div class="comBox showdiv_3 clearfix">
			<h1>接收任务</h1>
				<table cellspacing="0" cellpadding="0" summary="" class="list">
					<col width="29%" />
					<col width="30%" />
					<col width="17%" />
					<col width="12%" />
					<col width="12%" />
					<tr>
						<th>时 间</th>
						<th>任务详情</th>
						<th>发布人</th>
						<th>价 格</th>
						<th>状 态</th>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
					<tr>
						<td>开始时间：2011-11-16 12:00:00<br />
							 结束时间：2011-11-18 15:00:00</td>
						<td><a href="#">美女陪玩征途二</a></td>
						<td><a href="#">~/妮妮*</a> <a href="#">(编 辑)</a></td>
						<td>￥500.00</td>
						<td><select name="">
							<option>进行中..</option>
							<option>完成</option>
						</select></td>
					</tr>
				</table>
				<ul class="page clearfix">
						<li><a href="#">下一页</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#" class="on">1</a></li>		
				</ul>
			</div>
			</form>
	</div>
	<div class="sideBar">
		<div class="s_top">
			<p>当前共有<br /><strong>65236</strong><span>条任务</span></p>
			<a href="#">任务大厅</a>
		</div>
		<ul>
			<li><a onclick="javascript:showdiv(1);" class="li01" href="#">发布任务</a></li>
			<li><a onclick="javascript:showdiv(2);" class="li02" href="#">个人发布列表</a></li>
			<li><a onclick="javascript:showdiv(3);" class="li03" href="#">个人接收任务</a></li>	
		</ul>
	</div>
</div>

<!-- END for 内容 -->
</body>
</html>