/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) AjaxData.java 1.0 2008-10-20
 */
package com.navigation.domain;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.Since;
import com.navigation.utils.JSONUtils;

/**
 * <code>Ajax</code> 进行一些操作（通常是指添加、删除和修改）时，用于保存返回信息的POJO类。
 * <p>
 * <strong>since 1.1 更新说明: </strong>
 * <ul>
 * <li>1、增加 String target 属性，用于返回前端由JS控制跳转的</li>
 * <li>2、增加 {@linkplain AjaxData#getErrorJson(String) getErrorJson(String)}
 * 方法直接返回Ajax请求状态<u>错误</u>的 <code>JSON</code> 字符串。</li>
 * <li>3、增加
 * {@linkplain AjaxData#getErrorJson(String, Map) getErrorJson(String, Map)}
 * 方法直接返回Ajax请求状态<u>错误</u>的 <code>JSON</code> 字符串。</li>
 * <li>4、增加
 * {@linkplain AjaxData#getSuccessJson(String, Map) getSuccessJson(String, Map)}
 * 方法直接返回Ajax请求状态<u>成功</u>的 <code>JSON</code> 字符串。</li>
 * <li>5、增加
 * {@linkplain AjaxData#getSuccessJson(String, String, Map) getSuccessJson(String, String, Map)}
 * 方法直接返回Ajax请求状态<u>成功</u>的 <code>JSON</code> 字符串。</li>
 * <li>6、增加
 * {@linkplain AjaxData#getFailureJson(String, Map) getFailureJson(String, Map)}
 * 方法直接返回Ajax请求状态<u>失败</u>的 <code>JSON</code> 字符串。</li>
 * <li>7、增加
 * {@linkplain AjaxData#getFailureJson(String, String, Map) getFailureJson(String, String, Map)}
 * 方法直接返回Ajax请求状态<u>失败</u>的 <code>JSON</code> 字符串。</li>
 * </ul>
 * </p>
 * 
 * @author Fuchun
 * @version 1.0, 2008-10-20 <br />
 * 1.1, 2009-06-05 by Fuchun。更新说明见该类的更新说明。
 */
public class AjaxData implements Serializable {

    /** 默认的串行化版本标识。 */
    private static final long serialVersionUID = 1L;

    /**
     * <code>Ajax</code> 请求完成时返回JSON字符串的键名。
     */
    public static final String DEFAULT_NAME = "json";
    
    /**
     * <code>Ajax</code> 请求完成时返回HTML页面的键名。
     */
    public static final String DEFAULT_HTML_NAME = "html";

    /**
     * <code>Ajax</code> 请求完成时返回的 <code>target</code> 重定向视图名称。
     * <p>
     * 该视图值为：/login.do 登录页面
     * </p>
     */
    public static final String LOGIN_REDIRECT_TARGET = "/login.do";

    /**
     * <code>Ajax</code> 请求完成时返回的 <code>target</code> 重定向视图名称。
     * <p>
     * 该视图值为：/home.do 个人首页页面
     * </p>
     */
    public static final String HOME_REDIRECT_TARGET = "/home.do";

    /**
     * <code>Ajax</code> 请求完成时默认返回的视图名。
     */
    public static final String DEFAULT_AJAX_VIEW = "ajaxJSONResult";

    /**
     * <code>Ajax</code> 请求完成时返回的完成标识。
     */
    public static final Short STATUS_COMPLETE = 1;

    /**
     * <code>Ajax</code> 请求成功时返回的成功标识。
     */
    public static final Short STATUS_SUCCESS = 1;

    /**
     * <code>Ajax</code> 请求失败时返回的失败标识。
     */
    public static final Short STATUS_FAILURE = 0;

    /**
     * <code>Ajax</code> 请求发生错误时返回的错误标识。
     */
    public static final Short STATUS_ERROR = -1;
    
    /**
     * <code>Ajax</code> 用户没有登陆时返回的错误标识。
     */
    public static final Short STATUS_NOT_LOGIN = -2;

    /** Ajax操作返回的状态。 */
    @Expose
    private Short status;

    /** Ajax操作返回的信息。 */
    @Expose
    private String message;

