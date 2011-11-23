package com.navigation.utils;

import java.util.Map;
import java.util.HashMap;
import java.util.Collections;
import java.util.regex.Pattern;

/**
 * 包含常用正在则表达式常量、正则表达式常用方法的工具类。
 * 
 * @author Fuchun
 * @version 1.0, 2009-06-22
 */
public class RegexpUtils extends Utils {

    /** 匹配单个任意字符（{@code .}）。 */
    public static final char POINTER = '.';

    /** 匹配任意多次，也可能不匹配（{@code *}）。 */
    public static final char ASTERRISK = '*';

    /** 容许匹配一次，但不是必须的（{@code ?}）。 */
    public static final char QUESTION_MASK = '?';

    /** 匹配数字范围的开始符（<tt>{</tt>）。 */
    public static final char RANGE_START1 = '{';

    /** 匹配数字范围的结束符（<tt>}</tt>）。 */
    public static final char RANGE_END1 = '}';

    /** 匹配数字范围的开始符（{@code [}）。 */
    public static final char RANGE_START2 = '[';

    /** 匹配数字范围的结束符（{@code ]}）。 */
    public static final char RANGE_END2 = ']';

    // 匹配字符
    // -------------------------------------------------------------------------
    /** 匹配反斜线字符：{@code \\} */
    public static final String BACKLASH = "\\\\";

    /** 匹配制表符：'\{@code u0009}' */
    public static final String TAB = "\\t";

    /** 匹配换行(新行)符：'\{@code u000A}' */
    public static final String NEW_LINE = "\\n";

    /** 匹配回车符：'\{@code u000D}' */
    public static final String ENTER = "\\r";

    /** 匹配换页符：'\{@code u000C}' */
    public static final String FORM_FEED = "\\f";

    /** 匹配报警符：'\{@code u0007}' */
    public static final String BELL = "\\a";

    /** 匹配转义符：'\{@code u001B}' */
    public static final String ESCAPE = "\\e";

    // 边界匹配器
    // -------------------------------------------------------------------------
    /** 匹配行的开头：{@code ^} */
    public static final String CARET = "^";

    /** 匹配行的结尾：{@code $} */
    public static final String DOLLAR_SIGN = "$";

    /** 匹配单词边界：{@code \b} */
    public static final String WORD_BOUNDARY = "\\b";

    /** 匹配非单词边界：{@code \B} */
    public static final String NON_WORD_BOUNDARY = "\\B";

    // 预定义字符
    // -------------------------------------------------------------------------
    /** 匹配数字：{@code [0-9]} */
    public static final String NUMERICAL = "\\d";

    /** 匹配非数字：{@code [^0-9]} */
    public static final String NON_NUMERIC = "\\D";

    /** 匹配空白字符：{@code [ \t\n\x0B\f\r]} */
    public static final String WHITE_SPACE = "\\s";

    /** 匹配非空白字符：{@code [^\s]} */
    public static final String NON_WHITESPACE = "\\S";

    /** 匹配单词字符：{@code [a-zA-Z_0-9]} */
    public static final String WORD_CHARACTER = "\\w";

    /** 匹配非单词字符：{@code [^\w]} */
    public static final String NOT_WORD_CHARACTER = "\\W";

    /** 用于查找缓存中手机号码模式的 {@code Key}。 */
    public static final String MOBILE_NUMBER_KEY = "mobile.number";

    /** 用于保存生成的正则表达式串的缓存 {@code Hash} 表。 */
    protected static final Map<String, Pattern> regexpCache;
    static {
        regexpCache = Collections.synchronizedMap(new HashMap<String, Pattern>());
    }

    /**
     * 用于保存生成的正则表达式的编译表达形式的缓存 {@code Hash} 表。
     * 
     * @return 保存常用表达式的缓存 {@code Hash} 表。
     */
    public static Map<String, Pattern> getRegexpCache() {
        return regexpCache;
    }
}