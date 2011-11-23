/**
 * 
 */
package com.navigation.action;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.axis.AxisFault;

import com.navigation.dao.UserLinkDao;
import com.navigation.domain.Constant;
import com.navigation.pojo.Topic;
import com.navigation.pojo.User;
import com.navigation.pojo.UserCredit;
import com.navigation.pojo.UserLink;
import com.navigation.pojo.UserMail;
import com.navigation.security.SessionUtil;
import com.navigation.service.TopicService;
import com.navigation.service.UserService;
import com.workflow.web.DealWebServiceHttpBindingStub;
import com.workflow.web.DetailModel;

/**
 * 首页
 * 
 * @author zhuchuanyong
 */
public class IndexAction extends BaseAction {

	private static final long serialVersionUID = 6204392166693025377L;

	@Resource
	public UserService userService;

	@Resource
	public TopicService topicService;

	@Resource
	public UserLinkDao userLinkDao;

	/**
	 * 注册
	 * 
	 * @return
	 */
	public String register() {
		return "register";
	}

	/**
	 * 只有头 软件嵌入
	 * 
	 * @return
	 */
	public String app() {
		return "app";
	}

	/**
	 * 首页
	 */
	public String index() throws Exception {
		// 获取直播用户
		List<User> liveList = userService.getLiveUserList(10);
		this.getRequest().setAttribute("liveList", liveList);

		// 获取排行榜
		List<UserCredit> starList = userService.getUserEarnCreditList(8);
		List<UserCredit> richList = userService.getUserSpendCreditList(8);
		List<UserCredit> popList = userService.getPopUserCreditList(8);
		this.getRequest().setAttribute("starList", starList);
		this.getRequest().setAttribute("richList", richList);
		this.getRequest().setAttribute("popList", popList);

		// 获取随机图片
		List<String[]> photos = this.randomPhotos(10);
		this.getRequest().setAttribute("photos", photos);

		return "index";
	}

	/**
	 * 获取随机图片
	 * 
	 * @param count
	 * @return
	 */
	public List<String[]> randomPhotos(int count) {
		String[] names = new String[] { "侬本佳人", "MC安可儿", "℡孤单", "格格不乖", "〆ツ❤雨兒", "Anna", "︶￣乐✿乐", "绝世妖孽", "Catherine", "◕樂۩۞۩児◕" };
		List<String[]> lst = new ArrayList<String[]>();
		List<Integer> lt = new ArrayList<Integer>();
		for (int i = 0; i < count; i++) {
			int n = (int) (Math.random() * 10);
			String fn = String.valueOf(n);
			String un = names[n];
			if (lt.contains(n)) {
				i--;
				continue;
			} else {
				lst.add(new String[] { fn, un });
				lt.add(n);
			}
		}
		return lst;
	}

	/**
	 * 首页
	 */
	public String index2() throws Exception {
		List<UserMail> mailList = null;
		UserLink userLink = null;
		UserLink userMailLink = null;
		try {
			Integer userId = SessionUtil.getLogonUID();
			userMailLink = this.userLinkDao.getUserLink(userId, Constant.LINKTYPE_BIND_MAIL);
			this.getRequest().setAttribute("userMailLink", userMailLink);
			if (null != userMailLink) {
				// 取邮件
				mailList = this.userService.getUserMail(userId, p, pageSize);
				this.getRequest().setAttribute("mailList", mailList);
			}
			// 取AMT 待办
			userLink = this.userLinkDao.getUserLink(userId, Constant.LINKTYPE_BIND_GIANT);
			this.getRequest().setAttribute("amtLink", userLink);
		} catch (Exception e) {
		}
		if (userLink != null) {
			String ssoDomainName = userLink.getLinkField1();
			URL url;
			try {
				url = new URL(Constant.AMT_LINK);
				DealWebServiceHttpBindingStub web = new DealWebServiceHttpBindingStub(url, null);
				DetailModel[] detail = web.getDeallistByUsername(ssoDomainName);
				this.getRequest().setAttribute("amtList", detail);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (AxisFault e) {
				e.printStackTrace();
			} catch (RemoteException e) {
				e.printStackTrace();
			}
		}
		pageSize = 6;
		// 取首页讨论
		List<Topic> topicList = this.topicService.getTopicList(1, pageSize, null, null, areaId);
		this.getRequest().setAttribute("topicList", topicList);
		// 取新闻
		List<Topic> newsList = this.topicService.getTopicList(1, pageSize, null, 2, areaId);
		this.getRequest().setAttribute("newsList", newsList);
		// 取策划
		List<Topic> designList = this.topicService.getTopicList(1, pageSize, null, 4, areaId);
		this.getRequest().setAttribute("designList", designList);

		return "index";
	}

	/**
	 * ChangeLog
	 * 
	 * @return
	 */
	public String ajaxGetChangeLog() {
		// try {
		// MsgShow.show(new String[] { "-L",
		// "imap://i319962:superman163@imap.163.com" });
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// SmtpSend.main(null);
		return "ajaxGetChangeLog";
	}
}