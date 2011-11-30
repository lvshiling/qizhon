package com.navigation.action.task;

import java.util.List;

import javax.annotation.Resource;

import com.navigation.action.BaseAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.Constant;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.Task;
import com.navigation.pojo.TaskAccept;
import com.navigation.pojo.User;
import com.navigation.security.SessionUtil;
import com.navigation.service.TaskService;
import com.navigation.service.UserService;
import com.navigation.utils.DateUtils;
import com.navigation.utils.StringUtil;

/**
 * @author Alex
 */
public class TaskAction extends BaseAction {

	private static final long serialVersionUID = -8700078315817194960L;

	private String id;

	private String uid;

	private TaskAccept taskAccept;

	private String price;

	private String account;

	private String startDate;

	private String endDate;

	private String title;

	private String content;

	private String status;

	@Resource
	public TaskService taskService;
	@Resource
	public UserService userService;

	/**
	 * 任务首页
	 * 
	 * @return
	 */
	public String index() throws SessionException {
		if (SessionUtil.isLogon()) {
			Integer userId = SessionUtil.getLogonUID();

			Integer count = this.taskService.getAllTaskCount();
			this.getRequest().setAttribute("taskCount", count);

			List<Task> pubList = this.taskService.getTaskListByPublisher(userId);
			this.getRequest().setAttribute("pubList", pubList);

			// List<Task> acceptList =
			// this.taskService.getTaskListByAcceptor(userId);
			List<TaskAccept> acceptList = this.taskService.getAcceptListByUser(userId);
			this.getRequest().setAttribute("acceptList", acceptList);

			return "index";
		} else {
			return center();
		}
	}

	/**
	 * 任务大厅
	 * 
	 * @return
	 */
	public String center() {
		List<Task> list = this.taskService.getNewTaskList(20);
		this.getRequest().setAttribute("taskList", list);
		return "center";
	}

	/**
	 * 管理员页面
	 * 
	 * @return
	 */
	public String admin() throws SessionException {
		User user = SessionUtil.getLogonUser().getUser();
		if (user.getIsAdmin() != null && user.getIsAdmin().equals(1)) {
			List<TaskAccept> acceptList = this.taskService.getAcceptListByStatus(Constant.TASK_ACCEPT_STATUS_ACK_PAYED);
			this.getRequest().setAttribute("acceptList", acceptList);
		} else {
			throw new SessionException("对不起，您没有权限！");
		}
		return "admin";
	}

	/**
	 * 发布任务
	 * 
	 * @return
	 */
	public String publish() throws SessionException {
		if (StringUtil.isEmpty(price))
			return INPUT;
		try {
			User user = SessionUtil.getLogonUser().getUser();
			Task task = new Task();
			task.setUserId(user.getId());
			task.setUserName(user.getName());
			task.setName(title);
			task.setContent(content);
			task.setOfferPrice(Float.valueOf(price));
			task.setStartDate(DateUtils.parse(startDate, "yyyy-MM-dd hh:mm:ss"));
			task.setEndDate(DateUtils.parse(endDate, "yyyy-MM-dd hh:mm:ss"));

			this.taskService.publishTask(task);
			this.userService.taskUserNews(task.getUserId(), task.getId(), task.getName(), Constant.USER_NEWS_TYPE_PUBLISH_TASK);

			this.getRequest().setAttribute("successFlag", "1");
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			throw new SessionException(e.getMessage());
		}
		return index();
	}

	/**
	 * 任务详情
	 * 
	 * @return
	 * @throws SessionException
	 */
	public String detail() throws SessionException {
		if (StringUtil.isEmpty(id))
			throw new SessionException("对不起，该页面不存在！");
		Integer taskId = Integer.valueOf(id);

		Task task = this.taskService.getTask(taskId);
		this.getRequest().setAttribute("task", task);

		Integer userId = task.getUserId();
		User user = this.userService.getUserWithCredit(userId);
		this.getRequest().setAttribute("user", user);

		List<TaskAccept> acceptList = this.taskService.getAcceptList(taskId);
		this.getRequest().setAttribute("acceptList", acceptList);

		TaskAccept winnedAccept = this.taskService.getWinnedAccept(taskId);
		this.getRequest().setAttribute("winnedAccept", winnedAccept);

		Integer guestId = null;
		if (SessionUtil.isLogon()) {
			guestId = SessionUtil.getLogonUID();
			for (TaskAccept accept : acceptList) {
				if (guestId.equals(accept.getUserId())) {
					this.getRequest().setAttribute("myAccept", accept);
					break;
				}
			}
			this.getRequest().setAttribute("isLogin", "1");
		}
		if (userId.equals(guestId)) {
			this.getRequest().setAttribute("isSelf", "1");
		}

		return "detail";
	}

