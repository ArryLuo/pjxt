package com.populook.system.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * shiro存放信息类
 * @author zengbiao
 * @date 2014-06-16
 */
public class UserInfo {
	public static String getUserid() {
		Subject currentUser = SecurityUtils.getSubject();
		return ((ShiroUser)currentUser.getPrincipal()).getUserid();
	}
	
	public static String getRoleId(){
		Subject currentUser = SecurityUtils.getSubject();
		return ((ShiroUser)currentUser.getPrincipal()).getRoleid();
	}

	public static String getUserName(){
		Subject currentUser = SecurityUtils.getSubject();
		return ((ShiroUser)currentUser.getPrincipal()).getUsername();
	}
//	
//	@SuppressWarnings("unchecked")
//	public static List<HrDto> getHrs(){
//		Session session=SecurityUtils.getSubject().getSession();
//		List<HrDto> hrs=(List<HrDto>)session.getAttribute("hrInfoList");
////		List<HrDto> hrs=new ArrayList<HrDto>();
////		//TODO:暂时在此添加hr信息
//		return hrs;
//	}
//	
//	public static List<String> getHrIds(){
//		
//		List<HrDto> hrs=getHrs();
//		
//		List<String> hrids=Lists.transform(hrs, new Function<HrDto,String>(){
//
//			@Override
//			public String apply(HrDto arg0) {
//				
//				return arg0.getHrid();
//			}
//			
//		});
//		
//		return hrids;
//	}
//	
//	/**
//	 * 是否需要根据hr信息过滤数据
//	 * @return
//	 */
//	public static boolean isCheckHr(){
//		Session session=SecurityUtils.getSubject().getSession();
//		Boolean isCheckHr=(Boolean)session.getAttribute("isCheckHr");		
//		return isCheckHr==null?false:isCheckHr.booleanValue();
//	}
}
