/**
 * 
 */
package com.navigation.service.Impl;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.security.Security;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.AuthenticationFailedException;
import javax.mail.FetchProfile;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;

import org.apache.axis.AxisFault;
import org.hibernate.HibernateException;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.muc.MultiUserChat;

import t4j.TBlog;
import t4j.TBlogException;
import weibo4j.Weibo;
import weibo4j.WeiboException;
import weibo4j.http.AccessToken;

import com.mime.qweibo.OauthKey;
import com.navigation.dao.AreaDao;
import com.navigation.dao.RoomDao;
import com.navigation.dao.TaskAcceptDao;
import com.navigation.dao.TaskDao;
import com.navigation.dao.TopicDao;
import com.navigation.dao.UserAreaDao;
import com.navigation.dao.UserAuthDao;
import com.navigation.dao.UserCreditDao;
import com.navigation.dao.UserDao;
import com.navigation.dao.UserInfoDao;
import com.navigation.dao.UserLinkDao;
import com.navigation.dao.UserLogStateDao;
import com.navigation.dao.UserMailDao;
import com.navigation.dao.UserMsgDao;
import com.navigation.dao.UserNewsDao;
import com.navigation.dao.UserNoticeDao;
import com.navigation.dao.UserPictureDao;
import com.navigation.dao.UserRecordVideoDao;
import com.navigation.dao.UserScoreLogDao;
import com.navigation.dao.UserVisitLogDao;
import com.navigation.domain.Constant;
import com.navigation.domain.PageBean;
import com.navigation.exception.ServiceException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.Area;
import com.navigation.pojo.Room;
import com.navigation.pojo.Task;
import com.navigation.pojo.TaskAccept;
import com.navigation.pojo.User;
import com.navigation.pojo.UserArea;
import com.navigation.pojo.UserAuth;
import com.navigation.pojo.UserCredit;
import com.navigation.pojo.UserInfo;
import com.navigation.pojo.UserLink;
import com.navigation.pojo.UserLogState;
import com.navigation.pojo.UserMail;
import com.navigation.pojo.UserMsg;
import com.navigation.pojo.UserNews;
import com.navigation.pojo.UserNotice;
import com.navigation.pojo.UserPicture;
import com.navigation.pojo.UserRecordVideo;
import com.navigation.pojo.UserScoreLog;
import com.navigation.pojo.UserVisitLog;
import com.navigation.security.SessionUtil;
import com.navigation.service.UserService;
import com.navigation.utils.ChatRoomUtil;
import com.navigation.utils.Constants;
import com.navigation.utils.DateUtils;
import com.navigation.utils.EncryptUtil;
import com.navigation.utils.HTTPUtils;
import com.navigation.utils.NumberUtils;
import com.navigation.utils.StringUtil;
import com.ztgame.webService.client.ReturnValidateAdOnlyByPasswd;
import com.ztgame.webService.client.Wsdl_passportBindingStub;

/**
 * @author WANGHUI Apr 8, 2011 11:34:55 AM
 */
public class UserServiceImpl implements UserService {

