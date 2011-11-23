/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) StringUtils.java 1.0 2009-07-27
 */
package com.navigation.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.navigation.utils.html.HtmlRegexpUtils;
import com.navigation.utils.html.HtmlTags;


/**
 * 包含字符串处理的常用方法的工具类。包括字符串解析、加密解密、URL转换、HTML标签转换、查找替换等操作方法。
 * <p />
 * 自 {@code v1.1} 版本开始，{@link #isNullOrEmpty(CharSequence)} 方法，检测字符串是否为空或空字符串时，
 * 不再去除给定字符串的前导和后导空白字符。
 * 
 * @author Fuchun
 * @version 1.0, 2009-06-09,
 * @version 1.1, 2009-07-23 by Fuchun
 */
public class StringUtils extends Utils {

    private static final Log log = LogFactory.getLog(StringUtils.class);

    /** 表示 <strong>GBK</strong> 编码方式的字符串。 */
    public static final String GBK = "GBK";

    /** 表示 <strong>UTF-8</strong> 编码方式的字符串。 */
    public static final String UTF8 = "UTF-8";

    /** {@code DES} 算法的名称。 */
    // public static final String DES_ALGORITHM = Crypto.DES_ALGORITHM;
    /** {@code MD5} 算法的名称。 */
    // public static final String MD5_ALGORITHM = Crypto.MD5_ALGORITHM;
    /** {@code SHA} 算法的名称。 */
    // public static final String SHA_ALGORITHM = Crypto.SHA_ALGORITHM;
    private static Pattern urlPatternCache = null;

    private static String urlRegexCache = null;

    private static final Object urlPatternLock = new Object();

    private static final Object urlRegexLock = new Object();

