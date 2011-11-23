/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) DateUtils.java 1.0 2009-7-4
 */
package com.navigation.utils;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//import com.ztgame.util.resource.Resources;

/**
 * 包含日期类型及对象处理的常用方法的工具类。
 * 
 * @author Fuchun
 * @version 1.0, 2009-06-14
 */
public class DateUtils extends Utils {

    @SuppressWarnings("unused")
    private final static Log log = LogFactory.getLog(DateUtils.class);

    /** 一秒钟的毫秒数。 */
    public static final long ONE_SECOND = 1000L;

    /** 一分钟的毫秒数。 */
    public static final long ONE_MINUTE = 60 * ONE_SECOND;

    /** 一小时的毫秒数。 */
    public static final long ONE_HOUR = 60 * ONE_MINUTE;

    /** 一天的毫秒数。 */
    public static final long ONE_DAY = 24 * ONE_HOUR;

    /** 一周的毫秒数。 */
    public static final long ONE_WEEK = 7 * ONE_DAY;

    /** 表示非闰年的2月份的天数。 */
    public static final int MIN_DAYS_OF_MONTH = 28;

    /** 表示闰年2月份的天数。 */
    public static final int DAYS_OF_LEAP_MONTH = 29;

    /** 表示一个月份正常的天数（即：4、6、9、11月份的天数）。 */
    public static final int NORMAL_DAYS_OF_MONTH = 30;

    /** 表示一个大月份的天数（即：1、3、5、7、8、10、12月份的天数）。 */
    public static final int MAX_DAYS_OF_MONTH = 31;

    /** 表示日期/时期格式器的标识。 */
    public static final int DATETIME = 0;

    /** 表示日期格式器的标识。 */
    public static final int DATE = 1;

    /** 表示时间格式器的标识。 */
    public static final int TIME = 2;

    /** 默认的时间格式化模式。 */
    public static final String DEFAULT_DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /** 长型的日期格式化模式。 */
    public static final String LONG_DATE_PATTERN = "yyyy-MM-dd";

    /** 短型的日期格式化模式。 */
    public static final String SHORT_DATE_PATTERN = "yy-MM-dd";

    /** 长型的时间格式化模式。 */
    public static final String LONG_TIME_PATTERN = "HH:mm:ss";

    /** 短型的时间格式化模式。 */
    public static final String SHORT_TIME_PATTERN = "HH:mm";

    /**
     * 在程序中，不会去构造它。
     */
    protected DateUtils() {
        super();
    }

//    /**
//     * 表示星期一 至 星期日 的一组星期国际化的名称。
//     * <p>
//     * 简体中文：星期一、星期二、星期三、星期四、星期五、星期六、星期日 <br/>
//     * {@code English：Monday、Tuesday、Wednesday、Thursday、Friday、Saturday、Sunday}
//     * </p>
//     */
    public static final String[] WEEK_NAMES0 = { "周一","周二","周三","周四","周五","周六","周日",};

//    /**
//     * 表示周一 至 周日 的一组星期国际化的名称。
//     * <p>
//     * 简体中文：周一、周二、周三、周四、周五、周六、周日 <br/>
//     * {@code English：Monday、Tuesday、Wednesday、Thursday、Friday、Saturday、Sunday}
//     * </p>
//     */
//    public static final String[] WEEK_NAMES1 = { Resources.getText("Calendar.Week.Mon1"),
//            Resources.getText("Calendar.Week.Tue1"), Resources.getText("Calendar.Week.Wed1"),
//            Resources.getText("Calendar.Week.Thu1"), Resources.getText("Calendar.Week.Fri1"),
//            Resources.getText("Calendar.Week.Sat1"), Resources.getText("Calendar.Week.Sun1") };
//
//    /**
//     * 表示一月 至 十二月 的一组月份国际化的名称。
//     * <p>
//     * 简体中文：一月、二月、三月、四月、五月、六月、七月、八月、九月、十月、十一月、十二月 <br/>
//     * {@code English：January、February、March、April、May、June、July、August、September、October、November、December}
//     * </p>
//     */
//    public static final String[] MONTH_NAMES = { Resources.getText("Calendar.Month.Jan"),
//            Resources.getText("Calendar.Month.Feb"), Resources.getText("Calendar.Month.Mar"),
//            Resources.getText("Calendar.Month.Apr"), Resources.getText("Calendar.Month.May"),
//            Resources.getText("Calendar.Month.Jun"), Resources.getText("Calendar.Month.Jul"),
//            Resources.getText("Calendar.Month.Aug"), Resources.getText("Calendar.Month.Sep"),
//            Resources.getText("Calendar.Month.Oct"), Resources.getText("Calendar.Month.Nov"),
//            Resources.getText("Calendar.Month.Dec") };

//    /**
//     * 获取当前日期的星期。
//     * 
//     * @return 当前日期的星期。
//     */
//    public static String getWeekDay() {
//        return getWeekDay(null);
//    }

//    /**
//     * 获取给定日期的星期。
//     * 
//     * @return 给定日期的星期。
//     */
    public static String getWeekDay(Date date) {
        Calendar instance = Calendar.getInstance();
        if (date != null)
            instance.setTime(date);
        switch (instance.get(Calendar.DAY_OF_WEEK)) {
        case Calendar.MONDAY:
            return WEEK_NAMES0[0];
        case Calendar.TUESDAY:
            return WEEK_NAMES0[1];
        case Calendar.WEDNESDAY:
            return WEEK_NAMES0[2];
        case Calendar.THURSDAY:
            return WEEK_NAMES0[3];
        case Calendar.FRIDAY:
            return WEEK_NAMES0[4];
        case Calendar.SATURDAY:
            return WEEK_NAMES0[5];
        case Calendar.SUNDAY:
            return WEEK_NAMES0[6];
        default:
            return "";
        }
    }

