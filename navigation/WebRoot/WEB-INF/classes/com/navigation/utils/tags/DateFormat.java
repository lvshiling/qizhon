/**
 * 
 */
package com.navigation.utils.tags;

import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.navigation.utils.DateUtils;

/**
 * @author wanghui2
 *
 * May 3, 2011 9:29:34 AM
 */
public class DateFormat extends TagSupport {

	private static final long serialVersionUID = 1L;
	private Date value;

	public int doStartTag() throws JspException {
		if (value != null) {
			try {
				pageContext.getOut()
						.print(DateUtils.specialFormat(value, null));
			} catch (Exception e) {
			}
			return SKIP_BODY;
		} else {
			return SKIP_BODY;
		}
	}

	public int doEndTag() {
		return EVAL_PAGE;
	}

	public Date getValue() {
		return value;
	}

	public void setValue(Date value) {
		this.value = value;
	}

}