    /** Ajax操作返回的一组信息。 */
    @Expose
    private Map<String, String> values;

    /** Ajax操作返回信息后，重定向的视图名称。 */
    @Expose
    @Since(1.1)
    private String target;

    /**
     * 默认的构造方法，初始化<code>AjaxData</code>类的新实例。
     */
    protected AjaxData() {
        this(STATUS_ERROR, "", new HashMap<String, String>());
    }

    /**
     * 用给定的属性值(status, message)初始化<code>AjaxData</code>类的新实例。
     * 
     * @param status 状态信息。参见{@link #STATUS_COMPLETE}、{@link #STATUS_FAILURE}等。
     * @param message 包含的信息。
     */
    protected AjaxData(Short status, String message) {
        this(status, message, null);
    }

    /**
     * 用给定的属性值(status, message, values)初始化<code>AjaxData</code>类的新实例。
     * 
     * @param status 状态信息。参见{@link #STATUS_COMPLETE}、{@link #STATUS_FAILURE}等。
     * @param message 包含的信息。
     * @param values 用于保存需要的值。
     */
    protected AjaxData(Short status, String message, Map<String, String> values) {
        this.status = status;
        this.message = message;
        this.values = values;
    }

    /**
     * 获取Ajax错误请求的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @return Ajax错误请求的<code>AjaxData</code>实例。
     */
    public static AjaxData getError(String message) {
        return new AjaxData(STATUS_ERROR, message);
    }

    /**
     * 获取Ajax错误请求的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param values 保存需要返回的值。
     * @return Ajax错误请求的<code>AjaxData</code>实例。
     */
    public static AjaxData getError(String message, Map<String, String> values) {
        return new AjaxData(STATUS_ERROR, message, values);
    }

    /**
     * 获取Ajax错误请求的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return Ajax错误请求的<code>AjaxData</code>实例。
     */
    public static AjaxData getError(String message, String target, Map<String, String> values) {
        AjaxData error = new AjaxData(STATUS_ERROR, message, values);
        error.setTarget(target);
        return error;
    }

    /**
     * 获取Ajax错误请求返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax错误的 <code>JSON</code> 字符串。
     */
    public static String getErrorJson(String message) {
        return JSONUtils.toJson(getError(message), null, false, JSONUtils.SINCE_VERSION_10, null, true);
//        return StringUtil.toJson(getError(message), null, Constant.JSON_FIELD_VERSION_10, false,
//                null);
    }

    /**
     * 获取Ajax错误请求返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param values 保存需要返回的值。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax错误的 <code>JSON</code> 字符串。
     */
    public static String getErrorJson(String message, Map<String, String> values) {
        return JSONUtils.toJson(getError(message, values), null, false, JSONUtils.SINCE_VERSION_10, null, true);
    }

    /**
     * 获取Ajax错误请求返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax错误的 <code>JSON</code> 字符串。
     */
    public static String getErrorJson(String message, String target, Map<String, String> values) {
        return JSONUtils.toJson(getError(message, target, values), null, false, JSONUtils.SINCE_VERSION_10, null, true);
    }

    /**
     * 获取Ajax成功请求的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param values 保存需要返回的值。
     * @return Ajax成功请求的<code>AjaxData</code>实例。
     */
    public static AjaxData getSuccess(String message, Map<String, String> values) {
        return new AjaxData(STATUS_SUCCESS, message, values);
    }

    /**
     * 获取Ajax成功请求的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return Ajax成功请求的<code>AjaxData</code>实例。
     */
    public static AjaxData getSuccess(String message, String target, Map<String, String> values) {
        AjaxData success = new AjaxData(STATUS_SUCCESS, message, values);
        success.setTarget(target);
        return success;
    }

    /**
     * 获取Ajax成功请求返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param values 保存需要返回的值。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax成功的 <code>JSON</code> 字符串。
     */
    public static String getSuccessJson(String message, Map<String, String> values) {
        return JSONUtils.toJson(getSuccess(message, values), null, false, JSONUtils.SINCE_VERSION_10, null, true);
//        return StringUtil.toJson(getSuccess(message, values), null, Constant.JSON_FIELD_VERSION_10,
//                false, null);
    }

