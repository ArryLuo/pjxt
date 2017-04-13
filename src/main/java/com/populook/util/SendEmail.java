package com.populook.util;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

/**
 * 发送邮箱
 * @author shenyijie
 * @date 2014-08-08
 * */
public class SendEmail {
	private static final Logger logger = LoggerFactory.getLogger(SendEmail.class);
	private static final ResourceBundle resource=ResourceBundle.getBundle("sysconf");
	/*private static String from="hbkongyue@163.com";
	private static String password="ky20!$ppk";*/
	private static String from=resource.getString("sendEmail.defaultEmail");
	private static String password=resource.getString("sendEmail.defaultpwd");
    private static Session session=null; 
    private  static Boolean isSend=true;
   static Properties properties = new Properties();
   static
   {
    //  properties.put("mail.smtp.host", "smtp.163.com");
      properties.put("mail.smtp.socketFactory.port", "25");
      properties.put("mail.smtp.socketFactory.class",
                     "javax.net.ssl.SSLSocketFactory");
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.port", "25");
   }
   //验证发件人
  public static void checkUser(){
  	String lastindex="";
  	  if(!from.equals("")){
  		  lastindex=from.substring(from.lastIndexOf("@")+1);
  		  if(lastindex.equals("163.com")){
  			  properties.put("mail.smtp.host", "smtp.163.com");
  		  }else if(lastindex.equals("126.com")){
  			  properties.put("mail.smtp.host", "smtp.126.com"); 
  		  }else if(lastindex.equals("sina.com")){
  			  properties.put("mail.smtp.host", "smtp.sina.com"); 
  		  }else if(lastindex.equals("sohu.com")){
  			  properties.put("mail.smtp.host", "smtp.sohu.com"); 
  		  }else if(lastindex.equals("yeah.net")){
  			  properties.put("mail.smtp.host", "smtp.yeah.net"); 
  		  }else if(lastindex.equals("21cn.com")){
  			  properties.put("mail.smtp.host", "smtp.21cn.com"); 
  		  }else if(lastindex.equals("139.com")){
  			  properties.put("mail.smtp.host", "smtp.139.com"); 
  		  }else if(lastindex.equals("qq.com")){
  			  properties.put("mail.smtp.host", "smtp.qq.com"); 
  		  }else if(lastindex.equals("gmail.com")){
  			  properties.put("mail.smtp.host", "smtp.gmail.com"); 
  		  }else if(lastindex.equals("hotmail.com")){
  			  properties.put("mail.smtp.host", "smtp.hotmail.com"); 
  			  properties.put("mail.smtp.port", "6025");  
  		  }else if(lastindex.equals("189.cn")){
  			  properties.put("mail.smtp.host", "smtp.189.cn"); 
  		  }
  	  }
  	  session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication(from, password);
	            }});

  } 
  //发送邮件
   public static boolean sendTo(String email,String content) 
   {
      try
      {
    	 isSend=true; 
    	 checkUser();
    	 sendMail(email,content,"","");
      }
      catch(Exception e)
      {
    	  isSend=false;
      }
     return isSend;
   }
   //群发邮件
   public static boolean sendToMany(List<String> emailList,String content,String title,String domain) 
   {
      try
      {
    	 isSend=true; 
    	 checkUser();
    	 mainContentToMang(emailList,content,title,domain);
      }
      catch(Exception e)
      {
    	  isSend=false;
      }
     return isSend;
   }
   
   public static void sendMail(String email,String content,String title,String domain){
	   try {
				  if(email!=null&&!email.equals("")){
					  logger.info("email----"+isEmail(email));
					  mainContent(email,content,title,domain); //循环发送邮件
					 /* if(isEmail(email)){
						
					  }else{
						  isSend=false;
					  }*/
				  }
	} catch (Exception e) {
		isSend=false;
	}
	  
   }
   //发送邮件的内容
   public static void mainContent(String email,String content,String title,String domain){
	   try {
		  
		   MimeMultipart mm = new MimeMultipart();
			// 新建一个存放信件内容的BodyPart对象
			BodyPart mdp = new MimeBodyPart();
			// 给BodyPart对象设置内容和格式/编码方式
			mdp.setContent(content.toString(), "text/html;charset=GBK");
			// 这句很重要，千万不要忘了
			mm.setSubType("related");
			//mdp.setHeader("Content-Transfer-Encoding", "知新继续教育");
			mm.addBodyPart(mdp); 
		   Message message = new MimeMessage(session);
		   String nick="";  
	        try {  
	        	if(domain.equals("")){
	        		domain="知新继续教育";
	        	}
	            nick=javax.mail.internet.MimeUtility.encodeText(""+domain+"");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }   
	        message.setFrom(new InternetAddress(from,nick));  
 	       message.setRecipients(Message.RecipientType.TO, 
 	       InternetAddress.parse(email));
 	       if(title.equals("")){
 	       message.setSubject("【知新继续教育】");
 	       }else{
 	    	  message.setSubject(title);
 	       }
 	     //  message.setText(content.replace("&nbsp;","").replace("<p>","").replace("</p>","").replace("<br/>",""));
 	       message.setContent(mm);
 	       message.saveChanges(); //  
 	       Transport.send(message);    
	} catch (Exception e) {
		isSend=false;
	}
	  
   }
   
   //群发邮件发送邮件的内容
   public static void mainContentToMang(List<String> emailList,String content,String title,String domain){
	   try {
		  if(emailList!=null&&emailList.size()>0){
		  for(int i=0;i<emailList.size();i++){	
			  if(!StringUtils.isEmpty(emailList.get(i))){   
		   MimeMultipart mm = new MimeMultipart();
			// 新建一个存放信件内容的BodyPart对象
			BodyPart mdp = new MimeBodyPart();
			// 给BodyPart对象设置内容和格式/编码方式
			mdp.setContent(content.toString(), "text/html;charset=GBK");
			// 这句很重要，千万不要忘了
			mm.setSubType("related");
			//mdp.setHeader("Content-Transfer-Encoding", "知新继续教育");
			mm.addBodyPart(mdp); 
		   Message message = new MimeMessage(session);
		   String nick="";  
	        try {  
	        	if(domain.equals("")){
	        		domain="知新继续教育";
	        	}
	            nick=javax.mail.internet.MimeUtility.encodeText(""+domain+"");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }   
	        message.setFrom(new InternetAddress(from,nick));  
 	       message.setRecipients(Message.RecipientType.TO, 
 	       InternetAddress.parse(emailList.get(i)));
 	       if(title.equals("")){
 	       message.setSubject("【知新继续教育】");
 	       }else{
 	    	  message.setSubject(title);
 	       }
 	     //  message.setText(content.replace("&nbsp;","").replace("<p>","").replace("</p>","").replace("<br/>",""));
 	       message.setContent(mm);
 	       message.saveChanges(); //  
 	       Transport.send(message);  
 	       }
		   }
 	       }  
	} catch (Exception e) {
		isSend=false;
	}
	  
   }

   public static Properties getProperties() {
      return properties;
   }

   public static void setProperties(Properties properties) {
	   SendEmail.properties = properties;
   }
   //验证邮箱的有效性
   public static boolean isEmail( String str ) {
       String regex = "[a-zA-Z_0-9]{1,}@(([a-zA-z0-9]-*){1,}\\.){1,3}[a-zA-z\\-]{1,}" ;
       return match( regex ,str );
   } 
   /** 
    * @param regex 正则表达式字符串
    * @param str   要匹配的字符串
    * @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
    */
   private static boolean match( String regex ,String str ){
       Pattern pattern = Pattern.compile(regex);
       Matcher  matcher = pattern.matcher( str );
       return matcher.matches();
   }

}
