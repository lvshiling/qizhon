/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) Constant.java 1.1 2008-10-31
 */
package com.navigation.domain;

import org.springframework.stereotype.Component;

/**
 * 包含系统公用常量的实用工具类。.
 * 
 */
@Component
public class Constant {
	/** 正常标志 */
	public final static int NOMAL_STATE = 0;
	/** 贴子状态 */
	public final static int NOMAL_HIDDEN = 1;
	public final static int NOMAL_STATE_FROM_SINA = 2;
	/** 删除标志 */
	public final static int DELETE_STATE = -1;

	/** 贴子分类 状态 **/
	public static final int TOPIC_SORT_STATE_DEFAULT = 0;
	public static final int TOPIC_SORT_STATE_HIDDEN = 1;
	public static final int TOPIC_SORT_STATE_DELETE = 99;

	/** 贴子分类 发表权限限制 */
	public final static int TOPIC_SORT_DEGREE_EVERYBODY = 0;
	public final static int TOPIC_SORT_DEGREE_MANAGER_ONLY = 1;

	/** 指示页面传递上来的用户加密ID的key。 */
	public static final String UID = "uid";

	/** 指示用户身份信息的session key。 */
	public static final String USER_TOKEN_SESSION = "userToken";

	/** 提醒标志 */
	public static final int NOTICE_READED = 0;

	/** 提醒种类 */
	public static final int NOTICE_TYPE_EMAIL = 0; //邮件提醒
	public static final int NOTICE_TYPE_TOPIC = 1; //帖子提醒
	public static final int NOTICE_TYPE_MSG = 2; //信息提醒

	public static final String sinaAdminUserId = "2081411633"; //新浪绑定系统用户ID

	/** 绑定站外通行证 类型 */
	public static final int LINKTYPE_BIND_SINA = 0; //新浪微博
	public static final int LINKTYPE_BIND_MAIL = 1; //绑定邮箱
	public static final int LINKTYPE_BIND_GIANT = 2;//绑定内网域帐户 SSO
	public static final int LINKTYPE_BIND_QQWEIBO = 3; //腾讯微博
	public static final int LINKTYPE_BIND_163WEIBO = 4; //网易微博

	/** 用户动态：个性签名 */
	public static final int USER_NEWS_TYPE_MSG = 1;
	/** 用户动态：转发和评论 */
	public static final int USER_NEWS_TYPE_REF = 2;
	/** 用户动态：上传照片 */
	public static final int USER_NEWS_TYPE_UPLOAD_IMG = 3;
	/** 用户动态：评论照片 */
	public static final int USER_NEWS_TYPE_COMMENT_IMG = 4;
	/** 用户动态：关注别人 */
	public static final int USER_NEWS_TYPE_ATT_USER = 5;
	/** 用户动态：升级 */
	public static final int USER_NEWS_TYPE_UPGRADE = 6;
	/** 用户动态：发布任务 */
	public static final int USER_NEWS_TYPE_PUBLISH_TASK = 7;
	/** 用户动态：接受任务 */
	public static final int USER_NEWS_TYPE_ACCEPT_TASK = 8;
	/** 用户动态：中标任务 */
	public static final int USER_NEWS_TYPE_WIN_TASK = 9;

	/** 任务状态：发布(打开) */
	public static final int TASK_STATUS_NEW = 1;
	/** 任务状态：已中标(关闭) */
	public static final int TASK_STATUS_BIDDED = 2;
	/** 任务状态：任务结束 */
	public static final int TASK_STATUS_FINISH = 3;
	/** 任务状态：中标者未付款 */
	public static final int TASK_STATUS_NOT_PAYED = -1;
	/** 任务状态：中标者已付款 */
	public static final int TASK_STATUS_PAYED = -2;

