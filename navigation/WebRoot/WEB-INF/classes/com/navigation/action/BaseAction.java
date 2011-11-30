/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) com.ztgame.action.BaseAction.java 2.1, 2009-05-21
 */
package com.navigation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.navigation.domain.Constant;
import com.navigation.security.SessionUtil;
import com.navigation.security.UserState;
import com.navigation.utils.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


/**
 * <strong>GAVC Web</strong> 系统的顶层控制器。该控制器提供了多个常用的公用方法。
 * <pre>
 * <strong>若要使用 {@link #getPageUser()} 和 {@link #getCurrentUser()} 方法，
 * 在ActionContext配置中，需注入 ProfileService 业务接口的实现。</strong>
 * {@link #getCurrPage()} 方法获取分页查询时的当前页页码(参数为 <code>p</code>)。
 * {@link #getContext()} 方法获取控制器上下文对象(<code>com.opensymphony.xwork2.ActionContext</code>)。
 * {@link #getUserId()} 方法获取当前传递的经加密的<code>uid</code>的值，并进行解密返回。
 * {@link #getClientIp()} 方法获取当前请求者的客户端真实IP地址。
 * </pre>
 * 
 * @author Fuchun
 * @version 2.0, 2009-04-27
 * @version 2.1, 2009-05-21 by Fuchun <br>
 *          添加 {@link #getPageUser()} 方法以获取当前页页面的所属用户信息。<br>
 *          添加 {@link #getCurrentUser()} 方法以获取当前登录用户的用户信息。
 */
public class BaseAction extends ActionSupport {

    //private static final Logger LOG = LoggerFactory.getLogger(BaseAction.class);

    /** 默认的串行化版本标识。 */
    private static final long serialVersionUID = 1L;
    
    private static final Integer DEFAULT_CURRENT_PAGE = 1;
    
    /** 默认皮肤 */
    protected static final String SKIN = "skin1";

    // 非法操作提示信息
	private static String illegalOperationInfo = "";

    /** 当前请求的用户身份认证对象({@link com.ztgame.domain.UserState})。 */
    protected UserState userToken = null;

    /** 当前请求的客户端IP地址。 */
    private String clientIp;

    /** 请求的目标名称。 */
    protected String target;
    protected String msg;

    /** 当前请求的目标URL(该目标URL地址为加密的密文)。 */
    private String targetUrl;

    /** 当前请求的目标URL(真实的URL地址)。 */
    private String cTargetUrl;

    /** 当前传递的当前页 p 参数。 */
    protected Integer p = 1;
    protected Integer cityId = 1;
    protected Integer q = 1;
    protected Integer pageSize = 10;
    protected Integer targetId;
    
    /** 匿名参数名。*/
    protected String _ = "";
    /** 格式化参数名。*/
    private String format = "";
    
    /** 随机数。*/
    private String rn = "";
    
    /** json数据 */
	protected String json = "";
    
    /** Ajax跨域请求时，接收的回调函数名称参数。*/
    private String jsoncallback = StringUtils.EMPTY;
    
    /** 系统消息ID. */
    private Long sysId;
    
    /** 操作的命令回馈信息KEY. */
    private String responseKey;
    
    public static final String AJAX_JSON_RESULT = "ajaxJSONResult";
    
    public static final String LOGIN_RESULT = "login";
    
    protected boolean pageFlag = false;
    
    /** 主菜单ID */
    private String mainMenuid;
    
    /** 区域ID，默认1 */
    protected Integer areaId = null;
    
    /** 页面ID */
    protected Integer pageId = null;
    
    /** 加密消息 */
    protected String emsg;
    
    /** 模式开关 */
    protected String mode;
    
    /**
     * 默认的Action请求执行方法。
     * 
     * @return 默认的视图名称
     * @see com.opensymphony.xwork2.ActionSupport#execute()
     */
    public String execute() throws Exception {
        return SUCCESS;
    }
    
    /**
     * 判断用户是否已登录
     * 
     * @return boolean:true为已登录，false为未登录
     */
    public Boolean isLogin() {
        return SessionUtil.isLogon();
    }

    
    /**
     * 获取当前Action的上下文对象(<code>com.opensymphony.xwork2.ActionContext</code>)。
     * 
     * @return 当前Action的上下文对象。
     */
    public ActionContext getContext() {
        return ActionContext.getContext();
    }
    
    /**
     * 获得当前登录用户的身份认证对象。若当前用户没有登录，则返回<code>null</code>。
     * 
     * @return 返回 {@link com.ztgame.domain.UserState}。
     */
    public UserState getUserToken() {
        return userToken;
    }

    public void setUserToken(UserState userToken) {
        setUserState(userToken);
    }    
    
    /**
     * 设置当前请求的用户身份认证对象。
     * 
     * @param userToken 要设置的 当前请求的用户身份认证对象。
     * {@link com.ztgame.domain.UserState}。
     */
    public void setUserState(UserState userToken) {
        this.userToken = userToken;
        getContext().put(Constant.USER_TOKEN_SESSION, this.userToken);
    }

    /**
     * 获得当前请求的客户端IP地址。
     * 
     * @return 当前请求的客户端IP地址。
     */
    public String getClientIp() {
        return clientIp;
    }