	@Resource
	public UserDao userDao;
	@Resource
	public UserNoticeDao userNoticeDao;
	@Resource
	public TopicDao topicDao;
	@Resource
	public UserLinkDao userLinkDao;
	@Resource
	public UserMailDao userMailDao;
	@Resource
	public UserLogStateDao userLogStateDao;
	@Resource
	public AreaDao areaDao;
	@Resource
	public UserAreaDao userAreaDao;
	@Resource
	public UserInfoDao userInfoDao;
	@Resource
	public UserPictureDao userPictureDao;
	@Resource
	public UserMsgDao userMsgDao;
	@Resource
	public UserRecordVideoDao userRecordVideoDao;
	@Resource
	public UserCreditDao userCreditDao;
	@Resource
	public UserVisitLogDao userVisitLogDao;
	@Resource
	public RoomDao roomDao;
	@Resource
	public UserNewsDao userNewsDao;
	@Resource
	public UserAuthDao userAuthDao;
	@Resource
	public UserScoreLogDao userScoreLogDao;
	@Resource
	public TaskDao taskDao;
	@Resource
	public TaskAcceptDao taskAcceptDao;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.navigation.service.UserService#createNewUser(com.navigation.pojo.User)
	 */
	public User createNewUser(User user) {
		return this.userDao.save(user);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.navigation.service.UserService#createNewUser(java.lang.String,
	 *      java.lang.String, java.lang.String)
	 */
	public User createNewUser(String emailOrPhone, String password, String userName, Integer areaId) {
		User dbUser = this.userDao.getUserByEmail(emailOrPhone);
		if (null != dbUser)
			throw new ServiceException("用户已经存在");
		User user = new User();
		user.setMail(emailOrPhone);
		if (password.length() != 32)
			password = StringUtil.md5(password);
		user.setPassword(password);
		user.setName(userName);
		this.userDao.save(user);

		// AREA权限
		Area area = this.areaDao.get(areaId);
		UserArea userArea = new UserArea();
		userArea.setArea(area);
		userArea.setUser(user);
		this.userAreaDao.save(userArea);

		// 用户帐户
		UserCredit userCredit = new UserCredit();
		userCredit.setUser(user);
		userCredit.setScore(0d);
		userCredit.setCredit(0);
		userCredit.setEarnCredit(0);
		userCredit.setSpendCredit(0);
		userCredit.setStarGrade(0);
		userCredit.setRichGrade(0);
		this.userCreditDao.save(userCredit);
		return user;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.navigation.service.UserService#getUser(java.lang.Integer)
	 */
	public User getUser(Integer id) {
		return this.userDao.get(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.navigation.service.UserService#getUserByEmail(java.lang.String)
	 */
	public User getUserByEmail(String email) {
		return this.userDao.getUserByEmail(email);
	}

	/**
	 * 用户登录
	 */
	public User login(User user) {
		String email = user.getMail();
		if (!StringUtil.isEmail(email))
			throw new ServiceException("邮件地址不正确");
		User dbUser = this.getUserByEmail(email);
		if (dbUser == null)
			throw new ServiceException("用户不存在");
		String password = user.getPassword();
		if (password.length() < 32)
			password = StringUtil.md5(password);
		if (!dbUser.getPassword().equalsIgnoreCase(password))
			throw new ServiceException("密码错误");
		// 写SESSION 登录
		SessionUtil.userLogon(dbUser);
		return dbUser;
	}

	/**
	 * 巨人域帐号登录 检查域帐户密码并 新注册一个用户，并绑定他的邮箱 和 AMT
	 * 
	 * @param email
	 * @param password
	 * @return
	 * @throws MessagingException
	 */
	private User checkAndBindGiantDomainUser(String email, String password) throws MessagingException {
		String host = "pop3.ztgame.com";
		int port = 995;
		String socketType = "pop3";
		String userName = email.substring(0, email.indexOf("@"));
		// 取巨人域邮件 认证
		Properties props = System.getProperties();
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		props.setProperty("mail.pop3.socketFactory.class", SSL_FACTORY);
		Session session = Session.getInstance(props, null);
		Store store = session.getStore(socketType);
		store.connect(host, port, userName, password);
		System.out.println("DOMAIN CHECK");

		// 注册用户
		User dbUser = new User();
		dbUser.setMail(email);
		dbUser.setPassword(StringUtil.md5(password));
		dbUser.setName(userName);
		this.userDao.save(dbUser);

		// 绑定邮箱
		UserLink link = this.getUserLink(dbUser.getId(), Constant.LINKTYPE_BIND_MAIL);
		if (null == link)
			link = new UserLink();
		link.setUser(dbUser);
		link.setLinkType(Constant.LINKTYPE_BIND_MAIL);
		link.setUpdateTime(new Date());
		link.setLinkField1(userName);
		link.setLinkField2(StringUtil.encode(password));
		link.setLinkField3(host + ":" + port);
		link.setLinkField4("SSL");
		if (link.getId() != null) {
			this.userLinkDao.update(link);
		} else
			this.userLinkDao.save(link);

		// 邮件收取通知 标志位
		UserNotice notice = this.userNoticeDao.getUserMailNotice(dbUser.getId(), Constant.NOTICE_TYPE_EMAIL);
		if (null == notice) {
			notice = new UserNotice();
			notice.setUser(dbUser);
			notice.setNoticeType(Constant.NOTICE_TYPE_EMAIL);
			notice.setIsRead(0);
			this.userNoticeDao.save(notice);
		}

		// 绑定AMT
		UserLink userLink = new UserLink();
		userLink.setUser(dbUser);
		userLink.setLinkType(Constant.LINKTYPE_BIND_GIANT);
		userLink.setLinkField1(userName);
		userLink.setUpdateTime(new Date());
		this.userLinkDao.save(userLink);

		// 首次收取邮件
		Folder folder = store.getDefaultFolder();
		folder = folder.getFolder("INBOX");
		if (folder != null) {
			try {
				folder.open(Folder.READ_WRITE);
			} catch (MessagingException ex) {
				folder.open(Folder.READ_ONLY);
			}
			int totalMessages = folder.getMessageCount();
			List<UserMail> list = new ArrayList<UserMail>();
			if (totalMessages > 0) {
				Message[] msgs;
				if (totalMessages < 10)
					msgs = folder.getMessages(1, totalMessages);
				else
					msgs = folder.getMessages(totalMessages - 10, totalMessages);
				FetchProfile fp = new FetchProfile();
				fp.add(FetchProfile.Item.ENVELOPE);
				fp.add(FetchProfile.Item.FLAGS);
				fp.add("X-Mailer");
				folder.fetch(msgs, fp);
				for (int i = 0; i < msgs.length; i++) {
					UserMail mail = this.updateUserMail(msgs[i], link);
					if (null != mail)
						list.add(mail);
				}
			}
			if (list.size() > 0)
				this.userNoticeDao.updateTopicNotice(Constant.NOTICE_TYPE_EMAIL, null, dbUser.getId());// 插入提醒
		}
		return dbUser;
	}

	public void subTopic(Integer userId, Integer topicId, String title) {
		UserNotice notice = this.userNoticeDao.getTopicNotice(userId, topicId);
		if (notice != null)
			throw new ServiceException("您已经订阅了该主题　<a href='javascript:cancleTopicNotice(" + notice.getId() + ");'>[取消订阅？]</a>");
		notice = new UserNotice();
		notice.setIsRead(Constant.NOTICE_READED);
		notice.setNoticeType(Constant.NOTICE_TYPE_TOPIC);
		notice.setRefId(topicId);
		if (!StringUtil.isNullOrEmpty(title)) {
			if (title.length() > 100)
				title = title.substring(0, 100);
			notice.setRefTitle(title);
		}
		notice.setUser(new User(userId));
		this.userNoticeDao.save(notice);
		// 帖子订阅+1
		this.topicDao.updateTopicSubscribeCount(topicId, 1);
	}

	public List<UserNotice> getUserNotice(Integer userId, Integer noticeTpye, boolean isUnRead, Integer p, Integer pageSize) {
		List<UserNotice> noticeList = this.userNoticeDao.getUserNotice(userId, noticeTpye, isUnRead);
		List<UserMsg> msgs = this.userMsgDao.getUserMsg(userId, p, pageSize, false);
		for (UserMsg userMsg : msgs) {
			UserNotice msgNotice = new UserNotice();
			msgNotice.setIsRead(userMsg.getState());
			msgNotice.setNoticeType(Constant.NOTICE_TYPE_MSG);
			msgNotice.setRefTitle(userMsg.getContent());
			msgNotice.setRefId(userMsg.getFromId());
			noticeList.add(msgNotice);
		}
		return noticeList;
	}

	public void subTopicCancle(Integer userId, Integer targetId) {
		UserNotice notice = this.userNoticeDao.get(targetId);
		Integer userOwnId = notice.getUser().getId();
		if (userOwnId != userId.intValue())
			throw new ServiceException("不能操作别人的订阅");
		if (null != notice)
			this.userNoticeDao.delete(notice);
		// 帖子订阅+1
		this.topicDao.updateTopicSubscribeCount(notice.getRefId(), -1);
	}

	public void noticeReaded(Integer userId, Integer noticeId) {
		if (noticeId == -1) {
			this.userNoticeDao.setReadedAll(userId);
		} else {
			UserNotice notice = this.userNoticeDao.get(noticeId);
			if (null != notice) {
				notice.setIsRead(Constant.NOTICE_READED);
				this.userNoticeDao.update(notice); // TODO:这里可以用一句SQL解决
			}
		}
	}

	public void changePassword(Integer userId, String oldpassword, String newpassword) {
		User dbUser = this.getUser(userId);
		if (dbUser == null)
			throw new ServiceException("用户不存在");
		String dbPassword = dbUser.getPassword();
		if (oldpassword.length() != 32)
			oldpassword = StringUtil.md5(oldpassword);
		if (!dbPassword.equalsIgnoreCase(oldpassword))
			throw new ServiceException("旧密码不正确");
		if (newpassword.length() != 32)
			newpassword = StringUtil.md5(newpassword);
		dbUser.setPassword(newpassword);
		this.userDao.update(dbUser);
	}

	public User changeUserIcon(Integer userId, String userIcon) {
		User dbUser = this.getUser(userId);
		if (dbUser == null)
			throw new ServiceException("用户不存在");
		dbUser.setIcon(userIcon);
		this.userDao.update(dbUser);
		return dbUser;
	}

	@Override
	public void updateUser(User user) {
		this.userDao.update(user);
	}

	@Override
	public User changeUserPic(Integer userId, String pic, boolean override) {
		User dbUser = this.getUser(userId);
		if (dbUser == null)
			throw new ServiceException("用户不存在");
		String p = dbUser.getPic();
		if (override || p == null || p.isEmpty()) {
			dbUser.setPic(pic);
			this.userDao.update(dbUser);
		}
		return dbUser;
	}

	public void bindSinaUser(Integer userId, AccessToken accessToken) {
		// 取新浪用户名
		try {
			Weibo weibo = new Weibo();
			weibo.setOAuthAccessToken(accessToken);
			weibo4j.User userInSina = weibo.endSession();
			accessToken.setScreenName(userInSina.getScreenName());
			com.navigation.pojo.User user = this.userDao.get(userId);
			UserLink link = this.getUserLink(userId, Constant.LINKTYPE_BIND_SINA);
			if (null == link)
				link = new UserLink();
			link.setUser(user);
			link.setLinkType(Constant.LINKTYPE_BIND_SINA);
			link.setUpdateTime(new Date());
			link.setLinkField1(userInSina.getScreenName());
			link.setLinkField2(accessToken.getToken());
			link.setLinkField3(accessToken.getTokenSecret());
			link.setLinkField4(String.valueOf(accessToken.getUserId()));
			if (link.getId() != null) {
				this.userLinkDao.update(link);
			} else
				this.userLinkDao.save(link);
			System.out.println(userInSina.getScreenName() + " Bind User! " + DateUtils.format());
		} catch (WeiboException e) {
			e.printStackTrace();
		}
	}

	public UserLink getUserLink(Integer userId, Integer bindType) {
		return this.userLinkDao.getUserLink(userId, bindType);
	}

	public UserLink bindUserMail(Integer userId, String account, String passWord, String hostAndPort, String protocol)
			throws MessagingException {
		if (userId == null || StringUtil.isNullOrEmpty(account) || StringUtil.isNullOrEmpty(passWord)
				|| StringUtil.isNullOrEmpty(hostAndPort) || StringUtil.isNullOrEmpty(protocol)) {
			throw new ServiceException("参数不得为空");
		}
		if (account.indexOf("@") != -1)
			account = account.substring(0, account.indexOf("@"));
		com.navigation.pojo.User user = this.userDao.get(userId);
		// 验证邮箱用户名密码 并绑定
		UserLink link = this.checkUserMailAccount(account, passWord, hostAndPort, protocol, user);
		return link;
	}

	/**
	 * 绑定邮件地址时 检查用户帐户
	 * 
	 * @param account
	 * @param passWord
	 * @param hostAndPort
	 * @param protocol
	 * @throws MessagingException
	 */
	private UserLink checkUserMailAccount(String account, String passWord, String hostAndPort, String protocol, User user)
			throws MessagingException {

		String socketType = "pop3";
		if (hostAndPort.indexOf("imap") != -1)
			socketType = "imap";

		// 取邮件
		Properties props = System.getProperties();
		if (protocol.equalsIgnoreCase("SSL")) {
			Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
			final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
			props.setProperty("mail.pop3.socketFactory.class", SSL_FACTORY);
			System.out.println("SSL MODE checkUserMailAccount");
		} else {
			props.setProperty("mail.pop3.socketFactory.class", "");
		}
		Session session = Session.getInstance(props, null);
		// session.setDebug(true);
		String[] host = hostAndPort.split(":");
		String hostDomain = host[0];
		int port = Integer.parseInt(host[1]);
		Store store;
		store = session.getStore(socketType);
		store.connect(hostDomain, port, account, passWord);

		Folder folder = store.getDefaultFolder();
		folder = folder.getFolder("INBOX");
		if (folder == null)
			throw new ServiceException("INBOX目录不存在");

		try {
			folder.open(Folder.READ_WRITE);
		} catch (MessagingException ex) {
			folder.open(Folder.READ_ONLY);
		}
		int totalMessages = folder.getMessageCount();

		// 绑定
		UserLink link = this.getUserLink(user.getId(), Constant.LINKTYPE_BIND_MAIL);
		if (null == link)
			link = new UserLink();
		link.setUser(user);
		link.setLinkType(Constant.LINKTYPE_BIND_MAIL);
		link.setUpdateTime(new Date());
		link.setLinkField1(account);
		link.setLinkField2(StringUtil.encode(passWord));
		link.setLinkField3(hostAndPort);
		link.setLinkField4(protocol);
		if (link.getId() != null) {
			this.userLinkDao.update(link);
		} else
			this.userLinkDao.save(link);
		// 邮件收取通知 标志位
		UserNotice notice = this.userNoticeDao.getUserMailNotice(user.getId(), Constant.NOTICE_TYPE_EMAIL);
		if (null == notice) {
			notice = new UserNotice();
			notice.setUser(user);
			notice.setNoticeType(Constant.NOTICE_TYPE_EMAIL);
			notice.setIsRead(0);
			this.userNoticeDao.save(notice);
		}

		// 首次收取邮件
		List<UserMail> list = new ArrayList<UserMail>();
		if (totalMessages > 0) {
			Message[] msgs;
			if (totalMessages < 10)
				msgs = folder.getMessages(1, totalMessages);
			else
				msgs = folder.getMessages(totalMessages - 10, totalMessages);
			FetchProfile fp = new FetchProfile();
			fp.add(FetchProfile.Item.ENVELOPE);
			fp.add(FetchProfile.Item.FLAGS);
			fp.add("X-Mailer");
			folder.fetch(msgs, fp);
			for (int i = 0; i < msgs.length; i++) {
				UserMail mail = this.updateUserMail(msgs[i], link);
				if (null != mail)
					list.add(mail);
			}
		}
		if (list.size() > 0)
			this.userNoticeDao.updateTopicNotice(Constant.NOTICE_TYPE_EMAIL, null, user.getId());// 插入提醒

		return link;
	}

	/**
	 * 检查邮件
	 */
	public List<UserMail> checkUserMail(Integer userId) {
		System.out.println(userId + " GET MAIL START #########");
		UserLink link = this.getUserLink(userId, Constant.LINKTYPE_BIND_MAIL);
		if (null == link)
			throw new ServiceException("未绑定邮箱");
		String protocol = link.getLinkField4();
		String account = link.getLinkField1();
		String password = StringUtil.decode(link.getLinkField2());
		String[] host = link.getLinkField3().split(":");
		String hostDomain = host[0];
		int port = Integer.parseInt(host[1]);
		String socketType = "pop3";
		if (hostDomain.indexOf("imap") != -1)
			socketType = "imap";

		// 取邮件
		Properties props = System.getProperties();
		if (protocol.equalsIgnoreCase("SSL")) {
			Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
			final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
			props.setProperty("mail.pop3.socketFactory.class", SSL_FACTORY);
			System.out.println("SSL MODE");
		} else {
			props.setProperty("mail.pop3.socketFactory.class", "");
		}
		Session session = Session.getInstance(props, null);
		// session.setDebug(true);
		Store store;
		List<UserMail> list = new ArrayList<UserMail>();
		try {
			store = session.getStore(socketType);
			store.connect(hostDomain, port, account, password);
			Folder folder = store.getDefaultFolder();
			folder = folder.getFolder("INBOX");
			if (folder == null)
				throw new ServiceException("INBOX目录不存在");

			try {
				folder.open(Folder.READ_WRITE);
			} catch (MessagingException ex) {
				ex.printStackTrace();
				folder.open(Folder.READ_ONLY);
			}
			int totalMessages = folder.getMessageCount();
			if (totalMessages > 0) {
				Message[] msgs;
				if (totalMessages <= 10)
					msgs = folder.getMessages(1, totalMessages);
				else
					msgs = folder.getMessages(totalMessages - 10, totalMessages);
				FetchProfile fp = new FetchProfile();
				fp.add(FetchProfile.Item.ENVELOPE);
				fp.add(FetchProfile.Item.FLAGS);
				fp.add("X-Mailer");
				folder.fetch(msgs, fp);
				for (int i = 0; i < msgs.length; i++) {
					UserMail mail = this.updateUserMail(msgs[i], link);
					if (null != mail)
						list.add(mail);
				}
			}
		} catch (NoSuchProviderException e) {
			throw new ServiceException(e.getMessage());
		} catch (MessagingException e) {
			// e.printStackTrace();
			throw new ServiceException(e.getMessage());
		}
		if (list.size() > 0)
			this.userNoticeDao.updateTopicNotice(Constant.NOTICE_TYPE_EMAIL, null, userId);// 插入提醒
		System.out.println(userId + " GET MAIL END! " + list.size() + " #########");
		return list;
	}

	private UserMail updateUserMail(Message message, UserLink link) {
		UserMail userMail = new UserMail();
		userMail.setAccountId(link.getId());
		userMail.setUserId(link.getUser().getId());
		try {
			String subject = message.getSubject();
			if (subject.length() > 200)
				subject = subject.substring(0, 200);
			userMail.setMailTitle(subject);
			userMail.setAddTime(new Date());
			userMail.setSendTime(message.getSentDate());
			String sid = StringUtil.md5(message.getSubject() + message.getSentDate().toString() + link.getId().toString());
			userMail.setSid(sid);
			userMail = this.userMailDao.saveOrNot(userMail);
			return userMail;
		} catch (HibernateException e) {
			System.out.println(e.getMessage());
		} catch (Exception e) {
		}
		return null;
	}

	public List<UserMail> getUserMail(Integer userId, UserLink link) {
		return this.userMailDao.getUserMail(userId, link);
	}

	public UserLink getUserLink(Integer targetId) {
		return this.userLinkDao.get(targetId);
	}

	public void unBindId(Integer userId, Integer targetId) {
		UserLink link = this.userLinkDao.get(targetId);
		if (null != link && userId == link.getUser().getId().intValue()) {
			this.userLinkDao.delete(link);
		}
	}

	public List<UserMail> getUserMail(Integer userId, Integer p, Integer pageSize) {
		return this.userMailDao.getUserMail(userId, p, pageSize);
	}

	public void changeUserName(Integer userId, String title) {
		User dbUser = this.getUser(userId);
		if (dbUser == null)
			throw new ServiceException("用户不存在");
		dbUser.setName(title);
		this.userDao.update(dbUser);
	}

	public User sinaUserLogin(AccessToken accessToken) {
		User dbUser = null;
		try {
			Weibo weibo = new Weibo();
			weibo.setOAuthAccessToken(accessToken);
			int uid = accessToken.getUserId();
			// 判断是否存在该绑定用户
			dbUser = this.userDao.getUserByEmail(String.valueOf(uid));
			if (dbUser == null) {
				// 取新浪用户名
				weibo4j.User userInSina = weibo.endSession();
				dbUser = this.userDao.getSinaUser(userInSina);
			}
			if (dbUser == null)
				throw new ServiceException("用户不存在");
			// 并绑定新浪帐户
			UserLink link = this.getUserLink(dbUser.getId(), Constant.LINKTYPE_BIND_SINA);
			if (null == link) {
				link = new UserLink();
				link.setUser(dbUser);
				link.setLinkType(Constant.LINKTYPE_BIND_SINA);
				link.setUpdateTime(new Date());
				link.setLinkField1(dbUser.getName());
				link.setLinkField2(accessToken.getToken());
				link.setLinkField3(accessToken.getTokenSecret());
				link.setLinkField4(String.valueOf(accessToken.getUserId()));
				this.userLinkDao.save(link);
			}
			SessionUtil.userLogon(dbUser);
			// 更新在线状态
			SessionUtil.updateUserLogState(dbUser.getId());
			System.out.println(dbUser.getName() + " Sina Login User! " + DateUtils.format());
		} catch (WeiboException e) {
			e.printStackTrace();
		}
		return dbUser;
	}

	public User adLogin(User user) {
		String email = user.getMail();
		if (email.toLowerCase().indexOf("@ztgame.com") == -1)
			email += "@ztgame.com";
		User dbUser = this.getUserByEmail(email);
		boolean checkAdPassword = true;
		// 如果是域帐户，则去域验证
		if (dbUser == null) {
			if (email.toLowerCase().indexOf("ztgame.com") != -1) {
				try {
					dbUser = this.checkAndBindGiantDomainUser(email, user.getPassword());
					checkAdPassword = false;
				} catch (AuthenticationFailedException e) {
					throw new ServiceException("域用户名密码错误");
				} catch (MessagingException e) {
					e.printStackTrace();
					throw new ServiceException(e.getMessage());
				}
			}
		}
		if (dbUser == null)
			throw new ServiceException("用户不存在");
		String password = user.getPassword(); // 用户输入的密码

		// 去域验证密码
		if (checkAdPassword) {
			Wsdl_passportBindingStub stub;
			String name = email;
			if (email.indexOf("@") != -1)
				name = email.substring(0, email.indexOf("@"));
			try {
				stub = new Wsdl_passportBindingStub(new URL("http://passport.ztgame.com/passport/soap/soapserver_passport.php"), null);
				ReturnValidateAdOnlyByPasswd result = stub.validateAdOnlyByPasswd(name, password);
				if (!result.isReturn_flag()) // 域验证未通过
					throw new ServiceException("域帐号错误! " + result.getReturn_remark());
			} catch (AxisFault e) {
				e.printStackTrace();
				throw new ServiceException("域认证通讯出错");
			} catch (MalformedURLException e) {
				e.printStackTrace();
				throw new ServiceException("域认证解析出错");
			} catch (RemoteException e) {
				e.printStackTrace();
				throw new ServiceException("域认证接口出错");
			}
		}

		// 若与本地密码不相符，则更新本地密码 及 绑定邮箱密码
		String dbPassword = dbUser.getPassword();
		if (!dbPassword.equalsIgnoreCase(StringUtil.md5(password))) {
			dbUser.setPassword(StringUtil.md5(password));
			this.userDao.update(dbUser);
			// 修改 域用户 绑定域邮箱密码
			this.userLinkDao.changeAdMailPassword(email, password);
		}

		// 写SESSION 登录
		SessionUtil.userLogon(dbUser);
		return dbUser;
	}

	public void updateUserLogState(Integer userId) {
		this.userLogStateDao.updateUserLogState(userId);
	}

	public UserLogState getUserLogStateByHashCode(String hashCode) {
		return this.userLogStateDao.getByHashCode(hashCode);
	}

	public void bindTencentUser(Integer userId, OauthKey oauth) {
		// 腾讯微博
		com.navigation.pojo.User user = this.userDao.get(userId);
		if (user == null)
			throw new ServiceException("用户不存在");
		UserLink link = this.getUserLink(userId, Constant.LINKTYPE_BIND_QQWEIBO);
		if (null == link)
			link = new UserLink();
		link.setUser(user);
		link.setLinkType(Constant.LINKTYPE_BIND_QQWEIBO);
		link.setUpdateTime(new Date());
		link.setLinkField1(oauth.userName);
		link.setLinkField2(oauth.tokenKey);
		link.setLinkField3(oauth.tokenSecrect);
		link.setLinkField4("");
		if (link.getId() != null) {
			this.userLinkDao.update(link);
		} else
			this.userLinkDao.save(link);
		System.out.println(oauth.userName + " Bind QQ User! " + DateUtils.format());
	}

	public List<UserMail> searchUserMail(Integer userId, String keyWord, Integer p, Integer pageSize) {
		return this.userMailDao.searchMail(userId, keyWord, p, pageSize);
	}

	public void bind163User(Integer userId, t4j.http.AccessToken accessToken) {
		// 网易微博
		com.navigation.pojo.User user = this.userDao.get(userId);
		if (user == null)
			throw new ServiceException("用户不存在");
		// 取用户信息 名字和头像
		TBlog tblog = new TBlog();
		tblog.setToken(accessToken.getToken(), accessToken.getTokenSecret());
		try {
			t4j.data.User user163 = tblog.verifyCredentials();
			UserLink link = this.getUserLink(userId, Constant.LINKTYPE_BIND_163WEIBO);
			if (null == link)
				link = new UserLink();
			link.setUser(user);
			link.setLinkType(Constant.LINKTYPE_BIND_163WEIBO);
			link.setUpdateTime(new Date());
			link.setLinkField1(user163.getScreenName());
			link.setLinkField2(accessToken.getToken());
			link.setLinkField3(accessToken.getTokenSecret());
			link.setLinkField4(user163.getName());
			if (link.getId() != null) {
				this.userLinkDao.update(link);
			} else
				this.userLinkDao.save(link);

			System.out.println(user163.getName() + " Bind 163 User! " + DateUtils.format());
		} catch (TBlogException e) {
			e.printStackTrace();
		}
	}

	public List<UserLink> getUserLinks(Integer userId, Integer[] types) {
		return this.userLinkDao.getUserLinks(userId, types);
	}

	public void updateUserInfo(UserInfo userInfo, Integer id) {
		UserInfo infoInDB = this.userInfoDao.initUserInfo(id);
		if (infoInDB == null)
			throw new ServiceException("初始化用户信息出错");
		if (userInfo.getUserAge() != null)
			infoInDB.setUserAge(userInfo.getUserAge());
		if (userInfo.getUserSex() != null)
			infoInDB.setUserSex(userInfo.getUserSex());
		if (userInfo.getUserProvince() != null)
			infoInDB.setUserProvince(userInfo.getUserProvince());
		if (userInfo.getUserCity() != null)
			infoInDB.setUserCity(userInfo.getUserCity());
		if (userInfo.getUserHeight() != null)
			infoInDB.setUserHeight(userInfo.getUserHeight());
		if (userInfo.getUserWeight() != null)
			infoInDB.setUserWeight(userInfo.getUserWeight());
		if (userInfo.getUserAnswer() != null)
			infoInDB.setUserAnswer(userInfo.getUserAnswer());
		if (userInfo.getUserDegree() != null)
			infoInDB.setUserDegree(userInfo.getUserDegree());
		this.userInfoDao.update(infoInDB);
	}

	public void saveUserPicture(Integer userId, String fileName) {
		UserPicture picture = new UserPicture();
		picture.setUser(new User(userId));
		picture.setPicturePath(fileName);
		this.userPictureDao.save(picture);
	}

	public List<UserPicture> getUserPics(Integer userId, Integer p, Integer pageSize) {
		return this.userPictureDao.getUserPics(userId, p, pageSize);
	}

	@Override
	public PageBean getUserPicsPageBean(Integer userId, Integer p, Integer pageSize) {
		Integer count = this.userPictureDao.getUserPicsCount(userId);
		if (count > 0) {
			PageBean pb = new PageBean();
			List<UserPicture> pics = this.userPictureDao.getUserPics(userId, p, pageSize);
			pb.setRecordList(pics);
			pb.setRecordCount(count);
			return pb;
		}
		return null;
	}

	@Override
	public List<User> randUsersWithPic(Integer userId, int num) {
		List<User> lst = this.userDao.randUsersWithPic(userId, num);
		if (lst.size() < num) {
			List<User> ls = this.userDao.randUsers(userId, num - lst.size());
			lst.addAll(ls);
		}
		return lst;
	}

	@Override
	public List<User> randUsersWithPic(int num) {
		List<User> lst = this.userDao.randUsersWithPic(num);
		if (lst.size() < num) {
			List<User> ls = this.userDao.randUsers(num - lst.size());
			lst.addAll(ls);
		}
		return lst;
	}

	public void sendMsg(Integer userId, Integer toUserId, String msg) {
		UserMsg userMsg = new UserMsg();
		userMsg.setUserId(toUserId);
		userMsg.setFromId(userId);
		userMsg.setContent(msg);
		userMsg.setAddTime(new Date());
		userMsg.setState(0);
		this.userMsgDao.save(userMsg);
	}

	public UserInfo getuserInfo(Integer userId) {
		return this.userInfoDao.getUserInfo(userId);
	}

	public void saveUserRecordVideo(UserRecordVideo record) {
		this.userRecordVideoDao.save(record);
	}

	@Override
	public List<UserCredit> getUserEarnCreditList(int num) {
		return userCreditDao.getUserCreditList(num, UserCredit.PROP_EARN_CREDIT);
	}

	@Override
	public List<UserCredit> getUserSpendCreditList(int num) {
		return userCreditDao.getUserCreditList(num, UserCredit.PROP_SPEND_CREDIT);
	}

	@Override
	public List<UserCredit> getPopUserCreditList(int num) {
		return userCreditDao.getUserCreditList(num, UserCredit.PROP_VISITS);
	}

	@Override
	public void updateUserLiveState(Integer userId, Integer state, Integer camNum) throws SessionException {
		UserLogState bean = this.userLogStateDao.getByUserId(userId);
		if (bean == null)
			throw new SessionException("ex.no_logon");
		bean.setLiveState(state);
		if (state == Constant.LIVE_STATE_ON)
			bean.setLastLiveTime(new Date());
		if (camNum != null)
			bean.setCamNum(camNum);
		this.userLogStateDao.update(bean);
	}

	@Override
	public Room getRoomLiveInfo(Room room) {
		try {
			Connection conn = SessionUtil.getConnection();
			MultiUserChat muc2 = new MultiUserChat(conn, room.getRoomNo() + "@conference." + conn.getServiceName());
			muc2.join("qule");
			room.setOccupantsCount(muc2.getOccupantsCount());
			muc2.leave();
		} catch (XMPPException e) {
			e.printStackTrace();
		}
		return room;
	}

	@Override
	public Object[] getLiveUserList(int num) {
		List<Integer> list = this.userDao.getLiveUserIdList(num);
		List<User> ulist = new ArrayList<User>();
		if (list != null) {
			for (Integer uid : list) {
				ulist.add(this.getUserWithCredit(uid));
			}
		}
		if (ulist.size() < num) {
			// 直播用户太少，则取明星等级高的用户
			int limit = num - ulist.size();
			List<User> lst = userDao.getUserCreditList(limit, UserCredit.PROP_EARN_CREDIT);
			if (lst != null && !lst.isEmpty())
				ulist.addAll(lst);
		}
		int index = 0;
		Integer max = 0;
		for (int i = 0; i < ulist.size(); i++) {
			User dbUser = ulist.get(i);
			Room room = this.getRoomByOwner(dbUser.getId());
			if (room == null) {
				room = this.createRoom(dbUser.getId(), dbUser.getName());
				try {
					ChatRoomUtil.createReservedRoom(dbUser.getId(), room.getRoomNo(), room.getRoomName());
				} catch (XMPPException e) {
					e.printStackTrace();
				}
			} else {
				Integer cnt = room.getOccupantsCount();
				if (cnt == null)
					cnt = 0;
				if (cnt > max) {
					max = cnt;
					index = i;
				}
			}
			dbUser.setRoom(room);
		}
		Object[] objs = new Object[2];
		objs[0] = ulist.get(index);
		ulist.remove(index);
		objs[1] = ulist;
		return objs;
	}

	@Override
	public void changeUserPoster(Integer userId, String poster) {
		User dbUser = this.getUser(userId);
		if (dbUser == null)
			throw new ServiceException("用户不存在");
		dbUser.setPoster(poster);
		this.userDao.update(dbUser);
	}

	@Override
	public User getUserWithCredit(Integer userId) {
		User dbUser = this.getUser(userId);
		if (dbUser != null) {
			UserCredit credit = this.userCreditDao.getCredit(userId);
			dbUser.setUserCredit(credit);
		} else {
			throw new ServiceException("用户不存在");
		}
		return dbUser;
	}

	@Override
	public User getUserWithCreditAndRoom(Integer userId) {
		User dbUser = this.getUser(userId);
		if (dbUser != null) {
			UserCredit credit = this.userCreditDao.getCredit(userId);
			dbUser.setUserCredit(credit);
		} else {
			throw new ServiceException("用户不存在");
		}
		Room room = this.getRoomByOwner(dbUser.getId());
		if (room == null) {
			room = this.createRoom(dbUser.getId(), dbUser.getName());
			try {
				ChatRoomUtil.createReservedRoom(dbUser.getId(), room.getRoomNo(), room.getRoomName());
			} catch (XMPPException e) {
				e.printStackTrace();
			}
		}
		dbUser.setRoom(room);
		return dbUser;
	}

	@Override
	public User getUserWithCreditAndState(Integer userId) {
		User dbUser = this.getUser(userId);
		if (dbUser != null) {
			UserCredit credit = this.userCreditDao.getCredit(userId);
			dbUser.setUserCredit(credit);
			UserLogState state = this.userLogStateDao.getByUserId(userId);
			dbUser.setUserLogState(state);
		} else {
			throw new ServiceException("用户不存在");
		}
		return dbUser;
	}

	@Override
	public User getUserAllInfo(Integer userId) {
		User dbUser = this.getUser(userId);
		if (dbUser != null) {
			UserCredit credit = this.userCreditDao.getCredit(userId);
			dbUser.setUserCredit(credit);
			UserLogState state = this.userLogStateDao.getByUserId(userId);
			dbUser.setUserLogState(state);
		} else {
			throw new ServiceException("用户不存在");
		}
		Room room = this.getRoomByOwner(dbUser.getId());
		if (room == null) {
			room = this.createRoom(dbUser.getId(), dbUser.getName());
			try {
				ChatRoomUtil.createReservedRoom(dbUser.getId(), room.getRoomNo(), room.getRoomName());
			} catch (XMPPException e) {
				e.printStackTrace();
			}
		}
		dbUser.setRoom(room);
		return dbUser;
	}

	@Override
	public void addVisit(Integer ownerId, Integer pageId, Date date) {
		// 记日志
		UserVisitLog dbLog = this.userVisitLogDao.get(ownerId, pageId, date);
		if (dbLog == null) {
			UserVisitLog log = new UserVisitLog();
			log.setOwner(ownerId);
			log.setPage(pageId);
			log.setVisits(1);
			log.setDate(date);
			this.userVisitLogDao.save(log);
		} else {
			Integer visits = dbLog.getVisits();
			dbLog.setVisits(visits == null ? 1 : visits + 1);
			this.userVisitLogDao.update(dbLog);
		}
		// 记总量
		UserCredit dbcredit = this.userCreditDao.getCredit(ownerId);
		Integer vs = dbcredit.getVisits();
		dbcredit.setVisits(vs == null ? 1 : vs + 1);
		this.userCreditDao.update(dbcredit);
	}

	@Override
	public Integer addAttention(Integer userId, User targetUser) throws ServiceException {
		Integer targetId = targetUser.getId();
		// 更新关注列表
		UserCredit userCredit = userCreditDao.getCredit(userId);
		String userAtt = userCredit.getAttList();
		if (StringUtil.containsItem(userAtt, targetId.toString()))
			throw new ServiceException("已关注了该用户");
		userCredit.setAttList(StringUtil.addStringItem(userAtt, targetId.toString()));
		userCreditDao.update(userCredit);

		// 更新粉丝列表
		UserCredit targetCredit = userCreditDao.getCredit(targetId);
		String targetFans = targetCredit.getFansList();
		if (StringUtil.containsItem(targetFans, userId.toString()))
			throw new ServiceException("已关注了该用户");
		targetCredit.setFansList(StringUtil.addStringItem(targetFans, userId.toString()));
		Integer fansNum = targetCredit.getFansNum();
		Integer newFansNum = (fansNum == null) ? 1 : fansNum + 1;
		targetCredit.setFansNum(newFansNum);
		userCreditDao.update(targetCredit);

		// 更新用户动态
		UserNews userNews = new UserNews();
		userNews.setContent(targetUser.getName());
		userNews.setRefUid(targetId);
		userNews.setUpdateTime(new Date());
		userNews.setUserId(userId);
		userNews.setType(Constant.USER_NEWS_TYPE_ATT_USER);
		userNewsDao.save(userNews);

		return newFansNum;
	}

	@Override
	public UserInfo findUserInfo(Integer userId) {
		return this.userInfoDao.initUserInfo(userId);
	}

	@Override
	public Room createRoom(Integer userId, String roomName) {
		Room room = new Room();
		room.setUserId(userId);
		// room.setRoomName(roomName);
		room.setCreateTime(new Date());
		Room dbRoom = roomDao.save(room);
		Integer roomNo = ChatRoomUtil.genRoomNo(dbRoom.getId());
		dbRoom.setRoomNo(roomNo);
		dbRoom.setRoomName(String.valueOf(roomNo));
		roomDao.update(dbRoom);
		return dbRoom;
	}

	@Override
	public void updateRoom(Room room) {
		this.roomDao.update(room);
	}

	@Override
	public Room getRoomByNo(Integer roomNo) {
		return roomDao.getRoom(roomNo);
	}

	@Override
	public Room getRoomByOwner(Integer userId) {
		return roomDao.getByOwner(userId);
	}

	@Override
	public UserNews addUserNews(UserNews userNews) {
		return userNewsDao.save(userNews);
	}

	@Override
	public UserNews uploadImgUserNews(Integer userId, String imgSrc, int imgNum) {
		if (imgNum > 0 && imgSrc != null) {
			UserNews news = new UserNews();
			news.setUserId(userId);
			news.setContent("上传了" + imgNum + "张照片");
			news.setRefImg(imgSrc);
			news.setType(Constant.USER_NEWS_TYPE_UPLOAD_IMG);
			news.setUpdateTime(new Date());
			return userNewsDao.save(news);
		}
		return null;
	}

	@Override
	public UserNews commentImgUserNews(Integer userId, String comment, String refImg, Integer refUid) {
		UserNews news = new UserNews();
		news.setUserId(userId);
		news.setContent(comment);
		news.setRefImg(refImg);
		news.setRefUid(refUid);
		news.setUpdateTime(new Date());
		news.setType(Constant.USER_NEWS_TYPE_COMMENT_IMG);
		return userNewsDao.save(news);
	}

	@Override
	public UserNews msgUserNews(Integer userId, String content) {
		UserNews news = new UserNews();
		news.setUserId(userId);
		news.setContent(content);
		news.setUpdateTime(new Date());
		news.setType(Constant.USER_NEWS_TYPE_MSG);
		return userNewsDao.save(news);
	}

	@Override
	public UserNews refUserNews(Integer userId, String content, Integer refId) {
		UserNews news = new UserNews();
		news.setUserId(userId);
		news.setContent(content);
		news.setUpdateTime(new Date());
		news.setType(Constant.USER_NEWS_TYPE_MSG);
		news.setRefId(refId);
		return userNewsDao.save(news);
	}

	@Override
	public UserNews taskUserNews(Integer userId, Integer taskId, String taskName, Integer status) {
		UserNews news = new UserNews();
		news.setUserId(userId);
		news.setContent(taskName);
		news.setUpdateTime(new Date());
		news.setType(status);
		news.setRefId(taskId);
		return userNewsDao.save(news);
	}

	@Override
	public List<UserNews> getUserNewsList(Integer userId, Integer p, Integer pageSize) {
		List<UserNews> userNews = this.userNewsDao.getUserNewsList(userId, p, pageSize);
		return userNews;
	}

	@Override
	public List<UserAuth> getAwaitAuthList(Integer p, Integer pageSize) {
		return this.userAuthDao.getAwaitAuthList(p, pageSize);
	}

	@Override
	public List<UserAuth> getAwaitAuthList() {
		return this.userAuthDao.getAwaitAuthList();
	}

	@Override
	public void submitAuth(Integer userId, String photoNames) {
		Date now = new Date();
		UserAuth ua = new UserAuth();
		ua.setUserId(userId);
		ua.setCreateTime(now);
		ua.setUpdateTime(now);
		ua.setStatus(Constant.USER_AUTH_STATUS_NEW);
		ua.setPhotoName(photoNames);
		this.userAuthDao.save(ua);
	}

	@Override
	public boolean neededAuth(Integer userId) {
		UserAuth ua = this.userAuthDao.getBy(userId);
		if (ua == null) {
			return true;
		} else {
			Integer status = ua.getStatus();
			if (status != null && status == Constant.USER_AUTH_STATUS_INVALID)
				return true;
		}
		return false;
	}

	@Override
	public List<User> getUserScoreList(int num) {
		List<User> list = new ArrayList<User>();
		List<Object[]> lst = this.userDao.getUserScoreList(num);
		for (Object[] objs : lst) {
			User user = new User();
			user.setId((Integer) objs[0]);
			user.setName((String) objs[1]);
			UserCredit uc = new UserCredit();
			uc.setScore((Double) objs[2]);
			uc.setScoreNum((Integer) objs[3]);
			user.setUserCredit(uc);
			list.add(user);
		}
		return list;
	}

	@Override
	public Double giveScore(Integer userId, Integer scorer, Double score) {
		UserScoreLog record = new UserScoreLog();
		record.setUserId(userId);
		record.setScorer(scorer);
		record.setScore(score);
		record.setCreateTime(new Date());
		this.userScoreLogDao.save(record);

		Double avg = this.userScoreLogDao.getUserAvgScore(userId);
		if (avg != null) {
			UserCredit uc = this.userCreditDao.getCredit(userId);
			Integer num = uc.getScoreNum();
			avg = Double.valueOf(NumberUtils.format(avg, "###0.0"));
			uc.setScoreNum(num == null ? 0 : num + 1);
			uc.setScore(avg);
			this.userCreditDao.update(uc);
		}
		return avg;
	}

	@Override
	public void updateRoomOccuCnt(Integer roomNo, Integer count) {
		Room room = this.roomDao.getRoom(roomNo);
		if (room != null) {
			room.setOccupantsCount(count);
			this.roomDao.update(room);
		}
	}

	@Override
	public List<UserNews> getPublicUserNews(int num, Date afterTime) {
		List<UserNews> lst = this.userNewsDao.getUserNewsList(num, new Integer[] { 3, 5, 7, 8, 9 }, afterTime);
		for (UserNews news : lst) {
			Integer uid = news.getUserId();
			if (uid != null) {
				news.setUserName(userDao.get(uid).getName());
			}
			// Integer refUid = news.getRefUid();
			// if (refUid != null) {
			// news.setRefUserName(userDao.get(refUid).getName());
			// }
		}
		return lst;
	}

	@Override
	public void acceptTask(TaskAccept taskAccept) {
		if (taskAccept != null) {
			Date now = new Date();
			taskAccept.setCreateTime(now);
			taskAccept.setUpdateTime(now);
			taskAccept.setStatus(Constant.TASK_ACCEPT_STATUS_NEW);
			this.taskAcceptDao.save(taskAccept);
		}
	}

	@Override
	public void publishTask(Task task) {
		if (task != null) {
			Date now = new Date();
			task.setCreateTime(now);
			task.setUpdateTime(now);
			task.setStatus(Constant.TASK_ACCEPT_STATUS_NEW);
			this.taskDao.save(task);
		}
	}

	@Override
	public User getUserByHashid(String hashid) {
		return this.userDao.getByHashid(hashid);
	}

	@Override
	public void passAuth(Integer authId) {
		UserAuth auth = this.userAuthDao.get(authId);
		User user = this.userDao.get(auth.getUserId());
		auth.setStatus(Constant.USER_AUTH_STATUS_VALID);
		this.userAuthDao.update(auth);
		user.setIsAuth(Constant.USER_IS_AUTH_YES);
		this.userDao.update(user);

		if (!StringUtil.isEmpty(user.getHashid())) {
			this.authCallback(user.getHashid());
		}
	}

	public void authCallback(String hashid) {
		String[] ps = hashid.split("_");
		if (ps.length == 2) {
			String p = "gmid=" + ps[0] + "&hashid=" + ps[1];
			String secret = EncryptUtil.DESencrypt(p);
			HTTPUtils.sendGet(Constants.getInstance().auth_callback_BW, "emsg=" + secret);
		}
	}

	@Override
	public void unpassAuth(Integer authId) {
		UserAuth auth = this.userAuthDao.get(authId);
		User user = this.userDao.get(auth.getUserId());
		auth.setStatus(Constant.USER_AUTH_STATUS_INVALID);
		this.userAuthDao.update(auth);
		user.setIsAuth(Constant.USER_IS_AUTH_NO);
		this.userDao.update(user);
	}

	@Override
	public void bindGameUser(String gmhashid, User user) {
		if (StringUtil.isEmpty(user.getHashid())) {
			user.setHashid(gmhashid);
			this.userDao.update(user);
			SessionUtil.freshSession(user.getId());
		}
	}

	@Override
	public void bindGameUser(String gmhashid, Integer userId) {
		User user = this.getUser(userId);
		if (user == null)
			throw new ServiceException("用户不存在");
		this.bindGameUser(gmhashid, user);
	}
}
