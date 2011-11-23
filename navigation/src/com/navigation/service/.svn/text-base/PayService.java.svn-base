/**
 * 
 */
package com.navigation.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.navigation.pojo.UserCredit;
import com.navigation.pojo.UserCreditLog;

/**
 * @author wanghui2
 *
 * Aug 16, 2011 11:17:10 AM
 */
public interface PayService {

	/**
	 * 创建充值
	 * @param userId
	 * @param amount
	 * @return
	 */
	public UserCreditLog createPay(Integer userId, Integer credit, Integer cash);

	/**
	 * 取得支付记录
	 * @param parseInt
	 * @return
	 */
	public UserCreditLog getPayLog(int parseInt);

	/**
	 * 支付成功
	 * @param log
	 */
	@Transactional
	public void setPaySuccess(UserCreditLog log);

	/**
	 * 取得用户帐户 信息
	 * @param userId
	 * @return
	 */
	public UserCredit getUserCredit(Integer userId);
	
	/**
	 * 加减余额（不包括充值）
	 * @param userId
	 * @param creditAmount
	 * @param add
	 */
	public UserCredit useCredit(Integer userId, Integer creditAmount, Boolean add);
	
	/**
	 * 返回帐户变更记录
	 * @param userId
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public List<UserCreditLog> getUserPayLog(Integer userId,int p,int pageSize);
	
	/**
	 * 赠送礼物余额操作
	 * @param from
	 * @param to
	 * @param creditAmount
	 * @return
	 */
	@Transactional
	public UserCredit sendGift(Integer from, Integer to, Integer creditAmount);
}