    // HEX CHARS
    private static final char[] HEX_CHARS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            'A', 'B', 'C', 'D', 'E', 'F' };

    private static final int HIGHEST_SPECIAL = '>';

    private static char[][] specialCharactersRepresentation = new char[HIGHEST_SPECIAL + 1][];
    static {
        specialCharactersRepresentation['&'] = "&amp;".toCharArray();
        specialCharactersRepresentation['<'] = "&lt;".toCharArray();
        specialCharactersRepresentation['>'] = "&gt;".toCharArray();
        specialCharactersRepresentation['"'] = "&#034;".toCharArray();
        specialCharactersRepresentation['\''] = "&#039;".toCharArray();
    }

    /**
     * 检测给定的字符串是否为 {@code null}、{@code "null"} 或者为空字符串("")。
     * <p />
     * <strong>注意：此方法检查字符序列时不再去除前导和后导空格。</strong>
     * 
     * @param str 要检测的字符串。
     * @return 若给定的字符串为 {@code null} 或者为空字符串（{@code ""}），则返回 {@code true}，否则为
     *         {@code false}。
     * @see #hasText(CharSequence)
     */
    public static boolean isNullOrEmpty(CharSequence str) {
        return str == null || "".equals(str.toString()) || "null".equalsIgnoreCase(str.toString());
    }

    /**
     * 检测给定的字符序列中是否有实际的文本值。
     * <p />
     * <strong>如果给定的字符序列不为 {@code null}，并且字符序列中至少有一个非空白字符，则返回 {@code true}。</strong>
     * 
     * <pre>
     * StringUtils.hasText(null);   --&gt; false
     * StringUtils.hasText("");     --&gt; false
     * StringUtils.hasText("  ");   --&gt; false
     * StringUtils.hasText(" 321 ") --&gt; true
     * </pre>
     * 
     * @param chars 要检测的字符序列。
     * @return 如果给定的字符序列不为 {@code null}，并且字符序列中至少有一个非空白字符，则返回 {@code true}，否则为
     *         {@code false}。
     */
    public static boolean hasText(CharSequence chars) {
        return chars != null && !("".equals(chars.toString().trim()));
    }

    /**
     * 检测给定的字符串<strong>是否不为{@code null}，并且长度大于0</strong>。
     * 
     * @param str 要检测的字符串。
     * @return 若给定的字符串不为{@code null}，并且长度大于0，则返回 {@code true}，否则{@code false}。
     */
    public static boolean hasLength(String str) {
        return (str != null && str.length() > 0);
    }

    /**
     * 检测给定的字符串<strong>是否全都是空白字符</strong>。
     * 
     * <pre>
     * StringUtils.isBlank(null);   --&gt; false
     * StringUtils.isBlank("");     --&gt; false
     * StringUtils.isBlank("   ");  --&gt; true
     * StringUtils.isBlank("  1 "); --&gt; false
     * </pre>
     * 
     * @param str 要检测的字符串。
     * @return 若给定的字符串全都是空白字符，则返回 {@code true}，否则为 {@code false}。
     * @see java.lang.Character#isWhitespace(char)
     */
    public static boolean isBlank(String str) {
        if (!hasLength(str))
            return false;
        StringBuffer buffer = new StringBuffer(str);
        int strLen = buffer.length();
        for (int i = 0; i < strLen; i++) {
            if (!Character.isWhitespace(buffer.charAt(i)))
                return false;
        }
        return true;
    }

    /**
     * 测试给定字符串是否忽略大小写并且以指定的前缀开始。
     * 
     * <pre>
     * String str = "AbcDefghijklmn";
     * String prefix1 = "AbcDe";
     * String prefix2 = "abcde";
     * StringUtils.startsWith(null, null) = false
     * StringUtils.startsWith(str, null) = false
     * StringUtils.startsWith(str, prefix1) = true
     * StringUtils.startsWith(str, prefix2) = false
     * StringUtils.startsWith(str, prefix2, true) = true
     * </pre>
     * 
     * @param str 给定的字符串。
     * @param prefix 给定的前缀。
     * @param ignoreCase 是否忽略大小写。
     * @return 如果参数表示的字符序列 {@code prefix} 是给定字符串 {@code str} 表示的字符序列的前缀，则返回
     *         {@code true}；否则返回 {@code false}。还要注意，如果前缀 {@code prefix}
     *         是空字符串，或者 {@code str.equals(prefix) == true}，则返回 {@code true}。
     */
    public static boolean startsWith(String str, String prefix, boolean... ignoreCase) {
        if (str == null || prefix == null) {
            return false;
        }
        if (str.startsWith(prefix)) {
            return true;
        }
        // 指定大小写敏感
        if (ignoreCase == null || ignoreCase.length == 0 || !ignoreCase[0]) {
            return false;
        }
        if (str.length() < prefix.length()) {
            return false;
        }
        String lcStr = str.substring(0, prefix.length());
        return lcStr.equalsIgnoreCase(prefix);
    }

    /**
     * 测试给定字符串是否忽略大小写并且以指定的后缀结束。
     * 
     * <pre>
     * String str = "abcdefghiJklMn";
     * String suffix = "jklMn";
     * StringUtils.endsWith(null, suffix) = false
     * StringUtils.endsWith(str, null) = false
     * StringUtils.endsWith(str, suffix) = false
     * StringUtils.endsWith(str, suffix, true) = true
     * StringUtils.endsWith(str, "") = true
     * </pre>
     * 
     * @param str 给定的字符串。
     * @param suffix 给定的后缀。
     * @param ignoreCase 是否忽略大小写。
     * @return 如果参数表示的字符序列 {@code suffix} 是给定字符串 {@code str} 表示的字符序列的后缀，则返回
     *         {@code true}；否则返回 {@code false}。还要注意，如果后缀 {@code suffix}
     *         是空字符串，或者 {@code str.equals(suffix) == true}，则返回 {@code true}。
     */
    public static boolean endsWith(String str, String suffix, boolean... ignoreCase) {
        if (str == null || suffix == null) {
            return false;
        }
        if (str.endsWith(suffix)) {
            return true;
        }
        // 指定大小写敏感
        if (ignoreCase == null || ignoreCase.length == 0 || !ignoreCase[0]) {
            return false;
        }
        if (str.length() < suffix.length()) {
            return false;
        }
        String lcStr = str.substring(str.length() - suffix.length());
        return lcStr.equalsIgnoreCase(suffix);
    }

    /**
     * 测试给定的字符串中是否含有空白字符。
     * 
     * @param str 给定的字符串。
     * @return 如果给定的字符串中存在空白字符，则返回 {@code true}，否则为 {@code false}。
     */
    public static boolean containsBlank(String str) {
        if (!hasLength(str)) {
            return false;
        }
        int strLen = str.length();
        for (int i = 0; i < strLen; i++) {
            if (Character.isWhitespace(str.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    /**
     * 返回给定字符串的副本，除去指定的前导和后导字符。
     * 
     * <pre>该方法使用的例子：
     * String str1 = "  123456 ", str2 = "_123456___";
     * StringUtils.trim(str1);       --&gt; "123456"
     * StringUtils.trim(str1, ' ');  --&gt; "123456";
     * StringUtils.trim(str1, '1');  --&gt; "  123456 ";
     * StringUtils.trim(str2);       --&gt; "_123456___";
     * StringUtils.trim(str2, '_');  --&gt; "123456";
     * </pre>
     * 
     * @param str 给定的字符串。
     * @param character 要除去的前导和后导字符。
     * @return 此字符串移除了前导和后导的指定字符的副本；如果没有前导字符，则返回此字符串。
     */
    public static String trim(String str, char... character) {
        if (str == null) {
            return EMPTY;
        }
        char c = character != null && character.length > 0 ? character[0] : ' ';
        if (c == ' ') {
            return str.trim();
        }
        str = trimLeft(str, c);
        str = trimRight(str, c);
        return str;
    }

    /**
     * 去除给定字符串中的所有空白字符。
     * 
     * <pre>
     * StringUtils.trimAllBlank(null);    --&gt; ""
     * StringUtils.trimAllBlank("     "); --&gt; ""
     * StringUtils.trimAllBlank("  123"); --&gt; "123"
     * StringUtils.trimAllBlank("1  23"); --&gt; "123"
     * StringUtils.trimAllBlank("1 23 "); --&gt; "123"
     * </pre>
     * 
     * @param str 给定的字符串。
     * @return 无空白字符的字符串。
     * @see java.lang.Character#isWhitespace(char)
     */
    public static String trimAllBlank(String str) {
        if (!hasLength(str)) {
            return EMPTY;
        }
        StringBuffer buffer = new StringBuffer();
        int strLen = str.length();
        for (int i = 0; i < strLen; i++) {
            char c = str.charAt(i);
            if (!Character.isWhitespace(c))
                buffer.append(c);
        }
        return buffer.toString();
    }

    /**
     * 返回给定字符串的副本，忽略前导空白字符。
     * 
     * <pre>
     * StringUtils.trimLeft(null);   --&gt; ""
     * StringUtils.trimLeft("123  ");--&gt; "123  "
     * StringUtils.trimLeft("  123");--&gt; "123"
     * </pre>
     * 
     * @param str 要移除前导空白字符的字符串。
     * @return 此字符串移除了前导空白的副本；如果没有前导空白，则返回此字符串。
     */
    public static String trimLeft(String str) {
        if (!hasLength(str)) {
            return EMPTY;
        }
        StringBuffer buf = new StringBuffer(str);
        while (buf.length() > 0 && Character.isWhitespace(str.charAt(0))) {
            buf.deleteCharAt(0);
        }
        return buf.toString();
    }

    /**
     * 返回给定字符串的副本，忽略指定的前导字符。
     * 
     * <pre>
     * StringUtils.trimLeft(null, '0');   --&gt; ""
     * StringUtils.trimLeft("12300", '0');--&gt; "12300"
     * StringUtils.trimLeft("00123", '0');--&gt; "123"
     * </pre>
     * 
     * @param str 要移除前导字符的字符串。
     * @param leadingCharacter 要移除的字符。
     * @return 此字符串移除了前导字符的副本；如果没有给定的前导字符，则返回此字符串。
     */
    public static String trimLeft(String str, char leadingCharacter) {
        if (!hasLength(str)) {
            return EMPTY;
        }
        StringBuffer buf = new StringBuffer(str);
        while (buf.length() > 0 && buf.charAt(0) == leadingCharacter) {
            buf.deleteCharAt(0);
        }
        return buf.toString();
    }

    /**
     * 返回给定字符串的副本，忽略后导空白字符。
     * 
     * <pre>
     * StringUtils.trimLeft(null);   --&gt; ""
     * StringUtils.trimLeft("123  ");--&gt; "123"
     * StringUtils.trimLeft("  123");--&gt; "  123"
     * </pre>
     * 
     * @param str 要移除后导空白字符的字符串。
     * @return 此字符串移除了后导空白的副本；如果没有后导空白，则返回此字符串。
     */
    public static String trimRight(String str) {
        if (!hasLength(str)) {
            return EMPTY;
        }
        StringBuffer buf = new StringBuffer(str);
        while (buf.length() > 0 && Character.isWhitespace(str.charAt(buf.length() - 1))) {
            buf.deleteCharAt(buf.length() - 1);
        }
        return buf.toString();
    }

    /**
     * 返回给定字符串的副本，忽略给定的后导字符。
     * 
     * <pre>
     * StringUtils.trimLeft(null, '0');   --&gt; ""
     * StringUtils.trimLeft("12300", '0');--&gt; "123"
     * StringUtils.trimLeft("00123", '0');--&gt; "00123"
     * </pre>
     * 
     * @param str 要移除给定后导字符的字符串。
     * @param trailingCharacter 要移除的后导字符。
     * @return 此字符串移除了后导字符的副本；如果没有给定的后导字符，则返回此字符串。
     */
    public static String trimRight(String str, char trailingCharacter) {
        if (!hasLength(str)) {
            return EMPTY;
        }
        StringBuffer buf = new StringBuffer(str);
        while (buf.length() > 0 && buf.charAt(buf.length() - 1) == trailingCharacter) {
            buf.deleteCharAt(buf.length() - 1);
        }
        return buf.toString();
    }

    /**
     * 返回给定字符串的字节长度。
     * <p>
     * 返回的字符串字节长度根据指定的 {@code encoding} 字符编码确定。{@code encoding} 为 {@code null}
     * 或者空字符串("")时，返回的长度等效于 {@code str.length()}。可选择的计算长度的编码方式：<strong>GBK、UTF-8</strong>。
     * <ul>
     * <li>GBK - 一个全角字符 ＝ 两个字节，一个半角字符 ＝ 一个字节</li>
     * <li>UTF-8 - 一个全角字符 ＝ 三个字节，一个半角字符 ＝ 一个字节</li>
     * </ul>
     * </p>
     * 
     * @param str 要计算长度的字符串。
     * @param encoding 要依据计算长度的字符编码方式。
     * @return 给定字符串的字节长度。
     */
    public static int getLength(String str, String... encoding) {
        if (isNullOrEmpty(str))
            return 0;
        String strEncoding = hasValue(encoding) ? encoding[0] : UTF8;
        String regexpSBCCase = "[^x00-xff]";
        if (GBK.equalsIgnoreCase(strEncoding)) {
            return str.replaceAll(regexpSBCCase, "**").length();
        } else if (UTF8.equalsIgnoreCase(strEncoding)) {
            return str.replaceAll(regexpSBCCase, "***").length();
        } else { // 默认为 UTF-8
            return str.replaceAll(regexpSBCCase, "***").length();
        }
    }

    /**
     * 检测给定的字符串的每一个字符是否是数字(0-9)(<strong>该方法首先会去除给定字符串的前导和后导空格符</strong>)。
     * 
     * @param str 要检测的字符串。
     * @return 若给定的字符串的每一个字符都是数字，则返回 {@code true}，否则{@code false}。
     */
    public static boolean isAllDigit(String str) {
        if (isNullOrEmpty(str))
            return false;
        StringBuffer buffer = new StringBuffer(str.trim());
        for (int i = 0, len = buffer.length(); i < len; i++) {
            if (!Character.isDigit(buffer.charAt(i)))
                return false;
        }
        return true;
    }

    /**
     * 检测给定的字符串的每一个字符是否是英文字母(a-zA-Z)(<strong>该方法首先会去除给定字符串的前导和后导空格符</strong>)。
     * 
     * @param str 要检测的字符串。
     * @return 若给定的字符串的每一个字符都是英文字母，则返回 {@code true}，否则{@code false}。
     */
    public static boolean isAllLetter(String str) {
        if (isNullOrEmpty(str))
            return false;
        String remainingStr = str.trim().replaceAll("[a-zA-Z]", EMPTY);
        return isEmpty(remainingStr);
    }

    /**
     * 检测给定的字符串是否可解析为用 {@code java.util.Date} 表示的日期。
     * 
     * @param str 给定的字符串。
     * @return 若给定的字符串可以解析为用 {@code java.util.Date} 表示的日期，则返回 {@code true}，否则{@code false}。
     */
    public static boolean isDate(String str) {
        if (isNullOrEmpty(str))
            return Boolean.FALSE;
        SimpleDateFormat sdf = new SimpleDateFormat();
        try {
            return sdf.parse(str) != null;
        } catch (ParseException ex) {
            // ignore exception
        }
        return Boolean.FALSE;
    }

    /**
     * 检测给定的字符串是否是一个合法的Email。
     * 
     * @param str 要检测的字符串。
     * @return 若给定的字符串是一个合法的Email，则返回 {@code true}，否则{@code false}。
     */
    public static boolean isEmail(String str) {
        if (isNullOrEmpty(str))
            return false;
        return Pattern.matches("^\\w+(?:[\\-\\.]\\w+)*@\\w+(?:-\\w+)*\\.\\w+(?:\\-\\w+)?(?:\\.\\w+)?$", str.trim());
    }

    /**
     * 获取查找 {@code URL} 的正则表达式的编译表示形式。
     * 
     * @return 查找 {@code URL} 的正则表达式的编译表示形式。
     */
    public static Pattern getFindURLPattern() {
        if (urlPatternCache == null) {
            synchronized (urlPatternLock) {
                if (urlPatternCache == null) {
                    urlPatternCache = Pattern.compile(getFindURLRegex());
                }
            }
        }
        return urlPatternCache;
    }

    /**
     * 获取查找 {@code URL} 的正则表达式的字符串。
     * 
     * @return 查找 {@code URL} 的正则表达式的字符串。
     */
    private static String getFindURLRegex() {
        if (urlRegexCache == null) {
            synchronized (urlRegexLock) {
                if (urlRegexCache == null) {
                    final String subDomain = "(?i:[a-z0-9]|[a-z0-9][-a-z0-9]*[a-z0-9])";
                    StringBuffer tdBuffer = new StringBuffer("(?x-i:");
                    tdBuffer.append("com\\.[a-z][a-z]|edu\\.[a-z][a-z]|gov\\.[a-z][a-z]|");
                    tdBuffer.append("net\\.[a-z][a-z]|org\\.[a-z][a-z]|info\\.[a-z][a-z]|");
                    tdBuffer.append("com|asia|edu|gov|biz|in(?:t|fo)|mil|net|org|");
                    tdBuffer.append("name|museum|coop|[a-z][a-z])\\b");
                    final String topDomain = tdBuffer.toString();
                    final String hostName = "(?:" + subDomain + "\\.)+" + topDomain;
                    final String notIn = ";\"'<>()\\[\\]{}\\s\\x7F-\\xFF";
                    final String notEnd = "!.,?";
                    final String anyWhere = "[^" + notIn + notEnd + "]";
                    final String embeded = "[" + notEnd + "]";
                    final String urlPath = "/" + anyWhere + "*(" + embeded + "+" + anyWhere + "+)*";
                    StringBuffer buffer = new StringBuffer("(?x:\\b");
                    buffer.append("((?:ftp|https?)://[-\\w]+(\\.\\w[-\\w]*)+|").append(hostName)
                            .append(")");
                    buffer.append("(?::\\d+)?(?:").append(urlPath).append(")?)");
                    if (log.isDebugEnabled())
                        log.debug("The URL regex is : " + buffer.toString());
                    urlRegexCache = buffer.toString();
                }
            }
        }
        return urlRegexCache;
    }

    /**
     * 检测给定的字符串是否是一个符合规范的 {@code URL} 地址。
     * 
     * @param url 给定的字符串。
     * @return 若给定的字符串是一个符合规范的 {@code URL} 地址，则返回 {@code true}，否则{@code false}。
     */
    public static boolean isURL(String url) {
        StringBuffer buffer = new StringBuffer("^");
        buffer.append(getFindURLRegex()).append("$");
        Matcher m = Pattern.compile(buffer.toString()).matcher(url);
        return m.find();
    }

    /**
     * 检测给定的一组字符串中是否包含给定的值。
     * 
     * @param target 给定的字符串值。
     * @param strings 给定的一组字符串。
     * @return 若给定的一组字符串中包含给定的值，则返回 {@code true}。
     */
    public static boolean inArray(String target, String... strings) {
        if (target == null)
            return false;
        if (isNotEmpty(strings)) {
            if (strings.length <= 10000) {
                for (String str : strings) {
                    if (target.equals(str))
                        return true;
                }
            } else {
                int index = Collections.binarySearch(Arrays.asList(strings), target);
                if (index != -1)
                    return true;
                return false;
            }
        }
        return false;
    }

    /**
     * 将字符串中的XML特殊字符转换成 XML 可显示的字符。
     * 
     * <pre>下列字符经过转换后的字符:
     *    &amp; --&gt; &amp;amp;
     *    &lt; --&gt; &amp;lt;
     *    &gt; --&gt; &amp;gt;
     *    &quot; --&gt; &amp;#034;
     *    &#039; --&gt; &amp;#039;
     * </pre>
     * 
     * @param str 要处理的字符串。
     * @return 处理后的字符串。
     */
    public static String escapeXml(String str) {
        int start = 0;
        int length = str.length();
        char[] arrayBuffer = str.toCharArray();
        StringBuffer escapedBuffer = null;

        for (int i = 0; i < length; i++) {
            char c = arrayBuffer[i];
            if (c <= HIGHEST_SPECIAL) {
                char[] escaped = specialCharactersRepresentation[c];
                if (escaped != null) {
                    // 创建 StringBuffer 保存转义的XML特殊字符
                    if (start == 0) {
                        escapedBuffer = new StringBuffer(length + 5);
                    }
                    // 添加未转义的部分
                    if (start < i) {
                        escapedBuffer.append(arrayBuffer, start, i - start);
                    }
                    start = i + 1;
                    // 添加转义的XML特殊字符
                    escapedBuffer.append(escaped);
                }
            }
        }
        // 没有Xml字符则无须转换
        if (start == 0) {
            return str;
        }
        // 添加余于的未转义的字符
        if (start < length) {
            escapedBuffer.append(arrayBuffer, start, length - start);
        }
        return escapedBuffer.toString();
    }

    
    /**
     * 将字符串中的XML特殊字符转换成 XML 可显示的字符。
     * 
     * <pre>下列字符经过转换后的字符:
     *    &gt; &amp;amp; -- &amp;
     *    &gt; &amp;lt; -- &lt;
     *    &gt; &amp;gt; -- &gt;
     *    &gt; &amp;#034; -- &quot;
     *    &gt; &amp;#039; -- &#039;
     * </pre>
     * 
     * @param src 要处理的字符串。
     * @return 处理后的字符串。
     */
    public static String unescapeXml(String str) {
//        str = str.replaceAll("&amp;", "&");
//        str = str.replaceAll("&lt;", "<");
//        str = str.replaceAll("&gt;", ">");
//        str = str.replaceAll("&#034;", "\"");
//        str = str.replaceAll("&#039;", "'");
//        return str;
        StringBuilder sb = new StringBuilder();
        Matcher m = Pattern.compile("&amp;|&lt;|&gt;|&#034;|&#039;").matcher(str);
        int startIndex=0;
        int endIndex = 0;
        while(m.find()){
            sb.append(str.substring(startIndex, m.start()));
            String subStr = m.group();
            if(subStr.equals("&amp;")){
                sb.append("&");
            }else if(subStr.equals("&lt;")){
                sb.append("<");
            }else if(subStr.equals("&gt;")){
                sb.append(">");
            }else if(subStr.equals("&#034;")){
                sb.append("\"");
            }else if(subStr.equals("&#039;")){
                sb.append("'");
            }
            endIndex = m.end();
            startIndex = endIndex;
        }
        if(startIndex<endIndex){
            sb.append(str.substring(startIndex, endIndex));
        }
        return sb.toString();
    }    
    
    /**
     * 使用指定的字面值替换序列替换给定字符串匹配字面值目标序列的每个子字符串。
     * <p />
     * 该替换从此字符串的开始一直到结束，例如，用 "b" 替换字符串 "aaa" 中的 "aa" 将生成 "ba" 而不是 "ab"。
     * 
     * @param input 给定的源字符串
     * @param substringBefore 要替换的目标字符串
     * @param substringAfter 用于替换目标字符串的新字符串
     * @return 替换后的新字符串
     */
    public static String replace(String input, String substringBefore, String substringAfter) {
        if (input == null)
            input = EMPTY;
        if (input.length() == 0)
            return EMPTY;
        if (substringBefore == null)
            substringBefore = EMPTY;
        if (substringBefore.length() == 0)
            return input;

        StringBuffer buf = new StringBuffer(input.length());
        int startIndex = 0;
        int index;
        while ((index = input.indexOf(substringBefore, startIndex)) != -1) {
            buf.append(input.substring(startIndex, index)).append(substringAfter);
            startIndex = index + substringBefore.length();
        }
        return buf.append(input.substring(startIndex)).toString();
    }

    /**
     * 根据给定分隔符的匹配拆分此字符串。
     * <p />
     * 注意：此方法中的 {@code delimiters} 不使用正则表达式，与
     * <p />
     * 例如，字符串 "boo:and:foo" 使用这些表达式可生成以下结果：
     * <p />
     * <table border="1" style="font-family:monospace">
     * <tr>
     * <th>delimiters</th>
     * <th>结果</th>
     * </tr>
     * <tr>
     * <td align="center">:</td>
     * <td align="center">{ "boo", "and", "foo" }</td>
     * </tr>
     * <tr>
     * <td align="center">o</td>
     * <td align="center">{ "b", ":and:", "f" }</td>
     * </tr>
     * </table>
     * 
     * @param input 要解析的字符串。
     * @param delimiters 分隔符。
     * @return 字符串数组，它是根据给定分隔符的匹配拆分此字符串确定的。
     */
    public static String[] split(String input, String delimiters) {
        String[] array;
        if (input == null)
            input = EMPTY;
        if (input.length() == 0) {
            array = new String[1];
            array[0] = EMPTY;
            return array;
        }

        if (delimiters == null)
            delimiters = EMPTY;

        StringTokenizer tok = new StringTokenizer(input, delimiters);
        int count = tok.countTokens();
        array = new String[count];
        int i = 0;
        while (tok.hasMoreTokens()) {
            array[i++] = tok.nextToken();
        }
        return array;
    }

    /**
     * 使用给定的分隔符合并字符串数组成为新的字符串。
     * <p />
     * 例如，字符串数组 { "a", "b", "c", "d" } 使用以下分隔符可以生成以下结果：
     * <p />
     * <table border="1" style="font-family:monospace">
     * <tr>
     * <th>separator</th>
     * <th>结果</th>
     * </tr>
     * <tr>
     * <td align="center">""</td>
     * <td align="center">"abcd"</td>
     * </tr>
     * <tr>
     * <td align="center">","</td>
     * <td align="center">"a,b,c,d"</td>
     * </tr>
     * <tr>
     * <td align="center">"-"</td>
     * <td align="center">"a-b-c-d"</td>
     * </tr>
     * </table>
     * 
     * @param array 要合并的字符串数组。
     * @param separator 分隔符。
     * @return 由分隔符分隔字符串数组合并的新的字符串。
     */
    public static String join(String[] array, String separator) {
        if (array == null)
            return EMPTY;
        if (separator == null)
            separator = EMPTY;

        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < array.length; i++) {
            buf.append(array[i]);
            if (i < array.length - 1)
                buf.append(separator);
        }

        return buf.toString();
    }

    /**
     * 使用逗号 {@code ,} 合并字符串数组成为新的字符串。
     * <p />
     * 该方法相当于调用 {@linkplain #join(String[], String) join(array, ",")}。
     * 
     * @param array 给定的字符串数组。
     * @return 由逗号分隔的字符串数组合并的新的字符串。
     * @see #join(String[], String)
     */
    public static String join(String[] array) {
        return join(array, ",");
    }

    /**
     * 合并给定的字符串集合中的元素，合并时，元素加上给定的前缀和后缀，并添加给定的分隔符。
     * 
     * <pre>
     * String[] array = new String[] { "a", "b", "c", "d" };
     * StringUtils.join(Arrays.asList(new String[array.length]), ",", "_", "_");
     * // --&gt; "_a_,_b_,_c_,_d_"
     * </pre>
     * 
     * @param c 给定的字符串集合。
     * @param separator 分隔符。
     * @param prefix 字符串前缀。
     * @param suffix 字符串后缀。
     * @return 根据上述规则合并的新字符串。
     */
    public static String join(Collection<String> c, String separator, String prefix, String suffix) {
        if (c == null || c.size() == 0) {
            return EMPTY;
        }
        StringBuffer buf = new StringBuffer();
        Iterator<String> it = c.iterator();
        while (it.hasNext()) {
            buf.append(prefix).append(it.next()).append(suffix);
            if (it.hasNext()) {
                buf.append(separator);
            }
        }
        return buf.toString();
    }

    /**
     * 计算给定的子字符串在给定的字符串中出现的次数。
     * 
     * @param str 给定的源字符串。
     * @param substr 给定的子字符串。
     * @return 给定的子字符串在给定的字符串中出现的次数。
     */
    public static int countOccurrencesOf(String str, String substr) {
        if (str == null || substr == null || str.length() == 0 || substr.length() == 0) {
            return 0;
        }
        int count = 0, pos = 0, idx = 0;
        while ((idx = str.indexOf(substr, pos)) != -1) {
            count++;
            pos = idx + substr.length();
        }
        return count;
    }

    /**
     * 引用给定的字符串。
     * 
     * <pre>
     * StringUtils.quote("It's my life.", "'");  --&gt; 'It\'s my life.'
     * StringUtils.quote("这就是我的\"生活\"。", "\"");  --&gt; "这就是我的\"生活\"。"
     * </pre>
     * 
     * @param str 要引用的字符串。
     * @param quote 要使用的引号，只支持单引号 {@code '} 和双引号 {@code "}。
     * @return 引用的字符串。
     */
    public static String quote(String str, String quote) {
        if (str == null) {
            return "\"" + NULL + "\"";
        }
        quote = quote == null ? "\"" : quote.trim();
        if ("\"".equals(quote.trim())) {
            return quote + str.replace("\"", "\\\"") + quote;
        } else if ("'".equals(quote.trim())) {
            return quote + str.replace("'", "\\'") + quote;
        }
        return quote + str.replace("\"", "\\\"") + quote;
    }

    /**
     * 更改给定字符串的首字母为大写形式。
     * 
     * @param str 给定的字符串。
     * @return 首字母大写的字符串。
     */
    public static String capitalize(String str) {
        return changeFirstCharactorCase(str, true);
    }

    /**
     * 更改给定字符串的首字母为小写形式。
     * 
     * @param str 给定的字符串。
     * @return 首字母小写的字符串。
     */
    public static String uncapitalize(String str) {
        return changeFirstCharactorCase(str, false);
    }

    // 改变给定字符串的首字母的大小写
    private static String changeFirstCharactorCase(String str, boolean capitalize) {
        if (str == null || str.length() == 0) {
            return str;
        }
        StringBuffer buf = new StringBuffer(str.length());
        if (capitalize) {
            buf.append(Character.toUpperCase(str.charAt(0)));
        } else {
            buf.append(Character.toLowerCase(str.charAt(0)));
        }
        buf.append(str.substring(1));
        return buf.toString();
    }

    /**
     * 转换给定字符串的编码。
     * 
     * @param source 要转换编码的源字符串。
     * @param sourceEncoding 要转换的源字符串的编码。
     * @param targetEncoding 目标编码。
     * @return 经过新的编码转换的字符串。
     */
    public static String transcoding(String source, String sourceEncoding, String targetEncoding) {
        if (source == null)
            return EMPTY;
        byte[] bytes;
        try {
            if (!hasText(targetEncoding)) {
                bytes = source.getBytes();
            } else {
                bytes = source.getBytes(trimAllBlank(sourceEncoding));
            }
            if (hasText(targetEncoding)) {
                return new String(bytes, trimAllBlank(targetEncoding));
            } else {
                return new String(bytes);
            }
        } catch (Exception ex) {
            // ignore exception
            return source;
        }
    }

    /**
     * 截取源字符串中给定长度及编码的子字符串，并附加后缀。
     * <p />
     * <table style="font-family:monospace" border="1">
     * <tr>
     * <th>源字符串</th>
     * <th>编码</th>
     * <th>长度</th>
     * <th>后缀</th>
     * <th>结果</th>
     * </tr>
     * <tr>
     * <td>"Very Good,Very Strong!"</td>
     * <td align="center">UTF-8</td>
     * <td align="center">20</td>
     * <td>...</td>
     * <td>"Very Good,Very St..."</td>
     * </tr>
     * <tr>
     * <td>"Very Good,Very Strong!"</td>
     * <td align="center">GBK</td>
     * <td align="center">20</td>
     * <td>...</td>
     * <td>"Very Good,Very St..."</td>
     * </tr>
     * <tr>
     * <td>"5款开源云计算平台推荐"</td>
     * <td align="center">UTF-8</td>
     * <td align="center">20</td>
     * <td>...</td>
     * <td>"5款开源云计算..."</td>
     * </tr>
     * <tr>
     * <td>"5款开源云计算平台推荐"</td>
     * <td align="center">GBK</td>
     * <td align="center">20</td>
     * <td>...</td>
     * <td>"5款开源云计算平台..."</td>
     * </tr>
     * </table>
     * 
     * @param str 要截取的字符串。
     * @param encoding 截取字符串时的编码模式 {@code UTF-8、GBK}。
     * @param length 要截取的长度，编码不同，截取的字符不同。
     * @param suffixes 要附加的后缀串。
     * @return 符合条件的子字符串。
     */
    public static String truncate(String str, String encoding, int length, String... suffixes) {
        if (str == null) {
            return EMPTY;
        }
        // 全角字符所占的字节数 UTF-8 --> 3 GBK --> 2
        int sbcCase = 2;
        if (UTF8.equalsIgnoreCase(encoding)) {
            encoding = encoding.toUpperCase();
            sbcCase = 3;
        } else if (GBK.equalsIgnoreCase(encoding)) {
            encoding = encoding.toUpperCase();
            sbcCase = 2;
        } else {
            encoding = UTF8;
            sbcCase = 3;
        }
        int strLength = getLength(str, encoding);
        if (length <= 0 || strLength <= length) {
            return str;
        }
        String suffix = (suffixes != null && suffixes.length != 0 && suffixes[0] != null) ? suffixes[0] : "";
        StringBuffer source = new StringBuffer(str);
        StringBuffer result = new StringBuffer();
        char temp;
        int cutLen = 0;
        while (source.length() > 0) {
            temp = source.charAt(0);
            result.append(String.valueOf(temp));
            if ((int) temp > 255) {
                cutLen += sbcCase;
            } else {
                cutLen += 1;
            }
            if (cutLen + suffix.length() >= length) {
                break;
            }
            source.deleteCharAt(0);
        }
        return result.append(suffix).toString();
    }

    /**
     * 见 {@link #truncate(String, String, int, String...)}。
     * 
     * @param str 要截取的字符串。
     * @param encoding 截取字符串时的编码模式 {@code UTF-8、GBK}。
     * @param length 要截取的长度，编码不同，截取的字符不同。
     * @param suffixes 要附加的后缀串。
     * @return 符合条件的子字符串。
     */
    public static String truncate(String str, String encoding, int length) {
        return truncate(str, encoding, length, "...");
    }
    
    /**
     * 见 {@link #truncate(String, String, int, String...)}。
     * 
     * @param str 要截取的字符串。
     * @param length 要截取的长度，编码不同，截取的字符不同。
     * @param suffixes 要附加的后缀串。
     * @return 符合条件的子字符串。
     */
    public static String procString(String content, int length) {
        String result = content.replaceAll("(\\r\\n)+", "&nbsp;").replaceAll("<br(\\s)*/>", "&nbsp;");
        result = result.replaceAll("(?id)<(\"[^\"]*\"|'[^']*'|[^'\">]*)*>", StringUtils.EMPTY);
        result = result.replaceAll("(&nbsp;){2,}", "&nbsp;");
        Integer len = result.length();
        if(len > length) {
            result = result.substring(0, length) + "...";
        }
        return result;
    }
    
    /**
     * 用 {@code MD5} 算法对给定的摘要字符串进行加密。
     * <p />
     * 若给定的摘要字符串为 {@code null}，则当作 {@code "null"} 处理。
     * <code>md5(null).eqauls(md5("null"))</code>。
     * 
     * @param text 要加密的摘要字符串。
     * @return 经过MD5算法加密过的摘要字符串。
     */
    public static String md5(String text) {
        if (text == null) {
            text = NULL;
        }
        byte[] b = text.getBytes();
        MessageDigest digest = null;
        try {
            digest = MessageDigest.getInstance("MD5");
            // 用给定的字符串字节更新MD5算法的摘要信息
            digest.update(b);
            // 完成MD5的哈希计算
            byte[] hashBytes = digest.digest();
            char[] chars = new char[hashBytes.length * 2];
            for (int i = 0, k = 0; i < hashBytes.length; i++) {
                chars[k++] = HEX_CHARS[hashBytes[i] >>> 4 & 0xf];
                chars[k++] = HEX_CHARS[hashBytes[i] & 0xf];
            }
            return new String(chars);
        } catch (NoSuchAlgorithmException ex) {
            // ignore exception
        }
        return text;
    }

    /**
     * 将字符串添加到给定的数组中，返回新的数组。
     * 
     * <pre>例如，在数组 { "abc", "def", "g" } 中添加新的字符串 "hijklmn"
     * StringUtils.push(new String[] { "abc", "def", "g" }, "hijklmn");
     * // 返回 --&gt; { "abc", "def", "g", "hijklmn" }
     * </pre>
     * 
     * @param array 给定的字符串数组。
     * @param str 要添加的字符串。
     * @return 添加了新字符串的新数组。
     */
    public static String[] pushArray(String[] array, String str) {
        if (array == null || array.length == 0) {
            return new String[] { str };
        }
        String[] newArray = new String[array.length + 1];
        System.arraycopy(array, 0, newArray, 0, array.length);
        newArray[array.length] = str;
        return newArray;
    }

    /**
     * 联合两个给定的字符串数组。
     * <p />
     * <strong>该方法不会检查数组一中的元素，在数组二中是否存在。两个数组可以有重复的元素</strong>
     * 
     * <pre>例如，数组 { "a", "b", "c", "d" } 和数组 { "d", "e", "f", "g" } 联合：
     * StringUtils.unionArray(new String[] { "a", "b", "c", "d" }, new String[] { "d", "e", "f", "g" });
     * // 返回 --&gt; { "a", "b", "c", "d", "d", "e", "f", "g" }
     * </pre>
     * 
     * @param array1 要联合的数组一。
     * @param array2 要联合的数组二。
     * @return 两个给定字符串数组的联合数组。
     */
    public static String[] unionArray(String[] array1, String[] array2) {
        if (array1 == null || array1.length == 0) {
            return array2;
        }
        if (array2 == null || array2.length == 0) {
            return array1;
        }
        String[] newArray = new String[array1.length + array2.length];
        System.arraycopy(array1, 0, newArray, 0, array1.length);
        System.arraycopy(array2, 0, newArray, array1.length, array2.length);
        return newArray;
    }

    /**
     * 合并给定的两个字符串数组。
     * <p />
     * <strong>该方法会检查两个数组中的元素是否有重复，若有相同的元素，则只保留其中的一个。</strong>
     * 
     * <pre>例如，数组 { "a", "b", "c", "d" } 和数组 { "d", "e", "f", "g" } 合并：
     * StringUtils.mergeArray(new String[] { "a", "b", "c", "d" }, new String[] { "d", "e", "f", "g" });
     * // 返回 --&gt; { "a", "b", "c", "d", "e", "f", "g" }
     * </pre>
     * 
     * @param array1 要合并的数组一。
     * @param array2 要合并的数组二。
     * @return 两个给定字符串数组的并集。
     */
    public static String[] mergeArray(String[] array1, String[] array2) {
        if (array1 == null || array1.length == 0) {
            return array2;
        }
        if (array2 == null || array2.length == 0) {
            return array1;
        }
        List<String> result = GenericUtils.getList();
        result.addAll(Arrays.asList(array2));
        for (int i = 0, len = array2.length; i < len; i++) {
            String str = array2[i];
            if (!result.contains(str)) {
                result.add(str);
            }
        }
        return toStringArray(result);
    }

    /**
     * 将给定的字符串集合转换成字符串数组。
     * 
     * @param c 给定的字符串集合。
     * @return 给定字符串集合的字符串数组形式。
     */
    public static String[] toStringArray(Collection<String> c) {
        if (c == null || c.size() == 0) {
            return new String[0];
        }
        return c.toArray(new String[c.size()]);
    }

    /**
     * 去除给定的字符串数组中的所有元素的前导和后导空格。
     * 
     * @param array 给定的字符串数组。
     * @return 包含了去除前导和后导空格的元素的新数组。
     */
    public static String[] trimArray(String[] array) {
        if (array == null || array.length == 0) {
            return new String[0];
        }
        String[] newArray = new String[array.length];
        for (int i = 0, len = array.length; i < len; i++) {
            String ele = array[i];
            newArray[i] = ele == null ? null : ele.trim();
        }
        return newArray;
    }

    /**
     * 去除给定字符串数组中重复的字符串元素。
     * 
     * @param array 给定的字符串数组。
     * @return 元素唯一的字符串数组。
     */
    public static String[] removeDuplicateStrings(String[] array) {
        if (array == null || array.length == 0) {
            return new String[0];
        }
        Set<String> result = new TreeSet<String>();
        for (int i = 0; i < array.length; i++) {
            result.add(array[i]);
        }
        return toStringArray(result);
    }

    /**
     * 测试给定的字符串中是否包含给定的子字符串。
     * <p />
     * 如果 {@code str == null} 或者 {@code substr == null}，则返回 {@code false}。
     * 
     * @param str 给定的字符串。
     * @param substr 给定的子字符串。
     * @return 如果给定的字符串中是否包含给定的子字符串，则返回 {@code true}，否则为 {@code false}。
     */
    public static boolean containsSubstring(String str, String substr) {
        if (str == null || substr == null) {
            return false;
        }
        return str.indexOf(substr) != -1;
    }

    /**
     * 测试两个给定的字符串的值是否相同。
     * <p />
     * 如果 {@code arg1 == null} 或者 {@code arg2 == null}，则返回 {@code false}。
     * 
     * @param arg1 字符串。
     * @param arg2 字符串。
     * @return 如果两个给定的字符串的值相同，则返回 {@code true}，否则为 {@code false}。
     */
    public static boolean equals(String arg1, String arg2) {
        if (arg1 == null && arg2 != null) {
            return false;
        }
        if (arg1 != null && arg2 == null) {
            return false;
        }
        return arg1.equals(arg2);
    }
    
    /**
     * 替换给定字符串中的所有 {@code HTML} 标签代码。
     * 
     * @param str 给定的字符串。
     * @return 去除了所有HTML标签的内容。
     */
    public static String removeHtmlTags(String str) {
        if (str == null)
            return EMPTY;
        return str.replaceAll("</?[a-zA-Z_\\s]*/?>", EMPTY);
    }

    /**
     * 测试给定的 {@code HTML} 代码是否有内容。
     * <p />
     * 该方法会先去除所有的 {@code HTML} 代码，查看是否有内容；
     * 
     * @param html 给定的 {@code HTML} 内容。
     * @return 如果给定的 {@code HTML} 代码有内容，则返回 {@code true}，否则为 {@code false}。
     */
    public static boolean hasContentOfHtml(String html) {
        if (isNullOrEmpty(html)) {
            return false;
        }
        String text = html.replaceAll("(?id)<(\"[^\"]*\"|'[^']*'|[^'\">]*)*>", EMPTY);
        if (hasText(text.replaceAll("&nbsp;", EMPTY))) {
            return true;
        } else {
            // img pattern
            Pattern imgPattern = Pattern.compile("(?id)<\\s*img\\s*([a-zA-Z\\-]+\\s*="
                    + "\\s*(?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)?\\s*/?\\s*>");
            // object pattern
            Pattern objPattern = Pattern.compile("(?id)<\\s*object\\s*([a-zA-Z\\-]+\\s*="
                    + "\\s*(?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)?>([\\s\\S]*?)<\\s*/\\s*object\\s*>");
            // embed pattern
            Pattern embedPattern = Pattern.compile("(?id)<\\s*embed\\s*([a-zA-Z\\-]+\\s*="
                    + "\\s*(?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)?\\s*/?\\s*>");
            if (imgPattern.matcher(html).find() || objPattern.matcher(html).find()
                    || embedPattern.matcher(html).find()) {
                return true;
            } else {
                return false;
            }
        }
    }

    // Html 注释标签的正则模式
    private static final String COMMENTS_REGEXP = "(?id)<!\\-\\-[^>]*>([\\s\\S]*?)<![^>]*?\\-\\->";

    private static final Pattern[] ILLEGAL_TAGS_PATTERN = {
            Pattern.compile("(?id)<p\\s*([^><]*)>([\\s\\S]*?)</p>"),
            Pattern.compile("(?id)<pre\\s*([^><]*)>([\\s\\S]*?)</pre>"),
            Pattern.compile("(?id)<div\\s*([^><]*)>([\\s\\S]*?)</div>"),
            Pattern
                    .compile("(?id)<span\\s*([^><]*)>([\\s\\S]*?)</span>") };

    /**
     * 去除给定 {@code htmlContent} HTML内容的非法样式。
     * 
     * @param htmlContent 给定的 {@code htmlContent} HTML内容。
     * @return 返回过滤的内容。
     */
    public static String removeIllegalTags(String htmlContent) {
        if (htmlContent == null) {
            return EMPTY;
        }
        String buffer = trim(htmlContent);
        buffer = buffer.replaceAll(HtmlRegexpUtils.getHtmlTagPattern(HtmlTags.LINK, false)
                .toString(), EMPTY);
        buffer = buffer
                .replaceAll(HtmlRegexpUtils.getHtmlTagPattern("xml", true).toString(), EMPTY);
        buffer = buffer.replaceAll(HtmlRegexpUtils.getHtmlTagPattern(HtmlTags.STYLE, true)
                .toString(), EMPTY);
        buffer = buffer.replaceAll(HtmlRegexpUtils.getHtmlTagPattern("meta", false).toString(),
                EMPTY);
        // 去除所有的注释
        buffer = buffer.replaceAll(COMMENTS_REGEXP, EMPTY);
        for (Pattern pIllegal : ILLEGAL_TAGS_PATTERN) {
            Matcher m = pIllegal.matcher(buffer);
            while (m.find()) {
                String attrs = m.group(1);
                if (attrs != null && attrs.length() != 0) {
                    if (attrs.indexOf("class=") != -1 || attrs.indexOf("lang=") != -1) {
                        buffer = buffer.replaceAll(pIllegal.toString(), "$2");
                    }
                }
            }
        }
        buffer = buffer.replaceAll("(?id)<span\\s*lang=((?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)>([\\s\\S]*?)</span>", "$2");
        buffer = buffer.replaceAll("(?id)<font\\s*size=(?:\"[^\"]*\"|'[^']*'|[^'\">]*)><font\\s*face=(?:\"[^\"]*\"|'[^']*'|[^'\">]*)>([\\s\\S]*?)</font></font>", "$1");
        buffer = buffer.replaceAll("(?id)</?\\??\\w+\\:\\w+((?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)>",
                EMPTY);
        buffer = buffer.replaceAll("(?id)<div[^>]*><a[^>]*>\\s*<br\\s*/?>\\s*</a></div>", EMPTY);
        buffer = buffer.replaceAll("\r\n", "\n");
        buffer = buffer.replaceAll("\n", "<br />");
        return buffer;
    }

    /**
     * 截取给定内容的摘要。
     * <p />
     * 如果 {@code encoding == UTF-8} 内容的长度会按照 {@code UTF-8} 的编码方式计算； 如果
     * {@code encoding == GBK} 内容的长度会按照 {@code GBK} 的编码方式计算。
     * 
     * @param content 给定的字符串内容。
     * @param length 要截取的长度。
     * @param encoding 操作的编码。
     * @param suffix 截取的摘要的后缀。
     * @return 给定内容的摘要。
     */
    public static String fetchDigest(String content, int length, String encoding, String suffix) {
        if (!hasText(content)) {
            return hasText(suffix) ? trim(suffix) : EMPTY;
        }
        encoding = !hasText(encoding) ? UTF8 : encoding;
        suffix = suffix == null ? "..." : trim(suffix);
        int suffixLen = suffix.length();
        // 去除Html标签的内容。
        // String escapeTagsContent = content.replaceAll(HtmlRegexpUtils
        // .getHtmlTagPattern(EMPTY, true).toString(), EMPTY);
        // 去除Html标签的内容长度。
        // int etcLen = getLength(escapeTagsContent, encoding);
        StringBuffer result = new StringBuffer();
        int n = 0, magi = UTF8.equalsIgnoreCase(encoding) ? 3 : 2;
        char ch;
        // 是否表示Html标签的开始
        boolean htmlTag = false;
        // 是否表示Html特殊字符的开始
        boolean special = false;
        for (int i = 0, len = content.length(); i < len; i++) {
            ch = content.charAt(i);
            if (ch == '<') {
                htmlTag = true;
            } else if (ch == '&') {
                special = true;
            } else if (ch == '>' && htmlTag) {
                n -= 1;
                htmlTag = false;
            } else if (ch == ';' && special) {
                special = false;
            }
            if (!htmlTag && !special) {
                n = (ch >= 255 || ch < 0) ? n + magi : n + 1;
            }
            if (length - (n + suffixLen) <= 1) {
                break;
            }
            result.append(ch);
        }
        // 截取的字符串中剩余的标签
        String tagsString = result.toString().replaceAll("(>)[^<>]*?(<?)", "$1$2");
        // 去除不需要结束的标签
        tagsString = tagsString.replaceAll("(?id)</?(area|base|basefont|body|"
                + "br|col|colgroup|dd|dt|frame|head|hr|html|img|input|isindex|li|"
                + "link|meta|option|param|tbody|td|tfoot|th|thead|tr)[^<>]*/?>", EMPTY);
        int j = countOccurrencesOf(tagsString, "<");
        int k = countOccurrencesOf(tagsString, "</");
        for (int i = 0, len = j - k; i < len; i++) {
            tagsString = tagsString.replaceAll("<([a-zA-Z]+)[^<>]*>([\\s\\S]*?)</\\1>", "$2");
        }
        Pattern p = Pattern.compile("<([a-zA-Z]+)\\s*([a-zA-Z\\-]+\\s*=\\s*"
                + "(?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)?\\s*>");
        Matcher m = p.matcher(tagsString);

        List<String> endTags = GenericUtils.getLinkedList();
        while (m.find()) {
            endTags.add(m.group(1));
        }
        // 补齐需要结束的标签
        for (int i = endTags.size(); --i >= 0;) {
            result.append("</").append(endTags.get(i)).append(">");
        }
        if (length - (n + suffixLen) <= 1) {
            result.append(suffix);
        }
        return result.toString();
    }

    /**
     * 将给定的 {@code HTML} 标签的符号进行可显示的转义。
     * 
     * <pre>例如下列字符串：
     * String str = "&lt;br /&gt;119. 左边脑袋是面粉，&lt;span class=\"tt\"&gt;右边脑袋是水，&lt;script&gt;var s = \"&lt;script&gt;\";&lt;/script&gt;一想问题，就满脑袋糨糊&lt;/span&gt;";
     * System.out.println(StringUtils.escapeSpecialTags(str, "script"));
     * // 结果为：
     * &lt;br /&gt;119. 左边脑袋是面粉，&lt;span class="tt"&gt;右边脑袋是水，&amp;lt;script&amp;gt;var s = "&amp;lt;script&amp;gt;";&amp;lt;/script&amp;gt;一想问题，就满脑袋糨糊&lt;/span&gt;
     * </pre>
     * 
     * @param html 要转义的 {@code HTML} 代码内容。
     * @param tags 要转义的一组标签。
     * @param 经转义的新的 {@code HTML} 代码内容。
     */
    public static String escapeSpecialTags(String html, String... tags) {
        if (tags == null || tags.length == 0) {
            return html;
        }
        if (hasText(html)) {
            // 不改变参数html原来的值
            StringBuffer result = new StringBuffer(html.trim());
            Pattern regexp = null;
            for (int i = 0, len = tags.length; i < len; i++) {
                regexp = Pattern.compile("(?id)<\\s*/?" + tags[i] + "\\s*([a-zA-Z\\-]+\\s*=\\s*"
                        + "(?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)?\\s*/?\\s*>");
                Matcher m = regexp.matcher(result);
                StringBuffer temp = new StringBuffer();
                int idx = 0;
                while (m.find(idx)) {
                    temp.append(result.substring(idx, m.start()));
                    temp.append(escapeXml(m.group(0)));
                    idx = m.end();
                }
                if (idx < result.length()) {
                    temp.append(result.substring(idx));
                }
                if (temp.length() != 0)
                    result = new StringBuffer(temp);
            }
            return result.toString();
        }
        return html;
    }
    
    /**
     * 去除字符串中所有html标签
     * 
     * @param input 带处理的字符串
     */
    public static String replaceAllHtmlTag(String input) {
        return input.replaceAll("<[^>]*>", EMPTY).replaceAll("[(/>)<]", EMPTY);
    }
    
    /**
     * 用DES算法对指定的字符串进行加密处理。此方法与{@link #decryptNormal(String)} 方法配合使用。
     * 
     * @param text 要加密的字符串。
     * @return 经过加密的字符串。
     * @since 1.0
     */
    public static String encryptNormal(String text) {
        return text == null ? "" : DESCrypto.encrypt(text, DESCrypto.NORMAL_STRING);
    }

    /**
     * 用DES算法对指定的密文字符串进行解密处理。此方法与{@link #encryptNormal(String)} 方法配合使用。
     * 
     * @param detext 要解密的字符串。
     * @return 经过解密的明文字符串。
     * @since 1.0
     */
    public static String decryptNormal(String detext) {
        if (!hasText(detext)) {
            return EMPTY;
        } else {
            try {
                return DESCrypto.decrypt(detext, DESCrypto.NORMAL_STRING);
            } catch (Exception e) {
                return EMPTY;
            }
        }
    }

    /**
     * 用DES算法对指定的字符串(通常是密码等重要的字符串)进行加密处理。此方法与{@link #decryptImportant(String)}
     * 方法配合使用。
     * 
     * @param text 要加密的字符串。
     * @return 经过加密的字符串。
     * @since 1.0
     */
    public static String encryptImportant(String text) {
        return text == null ? "" : DESCrypto.encrypt(text, DESCrypto.IMPORTANT_STRING);
    }

    /**
     * 用DES算法对指定的密文字符串(通常是密码等重要的字符串)进行解密处理。此方法与{@link #encryptImportant(String)}
     * 方法配合使用。
     * 
     * @param detext 要解密的字符串。
     * @return 经过解密的明文字符串。
     * @since 1.0
     */
    public static String decryptImportant(String detext) {
        if (!hasText(detext)) {
            return EMPTY;
        } else {
            try {
                return DESCrypto.decrypt(detext, DESCrypto.IMPORTANT_STRING);
            } catch (Exception e) {
                return EMPTY;
            }
        }
    }

    /**
     * 使用特定的加密算法加密给定的字符串，该加密为不右逆。加密后的字符串永远是长度为20位的字符串。
     * 
     * @param text 要加密的摘要字符串。
     * @return 经过特定算法加密过的摘要字符串。
     * @since 1.1
     */
    public static String digest(String text) {
        String dedigest = md5(text);
        if (EMPTY.equals(dedigest))
            return EMPTY;
        StringBuffer sb = new StringBuffer();
        sb.append(dedigest.substring(2, 6));
        sb.append(dedigest.substring(8, 12));
        sb.append(dedigest.substring(14, 18));
        sb.append(dedigest.substring(20, 24));
        sb.append(dedigest.substring(26, 30));
        return sb.toString();
    }
    
    /**
     * 将密码加密。
     * 
     * @param password 密码字符串。
     * @return Hash加密后的密码。
     * @since 1.1
     */
    public static String hashPassword(String password) {
        password = encryptImportant(password);
        return digest(password);
    }
    
    
    public static void main(String[] args){
        String src = "aaa(&amp;)bbb|(&lt;)ccc|(&gt;)ddd|(&#034;)eeeee|(&#039;)aaaa&#039;cccc&#039;dddd&#039;";
        String str = unescapeXml(src);
        System.out.println(src);
        System.out.println(str);
        
      {
      double totalUseTime = 0;
      int count = 0;
      for(int i=0;i<100;i++){//在此设置测试次数
          long stime = System.nanoTime();        
          
          /* 测试代码 开始 */
          unescapeXml(src);
          /* 测试代码 结束 */
          
          double usetime = (System.nanoTime()-stime)/1000000f;
          if(usetime<1 && usetime>0){//大于50可认为是随机峰值，不参加统计，可根据情况调整
              totalUseTime += usetime;
              count++;
          }
          //System.out.println("time:"+(usetime));
      }
      System.out.println("HomeAction.getHomeInfo测试("+count+")平均用时（毫秒）:"+(totalUseTime/count));        
      }        
        
    }
}
