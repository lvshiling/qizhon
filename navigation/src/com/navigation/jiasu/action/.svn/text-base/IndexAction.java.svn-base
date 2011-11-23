/**
 * 
 */
package com.navigation.jiasu.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.navigation.action.BaseAction;
import com.navigation.dao.NewsDao;
import com.navigation.domain.AjaxData;
import com.navigation.domain.PageBean;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.jiasu.dao.GameDownStatusDao;
import com.navigation.jiasu.dao.GameZoneDao;
import com.navigation.jiasu.dao.JiasuRoleDao;
import com.navigation.jiasu.dao.RadacctDao;
import com.navigation.jiasu.pojo.GameZone;
import com.navigation.pojo.News;
import com.navigation.pojo.Topic;
import com.navigation.pojo.TopicReply;
import com.navigation.pojo.TopicSort;
import com.navigation.pojo.User;
import com.navigation.security.SessionUtil;
import com.navigation.security.UserState;
import com.navigation.service.TopicService;
import com.navigation.utils.DateUtils;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 * 
 * Jul 1, 2011 6:25:14 PM
 */
public class IndexAction extends BaseAction {

	/**
	 * 加速器
	 */
	private static final long serialVersionUID = 1L;
	Integer areaId = 2;

	@Resource
	public NewsDao newsDao;
	@Resource
	public RadacctDao radacctDao;
	@Resource
	public TopicService topicService;
	@Resource
	public GameDownStatusDao gameDownStatusDao;
	@Resource
	public GameZoneDao gameZoneDao;

	// answer 9-2
	@Resource
	public JiasuRoleDao jiasuRoleDao;

	public String startDate;
	public String endDate;
	public Integer topicSortId;
	public Integer topicId;

	/**
	 * 首页
	 * 
	 * @return
	 */
	public String index() {

		// test answer 9-2
		// isAdmin("123");
		// getAllGameZoneList();
		pageSize = 7;
		List<News> newsList = newsDao.getNewsList(areaId, p, pageSize);
		this.getRequest().setAttribute("newsList", newsList);
		return "index";
	}

	/**
	 * 新闻列表
	 * 
	 * @return
	 */
	public String ajaxGetNewsList() {
		PageBean newsPageBean = this.newsDao.getNewsPageBean(areaId, p, pageSize);
		this.getRequest().setAttribute("newsPageBean", newsPageBean);
		return "ajaxGetNewsList";
	}

	/**
	 * 下载
	 * 
	 * @return
	 */
	public String down() {
		pageSize = 6;
		List<News> newsList = newsDao.getNewsList(areaId, p, pageSize);
		this.getRequest().setAttribute("newsList", newsList);
		return "down";
	}

	/**
	 * 注册
	 * 
	 * @return
	 */
	public String register() {

		return "register";
	}

	/**
	 * 个人中心
	 * 
	 * @return
	 */
	public String home() {

		return "home";
	}

	/**
	 * 新闻
	 * 
	 * @return
	 */
	public String news() {
		PageBean newsPageBean = this.newsDao.getNewsPageBean(areaId, p, pageSize);
		this.getRequest().setAttribute("newsPageBean", newsPageBean);
		return "news";
	}

	/**
	 * 新闻 详细
	 * 
	 * @return
	 */
	public String newsDetail() {
		News news = this.newsDao.get(targetId);
		this.getRequest().setAttribute("news", news);
		return "newsDetail";
	}

	/**
	 * 论坛
	 * 
	 * @return
	 */
	public String faq() {
		// 取贴子分类
		List<TopicSort> sortList = this.topicService.getPublicTopicSort(areaId);
		this.getRequest().setAttribute("sortList", sortList);
		this.getRequest().setAttribute("nowArea", areaId);

		if (sortList.size() > 0) {
			// 取得贴子
			TopicSort sort = sortList.get(0);
			PageBean pageBean = topicService.getTopicListBean(p, pageSize, null, sort.getId(), areaId);
			this.getRequest().setAttribute("topicPageBean", pageBean);
		}
		return "faq";
	}

	/**
	 * 取得帖子的回复
	 * 
	 * @return
	 */
	public String ajaxGetTopicReply() {
		Topic topic = this.topicService.getTopicByIdFetchUser(topicId);
		if (null != topic) {
			this.getRequest().setAttribute("topic", topic);
			List<TopicReply> replyList = this.topicService.getTopicReplyList(topic, null);
			this.getRequest().setAttribute("topicReplyList", replyList);
		}
		return "ajaxGetTopicReply";
	}

