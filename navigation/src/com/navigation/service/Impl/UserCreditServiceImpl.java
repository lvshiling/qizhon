package com.navigation.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import com.navigation.dao.UserCreditDao;
import com.navigation.pojo.UserCredit;
import com.navigation.service.UserCreditService;

public class UserCreditServiceImpl implements UserCreditService {

	@Resource
	public UserCreditDao userCreditDao;
	
	@Override
	public List<UserCredit> getRichRankList(int limit) {
		return userCreditDao.getUserCreditList(limit, UserCredit.PROP_RICH_GRADE);
	}

	@Override
	public List<UserCredit> getStarRankList(int limit) {
		return userCreditDao.getUserCreditList(limit, UserCredit.PROP_STAR_GRADE);
	}

	@Override
	public List<UserCredit> getPopRankList(int limit) {
		return userCreditDao.getUserCreditList(limit, UserCredit.PROP_VISITS);
	}

}