    /**
     * 获取当前日期的月份信息。例如：一月（January）、二月（February）等，返回的信息视当前的语言环境。
     * 
     * @return 当前日期的月份信息。
     */
//    public static String getMonth() {
//        return getMonth(null);
//    }

//    /**
//     * 获取给定日期的月份信息。例如：一月（January）、二月（February）等，返回的信息视当前的语言环境。
//     * 
//     * @return 给定日期的月份信息。
//     */
//    public static String getMonth(Date date) {
//        Calendar instance = Calendar.getInstance();
//        if (date != null)
//            instance.setTime(date);
//        switch (instance.get(Calendar.MONTH)) {
//        case Calendar.JANUARY:
//            return MONTH_NAMES[0];
//        case Calendar.FEBRUARY:
//            return MONTH_NAMES[1];
//        case Calendar.MARCH:
//            return MONTH_NAMES[2];
//        case Calendar.APRIL:
//            return MONTH_NAMES[3];
//        case Calendar.MAY:
//            return MONTH_NAMES[4];
//        case Calendar.JUNE:
//            return MONTH_NAMES[5];
//        case Calendar.JULY:
//            return MONTH_NAMES[6];
//        case Calendar.AUGUST:
//            return MONTH_NAMES[7];
//        case Calendar.SEPTEMBER:
//            return MONTH_NAMES[8];
//        case Calendar.OCTOBER:
//            return MONTH_NAMES[9];
//        case Calendar.NOVEMBER:
//            return MONTH_NAMES[10];
//        case Calendar.DECEMBER:
//            return MONTH_NAMES[11];
//        default:
//            return "";
//        }
//    }

    /**
     * 检测给定的日期是否表示夏令时。
     * 
     * @param date 给定的日期。
     * @return 若给定的日期表示一个夏令时，返回 {@code true}，否则 {@code false}。
     */
    public static boolean isDst(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        int dateNum = Integer.parseInt(String.valueOf(year)
                + (month > 9 ? String.valueOf(month) : "0" + month)
                + (day > 9 ? String.valueOf(day) : "0" + day));
        if (dateNum >= 19910414 && dateNum <= 19910915) {
            return true;
        } else if (dateNum >= 19900415 && dateNum <= 19900916) {
            return true;
        } else if (dateNum >= 19890416 && dateNum <= 19890917) {
            return true;
        } else if (dateNum >= 19880410 && dateNum <= 19880911) {
            return true;
        } else if (dateNum >= 19870412 && dateNum <= 19870913) {
            return true;
        } else if (dateNum >= 19860504 && dateNum <= 19860914) {
            return true;
        }
        return false;
    }

    /**
     * 返回 {@code java.util.Date} 表示的当前日期。
     * 
     * @return {@code java.util.Date} 表示的当前日期。
     */
    public static Date getNow() {
        return new Date();
    }

    /**
     * 计算两个 {@code java.util.Date} 对象表示的时间相隔的毫秒数。
     * <ul>
     * <li>若 {@code date2.getTime() > date1.getTime()}，返回正值。</li>
     * <li>若 {@code date2.getTime() < date1.getTime()}，返回负值。</li>
     * <li>若 {@code date2.getTime() == date1.getTime()}，返回 {@code 0}。</li>
     * </ul>
     * 
     * @param date1 第一个 {@code java.util.Date}。
     * @param date2 第二个 {@code java.util.Date}。
     * @return 给定两个 {@code java.util.Date} 对象示的时间相隔的毫秒数。
     */
    public static Long timespace(Date date1, Date date2) {
        return (date2.getTime() - date1.getTime());
    }

    /**
     * 计算两个 {@code java.util.Date} 对象表示的时间相隔的秒数。
     * <ul>
     * <li>若 {@code date2.getTime() > date1.getTime()}，返回正值。</li>
     * <li>若 {@code date2.getTime() < date1.getTime()}，返回负值。</li>
     * <li>若 {@code date2.getTime() == date1.getTime()}，返回 {@code 0}。</li>
     * </ul>
     * 
     * @param date1 第一个 {@code java.util.Date}。
     * @param date2 第二个 {@code java.util.Date}。
     * @return 给定两个 {@code java.util.Date} 对象示的时间相隔的秒数。
     */
    public static Long timespaceOfSeconds(Date date1, Date date2) {
        BigDecimal diffspace = new BigDecimal(timespace(date1, date2));
        BigDecimal millisecond = new BigDecimal(ONE_SECOND);
        return diffspace.divide(millisecond, 2, BigDecimal.ROUND_HALF_UP).longValue();
    }