	/**
	 * 取得论坛 分页
	 * 
	 * @return
	 */
	public String ajaxGetTopicList() {
		PageBean pageBean = topicService.getTopicListBean(p, pageSize, null, topicSortId, areaId);
		this.getRequest().setAttribute("topicPageBean", pageBean);
		return "ajaxGetTopicList";
	}

	/**
	 * 支持游戏
	 * 
	 * @return
	 */
	public String games() {
		return "games";
	}

	/**
	 * 记录查询
	 * 
	 * @return
	 */
	public String record() {
		endDate = DateUtils.format(new Date(), "yyyyMMdd");
		startDate = DateUtils.format(new Date(), "yyyyMM") + "01";
		return "record";
	}

	/**
	 * 分页记录查询
	 * 
	 * @return
	 */
	public String ajaxGetRecordsList() {
		try {
			UserState userState = SessionUtil.getLogonUser();
			User user = userState.getUser();
			target = user.getMail();
		} catch (SessionException e) {
			e.printStackTrace();
		}
		if (!StringUtil.isNullOrEmpty(target) && !StringUtil.isNullOrEmpty(startDate) && !StringUtil.isNullOrEmpty(endDate)) {
			PageBean pageBean = this.radacctDao.getListByName(target, p, pageSize, startDate, endDate);
			this.getRequest().setAttribute("pageBean", pageBean);
			// 获取时间总和
			if (p == 1) {
				Integer count = this.radacctDao.getTimeCount(target, startDate, endDate);
				this.getRequest().setAttribute("count", count / 60);
			}
		}
		return "ajaxGetRecordsList";
	}

	/**
	 * 修改个人信息
	 * 
	 * @return
	 */
	public String edit() {

		return "edit";
	}

	/**
	 * 找回密码
	 * 
	 * @return
	 */
	public String findPassword() {

		return "findPassword";
	}

	/**
	 * 记数器
	 * 
	 * @return
	 */
	public String ajaxCount() throws AjaxJsonException {
		HttpServletRequest request = this.getRequest();
		String gameName = request.getParameter("game");
		String gameVersion = request.getParameter("name");
		String host = request.getParameter("host");
		if (StringUtil.isNullOrEmpty(gameName))
			throw new AjaxJsonException("game not null");
		if (StringUtil.isNullOrEmpty(gameVersion))
			throw new AjaxJsonException("name not null");
		try {
			this.gameDownStatusDao.updateGame(gameName, gameVersion, host);
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException("insert error");
		}
		this.setJson(AjaxData.getSuccessJson("success", null));
		return AJAX_JSON_RESULT;
	}

	/**
	 * <pre>
	 * 用户新增或更改游戏区信息
	 * URL: /jiasu/ajaxGameZone.do?querystring
	 * </pre>
	 * 
	 * @return
	 */
	public String ajaxGameZone() throws AjaxJsonException {

		HttpServletRequest request = this.getRequest();
		String company = request.getParameter("company");
		String game = request.getParameter("game");
		String zone = request.getParameter("zone");
		String gateway = request.getParameter("gateway");
		String port = request.getParameter("port");
		String user = request.getParameter("user");
		String action = request.getParameter("action");

		if (StringUtil.isNullOrEmpty(action))
			throw new AjaxJsonException("action is null");
		if (StringUtil.isNullOrEmpty(game))
			throw new AjaxJsonException("game is null");
		if (StringUtil.isNullOrEmpty(zone))
			throw new AjaxJsonException("zone is null");

		try {
			GameZone record = gameZoneDao.getByGameZone(game, zone);
			if (record == null) { // 不存在对象 则创建
				record = new GameZone();
				record.setGame(game);
				record.setZone(zone);
				if (!StringUtil.isNullOrEmpty(company))
					record.setCompany(company);
				if (!StringUtil.isNullOrEmpty(gateway))
					record.setGateway(gateway);
				if (!StringUtil.isNullOrEmpty(user))
					record.setUser(user);
				if (!StringUtil.isNullOrEmpty(port))
					record.setPort(port);
				this.gameZoneDao.save(record);
			} else { // 已存在 则更新
				if (!StringUtil.isNullOrEmpty(company))
					record.setCompany(company);
				if (!StringUtil.isNullOrEmpty(gateway))
					record.setGateway(gateway);
				if (!StringUtil.isNullOrEmpty(user))
					record.setUser(user);
				if (!StringUtil.isNullOrEmpty(port))
					record.setPort(port);
				this.gameZoneDao.update(record);
			}

		} catch (NumberFormatException ne) {
			ne.printStackTrace();
			throw new AjaxJsonException("param error");
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException("insert or update error");
		}
		this.setJson(AjaxData.getSuccessJson("success", null));
		return AJAX_JSON_RESULT;
	}

