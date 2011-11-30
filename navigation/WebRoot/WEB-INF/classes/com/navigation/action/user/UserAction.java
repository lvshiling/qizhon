/**
 * 
 */
package com.navigation.action.user;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.muc.MultiUserChat;

import weibo4j.WeiboException;
import weibo4j.http.HttpClient;
import weibo4j.http.Response;
import weibo4j.org.json.JSONArray;
import weibo4j.org.json.JSONException;
import weibo4j.org.json.JSONObject;

import com.navigation.action.BaseAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.Constant;
import com.navigation.domain.PageBean;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.ServiceException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.Room;
import com.navigation.pojo.Task;
import com.navigation.pojo.TaskAccept;
import com.navigation.pojo.User;
import com.navigation.pojo.UserAuth;
import com.navigation.pojo.UserCredit;
import com.navigation.pojo.UserCreditLog;
import com.navigation.pojo.UserInfo;
import com.navigation.pojo.UserLink;
import com.navigation.pojo.UserLogState;
import com.navigation.pojo.UserNews;
import com.navigation.pojo.UserNotice;
import com.navigation.pojo.UserPicture;
import com.navigation.pojo.UserRecordVideo;
import com.navigation.security.SessionUtil;
import com.navigation.service.FileService;
import com.navigation.service.PayService;
import com.navigation.service.UserService;
import com.navigation.utils.CacheUtil;
import com.navigation.utils.ChatRoomUtil;
import com.navigation.utils.Constants;
import com.navigation.utils.CreditUtils;
import com.navigation.utils.EncryptUtil;
import com.navigation.utils.FileUtil;
import com.navigation.utils.IdGenerator;
import com.navigation.utils.JSONUtils;
import com.navigation.utils.SimpleJSONUtils;
import com.navigation.utils.StringUtil;

/**
 * @author WANGHUI Apr 8, 2011 5:45:33 PM
 */
public class UserAction extends BaseAction {

