/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) HtmlComments.java 1.0 2009-9-4
 */
package com.navigation.utils.html;

import java.util.regex.Pattern;

/**
 * 为 {@code HTML} 的各种版本注释提供分类和正则模式的说明。
 *
 * @author  Fuchun
 * @version 1.0, 2009-09-04
 */
public enum CommentsRegxp {
    
    /**
     * JSP视图中的表示注释的正则表达式枚举。
     */
    JSP("(?id)<%\\-\\-([\\s\\S]*?)\\-\\-%>"),
    
    /**
     * HTML视图中的表示注释的正则表达式枚举。
     */
    HTML("(?id)<!\\-\\-([\\s\\S]*?)\\-\\->"),
    
    /**
     * FreeMarker视图中的表示注释的正则表达式枚举。
     */
    FREEMARKER("(?id)<#\\-\\-([\\s\\S]*?)\\-\\->");
    
    final String regexp;
    
    CommentsRegxp(String regexp) {
        this.regexp = regexp;
    }
    
    /**
     * 返回该注释枚举的正则表达式字符串。
     */
    public String getRegexp() {
        return regexp;
    }
    
    /**
     * 返回该注释枚举的正则表达式模式。
     */
    public Pattern getPattern() {
        return Pattern.compile(regexp);
    }

    /**
     * @see java.lang.Enum#toString()
     */
    public String toString() {
        return regexp;
    }
}
