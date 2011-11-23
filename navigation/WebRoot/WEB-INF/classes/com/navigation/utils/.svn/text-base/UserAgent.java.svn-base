/*
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 * @(#) UserAgent.java 1.0 2009-11-30
 */
package com.navigation.utils;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Fuchun
 * @version 1.0
 */
public class UserAgent implements Serializable {

    // 默认的串行化版本标识
    private static final long serialVersionUID = 1L;

    /** 表示客户端为 {@code Windows} 操作系统的标识。 */
    public static final int WINDOWS_OS = 0;
    /** 表示客户端为 {@code Unix} 操作系统的标识。 */
    public static final int UNIX_OS = 1;
    /** 表示客户端为 {@code Mac} 操作系统的标识。 */
    public static final int MAC_OS = 2;
    /** 未知的操作系统。*/
    public static final String UNKNOWN_OS = "unknown OS";

    /** 表示客户端为 {@code MSIE} 浏览器的标识。 */
    public static final int MSIE_BROWSER = 0;
    /** 表示客户端为 {@code Mozilla} 浏览器的标识。 */
    public static final int MOZILLA_BROWSER = 1;
    /** 表示客户端为 {@code Opera} 浏览器的标识。 */
    public static final int OPERA_BROWSER = 2;
    /** 表示客户端为 {@code Safari} 浏览器的标识。 */
    public static final int SAFARI_BROWSER = 3;
    /** 表示客户端为 {@code Firefox} 浏览器的标识。 */
    public static final int FIREFOX_BROWSER = 4;
    /** 表示客户端为 {@code Chrome} 浏览器的标识。 */
    public static final int CHROME_BROWSER = 5;

    /** 该 {@code UserAgent} 所能辩识的操作系统名称。 */
    public static String[] OperatingSystems = { "Windows", "Unix", "MAC" };

    /** 该 {@code UserAgent} 所能辩识的浏览器的名称。 */
    public static String[] Browsers = { "MSIE", "Mozilla", "Opera", "Safari", "Firefox", "Chrome" };

    // 客户端操作系统的名称
    private String OS = OperatingSystems[WINDOWS_OS];
    // 客户端浏览器的名称
    private String browser = Browsers[MSIE_BROWSER];
    // 客户端浏览器的版本
    private float browserVersion = -1;
    // 客户端是否是IE浏览器
    private boolean msie = false;
    // 客户端是否是Mozilla浏览器
    private boolean mozilla = false;
    
    private boolean firefox = false;
    // 客户端是否是Opera浏览器
    private boolean opera = false;
    // 客户端是否是safari核以的浏览器
    private boolean safari = false;
    
    private boolean chrome = false;
    // 客户端信息
    private String userAgent = null;

    /**
     * 构造一个默认的 {@code UserAgent}
     */
    public UserAgent() {
    }
    
    /**
     * 根据给定的客户端信息构建一个 {@code UserAgent}。
     * @param userAgent 客户端信息。
     */
    public UserAgent(String userAgent) {
        this.userAgent = userAgent;
        processUserAgent();
    }
    
