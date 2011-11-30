/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.security;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;

import com.navigation.dao.base.DaoSupport;
import com.navigation.exception.SessionException;
import com.navigation.pojo.User;
import com.navigation.pojo.UserLogState;
import com.navigation.utils.Constants;
import com.navigation.utils.DateUtils;
import com.navigation.utils.IdGenerator;

/**
 * 用户会话工具
 * 
 * @author Derek
 * @version 1.0, 2010-5-7
 */
public class SessionUtil {
	private static DaoSupport daoSupport;

	/** The session provider. */
	private static final ThreadLocal<HttpSession> sessionProvider = new AutoResetThreadLocal<HttpSession>();
	private static final String USER_SESSION_KEY = "SESSION_KEY";
	private static final String USER_SESSION_POJO_KEY = "SESSION_KEY_POJO";
	public static final String USER_STATE_UPDATE_TIME = "SESSION_KEY_LAST_UPDATE";
	public static final String USER_STATE = "SESSION_LAST_USERSTATE";
	private static final ThreadLocal<UserState> currentUser = new AutoResetThreadLocal<UserState>();
	private static XMPPConnection conn = null;

	public void init() {
		ConnectionConfiguration config = new ConnectionConfiguration(Constants.getInstance().xampp_server,
				Constants.getInstance().xampp_port);
		config.setReconnectionAllowed(true);
		conn = new XMPPConnection(config);
		try {
			System.out.println("init xmpp connecting!"+'|'+Constants.getInstance().xampp_resource);
			conn.connect();
			conn.login(Constants.getInstance().xampp_admin, 
					Constants.getInstance().xampp_password,
					Constants.getInstance().xampp_resource
					);
			System.out.println("init xmpp connected! " + conn.isAuthenticated());
		} catch (XMPPException e) {
			e.printStackTrace();
			conn.disconnect();
			conn = null;
		}
	}

	/**
	 * 获取XMPPConnection对象
	 * 
	 * @return
	 * @throws XMPPException
	 */
	public static Connection getConnection() throws XMPPException {
		String name = Constants.getInstance().xampp_admin;
		String password = Constants.getInstance().xampp_password;
		String resource = Constants.getInstance().xampp_resource;
		return getConnection(name, password, resource);
	}

	/**
	 * 获取XMPPConnection对象
	 * 
	 * @return
	 * @throws XMPPException
	 */
	public static Connection getConnection(String name, String password, String resource) throws XMPPException {
		if (conn == null || !conn.isConnected() || !conn.isAuthenticated()) {
			ConnectionConfiguration config = new ConnectionConfiguration(Constants.getInstance().xampp_server,
					Constants.getInstance().xampp_port);
			config.setReconnectionAllowed(true);
			conn = new XMPPConnection(config);
			System.out.println("xmpp connecting!"+"|"+resource);
			conn.connect();
			conn.login(name, password, resource);
			System.out.println("xmpp connected! " + conn.isAuthenticated());
		}
		return conn;
	}

	/**
	 * 获取SESSION对象
	 * 
	 * @return
	 */
	public static HttpSession getSession() {
		HttpSession session = sessionProvider.get();
		if (session == null) {
			throw new IllegalArgumentException("Please buildContext first!");
		} else {
			return session;
		}
	}

	/**
	 * 设置登录用户ID
	 * 
	 * @param uid
	 */
	public static void userLogon(int uid) {
		getSession().setAttribute(USER_SESSION_KEY, uid);
		getSession().setAttribute(USER_SESSION_POJO_KEY, getUser(uid));
	}

	public static void userLogon(User user) {
		getSession().setAttribute(USER_SESSION_KEY, user.getId());
		getSession().setAttribute(USER_SESSION_POJO_KEY, user);
	}

	/**
	 * 设置用户登出
	 * 
	 */
	public static void userLogout() {
		HttpSession session = sessionProvider.get();
		if (session != null) {
			session.invalidate();
			sessionProvider.set(null);
		}
	}

	/**
	 * 当前访问用户是否登录
	 * 
	 * @return true/false
	 */
	public static boolean isLogon() {
		HttpSession session = sessionProvider.get();
		if (session != null) {
			return session.getAttribute(USER_SESSION_KEY) == null ? false : true;
		}
		return false;
	}

	/**
	 * 获取当前登陆用户
	 * 
	 * @return UserState
	 * @throws SessionException
	 *             未登录用户或超时用户将抛出异常
	 */
	public static UserState getLogonUser() throws SessionException {
		UserState userState = currentUser.get();
		if (userState.isLogin())
			return userState;
		HttpSession session = sessionProvider.get();
		if (session != null) {
			Integer uid = (Integer) session.getAttribute(USER_SESSION_KEY);
			if (uid != null) {
				User User = getUser(uid);
				if (User != null) {
					userState.setUser(User);
					return userState;
				}
			}
		}
		throw new SessionException("ex.no_logon");
	}

	/**
	 * 获取当前登陆用户UID
	 * 
	 * @return uid
	 * @throws SessionException
	 *             未登录用户或超时用户将抛出异常
	 */
	public static Integer getLogonUID() throws SessionException {
		HttpSession session = sessionProvider.get();
		if (session != null) {
			Integer uid = (Integer) session.getAttribute(USER_SESSION_KEY);
			if (uid != null)
				return uid;
		}
		throw new SessionException("ex.no_logon");
	}

