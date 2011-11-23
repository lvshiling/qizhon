/**
 * 
 */
package com.navigation.domain;

import com.navigation.utils.StringUtils;


/**
 * @author wanghui2
 * 订单配送信息BEAN
 */
public class InfoBean {

	private Integer deliverModeId;
	private String postMemo;
	private String userName;
	private String userAddress;
	private String userPhone;
	private String userMobile;
	private String userPostZip;
	
	public static String checkNull(InfoBean info){
		if(StringUtils.isNullOrEmpty(info.getUserAddress())) return "userAddress";
		if(null == info.getDeliverModeId()) return "deliverModeId";
		if(StringUtils.isNullOrEmpty(info.getPostMemo())) return "postMemo";
		if(StringUtils.isNullOrEmpty(info.getUserMobile())) return "userMobile";
		if(StringUtils.isNullOrEmpty(info.getUserName())) return "userName";
		if(StringUtils.isNullOrEmpty(info.getUserPhone())) return "userPhone";
		if(StringUtils.isNullOrEmpty(info.getUserPostZip())) return "userPostZip";
		return "true";
	}
	
	public String getPostMemo() {
		return postMemo;
	}
	public void setPostMemo(String postMemo) {
		this.postMemo = postMemo;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserPostZip() {
		return userPostZip;
	}
	public void setUserPostZip(String userPostZip) {
		this.userPostZip = userPostZip;
	}

	public Integer getDeliverModeId() {
		return deliverModeId;
	}

	public void setDeliverModeId(Integer deliverModeId) {
		this.deliverModeId = deliverModeId;
	}
	
	
}
