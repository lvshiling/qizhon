package com.navigation.module.servlet; 

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.navigation.action.mail.javaMail.MsgShow;


public class MailChecker extends HttpServlet 
{

	private static final long serialVersionUID = 1L; 
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		// 禁止图像缓存。
		resp.setHeader("Pragma", "no-cache"); 
		resp.setHeader("Cache-Control", "no-cache"); 
		resp.setDateHeader("Expires", 0); 
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println("###########");
		MsgShow.show(new String[] { "-L", "imap://319962:superman163@imap.163.com" });
	}
	
	
}