/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) Utils.java 1.0.1 2009-07-03
 */
package com.navigation.utils;

import java.util.Map;
import java.util.Iterator;
import java.util.Collection;
import java.util.Enumeration;
import java.lang.reflect.Array;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 包含基本 {@code Java} 类型基本操作常用方法的便捷工具类。该类也是 {@code util} 工具包 的顶级类。
 * 
 * @author Fuchun
 * @version 1.0, 2009-06-17
 * @version 1.0.1, 2009-07-03 Fuchun {@code #isEmpty(Object)} 方法的参数是
 *          {@code String} 类型时，将去除前导和后导空格进行空值(空字符串)判定。
 * @version 1.0.2, 2009-07-20 Fuchun 添加可变参数的空值判断 {@link #hasValue(Object...)}。
 */
public class Utils {

    @SuppressWarnings("unused")
    private static final Log log = LogFactory.getLog(Utils.class);

    /** 类似布尔值中的 {@code true}。 */
    public static final String ON = "on";

    /** 类似布尔值中的 {@code false}。 */
    public static final String OFF = "off";

    /** 类似布尔值中的 {@code true}。 */
    public static final String FLAG_TRUE = "1";

    /** 类似布尔值中的 {@code false}。 */
    public static final String FLAG_FALSE = "0";

    /** 布尔值中的 {@code true} 的字符串形式。 */
    public static final String TRUE = Boolean.toString(true);

    /** 布尔值中的 {@code false} 的字符串形式。 */
    public static final String FALSE = Boolean.toString(false);

    /** 表示一个空字符串的常量（表示为：<strong>&quot;&quot;</strong>）。 */
    public static final String EMPTY = "";

    /** 表示一个空白字符的常量（表示为：<strong>&quot; &quot;</strong>）。 */
    public static final char WHITESPACE = ' ';

    /** 表示一个空值的字符串常量，即&quot;null&quot;。 */
    public static final String NULL = "null";

    /** 实际的程序中，不会调用该构造方法。 */
    protected Utils() {
        super();
    }

    /**
     * 检测给定的对象是否<strong>为空</strong>。
     * <p>
     * <strong>object</strong> 类型列表：
     * <ul>
     * <li>java.util.Collection --&gt; 为null或者长度为 0 时，返回 {@code true}，否则{@code false}。</li>
     * <li>java.util.Iterator --&gt; 为null或者无下一个元素时，返回 {@code true}，否则{@code false}。</li>
     * <li>java.util.Map --&gt; 为null或者大小为 0 时，返回 {@code true}，否则{@code false}。</li>
     * <li>java.lang.String --&gt; 为null或者为空字符串时，返回 {@code true}，否则{@code false}。</li>
     * <li>java.util.Enumeration --&gt; 为null或者无下一个元素时，返回 {@code true}，否则{@code false}。</li>
     * <li>java.lang.Array --gt; 为null或者长度为 0 时，返回 {@code true}，否则{@code false}。</li>
     * </ul>
     * </p>
     * 
     * @param object 要检测的对象。
     * @return 若检测的对象为空(值)，返回 {@code true}，否则{@code false}。
     */
    @SuppressWarnings("unchecked")
    public static boolean isEmpty(Object object) {
        if (object == null) return true;
        if (object.getClass().isPrimitive() || object instanceof CharSequence)
            return EMPTY.equals(String.valueOf(object).trim());
        else if (object instanceof Collection)
            return ((Collection<?>) object).size() == 0;
        else if (object instanceof Map)
            return ((Map<?, ?>) object).size() == 0;
        else if (object instanceof Iterator)
            return !((Iterator<?>) object).hasNext();
        else if (object instanceof Enumeration)
            return !((Enumeration<?>) object).hasMoreElements();
        else if (object.getClass().isArray()) {
            try {
                return Array.getLength(object) == 0;
            } catch (IllegalArgumentException e) {
                // ignore
            }
        }
        return EMPTY.equals(object.toString().trim());
    }

    /**
     * 检测给定的对象是否<strong>不为空</strong>。具体见 {@link #isEmpty(Object)}
     * 
     * @param object 要检测的对象。
     * @return 若检测的对象不为空(值)，返回 {@code true}，否则 {@code false}。
     * @see #isEmpty(Object)
     */
    public static boolean isNotEmpty(Object object) {
        return !isEmpty(object);
    }
    
    /**
     * 检测给定的可变参数是否有值。
     * <p />
     * 该方法首先判定
     * <code>values == null || values.length == 0 || values[0] == null</code>，如果成立，即刻返回
     * {@code false}。
     * <p />
     * 如果不成立，继续用 {@linkplain #isNotEmpty(Object) isNotEmpty(values[0])} 方法判定
     * {@code values[0]} 是否不为空。
     * 
     * @param <T> 可变参数的类型。
     * @param values 给定的可变参数。
     * @return 如果可变参数有值，则返回 {@code true}，否则 {@code false}。
     */
    public static <T> boolean hasValue(T... values) {
        if (values == null || values.length == 0 || values[0] == null) return false;
        return isNotEmpty(values);
    }

    /**
     * 返回给定对象的长度。
     * 
     * @param object 要计算长度的对象。
     * @return 给定字符串的字节长度。
     */
    @SuppressWarnings("unchecked")
    public static Integer getLength(Object object) {
        if (object == null) return 0;
        if (object.getClass().isPrimitive() || object instanceof CharSequence)
            return (String.valueOf(object)).length();
        if (object instanceof Collection) return ((Collection<?>) object).size();
        if (object instanceof Map) return ((Map<?, ?>) object).size();
        int count = 0;
        if (object instanceof Iterator) {
            Iterator<?> it = (Iterator<?>) object;
            while (it.hasNext()) {
                count++;
                it.next();
            }
            return count;
        }
        if (object instanceof Enumeration) {
            Enumeration<?> enum_ = (Enumeration<?>) object;
            while (enum_.hasMoreElements()) {
                count++;
                enum_.nextElement();
            }
            return count;
        }
        try {
            count = Array.getLength(object);
            return count;
        } catch (IllegalArgumentException ex) {
            // ignore
        }
        return object.toString().length();
    }
}