	/**
	 * USER 相关
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	public UserService userService;
	@Resource
	public PayService payService;
	@Resource
	public FileService fileService;
	public User user;
	public Integer topicId;
	public Integer noticeType;
	public boolean isUnRead;
	public String title;
	public String oldpassword;
	public String newpassword;
	public String userIcon;
	public String hashCode;
	public String hashid;

	private Integer areaId = 1;

	private File filedata;
	private String filedataContentType;
	private String filedataFileName;

	public String size;
	public String uid;
	public String rid;
	public UserInfo userInfo;
	public XMPPConnection xmConnection;

	public String type = "avatar";

	private String recordFileName;

	private Task task;
	private TaskAccept taskAccept;

	private String count;
	private String sendTo;
	private String roomNo;
	private String towho;
	private String value;
	private String rating;
	private String avg;
	private String lastId;
	private String msg;

	/**
	 * 统一页面跳转入口
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String redirect() throws SessionException {
		String namespace = (String) this.getRequest().getAttribute("namespace");
		String actionName = (String) this.getRequest().getAttribute("actionName");
		if ("/".equals(namespace) && StringUtil.isInteger(actionName)) {
			rid = actionName;
			return chat();
		} else {
			return "404";
		}
	}

	public String index() throws SessionException {
		Integer hostId = null;
		Integer guestId = null;

		if (!StringUtil.isNullOrEmpty(uid)) {
			hostId = new Integer(uid);
		} else {
			hostId = SessionUtil.getLogonUID();
		}
		this.getRequest().setAttribute("userId", hostId);

		User user = this.userService.getUserAllInfo(hostId);
		this.getRequest().setAttribute("user", user);

		UserInfo userInfo = this.userService.findUserInfo(hostId);
		this.getRequest().setAttribute("userInfo", userInfo);

		List<UserNews> userNews = this.userService.getUserNewsList(hostId, p, pageSize);
		this.getRequest().setAttribute("userNews", userNews);

		// List<UserPicture> picList = this.userService.getUserPics(hostId, p,
		// pageSize);
		// this.getRequest().setAttribute("picList", picList);

		if (SessionUtil.isLogon()) {
			guestId = SessionUtil.getLogonUID();
		}
		if (hostId.equals(guestId)) {
			this.getRequest().setAttribute("isSelf", true);
			this.getRequest().setAttribute("target", StringUtil.encode(hostId.toString()));
			List<UserCreditLog> logList = this.payService.getUserPayLog(hostId, p, pageSize);
			this.getRequest().setAttribute("logList", logList);
		}
		return "index";
	}

	/**
	 * 相册
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String album() throws SessionException {
		Integer hostId = null;
		Integer guestId = null;

		if (!StringUtil.isNullOrEmpty(uid)) {
			hostId = new Integer(uid);
		} else {
			hostId = SessionUtil.getLogonUID();
		}
		this.getRequest().setAttribute("userId", hostId);

		User user = this.userService.getUserAllInfo(hostId);
		this.getRequest().setAttribute("user", user);

		if (SessionUtil.isLogon()) {
			guestId = SessionUtil.getLogonUID();
		}
		if (hostId.equals(guestId)) {
			this.getRequest().setAttribute("isSelf", true);
			this.getRequest().setAttribute("target", StringUtil.encode(hostId.toString()));
		}

		this.setPageSize(8);

		PageBean pb = this.userService.getUserPicsPageBean(hostId, p, pageSize);
		this.getRequest().setAttribute("pageBean", pb);

		return "album";
	}

	public String ajaxUserPics() throws SessionException {
		if (StringUtil.isEmpty(uid))
			throw new SessionException("参数错误");
		this.setPageSize(8);
		PageBean pb = this.userService.getUserPicsPageBean(Integer.valueOf(uid), p, pageSize);
		this.getRequest().setAttribute("pageBean", pb);
		return "ajaxUserPics";
	}

	public String pubMsg() throws SessionException {
		Integer userId = SessionUtil.getLogonUID();
		this.userService.msgUserNews(userId, msg);
		return index();
	}

	public String ajaxPubMsg() throws AjaxJsonException {
		if (StringUtil.isEmpty(msg))
			throw new AjaxJsonException("消息不能为空");
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.msgUserNews(userId, msg);
			setJson(AjaxData.getSuccessJson("消息发布成功", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 个人中心
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String index3() throws SessionException {
		Integer userId = SessionUtil.getLogonUID();
		User user = this.userService.getUserAllInfo(userId);
		UserInfo userInfo = this.userService.findUserInfo(userId);
		List<UserCreditLog> logList = this.payService.getUserPayLog(userId, p, pageSize);
		this.getRequest().setAttribute("logList", logList);
		this.getRequest().setAttribute("user", user);
		this.getRequest().setAttribute("userInfo", userInfo);
		this.getRequest().setAttribute("target", StringUtil.encode(userId.toString()));
		return "index";
	}

	/**
	 * 个人中心
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String index2() throws SessionException {
		Integer userId;
		userId = SessionUtil.getLogonUID();
		// test
		String key = "lastUser";
		CacheUtil.getLocalRegion().set(key, userId, 3600 * 24);
		try {
			Integer user = (Integer) CacheUtil.getLocalRegion().get(key);
			System.out.println(user + "############");
		} catch (Exception e) {
			e.printStackTrace();
		}

		UserLink link = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_SINA);
		this.getRequest().setAttribute("UserLink", link);
		this.getRequest().setAttribute("_", Math.random());
		this.getRequest().setAttribute("target", StringUtil.encode(userId.toString()));
		// 查询余额 及记录
		UserCredit credit = this.payService.getUserCredit(userId);
		this.getRequest().setAttribute("userCredit", credit);
		List<UserCreditLog> logList = this.payService.getUserPayLog(userId, p, pageSize);
		this.getRequest().setAttribute("logList", logList);
		return "index";
	}

	/**
	 * 更新密码
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxChangeUserPassword() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(oldpassword))
			throw new AjaxJsonException("旧密码不得为空");
		if (StringUtil.isNullOrEmpty(newpassword))
			throw new AjaxJsonException("新密码不得为空");
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.changePassword(userId, oldpassword, newpassword);
			setJson(AjaxData.getSuccessJson("修改成功", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 更新头像
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxChangeUserIcon() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(userIcon))
			throw new AjaxJsonException("头像地址不得为空");
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.changeUserIcon(userId, userIcon);
			setJson(AjaxData.getSuccessJson("修改成功", null));
			// 刷新用户信息缓存
			SessionUtil.freshSession(userId);
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 推荐 头像
	 * 
	 * @return
	 */
	public String ajaxRecommendIcon() {
		Integer start = (p - 1) * 18;
		String url = "http://image.baidu.com/i?tn=baiduimagejson&ct=201326592&cl=2&lm=-1&fr=&sf=1&fmq=&pv=&ic=0&z=&se=1&showtab=0&fb=0&width=100&height=100&face=0&istype=2&word=%CD%B7%CF%F1&s=3&rn=60&1068480832501.8651&pn="
				+ start;
		HttpClient http = new HttpClient();
		try {
			Response res = http.get(url);
			JSONObject js = res.asJSONObject();
			String jsData = js.getString("data");
			JSONArray list = new JSONArray(jsData);
			Map<Integer, String> imgArray = new HashMap<Integer, String>();
			for (int i = 0; i < list.length(); i++) {
				JSONObject obj = (JSONObject) list.get(i);
				String urlImg = (String) obj.get("objURL");
				if (!StringUtil.isNullOrEmpty(urlImg))
					imgArray.put(i, urlImg.trim());
			}
			this.getRequest().setAttribute("imgArray", imgArray);
		} catch (WeiboException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return "ajaxRecommendIcon";
	}

	/**
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxChangeUserName() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(title))
			throw new AjaxJsonException("用户昵称不得为空");
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.changeUserName(userId, title);
			setJson(AjaxData.getSuccessJson("修改成功", null));
			// 刷新用户信息缓存
			SessionUtil.freshSession(userId);
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 直播开始
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxLiveStart() throws AjaxJsonException {
		int camNum = 1;
		if (!StringUtil.isNullOrEmpty(_) && _.equals("HAS_SMALL"))
			camNum = 2;
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.updateUserLiveState(userId, Constant.LIVE_STATE_ON, camNum);
			setJson(AjaxData.getSuccessJson("初始化成功", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 直播结束
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxLiveEnd() throws AjaxJsonException {
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.updateUserLiveState(userId, Constant.LIVE_STATE_OFF, null);
			setJson(AjaxData.getSuccessJson("直播结束", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 登录
	 * 
	 * @return
	 */
	public String ajaxLogin() throws AjaxJsonException {
		if (null == user)
			throw new AjaxJsonException("user is null!");
		if (StringUtil.isNullOrEmpty(user.getMail()))
			throw new AjaxJsonException("邮件地址不得为空");
		if (StringUtil.isNullOrEmpty(user.getPassword()))
			throw new AjaxJsonException("密码不得为空");
		try {
			User dbUser = this.userService.login(user);
			if (!StringUtil.isEmpty(user.getHashid())) {
				this.userService.bindGameUser(user.getHashid(), dbUser);
			}
			Map<String, String> values = new HashMap<String, String>();
			values.put("name", dbUser.getName());
			values.put("id", dbUser.getId().toString());
			String userId = StringUtil.encode(dbUser.getId().toString());
			Cookie cookie = new Cookie(Constant.COOKIE_KEY, StringUtil.encode(userId));
			cookie.setMaxAge(2592000); // 2592000 COOKIE 一个月
			cookie.setPath("/");
			HttpServletResponse response = this.getResponse();
			response.addCookie(cookie);

			// 更新在线状态
			UserLogState state = SessionUtil.updateUserLogState(dbUser.getId());
			values.put("hashCode", state.getLogHashCode());
			String isVip = "0";
			if (dbUser.getIsVip() != null && dbUser.getIsVip() != 0)
				isVip = dbUser.getIsVip().toString();
			values.put("isVip", isVip);

			setJson(AjaxData.getSuccessJson("登录成功", values));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 域用户 登录
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxAdLogin() throws AjaxJsonException {
		if (null == user)
			throw new AjaxJsonException("user is null!");
		if (StringUtil.isNullOrEmpty(user.getMail()))
			throw new AjaxJsonException("邮件地址不得为空");
		if (StringUtil.isNullOrEmpty(user.getPassword()))
			throw new AjaxJsonException("密码不得为空");
		try {
			User dbUser = this.userService.adLogin(user);
			Map<String, String> values = new HashMap<String, String>();
			values.put("name", dbUser.getName());
			values.put("id", dbUser.getId().toString());

			// 更新在线状态
			UserLogState state = SessionUtil.updateUserLogState(dbUser.getId());
			values.put("hashCode", state.getLogHashCode());
			setJson(AjaxData.getSuccessJson("登录成功", values));

			// 记住登录时间
			String userId = StringUtil.encode(dbUser.getId().toString());
			Cookie cookie = new Cookie(Constant.COOKIE_KEY, StringUtil.encode(userId));
			// cookie.setMaxAge(86400); //86400 COOKIE 一天
			cookie.setMaxAge(2592000); // 2592000 COOKIE 一个月
			cookie.setPath("/");
			HttpServletResponse response = this.getResponse();
			response.addCookie(cookie);
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 登出
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxLogout() throws AjaxJsonException {
		try {
			SessionUtil.userLogout();
			// 2592000 COOKIE 一个月
			Cookie cookie = new Cookie(Constant.COOKIE_KEY, "");
			cookie.setMaxAge(2592000);
			cookie.setPath("/");
			HttpServletResponse response = this.getResponse();
			response.addCookie(cookie);
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		setJson(AjaxData.getSuccessJson("登出成功", null));
		return AJAX_JSON_RESULT;
	}

	/**
	 * 检查邮件地址是否存在
	 * 
	 * @return
	 */
	public String ajaxEmailIsExist() {
		User dbUser = this.userService.getUserByEmail(user.getMail());
		boolean isExist = null == dbUser ? false : true;
		Map<String, String> values = new HashMap<String, String>();
		if (isExist)
			values.put("isExist", "true");
		else
			values.put("isExist", "false");
		setJson(AjaxData.getSuccessJson("", values));
		return AJAX_JSON_RESULT;
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	public String ajaxRegister() throws AjaxJsonException {
		if (null == user)
			throw new AjaxJsonException("数据不全");
		if (StringUtil.isEmpty(user.getMail()))
			throw new AjaxJsonException("请填写邮件地址");
		if (StringUtil.isEmpty(user.getPassword()))
			throw new AjaxJsonException("请填写密码");
		try {
			String password = user.getPassword();
			if (password.length() < 6 || password.length() > 16)
				throw new AjaxJsonException("密码长度必须为6-16位");

			String mail = user.getMail();
			if (mail.length() > 40)
				throw new AjaxJsonException("邮件地址太长");
			if (!StringUtil.isEmail(mail))
				throw new AjaxJsonException("邮件地址格式不符");

			String name = user.getName();
			if (null == name || name.equals(""))
				name = user.getMail().substring(0, user.getMail().indexOf("@"));
			if (name.length() > 18)
				throw new AjaxJsonException("用户名长度不符合");
			if (name.indexOf("@") != -1)
				throw new AjaxJsonException("用户名中不能包含'@'");

			String ztgameFlag = mail.toLowerCase();
			if (ztgameFlag.indexOf("ztgame") != -1)
				throw new AjaxJsonException("用户名中不能包含'ztgame'");

			User dbUser = this.userService.createNewUser(user.getMail(), user.getPassword(), name, areaId);

			// Create a room in db
			Room dbRoom = userService.createRoom(dbUser.getId(), dbUser.getName());
			// Create a room in XMPP server
			ChatRoomUtil.createReservedRoom(dbUser.getId(), dbRoom.getRoomNo(), dbRoom.getRoomName());

			SessionUtil.userLogon(dbUser);
			Map<String, String> values = new HashMap<String, String>();
			values.put("name", dbUser.getName());
			values.put("id", dbUser.getId().toString());
			setJson(AjaxData.getSuccessJson("注册成功", values));
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 用户订阅贴子
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxSubTopic() throws AjaxJsonException {
		if (null == topicId)
			throw new AjaxJsonException("帖子ID为空");
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.subTopic(userId, topicId, title);
			setJson(AjaxData.getSuccessJson("订阅成功", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 取消订阅帖子
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxCancleSubTopic() throws AjaxJsonException {
		if (null == targetId)
			throw new AjaxJsonException("订阅ID为空");
		try {
			Integer userId = SessionUtil.getLogonUID();
			this.userService.subTopicCancle(userId, targetId);
			setJson(AjaxData.getSuccessJson("取消订阅成功", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 取消息通知
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxGetNotice() throws AjaxJsonException {
		List<UserNotice> noticeList = new ArrayList<UserNotice>();
		try {
			Integer userId = SessionUtil.getLogonUID();
			// 更新在线状态
			SessionUtil.updateUserLogState(userId);
			// 取通知
			noticeList = this.userService.getUserNotice(userId, noticeType, isUnRead, p, pageSize);
		} catch (Exception e) {
			msg = e.getMessage();
		}
		if (noticeList != null && !noticeList.isEmpty()) {
			this.getRequest().setAttribute("noticeList", noticeList);
			this.setJson(AjaxData.getSuccessJson("", null));
		}
		return "ajaxGetNotice";
	}

	/**
	 * 取消息通知
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxGetNotice2() throws AjaxJsonException {
		List<UserNotice> noticeList = new ArrayList<UserNotice>();
		try {
			Integer userId = SessionUtil.getLogonUID();

			// 更新在线状态
			UserLogState sessionState = (UserLogState) SessionUtil.getSession().getAttribute(SessionUtil.USER_STATE);
			Long lastTime = null;
			if (sessionState != null)
				lastTime = sessionState.getLastLoginTime().getTime();
			UserLogState state = SessionUtil.updateUserLogState(userId); // 返回状态
			Long newTime = state.getLastLoginTime().getTime(); // 上次同步的时间
			if (lastTime == null || !lastTime.equals(newTime)) {
				try {
					this.userService.checkUserMail(userId); // System.out.println("帮用户收邮件标志！！");
				} catch (Exception e) {
					System.out.println(e.getMessage());
					String msg = e.getMessage().toLowerCase();
					System.out.println(msg);
					System.out.println(msg.indexOf("logon failure"));
					if (msg.indexOf("logon failure") != -1) {
						SessionUtil.userLogout();
						Cookie cookie = new Cookie(Constant.COOKIE_KEY, "");
						cookie.setMaxAge(2592000);
						cookie.setPath("/");
						HttpServletResponse response = this.getResponse();
						response.addCookie(cookie);
						System.out.println("强制退出！");
						throw new SessionException("请重新登录域帐户");
					}
				}
			}

			// 取通知
			noticeList = this.userService.getUserNotice(userId, noticeType, isUnRead, p, pageSize);
			if (null == noticeList || noticeList.size() == 0)
				throw new Exception("无未读消息");

			// this.setJson(JSONUtils.toJson(noticeList));
			// } catch (SessionException e) {
			// this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(),
			// target, null));
			// msg = e.getMessage();
		} catch (Exception e) {
			// throw new AjaxJsonException(e.getMessage());
			msg = e.getMessage();
		}
		this.getRequest().setAttribute("noticeList", noticeList);
		return "ajaxGetNotice";
	}

	/**
	 * 软件取消息
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxAppGetNotice() throws AjaxJsonException {
		if (targetId == null)
			throw new AjaxJsonException("targetId不得为空");
		Integer userId = targetId;
		List<UserNotice> noticeList = this.userService.getUserNotice(userId, noticeType, true, p, pageSize);
		if (null == noticeList || noticeList.size() == 0)
			throw new AjaxJsonException("无未读消息");
		this.setJson(JSONUtils.toJson(noticeList));
		// 更新在线状态
		SessionUtil.updateUserLogState(userId);
		return AJAX_JSON_RESULT;
	}

	/**
	 * 设置已读
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxReadNotice() throws AjaxJsonException {
		try {
			Integer userId = SessionUtil.getLogonUID();
			if (null == targetId)
				throw new AjaxJsonException("订阅ID为空");
			this.userService.noticeReaded(userId, targetId);
			setJson(AjaxData.getSuccessJson("成功", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 根据 HASHCODE 取用户在线状态
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxGetUserState() throws AjaxJsonException {
		try {
			if (null == hashCode)
				throw new AjaxJsonException("HC为空");
			UserLogState state = this.userService.getUserLogStateByHashCode(hashCode);
			if (null == state)
				throw new AjaxJsonException("登录不存在");
			Map<String, String> values = new HashMap<String, String>();
			values.put("uid", state.getUserId().toString());
			values.put("loginFlag", state.getLogState().toString());
			setJson(AjaxData.getSuccessJson("获取成功", values));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 取用户名
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxGetUser() throws AjaxJsonException {
		try {
			User user = SessionUtil.getCurrentUser().getUser();
			setJson("{uid: '" + user.getId() + "', username: '" + user.getName() + "'}");
		} catch (Exception e) {
			setJson("{uid:'0',username: ''}");
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 上传头像
	 * 
	 * @return
	 */
	public String ajaxUploadHead() {
		Map<String, String> map = new HashMap<String, String>();
		try {
			int buf = 0;
			String fileType = size.substring(0, 1);
			String fileName = uid + "_" + fileType + ".jpg";
			String dictroy = Constants.getInstance().avatar_path + "/" + type;
			FileUtil.createDir(dictroy, true);
			String filePath = dictroy + "/" + fileName;
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buffer = new byte[4096];
			while ((buf = this.getRequest().getInputStream().read(buffer)) != -1)
				fos.write(buffer, 0, buf);
			fos.close();
			if ("haibao".equals(type)) {
				userService.changeUserPoster(new Integer(uid), "/upload/haibao/" + fileName);
				SessionUtil.freshSession(new Integer(uid)); // 刷新海报缓存
			} else if (fileType.equals("5")) {
				userService.changeUserIcon(new Integer(uid), "/upload/avatar/" + fileName);
				SessionUtil.freshSession(new Integer(uid)); // 刷新头像缓存
			}
			map.put("code", "A00001");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "M00001");
			map.put("data", e.getMessage());
		}
		this.setJson(StringUtil.toJson(map));
		return AJAX_JSON_RESULT;
	}

	public String admin() throws SessionException {
		User user = SessionUtil.getLogonUser().getUser();
		if (user.getIsAdmin() != null && user.getIsAdmin().equals(1)) {
			List<UserAuth> authList = this.userService.getAwaitAuthList();
			this.getRequest().setAttribute("authList", authList);
		} else {
			throw new SessionException("对不起，您没有权限！");
		}
		return "admin";
	}

	public String passAuth() throws SessionException {
		String[] authIds = this.getRequest().getParameterValues("authIds");
		if (authIds == null || authIds.length == 0)
			return INPUT;
		try {
			for (String authId : authIds) {
				this.userService.passAuth(Integer.valueOf(authId));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SessionException(e.getMessage());
		}
		return admin();
	}

	public String unpassAuth() throws SessionException {
		String[] authIds = this.getRequest().getParameterValues("authIds");
		if (authIds == null || authIds.length == 0)
			return INPUT;
		try {
			for (String authId : authIds) {
				this.userService.unpassAuth(Integer.valueOf(authId));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SessionException(e.getMessage());
		}
		return admin();
	}

	public String ajaxSubmitAuth() {
		Map<String, String> map = new HashMap<String, String>();
		Integer userId = Integer.valueOf(uid);
		try {
			int buf = 0;
			String fileType = size.substring(0, 1);
			String fileName = uid + "_" + fileType + ".jpg";
			String dictroy = Constants.getInstance().avatar_path + "/" + type;
			FileUtil.createDir(dictroy, true);
			String filePath = dictroy + "/" + fileName;
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buffer = new byte[4096];
			while ((buf = this.getRequest().getInputStream().read(buffer)) != -1)
				fos.write(buffer, 0, buf);
			fos.close();
			if (fileType.equals("5")) {
				this.userService.changeUserIcon(userId, "/upload/avatar/" + fileName);
				SessionUtil.freshSession(userId); // 刷新头像缓存
			}
			if (fileType.equals("1")) {
				boolean neededAuth = this.userService.neededAuth(userId);
				if (neededAuth) {
					this.userService.submitAuth(userId, target);
					map.put("code", "A00001"); // 提交成功
					map.put("data", fileType);
				} else {
					map.put("code", "R00001"); // 不能重复认证
					map.put("data", fileType);
				}
			} else {
				map.put("code", "P00001");
				map.put("data", fileType);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "M00001");
			map.put("data", e.getMessage());
		}
		this.setJson(StringUtil.toJson(map));
		return AJAX_JSON_RESULT;
	}

	/**
	 * 上传 文件
	 * 
	 * @return
	 */
	public String ajaxUpload() {
		String fileName = new Date().getTime() + "." + FileUtil.getExtension(filedataFileName);
		if (filedata != null) {
			filedata.renameTo(new File(Constants.getInstance().avatar_path + File.separator + "attachment" + File.separator + fileName));
			System.out.println("SUCCESS");
		}
		StringBuffer sb = new StringBuffer();
		sb.append("{'err':'','msg':{'url':'");
		sb.append(Constant.getDomainPath() + "/upload/attachment/" + fileName);
		sb.append("','localname':'");
		sb.append(filedataFileName);
		sb.append("','id':'1'}}");
		setJson(sb.toString());
		return AJAX_JSON_RESULT;
	}

	/**
	 * 编辑 更多资料
	 * 
	 * @return
	 */
	public String ajaxUpdateUserInfo() throws AjaxJsonException {
		if (userInfo == null)
			throw new AjaxJsonException("资料为空");
		try {
			User user = SessionUtil.getCurrentUser().getUser();
			this.userService.updateUserInfo(userInfo, user.getId());
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		this.setJson(AjaxData.getSuccessJson("操作成功", null));
		return AJAX_JSON_RESULT;
	}

	/**
	 * 分页取照片列表
	 * 
	 * @return
	 */
	public String ajaxGetUserPics() {
		Integer userId = null;
		try {
			if (this.getRequest().getParameter("uid") != null)
				userId = Integer.parseInt(this.getRequest().getParameter("uid"));
			if (userId == null)
				userId = SessionUtil.getLogonUID();
			List<UserPicture> pics = this.userService.getUserPics(userId, p, pageSize);
			this.getRequest().setAttribute("pics", pics);
		} catch (SessionException e) {
			this.msg = "请先登录";
		}
		return "ajaxGetUserPics";
	}

	/**
	 * 发送站内信
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxSendMsg() throws AjaxJsonException {
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
			if (StringUtil.isNullOrEmpty(userId))
				throw new AjaxJsonException("对方ID不存在");
			Integer toUserId = Integer.parseInt(target);
			this.userService.sendMsg(userId, toUserId, msg);
		} catch (SessionException e) {
			throw new AjaxJsonException("请先登录");
		}
		this.setJson(AjaxData.getSuccessJson("发送成功", null));
		return AJAX_JSON_RESULT;
	}

	/**
	 * ID 个人首页
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String id() throws SessionException {
		Integer hostId = null;
		Integer guestId = null;

		if (!StringUtil.isNullOrEmpty(uid)) {
			hostId = new Integer(uid);
		} else {
			hostId = SessionUtil.getLogonUID();
		}
		this.getRequest().setAttribute("userId", hostId);

		User user = this.userService.getUserAllInfo(hostId);
		this.getRequest().setAttribute("user", user);

		UserInfo userInfo = this.userService.findUserInfo(hostId);
		this.getRequest().setAttribute("userInfo", userInfo);

		List<UserPicture> picList = this.userService.getUserPics(hostId, p, pageSize);
		this.getRequest().setAttribute("picList", picList);

		if (SessionUtil.isLogon())
			guestId = SessionUtil.getLogonUID();
		if (hostId.equals(guestId)) {
			this.getRequest().setAttribute("isSelf", true);
			this.getRequest().setAttribute("target", StringUtil.encode(hostId.toString()));
		}
		return "id";
	}

	/**
	 * 视频认证
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String auth() throws SessionException {
		if (StringUtil.isEmpty(emsg)) {
			return "auth";
		} else {
			return this.interCall("auth");
		}
	}

	public String interCall(String retstr) throws SessionException {
		String[] ps = this.gameParaDecrypt();
		if (StringUtil.isEmpty(ps[0]) || StringUtil.isEmpty(ps[1]))
			return retstr;
		String gmhashid = ps[0] + "_" + ps[1];
		if (SessionUtil.isLogon()) {
			User user = SessionUtil.getLogonUser().getUser();
			this.userService.bindGameUser(gmhashid, user);
		} else {
			this.getRequest().setAttribute("gmhashid", gmhashid);
		}
		return retstr;
	}

	public String bingwang() throws SessionException {
		List<User> lst = this.userService.getUserScoreList(20);
		this.getRequest().setAttribute("userList", lst);
		return "bingwang";
	}

	public String score() throws SessionException {
		List<User> userList = this.userService.randUsersWithPic(10);

		User user = null;
		if (!StringUtil.isEmpty(emsg)) {
			String[] ps = this.gameParaDecrypt();
			System.out.println(ps[0] + "_" + ps[1]);
			user = this.userService.getUserByHashid(ps[0] + "_" + ps[1]);
		}
		if (user == null) {
			if (StringUtil.isNullOrEmpty(uid)) {
				user = userList.get(0);
			} else {
				user = this.userService.getUser(Integer.valueOf(uid));
			}
		}
		if (!StringUtil.isNullOrEmpty(rating))
			this.getRequest().setAttribute("rating", rating);
		if (!StringUtil.isNullOrEmpty(avg))
			this.getRequest().setAttribute("avg", avg);
		if (!StringUtil.isNullOrEmpty(lastId))
			this.getRequest().setAttribute("lastUser", this.userService.getUser(Integer.valueOf(lastId)));

		this.getRequest().setAttribute("scuser", user);

		UserInfo userInfo = this.userService.findUserInfo(user.getId());
		this.getRequest().setAttribute("userInfo", userInfo);

		List<User> userList1 = new ArrayList<User>(userList.subList(0, 4));
		List<User> userList2 = new ArrayList<User>(userList.subList(4, 10));
		this.getRequest().setAttribute("userList1", userList1);
		this.getRequest().setAttribute("userList2", userList2);

		return "score";
	}

	public String ajaxGiveScore() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(uid))
			throw new AjaxJsonException("参数不正确");
		if (StringUtil.isNullOrEmpty(value))
			throw new AjaxJsonException("参数不正确");

		try {
			Integer logonUid = SessionUtil.getLogonUID();
			Integer rateUid = Integer.valueOf(uid);
			if (logonUid == rateUid) {
				throw new AjaxJsonException("不能给自己打分");
			}
			Double avg = this.userService.giveScore(rateUid, logonUid, Double.valueOf(value));
			if (avg == null)
				avg = 0.0d;
			Map<String, String> result = new HashMap<String, String>();
			result.put("rating", value);
			result.put("avg", avg.toString());
			result.put("lastId", uid);
			this.setJson(AjaxData.getSuccessJson("success", result));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	public String ajaxUpdateRoomOccuCnt() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(roomNo))
			return AJAX_JSON_RESULT;
		if (StringUtil.isNullOrEmpty(count))
			return AJAX_JSON_RESULT;
		try {
			userService.updateRoomOccuCnt(Integer.valueOf(roomNo), Integer.valueOf(count));
			this.setJson(AjaxData.getSuccessJson("success", null));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 聊天
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String chat() throws SessionException {
		Integer hostId = null; // 房主id
		Integer guestId = null; // 访客id
		Room room = null; // 房间
		User user = null; // 房主

		if (!StringUtil.isEmpty(rid)) {
			room = this.userService.getRoomByNo(Integer.valueOf(rid));
			if (room != null) {
				hostId = room.getUserId();
				user = this.userService.getUserWithCreditAndState(hostId);
			} else {
				throw new SessionException("对不起，该房间 不存在 或 已被删除。");
			}
		} else {
			if (!StringUtil.isEmpty(uid))
				hostId = new Integer(uid);
			else
				hostId = SessionUtil.getLogonUID();
			user = this.userService.getUserWithCreditAndState(hostId);
			room = this.userService.getRoomByOwner(hostId);
			if (room == null) {
				room = this.userService.createRoom(user.getId(), user.getName());
				try {
					ChatRoomUtil.createReservedRoom(user.getId(), room.getRoomNo(), room.getRoomName());
				} catch (XMPPException e) {
					e.printStackTrace();
				}
			}
		}
		if (SessionUtil.isLogon()) {
			guestId = SessionUtil.getLogonUID();
			UserCredit credit = this.payService.getUserCredit(guestId);
			this.getRequest().setAttribute("credit", credit);
		} else {
			String guestIdStr = StringUtil.getRandomString(6);
			String guestName = "游客" + guestIdStr;
			this.getRequest().setAttribute("guestId", guestIdStr);
			this.getRequest().setAttribute("guestName", guestName);
			this.getRequest().setAttribute("anonymous", "YES");
		}
		String roomKey;
		if (hostId.equals(guestId)) {
			this.getRequest().setAttribute("isSelf", true); // 访问者是房主本人
			roomKey = (String) IdGenerator.generateID();
			room.setRoomKey(roomKey);
			this.userService.updateRoom(room);
		} else {
			roomKey = room.getRoomKey();
			if (StringUtil.isEmpty(roomKey)) {
				roomKey = StringUtil.md5(room.getRoomNo().toString());
			}
		}
		user.setRoom(room);

		this.getRequest().setAttribute("user", user);
		this.getRequest().setAttribute("userId", hostId);
		this.getRequest().setAttribute("room", room);
		this.getRequest().setAttribute("xamppServer", Constants.getInstance().xampp_server);
		this.getRequest().setAttribute("red5Server", Constants.getInstance().red5_server);
		this.getRequest().setAttribute("redOrginServer", Constants.getInstance().red_orgin_server);
		this.getRequest().setAttribute("roomKey", roomKey);
		this.getRequest().setAttribute("pageId", Constant.PAGE_ID_CHAT);

		List<UserCredit> richList = userService.getUserSpendCreditList(6);
		this.getRequest().setAttribute("richList", richList);

		return "chat";
	}

	/**
	 * 显示视频接口
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String showvideo() throws SessionException {
		if (StringUtil.isEmpty(emsg))
			return "showvideo";
		String[] ps = this.gameParaDecrypt();
		System.out.println(ps[0] + "_" + ps[1]);
		User user = this.userService.getUserByHashid(ps[0] + "_" + ps[1]);
		Room room = this.userService.getRoomByOwner(user.getId());
		if (room == null) {
			room = this.userService.createRoom(user.getId(), user.getName());
			try {
				ChatRoomUtil.createReservedRoom(user.getId(), room.getRoomNo(), room.getRoomName());
			} catch (XMPPException e) {
				e.printStackTrace();
			}
		}
		String roomKey = room.getRoomKey();
		if (StringUtil.isEmpty(roomKey)) {
			roomKey = StringUtil.md5(room.getRoomNo().toString());
		}
		this.getRequest().setAttribute("user", user);
		this.getRequest().setAttribute("userId", user.getId());
		this.getRequest().setAttribute("room", room);
		this.getRequest().setAttribute("red5Server", Constants.getInstance().red5_server);
		this.getRequest().setAttribute("roomKey", roomKey);
		return "showvideo";
	}

	/**
	 * 增加一次uv
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String ajaxAddVisit() throws SessionException {
		if (StringUtil.isNullOrEmpty(target))
			return AJAX_JSON_RESULT;
		if (pageId == null)
			return AJAX_JSON_RESULT;
		try {
			userService.addVisit(Integer.valueOf(target), pageId, new Date());
			this.setJson(AjaxData.getSuccessJson("success", null));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AJAX_JSON_RESULT;
	}

	public String ajaxPublicUserNews() throws AjaxJsonException {
		try {
			List<UserNews> userNews;
			if (StringUtil.isEmpty(_)) {
				userNews = userService.getPublicUserNews(8, null);
			} else {
				Date afterTime = new Date(Long.valueOf(_));
				userNews = userService.getPublicUserNews(8, afterTime);
			}
			if (userNews != null && !userNews.isEmpty()) {
				long time = userNews.get(0).getUpdateTime().getTime();
				Map<String, Object> result = new HashMap<String, Object>();
				result.put("status", AjaxData.STATUS_SUCCESS);
				result.put("message", String.valueOf(time));
				result.put("values", userNews);
				String json = SimpleJSONUtils.map2json(result);
				System.out.println(json);
				this.setJson(json);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 加关注
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String ajaxAddAttention() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(target))
			throw new AjaxJsonException("关注失败");
		User targetUser = userService.getUser(Integer.valueOf(target));
		if (targetUser == null)
			throw new AjaxJsonException("该用户不存在");
		try {
			Integer userId = SessionUtil.getLogonUID();
			if (userId.toString().equals(target))
				throw new AjaxJsonException("不能关注自己");
			Integer newFansNum = userService.addAttention(userId, targetUser);
			Map<String, String> result = new HashMap<String, String>();
			result.put("fansNum", newFansNum == null ? "" : newFansNum.toString());
			this.setJson(AjaxData.getSuccessJson("success", result));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (ServiceException e) {
			throw new AjaxJsonException(e.getMessage());
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 送礼物
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxSendGift() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(target))
			throw new AjaxJsonException("礼物不得为空");
		if (StringUtil.isNullOrEmpty(_))
			throw new AjaxJsonException("请选择送礼物的对象");
		if (StringUtil.isNullOrEmpty(towho))
			throw new AjaxJsonException("请选择送礼物的对象");
		if (StringUtil.isNullOrEmpty(count))
			throw new AjaxJsonException("礼物数量不能为空");
		if (StringUtil.isNullOrEmpty(roomNo))
			throw new AjaxJsonException("房间号不能为空");

		try {
			User user = SessionUtil.getLogonUser().getUser();

			int giftValue = CreditUtils.giftValue(target);
			int totalValue = giftValue * Integer.valueOf(count);

			// 扣费
			UserCredit userCredit = payService.sendGift(user.getId(), Integer.valueOf(_), totalValue);
			// 广播
			Connection conn = SessionUtil.getConnection();
			MultiUserChat muc2 = new MultiUserChat(conn, roomNo + "@conference." + conn.getServiceName());

			muc2.join("qule");
			muc2.sendMessage("__gift__" + user.getId() + "," + user.getName() + "," + _ + "," + towho + "," + target + "," + count);
			muc2.leave();
			// 返回余额
			Map<String, String> result = new HashMap<String, String>();
			result.put("userId", user.getId().toString());
			result.put("credit", userCredit.getCredit().toString());
			result.put("score", userCredit.getScore().toString());
			this.setJson(AjaxData.getSuccessJson("success", result));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (XMPPException e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		} catch (ServiceException e) {
			throw new AjaxJsonException(e.getMessage());
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 上传并保存用户录制视频
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxRecordEnd() throws AjaxJsonException {
		if (StringUtil.isNullOrEmpty(recordFileName))
			throw new AjaxJsonException("视频名称不得为空");

		String tempPath = Constants.getInstance().record_temp_path;
		String tempName = tempPath + recordFileName;
		Date now = new Date();
		try {
			// 上传本地文件到fdfs
			Integer userId = SessionUtil.getLogonUID();
			String fileName = fileService.upload2Fdfs(tempName);
			if (fileName == null || fileName.isEmpty())
				throw new AjaxJsonException("视频上传失败");

			// 将视频信息保存到数据库
			UserRecordVideo record = new UserRecordVideo();
			record.setFileName(fileName);
			record.setUserId(userId);
			record.setAddTime(now);
			userService.saveUserRecordVideo(record);

			// 返回JSON消息
			Map<String, String> resut = new HashMap<String, String>();
			resut.put("userId", userId.toString());
			resut.put("fileName", fileName);
			resut.put("addTime", now.toString());
			this.setJson(AjaxData.getSuccessJson("success", resut));

		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new AjaxJsonException("上传失败:" + e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			throw new AjaxJsonException("上传失败:" + e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 对聊
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String im() throws SessionException {
		Integer userId = SessionUtil.getLogonUID();
		this.getRequest().setAttribute("userId", userId);
		return "im";
	}

	/**
	 * 显示图片接口
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String showpic() throws SessionException {
		if (StringUtil.isEmpty(emsg))
			return "showpic";
		String[] ps = this.gameParaDecrypt();
		System.out.println(ps[0] + "_" + ps[1]);
		User user = this.userService.getUserByHashid(ps[0] + "_" + ps[1]);
		this.getRequest().setAttribute("user", user);
		return "showpic";
	}

	/**
	 * 游戏接口URL参数解密
	 * 
	 * @return String[] - String[0]: gmid , String[1]: hashid
	 */
	public String[] gameParaDecrypt() {
		String msg = EncryptUtil.DESdecrypt(emsg);
		String[] paras = msg.split("&");
		String[] ps = new String[2];
		for (String para : paras) {
			String[] p = para.split("=");
			if (p[0].trim().equals("gmid"))
				ps[0] = p[1].trim();
			else if (p[0].trim().equals("hashid"))
				ps[1] = p[1].trim();
		}
		return ps;
	}

	/**
	 * 普通个人信息页【未登录】
	 * 
	 * @return
	 */
	public String showUserInfo() {
		try {
			User user = userService.getUserWithCredit(Integer.parseInt(uid));
			UserInfo userInfo = userService.getuserInfo(Integer.parseInt(uid));
			this.getRequest().setAttribute("user", user);
			this.getRequest().setAttribute("userInfo", userInfo);
			return "userInfo";
		} catch (RuntimeException e) {
			return null;
		}
	}

	public String acceptTask() throws SessionException {
		if (taskAccept == null)
			return "acceptTask";
		User user = SessionUtil.getLogonUser().getUser();
		taskAccept.setUserId(user.getId());
		taskAccept.setUserName(user.getName());
		try {
			this.userService.acceptTask(taskAccept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "acceptTask";
	}

	public String publishTask() throws SessionException {
		if (task == null)
			return "publishTask";
		User user = SessionUtil.getLogonUser().getUser();
		task.setUserId(user.getId());
		task.setUserName(user.getName());
		try {
			this.userService.publishTask(task);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "publishTask";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public File getFiledata() {
		return filedata;
	}

	public void setFiledata(File filedata) {
		this.filedata = filedata;
	}

	public String getFiledataContentType() {
		return filedataContentType;
	}

	public void setFiledataContentType(String filedataContentType) {
		this.filedataContentType = filedataContentType;
	}

	public String getFiledataFileName() {
		return filedataFileName;
	}

	public void setFiledataFileName(String filedataFileName) {
		this.filedataFileName = filedataFileName;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getRecordFileName() {
		return recordFileName;
	}

	public void setRecordFileName(String recordFileName) {
		this.recordFileName = recordFileName;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getSendTo() {
		return sendTo;
	}

	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getTowho() {
		return towho;
	}

	public void setTowho(String towho) {
		this.towho = towho;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getAvg() {
		return avg;
	}

	public void setAvg(String avg) {
		this.avg = avg;
	}

	public String getLastId() {
		return lastId;
	}

	public void setLastId(String lastId) {
		this.lastId = lastId;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getHashid() {
		return hashid;
	}

	public void setHashid(String hashid) {
		this.hashid = hashid;
	}
}
