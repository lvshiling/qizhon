package com.navigation.action.rank;

import java.util.List;

import javax.annotation.Resource;

import com.navigation.action.BaseAction;
import com.navigation.pojo.UserCredit;
import com.navigation.service.UserCreditService;

public class RankAction extends BaseAction {
	
	private static final long serialVersionUID = 8945057150160651033L;
	
	@Resource
	private UserCreditService userCreditService;
	
	public String rank(){
		
		// 获取排行榜
		List<UserCredit> starList = userCreditService.getStarRankList(10);
		List<UserCredit> richList = userCreditService.getRichRankList(10);
		List<UserCredit> popList = userCreditService.getPopRankList(10);
		this.getRequest().setAttribute("starList", starList);
		this.getRequest().setAttribute("richList", richList);
		this.getRequest().setAttribute("popList",popList);
		
		return "rank";
	}
	
	
	

}
