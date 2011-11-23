/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) NumberUtils.java 1.0 2009-06-25
 */
package com.navigation.utils;

import java.util.List;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.text.DecimalFormat;
import java.lang.reflect.Array;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 包含数字类型处理的常用方法的工具类。
 * 
 * @author Fuchun
 * @version 1.0, 2009-06-14
 * @version 1.0.1, 2009-12-08 修改 format 方法，去除异常抛出，改为返回默认值 "0"
 */
public class NumberUtils extends Utils {
    
    private static final Log log = LogFactory.getLog(NumberUtils.class);

    /**
     * 生成给定固定数字类型值，及长度的特定数组。
     * 
     * <pre>
     * Integer[] shorts = buildNumberArray(0, 10);
     * // 生成 [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
     * </pre>
     * 
     * @param <T> 数字的类型。
     * @param number 固定的数字值。
     * @param length 要生成的数组的长度。
     * @return 固定数字类型值，及长度的特定数组。
     */
    @SuppressWarnings("unchecked")
    public static <T extends Number> T[] buildNumberArray(T number, int length) {
        T[] result = (T[]) Array.newInstance(number.getClass(), length);
        for (int i = 0; i < length; i++) {
            result[i] = number;
        }
        return result;
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code byte}。该方法相当于
     * <code>{@linkplain #parseByte(String, byte) parseByte(str, (byte)0)}</code>。
     * 
     * @param str 要解析的字符串。
     * @return 参数（十进制）表示的 {@code byte} 值。
     */
    public static byte parseByte(String str) {
        return parseByte(str, (byte) 0);
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code byte}。该字符串中的字符必须都是十进制数字，除非第一个字符是表示负值的 ASCII
     * 符号中的负号 '-' ('\u002D')。如果解析出的值超出 {@code java.lang.Byte}
     * 的值域范围，或者字符串参数解析错误，则返回给定的默认值 {@code defaultValue}。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code java.lang.Byte} 值域范围时，返回的默认值。
     * @return 参数（十进制）表示的 {@code byte} 值。
     */
    public static byte parseByte(String str, byte defaultValue) {
        if (str == null || "".equals(str.trim()))
            return defaultValue;
        try {
            return Byte.parseByte(str.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * 返回一个保持指定 {@code java.lang.String} 所给出的值的 {@code java.lang.Byte} 对象。该方法相当于
     * <code>Byte.valueOf({@linkplain #parseByte(String, byte) parseByte(str, (byte)defaultValue)})</code>。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code >java.lang.Byte} 值域范围时，返回的默认值。
     * @return 保持字符串参数所表示的值的 {@code java.lang.Byte} 对象
     */
    public static Byte parseByte(String str, Byte defaultValue) {
        return Byte.valueOf(parseByte(str, defaultValue.byteValue()));
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code short}。该方法相当于
     * <code>{@linkplain #parseShort(String, short) parseShort(str, (short)0)}</code>。
     * 
     * @param str 包含要解析的 {@code short} 表示形式的 {@code java.lang.String}。
     * @return 参数（十进制）表示的 {@code short} 值。
     */
    public static short parseShort(String str) {
        return parseShort(str, (short) 0);
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code short}。该字符串中的字符必须都是十进制数字，除非第一个字符是表示负值的 ASCII
     * 符号中的负号 '-' ('\u002D')。如果解析出的值超出 {@code java.lang.Short}
     * 的值域范围，或者字符串参数解析错误，则返回给定的默认值 {@code defaultValue}。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code java.lang.Short} 值域范围时，返回的默认值。
     * @return 参数（十进制）表示的 {@code short} 值。
     */
    public static short parseShort(String str, short defaultValue) {
        if (str == null || "".equals(str.trim()))
            return defaultValue;
        try {
            return Short.parseShort(str.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * 返回一个保持指定 {@code java.lang.String} 所给出的值的 {@code java.lang.Short} 对象。
     * 该方法相当于
     * <code>Short.valuOf({@linkplain #parseShort(String, short) parseShort(str, (short)defaultValue)})</code>。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code >java.lang.Short} 值域范围时，返回的默认值。
     * @return 保持字符串参数所表示的值的 {@code java.lang.Short} 对象
     */
    public static Short parseShort(String str, Short defaultValue) {
        return Short.valueOf(parseShort(str, defaultValue.shortValue()));
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code int}。该方法相当于
     * <code>{@linkplain #parseInt(String, int) parseInt(str, 0)}</code>。
     * 
     * @param str 要解析的字符串。
     * @return 参数（十进制）表示的 {@code int} 值。
     */
    public static int parseInt(String str) {
        return parseInt(str, 0);
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code int}。该字符串中的字符必须都是十进制数字，除非第一个字符是表示负值的 ASCII
     * 符号中的负号 '-' ('\u002D')。如果解析出的值超出 {@code java.lang.Integer}
     * 的值域范围，或者字符串参数解析错误，则返回给定的默认值 {@code defaultValue}。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code java.lang.Integer} 值域范围时，返回的默认值。
     * @return 参数（十进制）表示的 {@code int} 值。
     */
    public static int parseInt(String str, int defaultValue) {
        if (str == null || "".equals(str.trim()))
            return defaultValue;
        try {
            return Integer.parseInt(str.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * 返回一个保持指定 {@code java.lang.String} 所给出的值的 {@code java.lang.Integer} 对象。
     * 该方法相当于
     * <code>Integer.valueOf({@linkplain #parseInt(String, int) parseInt(str, 0)})</code>。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code Integer} 值域范围时，返回的默认值。
     * @return 保持字符串参数所表示的值的 {@code java.lang.Integer} 对象
     */
    public static Integer parseInt(String str, Integer defaultValue) {
        return Integer.valueOf(parseInt(str, defaultValue.intValue()));
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code long}。该方法相当于
     * <code>{@linkplain #parseLong(String, long) parseLong(str, 0L)}</code>。
     * 
     * @param str 要解析的字符串。
     * @return 参数（十进制）表示的 {@code long} 值。
     */
    public static long parseLong(String str) {
        return parseLong(str, 0L);
    }

    /**
     * 将字符串参数解析为有符号的十进制 {@code long}。该字符串中的字符必须都是十进制数字，除非第一个字符是表示负值的 ASCII
     * 符号中的负号 '-' ('\u002D')，它表示一个负值。如果解析出的值超出 {@code java.lang.Long}
     * 值域范围，或者字符串参数解析错误，则返回给定的默认值 {@code defaultValue}。
     * <p>
     * 注意，不允许将字符 L ('\u004C') 和 l ('\u006C') 作为类型指示符出现在字符串的结尾处，这一点在 Java
     * 编程语言源代码中是允许的。
     * </p>
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code java.lang.Long} 值域范围时，返回的默认值。
     * @return 参数（十进制）表示的 {@code long} 值。
     */
    public static long parseLong(String str, long defaultValue) {
        if (str == null || "".equals(str.trim()))
            return defaultValue;
        try {
            return Long.parseLong(str.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * 返回一个保持指定 {@code java.lang.String} 所给出的值的{@code java.lang.Long} 对象。
     * 该方法相当于
     * <code>Long.valueOf({@linkplain #parseLong(String, long) parseLong(str, (long)defaultValue)})</code>。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code java.lang.Long} 值域范围时，返回的默认值。
     * @return 保持字符串参数所表示的值的 {@code java.lang.Long} 对象
     */
    public static Long parseLong(String str, Long defaultValue) {
        return Long.valueOf(parseLong(str, defaultValue.longValue()));
    }

    /**
     * 返回一个新的 {@code float} 值，该值被初始化为用指定 {@code java.lang.String} 表示的值。该方法相当于
     * <code>{@linkplain #parseFloat(String, float) parseFloat(str, 0.0f)}</code>。
     * 
     * @param str 要解析的字符串。
     * @return 用字符串参数表示的 {@code float} 值。
     */
    public static float parseFloat(String str) {
        return parseFloat(str, 0.0f);
    }

    /**
     * 返回一个新的 {@code float} 值，该值被初始化为用指定 {@code java.lang.String} 表示的值。如果解析出的值超过{@code java.lang.Float}
     * 值域范围，或者字符串参数解析错误，则返回给定的默认值 {@code defaultValue}。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code java.lang.Float} 值域范围时，返回的默认值。
     * @return 用字符串参数表示的 {@code float} 值。
     */
    public static float parseFloat(String str, float defaultValue) {
        if (str == null || "".equals(str.trim()))
            return defaultValue;
        try {
            return Float.parseFloat(str.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * 返回一个新的 {@code double} 值，该值被初始化为用指定 {@code java.lang.String} 表示的值。该方法相当于
     * <code>{@linkplain #parseDouble(String, double) parseDouble(str, 0.0d)}</code>。
     * 
     * @param str 要解析的字符串。
     * @return 用字符串参数表示的 {@code double} 值。
     */
    public static double parseDouble(String str) {
        return parseDouble(str, 0.0d);
    }

    /**
     * 返回一个新的 {@code double} 值，该值被初始化为用指定 {@code java.lang.String}
     * 表示的值。如果解析出的值超过{@code java.lang.Double} 值域范围，或者字符串参数解析错误，则返回给定的默认值
     * {@code defaultValue}。
     * 
     * @param str 要解析的字符串。
     * @param defaultValue 解析错误或超出 {@code java.lang.Double} 值域范围时，返回的默认值。
     * @return 用字符串参数表示的 {@code double} 值。
     */
    public static double parseDouble(String str, double defaultValue) {
        if (str == null || "".equals(str.trim()))
            return defaultValue;
        try {
            return Double.parseDouble(str.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * 将 {@code java.math.BigDecimal} 的字符串表示形式转换为 {@code java.math.BigDecimal}。
     * 该方法相当于
     * <code>{@linkplain #parseDecimal(String, BigDecimal) parseDecimal(str, new BigDecimal("0.0"))}</code>。
     * 
     * @param str {@code java.math.BigDecimal} 的字符串表示形式。
     * @return 用字符串参数表示的 {@code java.math.BigDecimal}。
     */
    public static BigDecimal parseDecimal(String str) {
        return parseDecimal(str, new BigDecimal("0.0"));
    }

    /**
     * 将 {@code java.math.BigDecimal} 的字符串表示形式转换为 {@code java.math.BigDecimal}。
     * 
     * @param str {@code java.math.BigDecimal} 的字符串表示形式。
     * @param defaultValue 解析错误时，返回的默认值。
     * @return 用字符串参数表示的 {@code java.math.BigDecimal}。
     */
    public static BigDecimal parseDecimal(String str, BigDecimal defaultValue) {
        if (str == null || "".equals(str.trim()))
            return defaultValue;
        try {
            return new BigDecimal(str.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * 将一组给定的字符串转换为 {@code Byte} 类型值。
     * 
     * @param list 要转换的一组字符串。
     * @param defaultValues 转换失败时对应的默认值。
     * @return 一组 {@code Byte} 类型值。
     * @throws NullPointerException 如果给定的默认返回值 {@code defaultValues} 为
     *         {@code null}。
     * @throws ArrayIndexOutOfBoundsException 如果给定的默认返回值
     *         {@code defaultValues.length} &lt; {@code list.size()} 的长度。
     */
    public static Byte[] parse(List<String> list, Byte[] defaultValues) {
        if (isEmpty(list)) {
            return defaultValues;
        }
        int i = 0, length = list.size();
        if (length > defaultValues.length) {
            throw new ArrayIndexOutOfBoundsException(
                    "The Byte[] defaultValues length is not equals list length.");
        }
        Byte[] result = new Byte[length];
        for (; i < length; i++) {
            result[i] = parseByte(list.get(i), defaultValues[i]);
        }
        return result;
    }

    /**
     * 将一组给定的字符串转换为 {@code Short} 类型值。
     * 
     * @param list 要转换的一组字符串。
     * @param defaultValues 转换失败时对应的默认值。
     * @return 一组 {@code Short} 类型值。
     * @throws NullPointerException 如果给定的默认返回值 {@code defaultValues} 为
     *         {@code null}。
     * @throws ArrayIndexOutOfBoundsException 如果给定的默认返回值 {@code defaultValues}
     *         的数组长度小于 {@code list} 的长度。
     */
    public static Short[] parse(List<String> list, Short[] defaultValues) {
        if (isEmpty(list)) {
            return defaultValues;
        }
        int i = 0, length = list.size();
        if (length > defaultValues.length) {
            throw new ArrayIndexOutOfBoundsException(
                    "The Byte[] defaultValues length is not equals list length.");
        }
        Short[] result = new Short[length];
        for (; i < length; i++) {
            result[i] = parseShort(list.get(i), defaultValues[i]);
        }
        return result;
    }

    /**
     * 将一组给定的字符串转换为 {@code Integer} 类型值。
     * 
     * <pre>
     * Integer[] defaultValues = generateNumberArray(new Integer(0), 4);
     * List&lt;String&gt; list = GenericUtils.getList();
     * list.add(&quot;1&quot;);
     * list.add(&quot;2&quot;);
     * list.add(&quot;&quot;);
     * list.add(null);
     * Integer[] result = NumberUtils.parse(list, defaultValues);
     * 
     * // RESULT: { 1, 2, 0, 0 }
     * // 如果上面的 defaultValues = { 0, 0, 0 };
     * // 则抛出 ArrayIndexOutOfBoundsException 异常。
     * </pre>
     * 
     * @param list 要转换的一组字符串。
     * @param defaultValues 转换失败时对应的默认值。
     * @return 一组 {@code Integer} 类型值。
     * @throws NullPointerException 如果给定的默认返回值 {@code defaultValues} 为
     *         {@code null}。
     * @throws ArrayIndexOutOfBoundsException 如果给定的默认返回值 {@code defaultValues}
     *         的数组长度小于 {@code list} 的长度。
     */
    public static Integer[] parse(List<String> list, Integer[] defaultValues) {
        if (isEmpty(list)) {
            return defaultValues;
        }
        int i = 0, length = list.size();
        if (length > defaultValues.length) {
            throw new ArrayIndexOutOfBoundsException(
                    "The Integer[] defaultValues length is not equals list length.");
        }
        Integer[] result = new Integer[length];
        for (; i < length; i++) {
            result[i] = parseInt(list.get(i), defaultValues[i]);
        }
        return result;
    }

    /**
     * 将一组给定的字符串转换为 {@code Long} 类型值。
     * 
     * @param list 要转换的一组字符串。
     * @param defaultValues 转换失败时对应的默认值。
     * @return 一组 {@code Long} 类型值。
     * @throws NullPointerException 如果给定的默认返回值 {@code defaultValues} 为
     *         {@code null}。
     * @throws ArrayIndexOutOfBoundsException 如果给定的默认返回值 {@code defaultValues}
     *         的数组长度小于 {@code list} 的长度。
     */
    public static Long[] parse(List<String> list, Long[] defaultValues) {
        if (isEmpty(list)) {
            return defaultValues;
        }
        int i = 0, length = list.size();
        if (length > defaultValues.length) {
            throw new ArrayIndexOutOfBoundsException(
                    "The Byte[] defaultValues length is not equals list length.");
        }
        Long[] result = new Long[length];
        for (; i < length; i++) {
            result[i] = parseLong(list.get(i), defaultValues[i]);
        }
        return result;
    }

    /**
     * 判断给定的一个 {@code Integer} 类型值是否与给定的 {@code Short} 类型值相同。若基中一个给定的数字类型值为
     * {@code null}，则返回 {@code false}。
     * 
     * @param arg1 第一个 {@code Integer} 对象。
     * @param arg2 第一个 {@code Short} 对象。
     * @return 若给定的两个数字对象的值相同，则返回 {@code true}，否则 {@code false}。
     */
    public static boolean equals(Integer arg1, Short arg2) {
        if (arg1 == null || arg2 == null) {
            return false;
        }
        return arg1.intValue() == arg2.intValue();
    }

    /**
     * 判断两个给定的 {@code Integer} 类型值是否相同。若其中一个给定的整型值为 {@code null}，则返回
     * {@code false}。
     * 
     * @param arg1 第一个 {@code Integer} 对象。
     * @param arg2 第二个 {@code Integer} 对象。
     * @return 若给定的两个 {@code Integer} 类型值相同，则返回 {@code true}，否则 {@code false}。
     */
    public static boolean equals(Integer arg1, Integer arg2) {
        if (arg1 == null || arg2 == null) {
            return false;
        }
        return arg1.intValue() == arg2.intValue();
    }

    /**
     * 判断给定的一个 {@code Integer} 类型值是否与给定的 {@code Long} 类型值相同。若基中一个给定的数字类型值为
     * {@code null}，则返回 {@code false}。
     * 
     * @param arg1 第一个 {@code Integer} 对象。
     * @param arg2 第一个 {@code Long} 对象。
     * @return 若给定的两个数字对象的值相同，则返回 {@code true}，否则 {@code false}。
     */
    public static boolean equals(Integer arg1, Long arg2) {
        if (arg1 == null || arg2 == null) {
            return false;
        }
        return arg1.longValue() == arg2.longValue();
    }
    
    /**
     * 判断给定的一个 {@code Long} 类型值是否与给定的 {@code Short} 类型值相同。若基中一个给定的数字类型值为
     * {@code null}，则返回 {@code false}。
     * 
     * @param arg1 第一个 {@code Long} 对象。
     * @param arg2 第一个 {@code Short} 对象。
     * @return 若给定的两个数字对象的值相同，则返回 {@code true}，否则 {@code false}。
     */
    public static boolean equals(Long arg1, Short arg2) {
        if (arg1 == null || arg2 == null) {
            return false;
        }
        return arg1.longValue() == arg2.longValue();
    }
    
    /**
     * 判断给定的一个 {@code Long} 类型值是否与给定的 {@code Long} 类型值相同。若基中一个给定的数字类型值为
     * {@code null}，则返回 {@code false}。
     * 
     * @param arg1 第一个 {@code Long} 对象。
     * @param arg2 第一个 {@code Long} 对象。
     * @return 若给定的两个数字对象的值相同，则返回 {@code true}，否则 {@code false}。
     */
    public static boolean equals(Long arg1, Long arg2) {
        if (arg1 == null || arg2 == null) {
            return false;
        }
        return arg1.longValue() == arg2.longValue();
    }

    /**
     * 用给定的模式格式化给定的数字。数字的舍入模式由 {@code mode} 指定。
     * 
     * <pre>
     * NumberUtils.format(123456.78901, "###0.00"); --&gt; 123456.79
     * NumberUtils.format(123456.7991, "###0.00");  --&gt; 123456.80
     * </pre>
     * 
     * @param <T> 要格式化的数字类型。
     * @param number 要格式化的数字。
     * @param pattern 给定的格式模式。
     * @param mode 给定的舍入模式。
     * @return 已格式化的数字字符串。
     */
    public static <T extends Number> String format(T number, String pattern, RoundingMode... mode) {
        NumberFormat nformat = new DecimalFormat(pattern);
        if (isEmpty(mode))
            nformat.setRoundingMode(RoundingMode.HALF_UP);
        else
            nformat.setRoundingMode(mode[0]);
        try {
            return nformat.format(number);
        } catch (IllegalArgumentException ex) {
            log.warn("给定的格式化模式"
                    + (pattern == null ? "" : "(" + pattern + ")") + "不正确。", ex);
            return "0";
        }
    }

    /**
     * 格式化给定的数字。不保留小数点后面的位数，并四舍五入。该方法相当于调用 {@code format(number, "###0")}。
     * 
     * @param <T> 要格式化的数字类型。
     * @param number 要格式化的数字。
     * @return 已格式化的数字字符串。
     */
    public static <T extends Number> String format(T number) {
        return format(number, "###0");
    }
}