package com.populook.util;

import java.io.IOException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author shenyijie
 * @date  2014-08-07
 * */

public class SendSms {
	private static final Logger logger = LoggerFactory.getLogger(SendSms.class);
	//发送短信
	 public static int sendMessage(String mobile,String content) {
			String msg=content.replace("<br/>", "");
			HttpClient client = new HttpClient();  
	        PostMethod post = new PostMethod("http://116.213.72.20/SMSHttpService/send.aspx");  
	        post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码  
	        NameValuePair[] data = { new NameValuePair("username", "zyzyjy"), // 注册的用户名  
	                new NameValuePair("password", "zyzyjy"), 
	// 注册成功后,登录网站使用的密钥，这个密钥要登录到国建网然后有一个API接口，点进去就有一个key，可以改，那个才是密钥  
	                new NameValuePair("mobile",mobile), // 手机号码  
			          new NameValuePair("content", msg), new NameValuePair("Extcode", ""), new NameValuePair("senddate", ""), new NameValuePair("batchID", "") };//设置短信内容          
			  post.setRequestBody(data); 
			try {
				int isFlag=checkBalance();
				if(isFlag>0){
				client.executeMethod(post);
				}
			} catch (HttpException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
			Header[] headers = post.getResponseHeaders();  
		//	int statusCode = post.getStatusCode();  
			//System.out.println("statusCode:" + statusCode);
			//logger.info("statusCode:" + statusCode);
			post.releaseConnection();  
		  return 0;
			}
	public static int checkBalance(){
		 HttpClient client = new HttpClient();  
		 PostMethod postBalance = new PostMethod("http://116.213.72.20/SMSHttpService/Balance.aspx");  
		 NameValuePair[] paramdata = { new NameValuePair("username", "zyzyjy"), // 注册的用户名  
	                new NameValuePair("password", "zyzyjy")};//设置短信内容          	
		 postBalance.setRequestBody(paramdata); 
		 try {
			 client.executeMethod(postBalance);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int statusCode = postBalance.getStatusCode();  
		 return  statusCode;
	}
	

}
