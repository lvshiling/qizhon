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
	 * 礼物类型：花束
	 */
	public static final String GIFT_TYPE_BOUQUET = "bouquet";
	/**
	 * 礼物类型：棒棒糖
	 */
	public static final String GIFT_TYPE_LOLLIPOP = "lollipop";
	/**
	 * 礼物类型：蓝玫瑰
	 */
	public static final String GIFT_TYPE_BLUEROSE2 = "blueRose2";
	/**
	 * 礼物类型：搓板
	 */
	public static final String GIFT_TYPE_WASHBOARD = "washboard";
	/**
	 * 礼物类型：香烟
	 */
	public static final String GIFT_TYPE_CIGARETTE = "cigarette";
	/**
	 * 礼物类型：么么
	 */
	public static final String GIFT_TYPE_KISS = "kiss";
	/**
	 * 礼物类型：喉宝
	 */
	public static final String GIFT_TYPE_LOZENGE = "lozenge";
	/**
	 * 礼物类型：啤酒
	 */
	public static final String GIFT_TYPE_WINE = "wine";
	/**
	 * 礼物类型：眼霜
	 */
	public static final String GIFT_TYPE_EYECREAM = "eyeCream";
	/**
	 * 礼物类型：奶牛
	 */
	public static final String GIFT_TYPE_COW = "cow";
	/**
	 * 礼物类型：爱心
	 */
	public static final String GIFT_TYPE_ROSE99 = "rose99";

	/**
	 * 存储礼物对应的乐币价值
	 */
	public static Map<String, Integer> GIFT_STORE = new HashMap<String, Integer>();
	static {
		GIFT_STORE.put(GIFT_TYPE_ROSE, 5);
		GIFT_STORE.put(GIFT_TYPE_PIG, 10);
		GIFT_STORE.put(GIFT_TYPE_BOUQUET, 10);
		GIFT_STORE.put(GIFT_TYPE_LOLLIPOP, 20);
		GIFT_STORE.put(GIFT_TYPE_BLUEROSE2, 30);
		GIFT_STORE.put(GIFT_TYPE_WASHBOARD, 30);
		GIFT_STORE.put(GIFT_TYPE_CIGARETTE, 40);
		GIFT_STORE.put(GIFT_TYPE_KISS, 50);
		GIFT_STORE.put(GIFT_TYPE_LOZENGE, 50);
		GIFT_STORE.put(GIFT_TYPE_WINE, 60);
		GIFT_STORE.put(GIFT_TYPE_EYECREAM, 60);
		GIFT_STORE.put(GIFT_TYPE_COW, 80);
		GIFT_STORE.put(GIFT_TYPE_ROSE99, 100);
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