    /**
     * 计算两个 {@code java.util.Date} 对象表示的时间相隔的分钟数。
     * <ul>
     * <li>若 {@code date2.getTime() > date1.getTime()}，返回正值。</li>
     * <li>若 {@code date2.getTime() < date1.getTime()}，返回负值。</li>
     * <li>若 {@code date2.getTime() == date1.getTime()}，返回 {@code 0}。</li>
     * </ul>
     * 
     * @param date1 第一个 {@code java.util.Date}。
     * @param date2 第二个 {@code java.util.Date}。
     * @return 给定两个 {@code java.util.Date} 对象示的时间相隔的分钟数。
     */
    public static Long timespaceOfMinutes(Date date1, Date date2) {
        BigDecimal diffspace = new BigDecimal(timespace(date1, date2));
        BigDecimal minutes = new BigDecimal(ONE_MINUTE);
        return diffspace.divide(minutes, 2, BigDecimal.ROUND_HALF_UP).longValue();
    }

    /**
     * 计算两个 {@code java.util.Date} 对象表示的时间相隔的小时数。
     * <ul>
     * <li>若 {@code date2.getTime() > date1.getTime()}，返回正值。</li>
     * <li>若 {@code date2.getTime() < date1.getTime()}，返回负值。</li>
     * <li>若 {@code date2.getTime() == date1.getTime()}，返回 {@code 0}。</li>
     * </ul>
     * 
     * @param date1 第一个 {@code java.util.Date}。
     * @param date2 第二个 {@code java.util.Date}。
     * @return 给定两个 {@code java.util.Date} 对象示的时间相隔的小时数。
     */
    public static Long timespaceOfHours(Date date1, Date date2) {
        BigDecimal diffspace = new BigDecimal(timespace(date1, date2));
        BigDecimal hours = new BigDecimal(ONE_HOUR);
        return diffspace.divide(hours, 2, BigDecimal.ROUND_HALF_UP).longValue();
    }

    /**
     * 计算两个 {@code java.util.Date} 对象表示的时间相隔的天数。
     * <ul>
     * <li>若 {@code date2.getTime() > date1.getTime()}，返回正值。</li>
     * <li>若 {@code date2.getTime() < date1.getTime()}，返回负值。</li>
     * <li>若 {@code date2.getTime() == date1.getTime()}，返回 {@code 0}。</li>
     * </ul>
     * 
     * @param date1 第一个 {@code java.util.Date}。
     * @param date2 第二个 {@code java.util.Date}。
     * @return 给定两个 {@code java.util.Date} 对象示的时间相隔的天数。
     */
    public static Long timespaceOfDays(Date date1, Date date2) {
        BigDecimal diffspace = new BigDecimal(timespace(date1, date2));
        BigDecimal days = new BigDecimal(ONE_DAY);
        return diffspace.divide(days, 2, BigDecimal.ROUND_HALF_UP).longValue();
    }

    /**
     * 计算两个 {@code java.util.Date} 对象表示的时间相隔的星期数。
     * <ul>
     * <li>若 {@code date2.getTime() > date1.getTime()}，返回正值。</li>
     * <li>若 {@code date2.getTime() < date1.getTime()}，返回负值。</li>
     * <li>若 {@code date2.getTime() == date1.getTime()}，返回 {@code 0}。</li>
     * </ul>
     * 
     * @param date1 第一个 {@code java.util.Date}。
     * @param date2 第二个 {@code java.util.Date}。
     * @return 给定两个 {@code java.util.Date} 对象示的时间相隔的星期数。
     */
    public static Long timespaceOfWeeks(Date date1, Date date2) {
        BigDecimal diffspace = new BigDecimal(timespace(date1, date2));
        BigDecimal weeks = new BigDecimal(ONE_WEEK);
        return diffspace.divide(weeks, 2, BigDecimal.ROUND_HALF_UP).longValue();
    }

    /**
     * 获取默认环境下的简短格式风格的当前日期的字符串。和调用
     * {@code {@linkplain #getShortDate(Locale) getShortDate(Locale.getDefault())}}
     * 方法的值相同。
     * 
     * @return 简短格式的当前时间的字符串。
     */
    public static String getShortDate() {
        return getFormatDate(DATE, Locale.getDefault(), new int[] { DateFormat.SHORT });
    }

