/**
 * 
 */
package com.navigation.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author wanghui2
 *
 * Apr 29, 2011 4:10:26 PM
 */
public class TopicUtil {

	/**
	 * 处理表情 OC等
	 * @param content
	 * @return
	 */
	public static String parseEmote(String content) {
		if(StringUtil.isNullOrEmpty(content)) return "";
		Pattern pattern = Pattern.compile("\\[OCS:(.+?)\\]");
		Matcher matcher = pattern.matcher(content);
		content = matcher.replaceAll("<a href=\"sip:$1@ztgame.com\">[OC:$1]</a>");
		return content;
	}
	
}
