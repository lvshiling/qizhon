package com.navigation.utils.html;

import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.navigation.utils.RegexpUtils;
import com.navigation.utils.StringUtils;


/**
 * 包含常用 {@code HTML} 相关的正在则表达式常量、正则表达式常用方法的工具类。
 * 
 * @author Fuchun
 * @version 1.0, 2009-06-28
 */
public class HtmlRegexpUtils extends RegexpUtils {

    @SuppressWarnings("unused")
    private static final Log log = LogFactory.getLog(HtmlRegexpUtils.class);

    /* 用于保存在缓存中的查找 script 标签经编译的正则表达式的 key。 */
    private static final String SCRIPT_TAG_PREFIX = "public_static_Pattern_getScriptTagPattern({0})";

    /* 用于保存在缓存中的查找 html 标签经编译的正则表达式的 key。 */
    private static final String HTML_TAG_PREFIX = "public_static_Pattern_getHtmlTagPattern({0},{1})";

    /**
     * 获取匹配 {@code script} 标签的正则表达式的编译模式，由 {@code isClosed} 指定是否匹配完整的对称标签。
     * <p />
     * <strong>该方法返回的正则表达式模式还有一些非常特殊的情况，无法正确的查找到目标。例如下面的情况：</strong>
     * 
     * <pre>
     * &lt;script type="text/javascript"&gt;
     * var scriptUrl = "&lt;script src=\"target.script\"&gt;&lt;/script&gt;";
     * &lt;/script&gt;
     * // 它只能匹配到：
     * &lt;script type="text/javascript"&gt;
     * var scriptUrl = "&lt;script src=\"target.script\"&gt;&lt;/script&gt;
     * </pre>
     * 
     * 下面是使用该方法返回的结果：
     * <ul>
     * <li><code>getScriptTagPattern(true) --&gt; (?id)&lt;\s*?script\\s*?([^&gt;]*)\s*?&gt;([\s\S]*?)&lt;\s*?/script\s*?&gt;</code></li>
     * <li><code>getScriptTagPattern(false) --&gt; (?id)&lt;\\/?\\s*?script\\s*?([^&gt;]*)\\s*?&gt;</code></li>
     * </ul>
     * 
     * @param isClosed 是否匹配对称的关闭标签。
     * @return 匹配 {@code script} 标签的正则表达式的编译模式。
     */
    public static Pattern getScriptTagPattern(boolean isClosed) {
        String key = SCRIPT_TAG_PREFIX + String.valueOf(isClosed) + ")";
        if (getRegexpCache().containsKey(key)) {
            return getRegexpCache().get(key);
        }
        String regexp;
        if (isClosed) {
            regexp = "(?id)<\\s*?script\\s*?([^>]*)\\s*?>([\\s\\S]*?)<\\s*?/script\\s*?>";
        } else {
            regexp = "(?id)<\\/?\\s*?script\\s*?([^>]*)\\s*?>";
        }
        Pattern p = Pattern.compile(regexp);
        getRegexpCache().put(key, p);
        return p;
    }

    /**
     * 返回匹配指定 {@code HTML} 标签的正则表达式模式。由 {@code needClosed} 参数决定是否需要关闭标签。
     * <p />
     * 如果 {@code htmlTag == null || "".equals(htmlTag)}，则返回匹配所有 {@code HTML}
     * 标签的正则模式。
     * 
     * @param htmlTag 指定的 {@code HTML} 标签。
     * @param needClosed 是否需要关闭标签。
     * @return 匹配指定 {@code HTML} 标签的正则表达式模式。
     */
    public static Pattern getHtmlTagPattern(String htmlTag, boolean needClosed) {
        String key = HTML_TAG_PREFIX, regexp;
        boolean isEmptyTag = StringUtils.isNullOrEmpty(htmlTag);
        // 未指定 html 标签名，则返回匹配所有的 HTML 标签
        if (isEmptyTag) {
            key = key + "\"\")";
            if (getRegexpCache().containsKey(key)) {
                return getRegexpCache().get(key);
            }
            regexp = "<(\"[^\"]*\"|'[^']*'|[^'\">]*)*>";
        } else {
            htmlTag = htmlTag.trim();
            key = key + htmlTag + ")";
            if (getRegexpCache().containsKey(key)) {
                return getRegexpCache().get(key);
            }
            StringBuffer buffer = new StringBuffer();
            buffer.append("(?id)<").append(htmlTag).append("\\s*");
            buffer.append("([a-zA-Z\\-]+\\s*=\\s*(?:\"[^\"]*\"|'[^']*'|[^'\">]*)*?)?");
            if (needClosed) {
                buffer.append(">([\\s\\S]*?)<\\s*/\\s*").append(htmlTag).append("\\s*>");
            } else {
                buffer.append("\\s*/?\\s*>");
            }
            regexp = buffer.toString();
        }
        Pattern p = Pattern.compile(regexp);
        getRegexpCache().put(key, p);
        return p;
    }
}