    /**
     * 获取指定环境下的简短格式风格的当前日期的字符串。若指定的语言环境对象 {@code locale} 为 {@code NULL}，若默认为当前的语言环境。
     * 
     * @param locale 指定的语言环境。
     * @return 指定环境下的简短格式的当前时间的字符串。
     */
    public static String getShortDate(Locale locale) {
        return getFormatDate(DATE, locale, new int[] { DateFormat.SHORT });
    }

    /**
     * 获取默认环境下的简短格式风格的当前日期的字符串。和调用
     * <code>{@linkplain #getLongDate(Locale) getLongDate(Locale.getDefault())}</code>
     * 方法的值相同。
     * 
     * @return 长格式的当前时间的字符串。
     */
    public static String getLongDate() {
        return getFormatDate(DATE, Locale.getDefault(), new int[] { DateFormat.LONG });
    }

    /**
     * 获取指定环境下的长格式风格的当前日期的字符串。若指定的语言环境对象 {@code locale} 为 {@code NULL}，若默认为当前的语言环境。
     * 
     * @param locale 指定的语言环境。
     * @return 指定环境下的长格式的当前日期的字符串。
     */
    public static String getLongDate(Locale locale) {
        return getFormatDate(DATE, locale, new int[] { DateFormat.LONG });
    }

    /**
     * 获取默认当前环境下的短格式风格的当前时间的字符串。和调用
     * <code>{@linkplain #getShortTime(Locale) getShortTime(Locale.getDefault())}</code>
     * 方法的值相同。
     * 
     * @return 指定环境下的短格式风格的当前时间的字符串。
     */
    public static String getShortTime() {
        return getFormatDate(TIME, Locale.getDefault(), new int[] { DateFormat.SHORT });
    }

    /**
     * 获取指定环境下的短格式风格的当前时间的字符串。若指定的语言环境对象 {@code locale} 为 {@code NULL}，若默认为当前的语言环境。
     * 
     * @param locale 指定的语言环境。
     * @return 指定环境下的短格式风格的当前时间的字符串。
     */
    public static String getShortTime(Locale locale) {
        return getFormatDate(TIME, locale, new int[] { DateFormat.SHORT });
    }

    /**
     * 获取默认当前环境下的长格式风格的当前时间的字符串。和调用
     * <code>{@linkplain #getLongTime(Locale) getLongTime(Locale.getDefault())}</code>
     * 方法的值相同。
     * 
     * @return 指定环境下的长格式风格的当前时间的字符串。
     */
    public static String getLongTime() {
        return getFormatDate(TIME, Locale.getDefault(), new int[] { DateFormat.LONG });
    }

    /**
     * 获取指定环境下的长格式风格的当前时间的字符串。若指定的语言环境对象 {@code locale} 为 {@code NULL}，若默认为当前的语言环境。
     * 
     * @param locale 指定的语言环境。
     * @return 指定环境下的长格式风格的当前时间的字符串。
     */
    public static String getLongTime(Locale locale) {
        return getFormatDate(TIME, locale, new int[] { DateFormat.LONG });
    }

    /**
     * 获取默认当前环境下的短格式风格的当前日期/时间的字符串。和调用
     * <code>{@linkplain #getShortDateTime(Locale) getShortDateTime(Locale.getDefault())}</code>
     * 方法的值相同。
     * 
     * @return 指定环境下的短格式风格的当前日期/时间的字符串。
     */
    public static String getShortDateTime() {
        return getFormatDate(DATETIME, Locale.getDefault(), new int[] { DateFormat.SHORT,
                DateFormat.SHORT });
    }

    /**
     * 获取指定环境下的短格式风格的当前时间的字符串。若指定的语言环境对象 {@code locale} 为 {@code NULL}，若默认为当前的语言环境。
     * 
     * @param locale 指定的语言环境。
     * @return 指定环境下的短格式风格的当前时间的字符串。
     */
    public static String getShortDateTime(Locale locale) {
        return getFormatDate(DATETIME, locale, new int[] { DateFormat.SHORT, DateFormat.SHORT });
    }

    /**
     * 获取默认当前环境下的长格式风格的当前日期/时间的字符串。和调用
     * <code>{@linkplain #getLongDateTime(Locale) getLongDateTime(Locale.getDefault())}</code>
     * 方法的值相同。
     * 
     * @return 指定环境下的短格式风格的当前日期/时间的字符串。
     */
    public static String getLongDateTime() {
        return getFormatDate(DATETIME, Locale.getDefault(), new int[] { DateFormat.LONG,
                DateFormat.LONG });
    }

    /**
     * 获取指定环境下的长格式风格的当前时间的字符串。若指定的语言环境对象 {@code locale} 为 {@code NULL}，若默认为当前的语言环境。
     * 
     * @param locale 指定的语言环境。
     * @return 指定环境下的短格式风格的当前时间的字符串。
     */
    public static String getLongDateTime(Locale locale) {
        return getFormatDate(DATETIME, locale, new int[] { DateFormat.LONG, DateFormat.LONG });
    }