    /**
     * 获取Ajax成功请求返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax成功的 <code>JSON</code> 字符串。
     */
    public static String getSuccessJson(String message, String target, Map<String, String> values) {
        return JSONUtils.toJson(getSuccess(message, target, values), null, false, JSONUtils.SINCE_VERSION_10, null, true);
    }

    /**
     * 获取Ajax请求失败的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param values 保存需要返回的值。
     * @return Ajax请求失败的<code>AjaxData</code>实例。
     */
    public static AjaxData getFailure(String message, Map<String, String> values) {
        return new AjaxData(STATUS_FAILURE, message, values);
    }

    /**
     * 获取Ajax请求失败的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return Ajax请求失败的<code>AjaxData</code>实例。
     */
    public static AjaxData getFailure(String message, String target, Map<String, String> values) {
        AjaxData failure = new AjaxData(STATUS_FAILURE, message, values);
        failure.setTarget(target);
        return failure;
    }

    /**
     * 获取Ajax请求操作失败返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param values 保存需要返回的值。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax成功的 <code>JSON</code> 字符串。
     */
    public static String getFailureJson(String message, Map<String, String> values) {
        return JSONUtils.toJson(getFailure(message, values), null, false, JSONUtils.SINCE_VERSION_10, null, true);
//        return StringUtil.toJson(getFailure(message, values), null, Constant.JSON_FIELD_VERSION_10,
//                false, null);
    }

    /**
     * 获取Ajax请求操作失败返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax失败的 <code>JSON</code> 字符串。
     */
    public static String getFailureJson(String message, String target, Map<String, String> values) {
        return JSONUtils.toJson(getFailure(message, target, values), null, false, JSONUtils.SINCE_VERSION_10, null, true);
    }
    
    /**
     * 获取Ajax未登录错误请求返回的 <code>JSON</code> 字符串。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return 由 <code>AjaxData</code> 生成的表示Ajax错误的 <code>JSON</code> 字符串。
     */
    public static String getNotLoginErrorJson(String message, String target, Map<String, String> values) {
        return JSONUtils.toJson(getNotLoginError(message, target, values), null, false, JSONUtils.SINCE_VERSION_10, null, true);
    }
    
    /**
     * 获取Ajax未登录错误请求的<code>AjaxData</code>实例。
     * 
     * @param message <code>AjaxData</code>的message属性值(消息)。
     * @param target 重定向的视图名称。
     * @param values 保存需要返回的值。
     * @return Ajax错误请求的<code>AjaxData</code>实例。
     */
    public static AjaxData getNotLoginError(String message, String target, Map<String, String> values) {
        AjaxData error = new AjaxData(STATUS_NOT_LOGIN, message, values);
        error.setTarget(target);
        return error;
    }

    /**
     * 获取Ajax操作返回的执行状态。
     * 
     * @return Ajax操作返回的执行状态。
     */
    public Short getStatus() {
        return status;
    }

    /**
     * 设置Ajax操作返回的执行状态。
     * 
     * @param status 要设置的 Ajax操作返回的执行状态。
     */
    public void setStatus(Short status) {
        this.status = status;
    }

    /**
     * 获取 Ajax操作返回的主要信息。
     * 
     * @return Ajax操作返回的主要信息。
     */
    public String getMessage() {
        return message;
    }

    /**
     * 设置Ajax操作返回的主要信息。
     * 
     * @param message 要设置的 Ajax操作返回的主要信息。
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 获取Ajax操作返回的一组信息。
     * 
     * @return Ajax操作返回的一组信息。
     */
    public Map<String, String> getValues() {
        return values;
    }

    /**
     * 设置Ajax操作返回的一组信息。
     * 
     * @param values 要设置的 Ajax操作返回的一组信息。
     */
    public void setValues(Map<String, String> values) {
        this.values = values;
    }

    /**
     * 获取重定向的视图名称。
     * 
     * @return 重定向的视图名称。
     */
    public String getTarget() {
        return target;
    }

    /**
     * 设置重定向的视图名称。
     * 
     * @param target 要设置的 重定向的视图名称。
     */
    public void setTarget(String target) {
        this.target = target;
    }
}