	/**
	 * 帮助页面
	 * 
	 * @return
	 */
	public String acctHelp() {
		return "acctHelp";
	}

	/**
	 * 查询所有用户的游戏名字和区
	 * 
	 * @throws SessionException
	 * 
	 */
	public String gamezone(){
		try {
			this.gameZoneList();
		} catch (SessionException e) {
			 return "toLogin";
		}
		return "gamezone";
	}

	public String ajaxGameZoneList() throws SessionException {
		try {
			this.gameZoneList();
		} catch (SessionException e) {
			 return "toLogin";
		}
		return "ajaxGameZoneList";
	}

	public void gameZoneList() throws SessionException {
		UserState userState = SessionUtil.getLogonUser();
		User user = userState.getUser();
		String logonName = user.getMail();

		boolean isAdmin = false;
		List lst = jiasuRoleDao.isJiasuAdmin(SessionUtil.getLogonUID());
		if (lst != null && !lst.isEmpty()) {
			this.getRequest().setAttribute("login_role", "SUCCESS");
			isAdmin = true;
		} else {
			this.getRequest().setAttribute("login_role", "FAIL");
			isAdmin = false;
		}
		PageBean pageBean = gameZoneDao.getGameZonesList(p, pageSize);
		List<GameZone> list = pageBean.getRecordList();
		for (GameZone gameZone : list) {
			String name = gameZone.getUser();
			if (!isAdmin && !logonName.equals(name)) {
				gameZone.setUser(maskUserName(name));
				gameZone.setGateway(maskIpArr(gameZone.getGateway()));
			}
			gameZone.setCompany(StringUtil.transcoding(gameZone.getCompany(), "ISO-8859-1", "GB2312"));
			gameZone.setGame(StringUtil.transcoding(gameZone.getGame(), "ISO-8859-1", "GB2312"));
			gameZone.setZone(StringUtil.transcoding(gameZone.getZone(), "ISO-8859-1", "GB2312"));
		}
		this.getRequest().setAttribute("pageBean", pageBean);
	}

	public String ajaxChangeStatus() throws AjaxJsonException {
		HttpServletRequest request = this.getRequest();
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		if (StringUtil.isNullOrEmpty(id))
			throw new AjaxJsonException("id is null");
		if (StringUtil.isNullOrEmpty(status))
			throw new AjaxJsonException("status is null");
		try {
			GameZone record = gameZoneDao.get(Long.valueOf(id));
			record.setStatus(Integer.valueOf(status));
			gameZoneDao.update(record);

			// 返回JSON消息
			this.setJson(AjaxData.getSuccessJson("success", null));

		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	// 取传入参数（IP地址）转化数组---192.168.55.66 中间加*** ***

	public String maskIpArr(String ipArr) {
		if (ipArr != null && !ipArr.isEmpty()) {
			StringBuilder sb = new StringBuilder();
			String[] ips = ipArr.split(":");
			for (String ipstr : ips) {
				String newstr = this.maskIp(ipstr);
				sb.append(newstr + ":");
			}
			return sb.toString();
		}
		return ipArr;
	}

	public String maskIp(String ipstr) {
		if (ipstr != null && ipstr.matches("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}")) {
			String first = ipstr.substring(0, ipstr.indexOf(".") + 1);
			String last = ipstr.substring(ipstr.lastIndexOf("."), ipstr.length());
			String newStr = first + "***" + ".***" + last;
			return newStr;
		}
		return ipstr;
	}

	public String maskUserName(String userName) {
		if (userName != null && !userName.isEmpty())
			return userName.replaceFirst(".+@", "\\*\\*\\*@");
		return userName;
	}

}