    /**
     * 获取给定格式风格和给定语言环境的当前日期的字符串。
     * <ul>
     * <li>若 {@code formatStyle} 不属于
     * <code>{@link #DATETIME}、{@link #DATE}、{@link #TIME}</code>
     * 其中之一，则默认为 {@link #DATETIME}。</li>
     * <li>若 {@code locale} 为 {@code NULL}，则默认为当前的语言环境。</li>
     * <li>{@code styles} 组数定义格式风格，{@code formatStyle} 为 {@link #DATETIME} 时，{@code styles}
     * 需指定日期和时间格式风格（默认为长格式），即
     * {@code new int[] { DateFormat#LONG, DateFormat#LONG }}。</li>
     * </ul>
     * 
     * @param formatStyle 日期/时间格式器类型。
     * @param styles 给定的格式风格，见
     *        {@code DateFormat#LONG、DateFormat#SHORT、DateFormat#FULL……}。
     * @param locale 给定的语言环境。
     * @return 给定格式风格和给定语言环境的当前日期的字符串。
     */
    public static String getFormatDate(int formatStyle, Locale locale, int... styles) {
        DateFormat df = null;
        if (styles == null || styles.length == 0) {
            styles = new int[] { DateFormat.LONG, DateFormat.LONG };
        } else {
            if (styles[0] < 0 || styles[0] > 17)
                styles[0] = DateFormat.LONG;
            if (styles.length > 1) {
                if (styles[1] < 0 || styles[1] > 17)
                    styles[1] = DateFormat.LONG;
            }
        }
        if (locale == null)
            locale = Locale.getDefault();
        switch (formatStyle) {
        case DATETIME:
            df = DateFormat.getDateTimeInstance(styles[0], styles[1], locale);
            break;
        case DATE:
            df = DateFormat.getDateInstance(styles[0], locale);
            break;
        case TIME:
            df = DateFormat.getTimeInstance(styles[0], locale);
            break;
        default:
            df = DateFormat.getDateTimeInstance(styles[0], styles[1], locale);
        }
        return df.format(new Date());
    }

    /**
     * 用默认的语言环境和默认的模式格式化当前时间。默认的模式见 {@link #DEFAULT_DATETIME_PATTERN}。
     * 
     * @return 默认模式下格式化的当前时间字符串。
     */
    public static String format() {
        return format(new Date(), Locale.getDefault(), DEFAULT_DATETIME_PATTERN);
    }

    /**
     * 用默认的语言环境和给定的模式格式化当前时间。
     * 
     * @param pattern 给定的模式。
     * @return 给定模式下格式化的当前时间字符串。
     */
    public static String format(String pattern) {
        return format(new Date(), Locale.getDefault(), pattern);
    }

    /**
     * 用默认的语言环境和默认的模式格式化指定的时间毫秒数表示的日期。
     * 
     * @param time 指定的时间毫秒数。
     * @return 格式化指定的时间毫秒数表示的日期字符串。
     */
    public static String format(long time) {
        return format(new Date(time), Locale.getDefault(), DEFAULT_DATETIME_PATTERN);
    }

    /**
     * 用默认的语言环境和默认的模式格式化指定的 {@code java.util.Date} 对象。
     * 
     * @param date 指定的 {@code java.util.Date} 对象。
     * @return 指定的 {@code java.util.Date} 对象的格式化字符串。
     */
    public static String format(Date date) {
        return format(date, Locale.getDefault(), DEFAULT_DATETIME_PATTERN);
    }

    /**
     * 用默认的语言环境和给定的模式格式化指定的 {@code java.util.Date} 对象。
     * 
     * @param date 指定的 {@code java.util.Date} 对象。
     * @param pattern 给定的模式。
     * @return 指定的 {@code java.util.Date} 对象的格式化字符串。
     */
    public static String format(Date date, String pattern) {
        return format(date, Locale.getDefault(), pattern);
    }

    /**
     * 用默认的语言环境和给定的模式格式化指定的时间毫秒数表示的日期。
     * 
     * @param time 指定的时间毫秒数。
     * @param pattern 给定的模式。
     * @return 格式化指定的时间毫秒数表示的日期字符串。
     */
    public static String format(long time, String pattern) {
        return format(new Date(time), Locale.getDefault(), pattern);
    }

    /**
     * 用给定的语言环境和给定的模式格式化指定的时间毫秒数表示的日期。
     * 
     * @param time 指定的时间毫秒数。
     * @param locale 给定的语言环境。
     * @param pattern 给定的模式。
     * @return 格式化指定的时间毫秒数表示的日期字符串。
     */
    public static String format(long time, Locale locale, String pattern) {
        return format(new Date(time), locale, pattern);
    }

    /**
     * 用给定的语言环境和给定的模式格式化指定的 {@code java.util.Calendar} 日历对象。
     * 
     * @param calendar 指定的 {@code java.util.Calendar} 日历对象。
     * @param locale 给定的语言环境。
     * @param pattern 给定的模式。
     * @return 指定的 {@code java.util.Calendar} 日历对象的格式化字符串。
     */
    public static String format(Calendar calendar, Locale locale, String pattern) {
        Date date = null;
        if (calendar == null)
            date = new Date();
        else
            date = calendar.getTime();
        return format(date, locale, pattern);
    }

