/**
 * 
 */
package com.navigation.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.navigation.dao.UserCreditDao;
import com.navigation.dao.UserCreditLogDao;
import com.navigation.dao.UserDao;
import com.navigation.domain.Constant;
import com.navigation.exception.ServiceException;
import com.navigation.pojo.User;
import com.navigation.pojo.UserCredit;
import com.navigation.pojo.UserCreditLog;
import com.navigation.service.PayService;
import com.navigation.utils.CreditUtils;

/**
 * @author wanghui2
 * 
 * Aug 16, 2011 11:17:39 AM
 */
public class PayServiceImpl implements PayService {
	@Resource
	public UserCreditDao userCreditDao;
	@Resource
	public UserCreditLogDao userCreditLogDao;
	@Resource
	public UserDao userDao;

	public UserCreditLog createPay(Integer userId, Integer credit, Integer cash) {
		return userCreditLogDao.createLog(userId, credit, cash);
	}

	public UserCreditLog getPayLog(int parseInt) {
		return this.userCreditLogDao.get(parseInt);
	}

	public void setPaySuccess(UserCreditLog log) {
		// 1 设置成功
		Integer userId = log.getUserId();
		User user = this.userDao.get(userId);
		if (user == null)
			throw new ServiceException("用户不存在");
		log.setState(1);
		this.userCreditLogDao.update(log);

		// 2 更改余额
		UserCredit credit = this.userCreditDao.getCredit(userId);
		credit.setCredit(credit.getCredit() + log.getCredit());
		this.userCreditDao.update(credit);

		// 3 写日志
		UserCreditLog newLog = new UserCreditLog();
		newLog.setUserId(userId);
		newLog.setCredit(log.getCredit());
		newLog.setAddTime(new Date());
		newLog.setRef(log.getId().toString());
		newLog.setType(Constant.CREDIT_TYPE_PAY_COMPLETE);
		newLog.setScore(0);
		newLog.setState(0);
		newLog.setCash(log.getCash());
		this.userCreditLogDao.save(newLog);
	}

	public UserCredit getUserCredit(Integer userId) {
		return this.userCreditDao.getCredit(userId);
	}

	public UserCredit sendGift(Integer from, Integer to, Integer creditAmount) {
		if(from.equals(to)) throw new ServiceException("不能送礼物给自己");
		UserCredit uc = this.useCredit(from, creditAmount, false); // 送礼物的人减少余额
		this.useCredit(to, CreditUtils.mcGainFromGift(creditAmount), true); // 主播增加余额
		return uc;
	}

	public UserCredit useCredit(Integer userId, Integer creditAmount, Boolean add) {
		UserCredit userCredit = this.getUserCredit(userId);
		if (userCredit == null)
			throw new ServiceException("账户不存在，请重新注册");

		Integer creditType = null;
		creditAmount = Math.abs(creditAmount);
		if (add) {// 加余额
			userCredit.setCredit(userCredit.getCredit() + creditAmount);
			userCredit.setEarnCredit(userCredit.getEarnCredit() + creditAmount);
			userCredit.setStarGrade(CreditUtils.starGrade(userCredit.getEarnCredit()));
			creditType = Constant.CREDIT_TYPE_EARN;
		} else {// 减余额
			if (creditAmount > userCredit.getCredit())
				throw new ServiceException("余额不足");
			userCredit.setCredit(userCredit.getCredit() - creditAmount);
			userCredit.setSpendCredit(userCredit.getSpendCredit() + creditAmount);
			userCredit.setRichGrade(CreditUtils.richGrade(userCredit.getSpendCredit()));
			creditType = Constant.CREDIT_TYPE_CUNSUME;
		}
		this.userCreditDao.update(userCredit);

		// 记日志
		UserCreditLog log = new UserCreditLog();
		log.setUserId(userId);
		log.setCredit(creditAmount);
		log.setScore(0);
		log.setAddTime(new Date());
		log.setState(0);
		log.setType(creditType);
		this.userCreditLogDao.save(log);

		return userCredit;
	}

	public List<UserCreditLog> getUserPayLog(Integer userId, int p, int pageSize) {
		return this.userCreditLogDao.getUserPayLog(userId, p, pageSize);
	}

}
