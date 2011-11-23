package com.navigation.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户账户等级工具
 * 
 * @author zhuchuanyong
 */
public class CreditUtils {

	/**
	 * 礼物类型：玫瑰
	 */
	public static final String GIFT_TYPE_ROSE = "rose";
	/**
	 * 礼物类型：猪头
	 */
	public static final String GIFT_TYPE_PIG = "pig";

	/**
	 * 存储礼物对应的乐币价值
	 */
	public static Map<String, Integer> GIFT_STORE = new HashMap<String, Integer>();
	static {
		GIFT_STORE.put(GIFT_TYPE_ROSE, 5);
		GIFT_STORE.put(GIFT_TYPE_PIG, 10);
	}

	/**
	 * 计算明星等级
	 * 
	 * @param credit
	 * @return
	 */
	public static int starGrade(int credit) {
		if (credit < 101) {
			return credit / 10;
		} else if (credit < 3001) {
			return credit / 100 + 10;
		} else if (credit < 13001) {
			return credit / 1000 + 37;
		} else {
			int result = credit / 5000 + 48;
			return result > 60 ? 60 : result;
		}
	}

	/**
	 * 计算富豪等级
	 * 
	 * @param credit
	 * @return
	 */
	public static int richGrade(int credit) {
		if (credit < 101) {
			return credit / 10;
		} else if (credit < 3001) {
			return credit / 100 + 10;
		} else if (credit < 13001) {
			return credit / 1000 + 37;
		} else {
			int result = credit / 5000 + 48;
			return result > 60 ? 60 : result;
		}
	}
	
	/**
	 * 主播从礼物中获得的提成
	 * 
	 * @param credit
	 * @return
	 */
	public static int mcGainFromGift(int credit) {
		return (int) credit / 2;
	}

	/**
	 * 获取礼物的乐币价值
	 * 
	 * @param giftType
	 * @return
	 */
	public static int giftValue(String giftType) {
		return GIFT_STORE.get(giftType);
	}

	public static void updateGift(String type, Integer value) {
		addGift(type, value);
	}

	public static void addGift(String type, Integer value) {
		GIFT_STORE.put(type, value);
	}

	/**
	 * 获得人民币乐币汇率
	 * 
	 * @return
	 */
	public static int getRmbLebiExchangeRate() {
		return Constants.getInstance().rmb_lebi_exchange_rate;
	}

	/**
	 * 人民币转化成乐币
	 * 
	 * @param cash
	 * @return
	 */
	public static int rmb2lebi(int rmb) {
		int rate = Constants.getInstance().rmb_lebi_exchange_rate;
		int credit = rmb * rate;
		return credit;
	}
}