    /**
     * 用给定的语言环境和给定的模式格式化指定的 {@code java.util.Date} 对象。
     * 
     * @param date 指定的 {@code java.util.Date} 对象。
     * @param locale 给定的语言环境。
     * @param pattern 给定的模式。
     * @return 指定的 {@code java.util.Date} 对象的格式化字符串。
     */
    public static String format(Date date, Locale locale, String pattern) {
        if (date == null)
            date = new Date();
        if (locale == null)
            locale = Locale.getDefault();
        if (!StringUtils.hasText(pattern))
            pattern = DEFAULT_DATETIME_PATTERN;
        DateFormat df = new SimpleDateFormat(pattern, locale);
        return df.format(date);
    }

    /**
     * 以当前日期为基准设置 月、日的字段值。保留其他字段以前的值。返回当前年份、给定月和日期的 {@code java.util.Date} 对象。
     * 
     * <pre> 若当前日期是：2009-07-04
     * DateUtils.getDate(9, 1); --&gt; 2009-10-01
     * </pre>
     * 
     * @param month 用来设置月份的值。{@code month} 值是基于 0 的。例如，0 表示 January。
     * @param day 用来设置天数的值。
     * @return 返回给定月、日的<code>java.util.Date</code>日期对象。
     */
    public static Date getDate(int month, int day) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DAY_OF_MONTH, day);
        return cal.getTime();
    }

    /**
     * 设置 年、月、日的值。保留其他字段以前的值。 并返回给定年、月、日的{@code java.util.Date}日期对象。
     * 
     * @param year 用来设置年份的值。
     * @param month 用来设置月份的值。Month 值是基于 0 的。例如，0 表示 January。
     * @param day 用来设置天数的值。
     * @return 返回给定年、月、日的{@code java.util.Date}日期对象。
     */
    public static Date getDate(int year, int month, int day) {
        return getDate(year, month, day, 0, 0, 0);
    }

    /**
     * 设置 年、月、日、小时、分钟 和 秒 的值。保留其他字段以前的值。 并返回给定年、月、日、小时、分钟 和 秒的{@code java.util.Date}日期对象。
     * 
     * @param year 用来设置年份的值。
     * @param month 用来设置月份的值。Month 值是基于 0 的。例如，0 表示 January。
     * @param day 用来设置天数的值。
     * @param hour 用来设置小时数的值。
     * @param minute 用来设置分钟数的值。
     * @param second 用来设置秒数的值。
     * @return 返回给定年、月、日、小时、分钟 和 秒的{@code java.util.Date}日期对象。
     */
    public static Date getDate(int year, int month, int day, int hour, int minute, int second) {
        Calendar cal = Calendar.getInstance(Locale.getDefault());
        cal.set(year, month, day, hour, minute, second);
        return cal.getTime();
    }

    /**
     * 根据规则，为当前日期对象添加或减去指定的分钟数。例如，要从当前时间倒退 60 分钟， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = DateUtils.addMinute(-60); // date 比当前时间早 60 分钟。
     * </pre>
     * 
     * @param amount 为日期添加的分钟数。
     * @return 返回添加或减去后的新日期对象。
     */
    public static Date addMinute(int amount) {
        return addTime(null, Calendar.MINUTE, amount);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的分钟数。例如，要从给定的时间减去 60 分钟， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = new java.util.Date();
     * DateUtils.addMinute(date, -60);
     * </pre>
     * 
     * @param date 要添加或减去给定时间的日期对象。
     * @param amount 为日期添加的分钟数。
     * @return 添加或减去指定分钟后的新日期对象。
     */
    public static Date addMinute(Date date, int amount) {
        return addTime(date, Calendar.MINUTE, amount);
    }

    /**
     * 根据规则，为当前日期对象添加或减去指定的小时数。例如，要从给定的时间添加 1 小时， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = DateUtil.addHour(1); // date 比当前时间迟 1 小时
     * </pre>
     * 
     * @param amount 为日期添加的小时数。
     * @return 添加或减去指定小时后的新日期对象。
     */
    public static Date addHour(int amount) {
        return addTime(null, Calendar.HOUR_OF_DAY, amount);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的小时数。例如，要从给定的时间添加 1 小时， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = new java.util.Date();
     * DateUtil.addHour(date, 1);
     * </pre>
     * 
     * @param date 要添加或减去给定时间的日期对象。
     * @param amount 为日期添加的小时数。
     * @return 添加或减去指定小时后的新日期对象。
     */
    public static Date addHour(Date date, int amount) {
        return addTime(date, Calendar.HOUR_OF_DAY, amount);
    }

    /**
     * 根据规则，为当前日期对象添加或减去指定的天数。例如，要从给定的时间减去 5 天， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = DateUtil.addHour(date, -5); // date 比当前时间早 5 天
     * </pre>
     * 
     * @param amount 为日期添加的天数。
     * @return 返回添加或减去指定的天数后的新日期对象。
     */
    public static Date addDay(int amount) {
        return addTime(null, Calendar.DAY_OF_MONTH, amount);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的天数。例如，要从给定的时间减去 5 天， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = new java.util.Date();
     * DateUtil.addHour(date, -5);
     * </pre>
     * 
     * @param date 要添加或减去给定时间的日期对象。
     * @param amount 为日期添加的天数。
     * @return 返回添加或减去指定的天数后的新日期对象。
     */
    public static Date addDay(Date date, int amount) {
        return addTime(date, Calendar.DAY_OF_MONTH, amount);
    }

    /**
     * 根据规则，为当前日期对象添加或减去指定的周数。例如，要从给定的时间减去 1 周， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = DateUtil.addWeek(date, -1); // date 比当前时间晚 1 周
     * </pre>
     * 
     * @param amount 为日期添加的天数。
     * @return 返回添加或减去指定的周数后的新日期对象。
     */
    public static Date addWeek(int amount) {
        return addTime(null, Calendar.DAY_OF_MONTH, amount * 7);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的周数。例如，要从给定的时间加上 2 周， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * Date date1 = new Date();
     * Date date2 = DateUtil.addHour(date1, 2); // date2 比 date1 早 2 周
     * </pre>
     * 
     * @param date 要添加或减去给定时间的日期对象。
     * @param amount 为日期添加的天数。
     * @return 返回添加或减去指定的周数后的新日期对象。
     */
    public static Date addWeek(Date date, int amount) {
        return addTime(date, Calendar.DAY_OF_MONTH, amount * 7);
    }

    /**
     * 根据规则，为当前日期对象添加或减去指定的月数。例如，要从给定的时间加上 3 个月， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = DateUtil.addHour(3); // date 比当前时间晚 3个月
     * </pre>
     * 
     * @param amount 为日期添加的天数。
     * @return 返回添加或减去指定的天数后的新日期对象。
     */
    public static Date addMonth(int amount) {
        return addTime(null, Calendar.MONTH, amount);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的月数。例如，要从给定的时间加上 3 个月， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date1 = new java.util.Date();
     * java.util.Date date2 = DateUtil.addHour(date1, 3);
     * // date2 比 date1 晚 3个月
     * </pre>
     * 
     * @param date 要添加或减去给定时间的日期对象。
     * @param amount 为日期添加的天数。
     * @return 返回添加或减去指定的天数后的新日期对象。
     */
    public static Date addMonth(Date date, int amount) {
        return addTime(date, Calendar.MONTH, amount);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的年数。例如，要从给定的时间加 1 年， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date = DateUtil.addYear(1); // date 比当前时间早 1 年
     * </pre>
     * 
     * @param amount 为日期添加的年数。
     * @return 返回添加或减去指定的年份后的新日期对象。
     */
    public static Date addYear(int amount) {
        return addTime(null, Calendar.YEAR, amount);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的年数。例如，要从给定的时间加 1 年， 可以通过调用以下方法做到这一点：
     * 
     * <pre>
     * java.util.Date date1 = new java.util.Date();
     * java.util.Date date2 = DateUtil.addYear(date1, 1); // date2 比 date1 早 1 年
     * </pre>
     * 
     * @param date 要添加或减去给定时间的日期对象。
     * @param amount 为日期添加的年数。
     * @return 返回添加或减去指定的年份后的新日期对象。
     */
    public static Date addYear(Date date, int amount) {
        return addTime(date, Calendar.YEAR, amount);
    }

    /**
     * 根据规则，为给定的日期对象添加或减去指定的字段数。
     * 
     * @param date 要添加或减去给定时间的日期对象。
     * @param mode 为日期添加或减去的字段类型。
     * @param amount 为日期添加或减去的字段数。
     * @return 返回添加或减去指定的字段数后的新日期对象。
     */
    protected static Date addTime(Date date, int mode, int amount) {
        Calendar cal = Calendar.getInstance();
        if (date != null)
            cal.setTime(date);
        cal.add(mode, amount);
        return cal.getTime();
    }

    /**
     * 返回当前日期所在的一个星期中的某天的日期。 注意：星期天表示一个星期中的第一天。
     * 
     * <pre>
     * 例如：当前日期是 2009年7月4日 星期六
     * DateUtils.getDateByWeek(Calendar.MONDAY); --&gt; 2009-06-29
     * </pre>
     * 
     * @param dayOfWeek
     * @return 当前日期所在的一个星期中的某天的日期。
     */
    public static Date getDateByWeek(int dayOfWeek) {
        return getDateByWeek(new Date(), dayOfWeek);
    }

    /**
     * 返回给定日期所在的一个星期中的某天的日期。<strong>注意：星期天表示一个星期中的第一天。</strong>
     * <p />
     * {@code dayOfWeek} 参数可取的值：
     * <ul>
     * <li>{@code Calendar#SUNDAY --> 1}</li>
     * <li>{@code Calendar#MONDAY --> 2}</li>
     * <li>{@code Calendar#TUESDAY --> 3}</li>
     * <li>{@code Calendar#WEDNESDAY --> 4}</li>
     * <li>{@code Calendar#THURSDAY --> 5}</li>
     * <li>{@code Calendar#FRIDAY --> 6}</li>
     * <li>{@code Calendar#SATURDAY --> 7}</li>
     * </ul>
     * 
     * <pre>
     * Date date = DateUtils.getDate(2009, 5, 5);
     * DateUtils.getDateByWeek(date, Calendar.MONDAY); --&gt; 2009-06-01
     * </pre>
     * 
     * @param date 给定的日期（{@code java.util.Date}）。
     * @param dayOfWeek 给定的一个星期中的某天。
     * @return 给定日期所在的一个星期中的某天的日期。
     */
    public static Date getDateByWeek(Date date, int dayOfWeek) {
        if (date == null) {
            date = new Date();
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dateWeek = cal.get(Calendar.DAY_OF_WEEK);
        if (dayOfWeek == dateWeek) {
            return date;
        } else {
            int amount = dayOfWeek - dateWeek;
            return addDay(date, amount);
        }
    }

    /**
     * 从给定字符串的开始解析文本，以生成一个日期。该方法不使用给定字符串的整个文本。
     * 
     * @param input 一个 {@code String}，应从其开始处进行解析。
     * @param pattern 描述日期和时间格式的模式。
     * @param locale 给定的语言环境（可变参数）。
     * @return {@code input} 中包含的日期字符串的 {@code java.util.Date} 对象。
     */
    public static Date parse(String input, String pattern, Locale... locale) {
        if (isEmpty(input)) {
            return null;
        }
        if (isEmpty(pattern)) {
            pattern = DEFAULT_DATETIME_PATTERN;
        }
        try {
            DateFormat df = new SimpleDateFormat(pattern,
                    locale == null || locale.length == 0 ? Locale.CHINESE : locale[0]);
            return df.parse(input);
        } catch (ParseException ex) {
            return null;
        }
    }

    /**
     * 用于日期/时间的特殊格式化。如果 {@code pattern} 为空或空字符串，则默认使用以下规则：
     * <ul>
     * <li>给定时间和当前时间相差24小时之内，格式：HH:mm</li>
     * <li>给定时间和当前时间相差超过24小时且在同一年内，格式：MM-dd HH:mm</li>
     * <li>给定时间和当前时间相差超过24小时且不在同一年内，格式：yyyy-MM-dd HH:mm</li>
     * </ul>
     * 否则，使用给定的模式格式化日期/时间。
     * 
     * @param date 给定的日期/时间。
     * @param pattern 给定的格式化模式。
     * @return 返回特定规则下的日期格式化形式。
     */
    public static String specialFormat(Date date, String pattern) {
        if (date == null) {
            return EMPTY;
        }
        if(StringUtils.hasText(pattern)) {
            return format(date, pattern);
        }
        Calendar calDate = Calendar.getInstance();
        int nowYear = calDate.get(Calendar.YEAR);
        int nowMonth = calDate.get(Calendar.MONTH);
        int nowDay = calDate.get(Calendar.DAY_OF_MONTH);
        int nowHour = calDate.get(Calendar.HOUR_OF_DAY);
        calDate.setTime(date);
        int dateYear = calDate.get(Calendar.YEAR);
        int dateMonth = calDate.get(Calendar.MONTH);
        int dateDay = calDate.get(Calendar.DAY_OF_MONTH);
        int dateHour = calDate.get(Calendar.HOUR_OF_DAY);
        // 同年
        if(nowYear == dateYear) {
            // 当天
            if(nowMonth == dateMonth && nowDay == dateDay) {
            	if(nowHour == dateHour){
            		Long space = timespaceOfMinutes(date, new Date());
            		return String.valueOf(space)+" 分钟前";
            	}
                return format(date, "今天 HH:mm");
            } else {
                return format(date, "MM-dd HH:mm");
            }
        } else {
            return format(date, "yyyy-MM-dd HH:mm");
        }
    }
    
    /**
     * 判断两个日期是否是同一天
     * 
     * @param date1 给定的日期
     * @param date2 给定的日期
     * @return 返回给定的两个日期是否是同一天
     */
    public static boolean isTheSameDay(Date date1,Date date2) {  
        Calendar c1 = Calendar.getInstance();  
        Calendar c2 = Calendar.getInstance();  
        c1.setTime(date1);  
        c2.setTime(date2);  
        return (c1.get(Calendar.YEAR) == c2.get(Calendar.YEAR))  
                && (c1.get(Calendar.MONTH) == c2.get(Calendar.MONTH))  
                && (c1.get(Calendar.DAY_OF_MONTH) == c2.get(Calendar.DAY_OF_MONTH));  
    }  
}