/**
 * 
 */
package com.navigation.action.credit;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipayService;
import com.navigation.action.BaseAction;
import com.navigation.exception.DePiaoException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.UserCreditLog;
import com.navigation.security.SessionUtil;
import com.navigation.service.PayService;
import com.navigation.utils.CreditUtils;

/**
 * @author wanghui2
 * 
 * Aug 16, 2011 10:56:57 AM
 */
public class PayAction extends BaseAction {

	/**
	 * 支付相关
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	public PayService payService;
	public Integer amount;

	/**
	 * 充值
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String pay() throws SessionException {
		Integer userId = SessionUtil.getLogonUID();
		try {
			int credit = CreditUtils.rmb2lebi(amount);
			if (amount == null || amount == 0)
				throw new Exception("金额不得为空");
			UserCreditLog log = this.payService.createPay(userId, credit, amount);
			// 取相关信息
			String subject = "会员订单支付";
			String body = "订单备注";
			String out_trade_no = log.getId().toString(); // 订单ID
			String total_fee = log.getCash().toString(); // 总金额
			String trade_link = AlipayConfig.show_url; // 查看链接地址
			String strUrl = AlipayService.CreateUrl(AlipayConfig.partnerID, AlipayConfig.sellerEmail, AlipayConfig.return_url,
					AlipayConfig.notify_url, trade_link, out_trade_no, subject, body, total_fee, "directPay", "", "", "", "", "", "", "",
					"", AlipayConfig.CharSet, AlipayConfig.key, AlipayConfig.sign_type);
			this.getRequest().setAttribute("strUrl", strUrl);
			try {
				this.getResponse().sendRedirect(strUrl);
			} catch (Exception e) {
			}
		} catch (Exception e) {
			e.printStackTrace();
			pageFlag = true;
			_ = e.getMessage();
		}
		return "pay";
	}

	public String topay() throws SessionException {
		if (!SessionUtil.isLogon())
			throw new SessionException("ex.no_logon");
		int exchangeRate = CreditUtils.getRmbLebiExchangeRate();
		this.getRequest().setAttribute("exchangeRate", exchangeRate);
		return "topay";
	}

	/**
	 * 支付宝返回处理 页面通知
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String ali() {
		try {
			boolean result = this.getResultFromAlipay(this.getRequest());
			if (!result)
				throw new DePiaoException("支付出错了");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			pageFlag = true;
			_ = e.getMessage();
		}
		return "ali";
	}

	/**
	 * 服务器通知接口 alipay
	 * 
	 * @return
	 */
	public String aliNotify() {
		_ = "success";
		try {
			boolean result = this.getResultFromAlipay(this.getRequest());
			if (!result)
				throw new DePiaoException("支付出错了");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			pageFlag = true;
			_ = e.getMessage();
		}
		return "aliNotify";
	}

	@SuppressWarnings("unchecked")
	private boolean getResultFromAlipay(HttpServletRequest request) throws UnsupportedEncodingException {
		String key = AlipayConfig.key;
		Map params = new HashMap();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
			params.put(name, valueStr);
		}

		String mysign = AlipayNotify.GetMysign(params, key);
		String responseTxt = AlipayNotify.Verify(request.getParameter("notify_id"));
		String sign = request.getParameter("sign");
		String trade_no = request.getParameter("trade_no"); // 支付宝交易号
		String order_no = request.getParameter("out_trade_no"); // 获取订单号
		String total_fee = request.getParameter("total_fee"); // 获取总金额
		String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"), "UTF-8");// 商品名称、订单名称
		String body = "";// 商品描述、订单备注、描述
		if (request.getParameter("body") != null) {
			body = new String(request.getParameter("body").getBytes("ISO-8859-1"), "UTF-8");
		}
		String buyer_email = request.getParameter("buyer_email"); // 买家支付宝账号
		String trade_status = request.getParameter("trade_status"); // 交易状态
		UserCreditLog log = this.payService.getPayLog(Integer.parseInt(order_no));
		int sOld_trade_status = log.getState(); // 获取商户数据库中查询得到该笔交易当前的交易状态
		boolean verifyStatus = false;
		// System.out.println("11111_"+sOld_trade_status);

		if (mysign.equals(sign) || responseTxt.equals("true")) {
			// System.out.println("22222_"+sOld_trade_status);
			request.setAttribute("buyer_email", buyer_email);
			request.setAttribute("out_trade_no", order_no);
			if (trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")) {
				// System.out.println("333333_"+sOld_trade_status);
				if (sOld_trade_status < 1) {
					this.payService.setPaySuccess(log);
					// System.out.println("444444_"+sOld_trade_status);
				}
			}
			verifyStatus = true;
		} else {
			verifyStatus = false;
		}
		return verifyStatus;
	}

}