    /**
     * 设置当前请求的客户端的IP地址。
     * 
     * @param clientIp 要设置的 当前请求的客户端的IP地址。
     * @see com.ztgame.interceptor.UserStateAware#setClientIp(java.lang.String)
     */
    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    /**
     * 获取请求的目标地址名称。
     * 
     * @return 请求的目标地址名称。
     */
    public String getTarget() {
        return target;
    }

    /**
     * 设置请求的目标地址名称。
     * 
     * @param target 要设置的 请求的目标地址名称。
     */
    public void setTarget(String target) {
        this.target = target;
    }

    /**
     * 获取当前请求的目标URL(该目标URL地址为加密的密文)。
     * 
     * @return 当前请求的目标URL。
     */
    public String getTargetUrl() {
        return targetUrl;
    }

    /**
     * 设置当前请求的目标URL(该目标URL地址为加密的密文)。。
     * 
     * @param targetUrl 要设置的 当前请求的目标URL(该目标URL地址为加密的密文)。。
     */
    public void setTargetUrl(String targetUrl) {
        this.targetUrl = targetUrl;
        this.cTargetUrl = StringUtils.decryptNormal(targetUrl);
    }

    /**
     * 获取当前请求的目标URL(真实的URL地址)。
     * 
     * @return 当前请求的目标URL(真实的URL地址)。
     */
    public String getCTargetUrl() {
        return cTargetUrl;
    }

    /**
     * 设置当前请求的目标URL(真实的URL地址)。
     * 
     * @param targetUrl 要设置的 当前请求的目标URL(真实的URL地址)。
     */
    public void setCTargetUrl(String url) {
        cTargetUrl = url;
        targetUrl = StringUtils.encryptNormal(url);
    }
    
    /**
     * 获取当前页页码(默认值为：1)。
     * 
     * @return 当前页页码。
     */
    public Integer getCurrPage() {
        try {
            return getP();
        } catch (Exception e) {
            return DEFAULT_CURRENT_PAGE;
        }
    }
    
    /**
	 * 取得REQUEST
	 */
	public HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}

	public HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}
	
	/**
	 * 取得SESSION
	 * @param jsonStr
	 */
	public HttpSession getSession(){
		return this.getRequest().getSession();
	}
	
	/**
	 * @param json the json to set
	 */
	public void setJson(String json) {
		responseJson(json);
	}
	
	public void responseJson(String jsonStr) {
		if (!StringUtils.isNullOrEmpty(jsoncallback)) {
			this.json = (jsoncallback + "(" + jsonStr + ")");
		} else {
			this.json = jsonStr;
		}
	}

    /**
     * 获得操作的命令回馈信息KEY.
     * 
     * @return the response key
     */
    public String getResponseKey() {
        return responseKey;
    }

    /**
     * 设置操作的命令回馈信息KEY.
     * 
     * @param responseKey the response key
     */
    public void setResponseKey(String responseKey) {
        this.responseKey = responseKey;
    }

    /**
     * 获得系统消息ID.
     * 
     * @return the sys id
     */
    public Long getSysId() {
        return sysId;
    }

    /**
     * 设置系统消息ID.
     * 
     * @param sysId the sys id
     */
    public void setSysId(Long sysId) {
        this.sysId = sysId;
    }

    /**
     * @return the jsoncallback
     */
    public String getJsoncallback() {
        return jsoncallback;
    }

    /**
     * @param jsoncallback 要设置的 jsoncallback。
     */
    public void setJsoncallback(String jsoncallback) {
        this.jsoncallback = jsoncallback;
    }

    /**
     * @return the _
     */
    public String get_() {
        return _;
    }

    /**
     * @param _ 要设置的 _。
     */
    public void set_(String _) {
        this._ = _;
    }

    /**
     * @return the format
     */
    public String getFormat() {
        return format;
    }

    /**
     * @param format 要设置的 format。
     */
    public void setFormat(String format) {
        this.format = format;
    }

    /**
     * @return the rn
     */
    public String getRn() {
        return rn;
    }

    /**
     * @param rn 要设置的 rn。
     */
    public void setRn(String rn) {
        this.rn = rn;
    }

	public String getJson() {
		return json;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setP(Integer p) {
		this.p = p;
	}

	public Integer getP() {
		return p;
	}

	public boolean isPageFlag() {
		return pageFlag;
	}

	public void setPageFlag(boolean pageFlag) {
		this.pageFlag = pageFlag;
	}

	public Integer getQ() {
		return q;
	}

	public void setQ(Integer q) {
		this.q = q;
	}

    public String getMainMenuid() {
        return mainMenuid;
    }

    public void setMainMenuid(String mainMenuid) {
        this.mainMenuid = mainMenuid;
    }

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public Integer getTargetId() {
		return targetId;
	}

	public void setTargetId(Integer targetId) {
		this.targetId = targetId;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public Integer getPageId() {
		return pageId;
	}

	public void setPageId(Integer pageId) {
		this.pageId = pageId;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getEmsg() {
		return emsg;
	}

	public void setEmsg(String emsg) {
		this.emsg = emsg;
	}
}