	/**
	 * 获取当前访问用户（可能未登录）
	 * 
	 * @return UserState
	 */
	public static UserState getCurrentUser() {
		UserState userState = currentUser.get();
		if (userState.isLogin())
			return userState;
		HttpSession session = getSession();
		Integer uid = (Integer) session.getAttribute(USER_SESSION_KEY);
		if (uid != null) {
			User user = getUser(uid);
			if (user != null) {
				userState.setUser(user);
				return userState;
			}
		}
		return userState;
	}

	// /**
	// * 如果没有登录，返回null
	// * @return
	// */
	// public static Authorization getUserToken() {
	// if(isLogon()){
	// getLogonUser
	// return new AuthorizationImpl();
	// }
	// return null;
	// }

	/**
	 * 判断传入的UID是否是当前登陆用户
	 * 
	 * @param uid
	 * @return
	 */
	public static boolean isOwner(int uid) {
		try {
			return getLogonUID() == uid;
		} catch (SessionException e) {
			return false;
		}
	}

	public static Object getAttribute(String key) {
		HttpSession session = getSession();
		return session.getAttribute(key);
	}

	public static void setAttribute(String key, Object value) {
		HttpSession session = getSession();
		session.setAttribute(key, value);
	}

	/**
	 * 每次请求初始化上下文
	 * 
	 * @param request
	 */
	public static void buildContext(ServletRequest request) {
		HttpServletRequest req = (HttpServletRequest) request;
		sessionProvider.set(req.getSession());
		UserState userState = new UserState();
		userState.setClientIp(getIp(req));
		userState.setLastAccessTime(req.getSession().getLastAccessedTime());
		userState.setLocale(req.getLocale());
		User user = (User) req.getSession().getAttribute(USER_SESSION_POJO_KEY);
		if (user != null) {
			userState.setUser(user);
		}
		currentUser.set(userState);
	}

	/**
	 * 获取当前请求的用户的真实IP。
	 * 
	 * @param request
	 *            一个<code>HttpServletRequest</code>对象，如JSP页面中的<code>request</code>对象。
	 * @return 返回当前请求用户的真实IP值。
	 */
	private static String getIp(HttpServletRequest request) {
		if (request == null)
			return StringUtils.EMPTY;
		String ip = request.getHeader("X-Real-IP");
		if (isIp(ip))
			return ip;
		else
			ip = request.getHeader("X-Forwarded-For");

		if (isIp(ip))
			return ip;
		else
			ip = request.getHeader("Proxy-Client-IP");

		if (isIp(ip))
			return ip;
		else
			ip = request.getHeader("WL-Proxy-Client-IP");

		if (isIp(ip))
			return ip;
		else
			ip = request.getHeader("HTTP_CLIENT_IP");

		if (isIp(ip))
			return ip;
		else
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");

		if (isIp(ip))
			return ip;
		else
			ip = request.getRemoteAddr();

		return ip;
	}

	private static boolean isIp(String ip) {
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
			return false;
		else
			return true;
	}

	private static User getUser(Integer uid) {
		return daoSupport.get(User.class, uid);
	}

	public void setDaoSupport(DaoSupport daoSupport) {
		SessionUtil.daoSupport = daoSupport;
	}

	public static UserLogState updateUserLogState(Integer userId) {
		if (userId == null)
			return null;
		// session控制更新时间 900秒
		Date now = new Date();
		UserLogState logState = null;
		Date updateTimeInSession = (Date) getSession().getAttribute(USER_STATE_UPDATE_TIME);
		Long spaceInSession = 1000L;
		if (updateTimeInSession != null)
			spaceInSession = DateUtils.timespaceOfSeconds(updateTimeInSession, now);
		if (spaceInSession > 900) {
			String hql = "from UserLogState s where s.userId = ? order by s.id desc";
			Object[] param = new Object[] { userId };
			List<UserLogState> list = daoSupport.find(hql, param, 0, 1);
			if (list != null && list.size() > 0)
				logState = list.get(0);
			// 若不存在则创建
			if (logState == null) {
				logState = new UserLogState();
				logState.setLastLoginTime(now);
				logState.setLogHashCode((String) IdGenerator.generateID());
				logState.setLogState(1);
				logState.setOnlineTime(0);
				logState.setUserId(userId);
				logState.setLiveState(0);
				logState.setCamNum(1);
				daoSupport.save(logState);
			} else { // 增加在线时间 最多900秒即15分钟 TODO
				Date lastUpdateTime = logState.getLastLoginTime();
				Long space = DateUtils.timespaceOfSeconds(lastUpdateTime, now);
				if (space > 900) {
					logState.setLastLoginTime(now);
					logState.setOnlineTime(logState.getOnlineTime() + 900);
					logState.setLogState(1);
					daoSupport.update(logState);
				}
			}
			// 更新缓存
			getSession().setAttribute(USER_STATE, logState);
			getSession().setAttribute(USER_STATE_UPDATE_TIME, now);
		} else
			logState = (UserLogState) getSession().getAttribute(USER_STATE);
		return logState;
	}

	/**
	 * 刷新用户缓存
	 * 
	 * @param userId
	 */
	public static void freshSession(Integer userId) {
		UserState userState = currentUser.get();
		HttpSession session = sessionProvider.get();
		if (session != null) {
			if (userId != null) {
				User User = getUser(userId);
				if (User != null) {
					userState.setUser(User);
					session.setAttribute(USER_SESSION_POJO_KEY, User);
				}
			}
		}
	}
}