    private final void processUserAgent() {
        if(userAgent == null || "".equals(userAgent.trim())) {
            return;
        }
        userAgent = userAgent.toLowerCase().trim();
        // 浏览器的版本号
        Pattern bvp = Pattern.compile("(?id).+(?:rv|it|ra|ie)[\\/: ]([\\d.]+)");
        Matcher bvm = bvp.matcher(userAgent);
        if(bvm.find()) {
            // mozilla
            if(userAgent.indexOf("rv:") > -1) {
                browserVersion = NumberUtils.parseFloat(bvm.group(1).substring(0, 3));
            } else { // other
                browserVersion = NumberUtils.parseFloat(bvm.group(1));
            }
        }
        if(userAgent.indexOf("msie") > -1 && userAgent.indexOf("opera") == -1) {
            browser = Browsers[MSIE_BROWSER];
            msie = true;
        } else {
            if(userAgent.indexOf("webkit") > -1) {
                safari = true;
                browser = Browsers[SAFARI_BROWSER];
                if(userAgent.indexOf("chrome") > -1) {
                    chrome = true;
                    browser = Browsers[CHROME_BROWSER];
                    bvm = Pattern.compile("(?id).+chrome/([\\d.]+)").matcher(userAgent);
                    if(bvm.find()) {
                        browserVersion = NumberUtils.parseFloat(bvm.group(1).substring(0, 3));
                    }
                }
            } else if(userAgent.indexOf("opera") > -1) {
                opera = true;
                browser = Browsers[OPERA_BROWSER];
            } else if(userAgent.indexOf("mozilla") > -1 && userAgent.indexOf("compatible") == -1
                    && userAgent.indexOf("webkit") == -1) {
                mozilla = true;
                browser = Browsers[MOZILLA_BROWSER];
                if(userAgent.indexOf("firefox") > -1) {
                    firefox = true;
                    browser = Browsers[FIREFOX_BROWSER];
                    bvm = Pattern.compile("(?id).+firefox/([\\d.]+)").matcher(userAgent);
                    if(bvm.find()) {
                        browserVersion = NumberUtils.parseFloat(bvm.group(1).substring(0, 3));
                    }
                }
            }
        }
        if(userAgent.indexOf(OperatingSystems[WINDOWS_OS]) > -1) {
            OS = OperatingSystems[WINDOWS_OS];
        } else if(userAgent.indexOf(OperatingSystems[UNIX_OS]) > -1) {
            OS = OperatingSystems[UNIX_OS];
        } else if(userAgent.indexOf(OperatingSystems[MAC_OS]) > -1) {
            OS = OperatingSystems[MAC_OS];
        } else {
            OS = UNKNOWN_OS;
        }
    }

    /**
     * 返回客户端信息。
     */
    public String getUserAgent() {
        return userAgent;
    }

    /**
     * 设置客业端信息。
     */
    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    /**
     * 返回客户端使用的操作系统。
     */
    public String getOS() {
        return OS;
    }

    /**
     * 设置客户端使用的操作系统。
     */
    public void setOS(String OS) {
        this.OS = OS;
    }

    /**
     * 返回客户端使用的浏览器名称。
     */
    public String getBrowser() {
        return browser;
    }

    /**
     * 设置客户端使用的浏览器名称。
     */
    public void setBrowser(String browser) {
        this.browser = browser;
    }

    /**
     * 返回客户端使用的浏览器的版本。
     */
    public float getBrowserVersion() {
        return browserVersion;
    }

    /**
     * 设置客户端使用的浏览器的版本。
     */
    public void setBrowserVersion(float browserVersion) {
        this.browserVersion = browserVersion;
    }

    /**
     * 如果客户端使用的是以 Microsoft Internet Explorer 为核心的浏览器，则返回 {@code true}，否则为 {@code
     * false}。
     */
    public boolean isMsie() {
        return msie;
    }

    /**
     * 如果客户端使用的是 Mozilla 为核心的浏览器，则返回 {@code true}，否则为 {@code false}。
     */
    public boolean isMozilla() {
        return mozilla;
    }
    
    /**
     * 如果客户端使用的是 Firefox 浏览器，则返回 {@code true}，否则为 {@code false}。
     */
    public boolean isFirefox() {
        return firefox;
    }

    /**
     * 如果客户端使用的是 Opera 浏览器，则返回 {@code true}，否则为 {@code false}。
     */
    public boolean isOpera() {
        return opera;
    }

    /**
     * 如果客户端使用的是 Safari 为核心的浏览器，则返回 {@code true}，否则为 {@code false}。
     */
    public boolean isSafari() {
        return safari;
    }
    
    /**
     * 如果客户端使用的是 Google Chrome 浏览器，则返回 {@code true}，否则为 {@code false}。
     */
    public boolean isChrome() {
        return chrome;
    }
    
    public static void main(String[] args) {
        System.out.println(NumberUtils.parseFloat("1.9"));
    }
}
