package com.navigation.utils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.muc.MultiUserChat;

import com.navigation.security.SessionUtil;

/**
 * @author Alex
 */
public class ChatRoomUtil {

	/**
	 * 创建一个持久房间
	 * 
	 * @param userId
	 * @param roomId
	 * @param roomName
	 * @return
	 * @throws XMPPException
	 */
	@SuppressWarnings("unchecked")
	public static MultiUserChat createReservedRoom(Integer userId, Integer roomNo, String roomName) throws XMPPException {
		Connection conn = SessionUtil.getConnection();
		MultiUserChat muc = new MultiUserChat(conn, roomNo + "@conference." + conn.getServiceName());

		muc.create("qule");

		Form form = muc.getConfigurationForm();
		Form submitForm = form.createAnswerForm();

		for (Iterator fields = form.getFields(); fields.hasNext();) {
			FormField field = (FormField) fields.next();
			if (!FormField.TYPE_HIDDEN.equals(field.getType()) && field.getVariable() != null) {
				submitForm.setDefaultAnswer(field.getVariable());
			}
		}

		// 设置房间的拥有者
		List<String> owners = new ArrayList<String>();
		owners.add(Constants.getInstance().xampp_admin + "@" + conn.getServiceName());
		owners.add(userId + "@" + conn.getServiceName());
		submitForm.setAnswer("muc#roomconfig_roomowners", owners);

		// 设置房间的管理员
		// List<String> admins = new ArrayList<String>();
		// admins.add(userId + "@" + conn.getServiceName());
		// submitForm.setAnswer("muc#roomconfig_roomadmins", admins);

		// 设置房间名称
		submitForm.setAnswer("muc#roomconfig_roomname", roomNo);

		// 给房间加密
		// submitForm.setAnswer("muc#roomconfig_passwordprotectedroom", true);
		// submitForm.setAnswer("muc#roomconfig_roomsecret", "reserved");

		// 设置房间为持久房间
		submitForm.setAnswer("muc#roomconfig_persistentroom", true);

		// 发送已完成的表单到服务器配置房间
		muc.sendConfigurationForm(submitForm);

		muc.leave();

		return muc;
	}

	/**
	 * 生成普通房间号
	 * 
	 * @param roomId
	 * @return
	 */
	public static Integer genRoomNo(Integer roomId) {
		return 10000 + roomId;
	}
}
