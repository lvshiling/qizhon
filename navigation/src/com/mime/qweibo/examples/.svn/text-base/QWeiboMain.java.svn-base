package com.mime.qweibo.examples;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Scanner;

import com.mime.qweibo.examples.QWeiboType.PageFlag;
import com.mime.qweibo.examples.QWeiboType.ResultType;

public class QWeiboMain {

	private static String customKey = "27d1186230a443d1ac7f514a96376adb";
	private static String customSecrect = "eff11cc20a1d582b81f1affe3e754889";
	private static String tokenKey = null;
	private static String tokenSecrect = null;
	private static String verify = null;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		syncRequest();
		asyncRequest();
	}

	private static void asyncRequest() {
		QWeiboAsyncApi api = new QWeiboAsyncApi();
        Scanner in = new Scanner(System.in);
        
//        System.out.println("GetRequestToken......");
//        if (api.getRequestToken(customKey, customSecrect)) {
//        	System.out.println("ok");
//        }
        
//        System.out.println("Get verification code......");
//        tokenKey = "c017888ad7c649788be3a971d9da090d";
//        tokenSecrect = "7debf1f444a98118a0c2ff84e11204d5";
//        if( !java.awt.Desktop.isDesktopSupported() ) {
//
//            System.err.println( "Desktop is not supported (fatal)" );
//            System.exit( 1 );
//        }
//        java.awt.Desktop desktop = java.awt.Desktop.getDesktop();
//        if(desktop == null || !desktop.isSupported( java.awt.Desktop.Action.BROWSE ) ) {
//
//            System.err.println( "Desktop doesn't support the browse action (fatal)" );
//            System.exit( 1 );
//        }
//        try {
//			desktop.browse(new URI("http://open.t.qq.com/cgi-bin/authorize?oauth_token=" + tokenKey));
//		} catch (IOException e) {
//			e.printStackTrace();
//			System.exit( 1 );
//		} catch (URISyntaxException e) {
//			e.printStackTrace();
//			System.exit( 1 );
//		}
//		
//        System.out.println("Input your verification code：");
//        verify = in.nextLine(); 
//        
//        System.out.println("GetAccessToken......");
//        if (api.getAccessToken(customKey, customSecrect, tokenKey, tokenSecrect, verify)) {
//        	System.out.println("ok");
//        }
        
        customKey = "27d1186230a443d1ac7f514a96376adb";
	    customSecrect = "eff11cc20a1d582b81f1affe3e754889";
	    tokenKey = "3b48537e3e41413d96b649da579e026d";
	    tokenSecrect = "c52f7911a7e97b3e446190c0bf3a5cb6";
//        System.out.println("GetHomeMsg......");
//      	if (api.getHomeMsg(customKey, customSecrect, tokenKey, tokenSecrect, ResultType.ResultType_Json, PageFlag.PageFlag_First, 20)) {
//      		System.out.println("ok");
//      	}
	    
	    if (api.publishMsg(customKey, customSecrect, tokenKey, tokenSecrect, "测试a", "", ResultType.ResultType_Json)) {
	    	System.out.println("ok");
	    }
        
        System.out.println("exit 0");
        in.close();
	}

	private static void syncRequest() {
		QWeiboSyncApi api = new QWeiboSyncApi();
		String response = null;
        Scanner in = new Scanner(System.in);
		
		System.out.println("GetRequestToken......");
		response = api.getRequestToken(customKey, customSecrect,null);

        System.out.println("Response from server：");
        System.out.println(response);
        
        if (!parseToken(response)) {
        	return;
        }
        
        System.out.println("Get verification code......");
        if( !java.awt.Desktop.isDesktopSupported() ) {

            System.err.println( "Desktop is not supported (fatal)" );
            System.exit( 1 );
        }
        java.awt.Desktop desktop = java.awt.Desktop.getDesktop();
        if(desktop == null || !desktop.isSupported( java.awt.Desktop.Action.BROWSE ) ) {

            System.err.println( "Desktop doesn't support the browse action (fatal)" );
            System.exit( 1 );
        }
        try {
			desktop.browse(new URI("http://open.t.qq.com/cgi-bin/authorize?oauth_token=" + tokenKey));
		} catch (IOException e) {
			e.printStackTrace();
			System.exit( 1 );
		} catch (URISyntaxException e) {
			e.printStackTrace();
			System.exit( 1 );
		}
		
        System.out.println("Input your verification code：");
        verify = in.nextLine(); 
        
        System.out.println("GetAccessToken......");
        response = api.getAccessToken(customKey, customSecrect, tokenKey, tokenSecrect, verify);
        System.out.println("Response from server：");
        System.out.println(response);

        if (!parseToken(response)){
            return;
        }
        
//        System.out.println("GetHomeMsg......");
//        response = api.getHomeMsg(customKey, customSecrect, tokenKey, tokenSecrect, ResultType.ResultType_Json, PageFlag.PageFlag_First, 20);
        
        System.out.println("Publishing......");
//        customKey = "27d1186230a443d1ac7f514a96376adb";
//        customSecrect = "eff11cc20a1d582b81f1affe3e754889";
//        tokenKey = "3b48537e3e41413d96b649da579e026d";
//        tokenSecrect = "c52f7911a7e97b3e446190c0bf3a5cb6";
        response = api.publishMsg(customKey, customSecrect, tokenKey, tokenSecrect, "测试a", "C:\\Users\\sampanweng\\Desktop\\QWeiboSDK\\QWBlogAPISDK_proj\\c#\\QWeiboTest\\head.bmp", ResultType.ResultType_Json);//"head.bmp"

        System.out.println("Response from server：");
        System.out.println(response);
        in.close();
	}

	static boolean parseToken(String response) {
		if (response == null || response.equals("")) {
			return false;
		}

		String[] tokenArray = response.split("&");

		if (tokenArray.length < 2) {
			return false;
		}

		String strTokenKey = tokenArray[0];
		String strTokenSecrect = tokenArray[1];

		String[] token1 = strTokenKey.split("=");
		if (token1.length < 2) {
			return false;
		}
		tokenKey = token1[1];

		String[] token2 = strTokenSecrect.split("=");
		if (token2.length < 2) {
			return false;
		}
		tokenSecrect = token2[1];

		return true;
	}
}