	/**
	 * 接受任务
	 * 
	 * @return
	 * @throws SessionException
	 */
	@Deprecated
	public String accept() throws SessionException {
		if (taskAccept == null)
			return INPUT;
		User user = SessionUtil.getLogonUser().getUser();
		taskAccept.setUserId(user.getId());
		taskAccept.setUserName(user.getName());
		try {
			this.taskService.acceptTask(taskAccept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return detail();
	}

	public String passAccept() throws SessionException {
		String[] acceptIds = this.getRequest().getParameterValues("acceptIds");
		if (acceptIds == null || acceptIds.length == 0)
			return INPUT;
		try {
			for (String acceptId : acceptIds) {
				this.taskService.passAccept(Integer.valueOf(acceptId));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SessionException(e.getMessage());
		}
		return admin();
	}

	public String unpassAccept() throws SessionException {
		String[] acceptIds = this.getRequest().getParameterValues("acceptIds");
		if (acceptIds == null || acceptIds.length == 0)
			return INPUT;
		try {
			for (String acceptId : acceptIds) {
				this.taskService.unpassAccept(Integer.valueOf(acceptId));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SessionException(e.getMessage());
		}
		return admin();
	}

	/**
	 * 接受任务(异步)
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxAccept() throws AjaxJsonException {
		if (StringUtil.isEmpty(price))
			throw new AjaxJsonException("出价为空");
		if (StringUtil.isEmpty(account))
			throw new AjaxJsonException("付款帐号为空");
		if (StringUtil.isEmpty(id))
			throw new AjaxJsonException("任务id为空");

		try {
			User user = SessionUtil.getLogonUser().getUser();
			TaskAccept accept = new TaskAccept();
			accept.setUserId(user.getId());
			accept.setUserName(user.getName());
			accept.setQuotePrice(Float.valueOf(price));
			accept.setUserAcct(account);
			accept.setTaskId(Integer.valueOf(id));

			this.taskService.acceptTask(accept);
			this.userService
					.taskUserNews(accept.getUserId(), accept.getTaskId(), accept.getTaskName(), Constant.USER_NEWS_TYPE_ACCEPT_TASK);

			this.setJson(AjaxData.getSuccessJson("success", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 选择中标请求
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxWinAccept() throws AjaxJsonException {
		if (StringUtil.isEmpty(id))
			throw new AjaxJsonException("参数错误");

		try {
			Integer userId = SessionUtil.getLogonUID();

			TaskAccept accept = this.taskService.winAccept(userId, Integer.valueOf(id));
			if (accept != null) {
				this.userService.taskUserNews(accept.getUserId(), accept.getTaskId(), accept.getTaskName(),
						Constant.USER_NEWS_TYPE_WIN_TASK);
			}
			this.setJson(AjaxData.getSuccessJson("success", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 修改订单状态
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxUpdateAcceptStatus() throws AjaxJsonException {
		if (StringUtil.isEmpty(status))
			throw new AjaxJsonException("参数错误");
		if (StringUtil.isEmpty(id))
			throw new AjaxJsonException("参数错误");

		try {
			SessionUtil.getLogonUID();
			this.taskService.updateAcceptStatus(Integer.valueOf(id), Integer.valueOf(status));
			this.setJson(AjaxData.getSuccessJson("success", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	/**
	 * 修改任务状态
	 * 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxUpdateTaskStatus() throws AjaxJsonException {
		if (StringUtil.isEmpty(status))
			throw new AjaxJsonException("参数错误");
		if (StringUtil.isEmpty(id))
			throw new AjaxJsonException("参数错误");

		try {
			SessionUtil.getLogonUID();
			this.taskService.updateTaskStatus(Integer.valueOf(id), Integer.valueOf(status));
			this.setJson(AjaxData.getSuccessJson("success", null));
		} catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), null, null));
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public TaskAccept getTaskAccept() {
		return taskAccept;
	}

	public void setTaskAccept(TaskAccept taskAccept) {
		this.taskAccept = taskAccept;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
