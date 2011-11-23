/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 * 
 * @(#) StringUtil.java 1.0 2008-09-04
 */
package com.navigation.utils;

import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.reflect.TypeToken;

import freemarker.template.utility.StringUtil;

/**
 * 参数传递、<code>Cookie</code>、</code>Session</code>等值的处理与封装的便捷类。
 * 
 * @author Fuchun
 * @version 1.0
 */
@SuppressWarnings("all")
public class ParamUtils extends Utils {

    //private final static Logger log = LoggerFactory.getLogger(ParamUtils.class);

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的参数的值。
     * 若该参数没被传递或没被赋值时返回空字符串（&quot;&quot;）。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的参数的值。
     * @see #getParameter(HttpServletRequest, String, String)
     */
    public static String getParameter(HttpServletRequest request, String name) {
        return getParameter(request, name, StringUtils.EMPTY);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的参数的值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的参数的值。
     */
    public static String getParameter(HttpServletRequest request, String name, String defaultValue) {
        if (!StringUtils.hasText(name)) return defaultValue;
        String value = request.getParameter(name);
        return value == null ? defaultValue : value.trim();
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的参数的值。
     * 该参数所获得的值是一个数组，相当于接收的是 {@code CheckBox} 或者 {@code ComboBox} 的值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的参数的值。
     */
    public static String[] getParameters(HttpServletRequest request, String name) {
        return getParameters(request, name, new String[] {});
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的参数的值。
     * 该参数所获得的值是一个数组，相当于接收的是 {@code CheckBox} 或者 {@code ComboBox} 的值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param defaults 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的参数的值。
     */
    public static String[] getParameters(HttpServletRequest request, String name, String[] defaults) {
        if (!StringUtils.hasText(name)) return defaults;
        String[] values = request.getParameterValues(name);
        return values == null || values.length == 0 ? defaults : values;
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的参数的值。
     * 该参数所获得的值是一组 {@code java.util.List&lt;String&gt;} 封装的值，相当于接收的是 {@code CheckBox} 或者
     * {@code ComboBox} 的值。若该参数没被传递或没被赋值时返回 0 长度的 {@code java.util.List&lt;String&gt;}。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的参数的值。
     */
    public static List<String> getParametersByList(HttpServletRequest request, String name) {
        return getParametersByList(request, name, new LinkedList<String>());
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的参数的值。
     * 该参数所获得的值是一组 {@code java.util.List&lt;String&gt;} 封装的值，相当于接收的是 {@code CheckBox} 或者
     * {@code ComboBox} 的值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param defaultList 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的参数的值。
     */
    public static List<String> getParametersByList(HttpServletRequest request, String name,
            List<String> defaultList) {
        if (!StringUtils.hasText(name)) return defaultList;
        String[] values = request.getParameterValues(name);
        if (values == null || values.length == 0)
            return defaultList;
        else {
            List<String> list = new LinkedList<String>();
            for (String val : values) {
                list.add(val);
            }
            return list;
        }
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code
     * java.math.BigDecimal} 类型的参数值。 若该参数没被传递或没被赋值时返回 {@code java.math.BigDecimal} 类型的 0。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的 {@code java.math.BigDecimal} 类型的参数值
     * @see #getBigDecimalParameter(HttpServletRequest, String, BigDecimal)
     */
    public static BigDecimal getBigDecimalParameter(HttpServletRequest request, String name) {
        return getBigDecimalParameter(request, name, NumberUtils.parseDecimal("0"));
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code
     * java.math.BigDecimal} 类型的参数值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的 {@code java.math.BigDecimal} 类型的参数值
     */
    public static BigDecimal getBigDecimalParameter(HttpServletRequest request, String name,
            BigDecimal defaultValue) {
        return NumberUtils.parseDecimal(getParameter(request, name), defaultValue);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的布尔值。
     * 若该参数没被传递或没被赋值时默认返回 {@code false}。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的布尔值。
     * @see #getBoolParameter(HttpServletRequest, String, boolean)
     */
    public static boolean getBoolParameter(HttpServletRequest request, String name) {
        return getBoolParameter(request, name, Boolean.FALSE);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的布尔值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的布尔值。
     */
    public static boolean getBoolParameter(HttpServletRequest request, String name,
            boolean defaultValue) {
        String value = getParameter(request, name).trim();
        if (StringUtils.isNullOrEmpty(value)) return defaultValue;
        if (TRUE.equals(value) || ON.equals(value) || FLAG_TRUE.equals(value))
            return Boolean.TRUE;
        else if (FALSE.equals(value) || OFF.equals(value) || FLAG_FALSE.equals(value))
            return Boolean.FALSE;
        return defaultValue;
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code byte}
     * 类型的参数值。若该参数没被传递或没被赋值时返回 {@code byte} 类型的 0。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的 {@code byte} 类型的参数值
     * @see #getByteParameter(HttpServletRequest, String, byte)
     */
    public static byte getByteParameter(HttpServletRequest request, String name) {
        return getByteParameter(request, name, (byte) 0);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code byte} 类型的参数值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的 {@code byte} 类型的参数值
     */
    public static byte getByteParameter(HttpServletRequest request, String name, byte defaultValue) {
        return NumberUtils.parseByte(getParameter(request, name), defaultValue);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code double}
     * 类型的参数值。若该参数没被传递或没被赋值时返回 {@code double} 类型的 0.0d。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的 {@code double} 类型的参数值
     * @see #getDoubleParameter(HttpServletRequest, String, double)
     */
    public static double getDoubleParameter(HttpServletRequest request, String name) {
        return getDoubleParameter(request, name, 0.0d);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code double}
     * 类型的参数值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的 {@code double} 类型的参数值
     */
    public static double getDoubleParameter(HttpServletRequest request, String name,
            double defaultValue) {
        return NumberUtils.parseDouble(getParameter(request, name), defaultValue);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code float}
     * 类型的参数值。若该参数没被传递或没被赋值时返回 {@code float} 类型的 0.0f。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的 {@code float} 类型的参数值
     * @see #getFloatParameter(HttpServletRequest, String, float)
     */
    public static float getFloatParameter(HttpServletRequest request, String name) {
        return getFloatParameter(request, name, 0.0f);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code float} 类型的参数值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的 {@code float} 类型的参数值
     */
    public static float getFloatParameter(HttpServletRequest request, String name,
            float defaultValue) {
        return NumberUtils.parseFloat(getParameter(request, name), defaultValue);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code int}
     * 类型的参数值。若该参数没被传递或没被赋值时返回 {@code int} 类型的 0。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的 {@code int} 类型的参数值
     * @see #getIntParameter(HttpServletRequest, String, int)
     */
    public static int getIntParameter(HttpServletRequest request, String name) {
        return getIntParameter(request, name, 0);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code int} 类型的参数值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的 {@code int} 类型的参数值
     */
    public static int getIntParameter(HttpServletRequest request, String name, int defaultValue) {
        return NumberUtils.parseInt(getParameter(request, name), defaultValue);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code long}
     * 类型的参数值。若该参数没被传递或没被赋值时返回 {@code long} 类型的 0L。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的 {@code long} 类型的参数值
     * @see #getLongParameter(HttpServletRequest, String, long)
     */
    public static long getLongParameter(HttpServletRequest request, String name) {
        return getLongParameter(request, name, 0L);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code long} 类型的参数值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的 {@code long} 类型的参数值
     */
    public static long getLongParameter(HttpServletRequest request, String name, long defaultValue) {
        return NumberUtils.parseLong(getParameter(request, name), defaultValue);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code short}
     * 类型的参数值。若该参数没被传递或没被赋值时返回 {@code short} 类型的 0。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的 {@code short} 类型的参数值
     * @see #getShortParameter(HttpServletRequest, String, short)
     */
    public static short getShortParameter(HttpServletRequest request, String name) {
        return getShortParameter(request, name, (short) 0);
    }

    /**
     * 从 {@code javax.servlet.http.HttpServletRequest} 的请求中获取给定参数名称的 {@code short} 类型的参数值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该参数没被传递或没被赋值时返回的默认值。
     * @return 返回给定参数名称的 {@code short} 类型的参数值
     */
    public static short getShortParameter(HttpServletRequest request, String name,
            short defaultValue) {
        return NumberUtils.parseShort(getParameter(request, name), defaultValue);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 中或者在 {@code
     * javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在
     * 则返回给定的默认值。属性值的类型由 {@code clazz} 指定。
     * 
     * @param <T> 指定要转换的属性值类型。
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param type 要从 {@code HttpServletRequest} 请求对象中获得的属性的类型。
     * @param defaultValue 该属性不存在或为 {@code NULL} 时返回的默认值。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    @SuppressWarnings("unchecked")
    public static <T> T getAttribute(HttpServletRequest request, String name, TypeToken<T> type,
            T defaultValue) {
        long start = System.currentTimeMillis();
        if (!StringUtils.hasText(name)) return defaultValue;
        Object val = request.getAttribute(name);
        if (val == null) {
            HttpSession session = request.getSession();
            if (session != null) val = session.getAttribute(name);
        }
        if (val == null) val = defaultValue;
        T result = null;
        try {
            result = ((Class<T>) type.getRawType()).cast(val);
        }
        catch (ClassCastException e) {
            //log.warn("类型 " + type.getRawType().getName() + " 转换错误！");
            result = defaultValue;
        }
//        if (log.isDebugEnabled()) {
//            log.debug("getAttribute(HttpServletRequest, String, TypeClass<T>, T) \n" + "(类型："
//                    + type.getRawType().getName() + ")方法执行时间 "
//                    + (System.currentTimeMillis() - start));
//        }
        return result;
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在
     * 则返回空字符串（&quot;&quot;）。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static String getAttribute(HttpServletRequest request, String name) {
        return getAttribute(request, name, StringUtils.EMPTY);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回给定的默认值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该属性不存在或为 {@code NULL} 时返回的默认值。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static String getAttribute(HttpServletRequest request, String name, String defaultValue) {
        return getAttribute(request, name, new TypeToken<String>() {}, defaultValue);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回 0。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static int getIntAttribute(HttpServletRequest request, String name) {
        return getIntAttribute(request, name, 0);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回给定的默认值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该属性不存在或为 {@code NULL} 时返回的默认值。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static int getIntAttribute(HttpServletRequest request, String name, int defaultValue) {
        return getAttribute(request, name, new TypeToken<Integer>() {}, 0);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回 0。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static long getLongAttribute(HttpServletRequest request, String name) {
        return getLongAttribute(request, name, 0L);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回给定的默认值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该属性不存在或为 {@code NULL} 时返回的默认值。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static long getLongAttribute(HttpServletRequest request, String name, long defaultValue) {
        return getAttribute(request, name, new TypeToken<Long>() {}, 0L);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回 0。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static short getShortAttribute(HttpServletRequest request, String name) {
        return getShortAttribute(request, name, (short) 0);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回给定的默认值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该属性不存在或为 {@code NULL} 时返回的默认值。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static short getShortAttribute(HttpServletRequest request, String name,
            short defaultValue) {
        return getAttribute(request, name, new TypeToken<Short>() {}, (short) 0);
    }

    /**
     * 获取当前 {@code javax.servlet.http.HttpServletRequest} 的请求中或者 在
     * {@code javax.servlet.http.HttpSession} 中找到给定参数名称的属性值。若属性值不存在 则返回给定的默认值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 获取的参数的名称。
     * @param defaultValue 该属性不存在或为 {@code NULL} 时返回的默认值。
     * @return 返回给定参数名称的属性值。查找顺序 request、session。
     */
    public static List<String> getListAttribute(HttpServletRequest request, String name,
            List<String> defaultValue) {
        return getAttribute(request, name, new TypeToken<List<String>>() {}, defaultValue);
    }

    /**
     * 重新获得在 {@code HttpServletRequest} 或 {@code Cookie} 中保存的值。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param response 当前Web应用的 {@code HttpServletResponse} 服务器响应对象。
     * @param key 给定的键。
     * @return 在 {@code HttpServletRequest} 或 {@code Cookie} 中保存的值。
     */
    public static String retrieve(HttpServletRequest request, HttpServletResponse response,
            String key) {
        HttpSession session = request.getSession(); // 获得session对象
        String value = (String) session.getAttribute(key);
        if (value == null || value.length() == 0 || "null".equals(value)) {
            value = getCookieValue(request, key, true);
            if (value.length() > 0) {
                session.setAttribute(key, value);
            }
        }
        return value;
    }

    /**
     * 在 {@code HttpServletRequest} 或 {@code Cookie} 中保存给定的键值对。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param response 当前Web应用的 {@code HttpServletResponse} 服务器响应对象。
     * @param name 保存的值的唯一名称。
     * @param value 保存的对应于名称的值。
     * @param domain 保存 {@code Cookie} 时指定的域。
     */
    public static void store(HttpServletRequest request, HttpServletResponse response, String name,
            String value, String domain) {
        store(request, response, name, value, 0, domain);
    }

    /**
     * 在 {@code HttpServletRequest} 中保存给定的键值对，若给定的保存周期 {@code storeTime} 大于0，
     * 则同时保存到客户端 {@code Cookie} 中。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param response 当前Web应用的 {@code HttpServletResponse} 服务器响应对象。
     * @param name 保存的值的唯一名称。
     * @param value 保存的对应于名称的值。
     * @param saveTime 存入 {@code Cookie} 的周期，单位：秒(s)。
     * @param domain 保存 {@code Cookie} 时指定的域。
     * @param saveSession 是否保存到 {@code Session} 中。
     */
    public static void store(HttpServletRequest request, HttpServletResponse response, String name,
            String value, int saveTime, String domain, boolean ... saveSession) {
        if (!StringUtils.hasText(name)) return;
        request.setAttribute(name, value);
        if(saveSession != null && saveSession.length > 0) {
            if(saveSession[0]) {
                HttpSession session = request.getSession();
                session.setAttribute(name, value);
            }
        }
        if (saveTime > 0) { // 需要保存到Cookie中
            saveCookie(response, name, value, saveTime, domain, true);
        }
    }

    /**
     * 删除存储的值，该值可能保存于 {@code HttpServletRequest} 或 {@code Cookie} 中。 若要删除的给定键
     * {@code name} 为空，则不作任何处理。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param response 当前Web应用的 {@code HttpServletResponse} 服务器响应对象。
     * @param name 要删除的值的给定键。
     * @param domain {@code Cookie} 值保存的域。
     */
    public static void delete(HttpServletRequest request, HttpServletResponse response,
            String name, String domain) {
        HttpSession session = request.getSession();
        session.removeAttribute(name);
        deleteCookie(response, name, domain);
    }

    /**
     * 删除给定键的 {@code Cookie} 值。{@code name} 为 {@code null} 或者空字符串，则不作任何操作。
     * 
     * @param response 当前Web应用的 {@code HttpServletResponse} 服务器响应对象。
     * @param name 要删除的 {@code Cookie} 键名。
     * @param domain 要删除的 {@code Cookie} 的所在域的值。
     * @param path 要删除的 {@code Cookie} 的路径。
     */
    public static void deleteCookie(HttpServletResponse response, String name, String domain,
            String... path) {
        // 使Cookie无效
        Cookie cookie = new Cookie(name, "");
        // 当用户关闭浏览器时删除Cookie的值
        cookie.setDomain(domain);
        cookie.setMaxAge(0);
        cookie.setPath(path == null || path.length == 0 ? "/" : path[0]);
        response.addCookie(cookie);
    }

    /**
     * 在客户端 {@code Cookie} 中保存给定的键值对，保存的值的周期由 {@code saveTime} 指定，单位：秒(s)。
     * 默认的保存周期为一小时。
     * 
     * @param response 当前Web应用的 {@code HttpServletResponse} 服务器响应对象。
     * @param name 保存的 {@code Cookie} 的值的唯一名称。
     * @param value 存的 {@code Cookie} 的对应于名称的值。
     * @param domain {@code Cookie} 保存的域。
     */
    public static void saveCookie(HttpServletResponse response, String name, String value,
            String domain) {
        saveCookie(response, name, value, 60 * 60 * 24, domain, true);
    }

    /**
     * 在客户端 {@code Cookie} 中保存给定的键值对，保存的值的周期由 {@code saveTime} 指定，单位：秒(s)。
     * 
     * @param response 当前Web应用的 {@code HttpServletResponse} 服务器响应对象。
     * @param name 保存的 {@code Cookie} 的值的唯一名称。
     * @param value 保存的 {@code Cookie} 的对应于名称的值。
     * @param saveTime {@code Cookie} 保存的周期(单位：秒) -1 - 关闭浏览器即失效。
     * @param domain {@code Cookie} 保存的域。
     * @param encryptImportant 是否用默认的加密/解密方式加密 {@code Cookie} 的值。
     */
    public static void saveCookie(HttpServletResponse response, String name, String value,
            int saveTime, String domain, boolean encryptImportant) {
        if (value == null) value = StringUtils.EMPTY;

        String newvalue = value;
        if (encryptImportant) newvalue = StringUtils.encryptImportant(value);
        Cookie cookie = new Cookie(name, newvalue);
        cookie.setDomain(domain);
        cookie.setMaxAge(saveTime);
        cookie.setPath("/"); // 设置分隔符
        cookie.setSecure(false);
        response.addCookie(cookie);
    }

    /**
     * 获取给定键值的Cookie。若给定的Cookie键不存在，则返回<code>null</code>。
     * 
     * @param request 一个HttpServletRequest对象，如JSP页面中的request对象。
     * @param name 给定的Cookie的键值。
     * @return 返回给定Cookie对象。
     */
    public static Cookie getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies(); // 获得Cookie的集合
        if (cookies == null || !StringUtils.hasText(name)) return null;
        for (int i = 0; i < cookies.length; i++) {
            if (name.equals(cookies[i].getName())) { return cookies[i]; }
        }
        return null;
    }

    /**
     * 获取给定键的 {@code Cookie} 值。若给定的 {@code Cookie} 的 {@code name} 不存在， 则返回
     * {@code null}。
     * 
     * @param request 当前Web应用的 {@code HttpServletRequest} 请求对象。
     * @param name 给定的 {@code Cookie} 的键值。
     * @param encryptImportant 取出的值是否要解密。
     * @return 返回给定键的 {@code Cookie} 值。
     */
    public static String getCookieValue(HttpServletRequest request, String name,
            boolean encryptImportant) {
        Cookie cookie = getCookie(request, name);
        if (cookie == null) return StringUtils.EMPTY;
        String value = cookie.getValue();
        // TODO: 取出保存在Cookie里的值，全部必须经过 StringUtil.decryptImportant(String) 方法的解密
        if (encryptImportant)
            return StringUtils.decryptImportant(value);
        else return value == null ? StringUtils.EMPTY : value.trim();
    }

    /**
     * 获取当前请求的用户的真实IP。若取不到IP值，则返回{@link StringUtil#EMPTY}值。
     * 
     * @param request 一个<code>HttpServletRequest</code>对象，如JSP页面中的<code>request</code>对象。
     * @return 返回当前请求用户的真实IP值。
     */
    public static String getIp(HttpServletRequest request) {
        if (request == null) return StringUtils.EMPTY;
        String ip = request.getHeader("X-Real-IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 获取客户端的信息（包括浏览器及版本、操作系统等）。
     * 
     * @param request 一个<code>HttpServletRequest</code>对象，如JSP页面中的<code>request</code>对象。
     * @return {@code UserAgent} 客户端信息。
     */
    public static UserAgent getUserAgent(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        return new UserAgent(userAgent.toLowerCase().trim());
    }
}
