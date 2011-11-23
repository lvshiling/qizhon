/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) com.ztgame.domain.AjaxDataType.java 1.0, 2008-11-11
 */
package com.navigation.domain;

import java.util.Map;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * <code>AjaxData</code> 类的显式子类。该类引入泛型类型，弥补<code>AjaxData</code>无法指定特定类型的缺失。
 * 
 * @author Fuchun
 * @version 1.0, 2008-11-11
 */
public class AjaxDataType<T> extends AjaxData implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 默认的构造方法，它将执行基类{@link AjaxData}的构造方法。
     */
    public AjaxDataType() {
        super();
    }

    /**
     * 用给定的属性初始化<code>AjaxDataType</code>的一个新实例。
     * 
     * @param status 状态信息。参见{@link #STATUS_COMPLETE}、{@link #STATUS_FAILURE}等。
     * @param message 包含的信息。
     * @param object 指定的泛型对象。
     */
    public AjaxDataType(Short status, String message, T object) {
        super(status, message);
        this.object = object;
    }

    /**
     * 用给定的属性初始化<code>AjaxDataType</code>的一个新实例。
     * 
     * @param status 状态信息。参见{@link #STATUS_COMPLETE}、{@link #STATUS_FAILURE}等。
     * @param message 包含的信息。
     * @param values 用于保存需要的值。
     * @param object 指定的泛型对象。
     */
    public AjaxDataType(Short status, String message, Map<String, String> values, T object) {
        super(status, message, values);
        this.object = object;
    }

    @Expose
    @SerializedName("info")
    private T object;

    /**
     * @return 指定泛型类型的类对象。
     */
    public T getObject() {
        return object;
    }

    /**
     * @param object 要设置的 指定泛型类型的类对象。
     */
    public void setObject(T object) {
        this.object = object;
    }
}
