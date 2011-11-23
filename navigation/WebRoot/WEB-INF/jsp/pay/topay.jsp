<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
#paymentMain{text-align:center; }
.paymentBox{width: 540px; margin:auto;}
.pbtb {margin-left:40px;}
.pbtb tr{height:32px; line-height:32px;}
.pbtb td{font-size:12px; font-family:"Microsoft Yahei",Tahoma,Simsun,Arial,Helvetica,sans-serif;}
</style>
</head>
<body>
<!-- 在线支付 -->
<!-- 内容 -->
<div id="content" class="clearfix" style="padding-top:100px;">
<form name="payform" action="${domain }/pay/pay.do" method="post">
<div id="paymentMain">
<div class="paymentBox">
	<div class="pbln1"><img src="${domain }/images/commons/paybar_tpl.jpg" /><span class="pbmd"><label><font color="#5b6881">当前支付方式</font>：支付宝</label></span><img src="${domain }/images/commons/paybar_tpr.jpg" /></div>
		<div class="pbln2">
			<table class="pbtb">
				<tr>
					<td class="tright">充值到帐号：</td>
					<td><s:if test="userToken.user != null">${userToken.user.mail}</s:if><s:else>请先<a href="javascript:login();void(0);">登录</a></s:else></td>
				</tr>
				<tr>
					<td class="tright">请选择充值金额：</td>
					<td><select style="width:150px;" id="amount" name="amount" onchange="selAmount(this.value);"><option value="5">5元</option><option value="10">10元</option><option value="20">20元</option><option value="30">30元</option><option selected="selected" value="50">50元</option><option value="100">100元</option>
							<option value="200">200元</option><option value="300">300元</option><option value="500">500元</option><option value="1000">1000元</option><option value="2000">2000元</option><option value="3000">3000元</option><option value="5000">5000元</option><option value="10000">10000元</option>
								<option value="50000">50000元</option></select></td>
				</tr>
				<tr>
					<td class="tright">可购买乐币：</td>
					<td><input id="payGold" disabled="disabled" type="text" value="5000" /></td>
				</tr>
				<tr>
					<td class="tright">&nbsp;</td>
					<td><font color="#ff0000"><strong>提示：人民币和乐币兑换比例为1 : 100</strong></font></td>
				</tr>
				<tr>
					<td class="tright">&nbsp;</td>
					<td><input type="submit" style="width:58px;height:25px;" value="下一步" /></td>
				</tr>
			</table>
		</div>
		<div class="pbln3"><img src="${domain }/images/commons/paybar_bt.jpg" /></div>
</div>
</div>
</form>
</div>
<script type="text/javascript">
	function selAmount(amt){
		var rate = ${requestScope.exchangeRate};
		var rs = amt*rate;
		document.getElementById("payGold").value = rs;
	}
</script>
<!-- END for 内容 -->
<!-- END for 在线支付 -->
</body>
</html>
