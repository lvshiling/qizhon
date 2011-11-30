package com.navigation.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

/**
 * @author Alex
 */
public class HTTPUtils {

	public static String sendGet(String url, String param) {
		String result = "";
		try {
			String urlName = url + "?" + param;//

			URL U = new URL(urlName);
			URLConnection connection = U.openConnection();
			connection.connect();

			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
			in.close();
		} catch (Exception e) {
			System.out.println("没有结果！" + e);
		}
		return result;
	}

	public static String sendPost(String url, String param) {
		String result = "";
		try {
			URL httpurl = new URL(url);
			HttpURLConnection httpConn = (HttpURLConnection) httpurl.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setDoInput(true);
			PrintWriter out = new PrintWriter(httpConn.getOutputStream());
			out.print(param);
			out.flush();
			out.close();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
			in.close();
		} catch (Exception e) {
			System.out.println("没有结果！" + e);
		}
		return result;
	}

	public static void main(String[] args) {
		// String s=sendGet("http://v.qule.com/user/auth.do","");
		// System.out.println(s);
		String s1 = sendPost("http://v.qule.com/user/auth.do", "");
		System.out.println(s1);
	}
}