	/** 订单状态：新建 */
	public static final int TASK_ACCEPT_STATUS_NEW = 1;
	/** 订单状态：中标 */
	public static final int TASK_ACCEPT_STATUS_WIN = 2;
	/** 订单状态：通知已付款 */
	public static final int TASK_ACCEPT_STATUS_ACK_PAYED = 3;
	/** 订单状态：已付款 */
	public static final int TASK_ACCEPT_STATUS_PAYED = 4;
	/** 订单状态：结束 */
	public static final int TASK_ACCEPT_STATUS_FINISH = 5;
	/** 订单状态：未中标 */
	public static final int TASK_ACCEPT_STATUS_FAIL = -1;
	/** 订单状态：未付款 */
	public static final int TASK_ACCEPT_STATUS_NOT_PAYED = -2;
	/** 订单状态：已失效 */
	public static final int TASK_ACCEPT_STATUS_EXPIRED = -3;

	/** 用户认证状态：新提交 */
	public static final int USER_AUTH_STATUS_NEW = 1;
	/** 用户认证状态：认证通过 */
	public static final int USER_AUTH_STATUS_VALID = 2;
	/** 用户认证状态：认证不通过 */
	public static final int USER_AUTH_STATUS_INVALID = 3;

	/** 用户是否通过认证：是 */
	public static final int USER_IS_AUTH_YES = 1;
	/** 用户是否通过认证：否 */
	public static final int USER_IS_AUTH_NO = 2;

	/** 用户照片允许打分 */
	public static final int USER_PICTURE_ALLOW_SCORE = 1;

	/** 验证码 */
	public static final String VALIDATEKEY = "validate";

	/** COOKIE KEY */
	public static final String COOKIE_KEY = "key";

	/** AMT接口 **/
	public static final String AMT_LINK = "http://workflow.ztgame.com/service/dealWebService";

	/** 域邮件服务器 */
	public static final String GIANT_EMAIL_HOST = "pop3.ztgame.com:995";

	/** 贴子匿名 */
	public static final int TOPIC_FAKE_NOMAL_FLAG = 0;
	public static final int TOPIC_FAKE_FLAG = 1;

	/** 腾讯微博 **/
	public static final String QweiboAppKey = "2ecbd715dd5e4cbc9961c97e24d93db4";
	public static final String QweiboAppSecret = "136ad0c5b40c9fd35dfff2420a47e7dd";

	public static final Integer CREDIT_TYPE_PAY = 0; //支付
	public static final Integer CREDIT_TYPE_PAY_COMPLETE = 10; //支付成功
	public static final Integer CREDIT_TYPE_CUNSUME = 20; //消费
	public static final Integer CREDIT_TYPE_EARN = 30; //赚得
	public static final Integer CREDIT_TYPE_PAY_FAIL = 99; //支付失败

	public static final String FDFS_CONF_PATH = "fdfs_client.conf";

	public static final int LIVE_STATE_ON = 1; //正在直播
	public static final int LIVE_STATE_OFF = 0; //结束直播

	public static final int PAGE_ID_INDEX = 1; //首页
	public static final int PAGE_ID_CHAT = 2; //聊天房间页

	/** 网站根路径，通过读取动态注入。 */
	private static String domainPath = "";

	/** 网站静态资源存放根路径，通过读取动态注入。 */
	private static String staticPath = "";

	/** 网站系统图片根路径，通过读取动态注入。 */
	private static String imagesPath = "";

	/** 网站样式表存放根路径，通过读取动态注入。 */
	private static String stylesPath = "";

	public static String getDomainPath() {
		return domainPath;
	}

	public static void setDomainPath(String domainPath) {
		Constant.domainPath = domainPath;
	}

	public static String getStaticPath() {
		return staticPath;
	}

	public static void setStaticPath(String staticPath) {
		Constant.staticPath = staticPath;
	}

	public static String getImagesPath() {
		return imagesPath;
	}

	public static void setImagesPath(String imagesPath) {
		Constant.imagesPath = imagesPath;
	}

	public static String getStylesPath() {
		return stylesPath;
	}

	public static void setStylesPath(String stylesPath) {
		Constant.stylesPath = stylesPath;
	}

}
