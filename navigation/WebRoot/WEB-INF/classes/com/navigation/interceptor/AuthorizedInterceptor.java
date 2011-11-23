/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) com.ztgame.interceptor.AuthorizedInterceptor.java 1.0, 2008-10-30
 */
package com.navigation.interceptor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.StrutsStatics;

import weibo4j.User;
import weibo4j.Weibo;
import weibo4j.WeiboException;
import weibo4j.examples.WebOAuth;
import weibo4j.http.AccessToken;
import weibo4j.http.RequestToken;

import com.navigation.action.BaseAction;
import com.navigation.domain.Constant;
import com.navigation.security.SessionUtil;
import com.navigation.security.UserState;
import com.navigation.utils.DateUtils;
import com.navigation.utils.StringUtil;
import com.navigation.utils.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 用户身份认证信息处理的拦截器。
 * 
 */
public class AuthorizedInterceptor extends AbstractInterceptor implements
        StrutsStatics {

    /** 默认的串行化版本标识。 */
    private static final long serialVersionUID = 1L;

    /** 放在cookie中的 用于记录用户首页要显示的列表（组件/好友）的 字段名称。 */
    private static final String HOME_BAR_TYPE = "homeBarType";

    /** 配置需要登录才能访问的Action，以及方法 */
    private static List<String> actionNames = new ArrayList<String>();
    private static List<Integer> managerUserIds = new ArrayList<Integer>();
    
    /* 定义需要登录才能访问的Action，包括名字空间 */
    static{
        actionNames.add("/manager");
        managerUserIds.add(1912304521);//w
        managerUserIds.add(1708743001);//x
        managerUserIds.add(1059658627);//h
        managerUserIds.add(1721953184);//z
    }
    
    /**
     * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
     */
    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        final BaseAction action = (BaseAction)invocation.getAction();
        ActionContext context = invocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) context.get(HTTP_REQUEST);
        HttpServletResponse response = (HttpServletResponse) context.get(HTTP_RESPONSE);
        
        SessionUtil.buildContext(request);
        //检查COOKIE	登录
        if(!SessionUtil.isLogon()){
        	this.cookieLogin(request,response);
        }
        if(SessionUtil.isLogon()){
        	UserState userState = SessionUtil.getLogonUser();
            action.setUserState(userState);
            System.out.println(userState.getUser().getName()+"_"+request.getRemoteAddr()+" ### "+request.getRequestURI());
        }else {
			System.out.println(request.getRemoteAddr()+" ### "+request.getRequestURI());
		}
        
        ActionProxy proxy = invocation.getProxy();
        request.setAttribute("namespace", proxy.getNamespace());
        request.setAttribute("actionName", proxy.getActionName());
        
        /*
        //检查管理员权限
        ActionProxy proxy = invocation.getProxy();
		if(actionNames.contains(proxy.getNamespace())) {
			this.checkRight(request,response,proxy);
		}
        String remoteIp = request.getRemoteAddr();
        if(!remoteIp.equals(request.getServerName()) && !remoteIp.equals("192.168.82.87")) 
        	System.out.println("### RemoteIp:"+remoteIp+" "+DateUtils.format()+ " "+proxy.getActionName());
        if (action instanceof ClientIpAware) {
        	String clientIp = ParamUtils.getIp(request);
        	((ClientIpAware) action).setClientIp(clientIp);
        }
        
        //接口访问
        String host = request.getServerName();
        if(host.equals("192.168.82.87")){
        	List<String> permit = new ArrayList<String>();
        	permit.add("ajaxBindReturn");
        	String nowAction = proxy.getActionName();
        	if(!permit.contains(nowAction)) return "none";
        }
        */
        return invocation.invoke();
    }

    /**
     * COOKIE 登录
     * @param request
     * @param response
     */
    private void cookieLogin(HttpServletRequest request,
			HttpServletResponse response) {
    	Cookie[] cookies=request.getCookies(); 
    	String key = null;
    	if(!StringUtil.isNull(cookies)){
			for (int i=0;i <cookies.length;i++) { 
				Cookie c=cookies[i];
				if(c.getName().equalsIgnoreCase(Constant.COOKIE_KEY)) key = StringUtil.decode(c.getValue());
			}
			if(!StringUtil.isNullOrEmpty(key)){
				Integer userId = Integer.parseInt(StringUtil.decode(key));
				SessionUtil.userLogon(userId);
				System.out.println("COOKIE LOGIN_"+userId);
			}
		}
	}

	/**
     * 检查新浪登录
     * @param request
     */
    private void sinaLogon(HttpServletRequest request) {
    	String verifier=request.getParameter("oauth_verifier");
		if(verifier!=null){
			HttpSession session = request.getSession();
			RequestToken resToken=(RequestToken) session.getAttribute("resToken");

			if(resToken!=null){
				AccessToken accessToken=WebOAuth.requstAccessToken(resToken,verifier);
				if(accessToken!=null){
					//取新浪用户名
					try {
						Weibo weibo = new Weibo();
						weibo.setOAuthAccessToken(accessToken);
						User user = weibo.endSession();
						System.out.println(user.getScreenName()+ " LOGIN ON "+ DateUtils.format());
						accessToken.setScreenName(user.getScreenName());
					} catch (WeiboException e) {
						e.printStackTrace();
					}
					session.setAttribute("accessToken", accessToken);
					session.setMaxInactiveInterval(-1);
				}else System.out.println("access token request error");
			}else System.out.println("request token session error");
		}
	}

	private void checkRight(HttpServletRequest request, HttpServletResponse response, ActionProxy proxy) throws IOException {
    	AccessToken accessToken = (AccessToken) request.getSession().getAttribute("accessToken");
    	String loginURL = request.getContextPath()+"/managerPage.do";
    	if(null == accessToken ){
    		response.sendRedirect(loginURL);
    		return;
    	}
		Integer userId = accessToken.getUserId();
		if(null == userId){
			response.sendRedirect(loginURL);
			return;
		}
		if(!managerUserIds.contains(userId)) {
			response.sendRedirect(loginURL);
			return;
		}
		request.getSession().setAttribute("accessToken", accessToken);
		System.out.println(accessToken.getScreenName()+ " "+ DateUtils.format()+ " CALL_"+ proxy.getActionName());
		request.getSession().setMaxInactiveInterval(-1);
	}

	public String makeTargetUrl(HttpServletRequest request){
        String requestURI = request.getRequestURI();
        String qs = request.getQueryString();
        requestURI = Constant.getDomainPath() + requestURI.replace("/depiao", "");
        return StringUtils.encryptNormal(requestURI
                .concat(!StringUtils.hasText(qs) ? StringUtils.EMPTY : "?".concat(qs)));    
    }
    
}
