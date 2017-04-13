package com.populook.system.action;

import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;
import com.populook.system.entity.Operator;
import com.populook.system.service.OperatorService;
import com.populook.system.shiro.UserInfo;
import com.populook.util.BackendRealName;

/**
 * 登录
 * 
 * @author chenghai
 * @date 2014-06-16
 */
@ParentPackage(value = "default")
public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 8579119443940886147L;

	private String username;

	private String userpasswd;
	
	private String id;
	
	private String errorCode;
	
	@Resource
	private OperatorService operatorService;

	public String getUsername() {
		return username;
	}

	public String getUserpasswd() {
		return userpasswd;
	}

	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 登录
	 * 
	 * @return void
	 */
	@Action(value = "/login", results = {
			@Result(name = "success", type="redirect", location = "/index.action"),
			@Result(name = "fail", location = "/login.jsp")
			})
	public String login() {
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username,userpasswd);
		token.setRememberMe(true);
		try {
			currentUser.login(token);
		} catch (AuthenticationException e) {
			this.errorCode="1";
			return "fail";
		}
		
	    Operator operator= BackendRealName.getOperator(operatorService);
	    if (operator!=null&&!"".equals(operator)) {
	    	if ("01".equals(operator.getUserstatus()!=null?operator.getUserstatus():"")) {
	    		this.errorCode="2";
	    		return "fail";
			}
		}
		
		
		if (currentUser.isAuthenticated()) {
			return "success";
		} else {
			this.errorCode="1";
			return "fail";
		}
		
	}
	
	@Action(value = "/index", results = {
			@Result(name = "success", location = "/WEB-INF/views/main/main.jsp")
			})
	public String index() {
		username=UserInfo.getUserName();
		id=UserInfo.getUserid();
		return "success";
	}

	/**
	 * 退出
	 * 
	 * @return
	 * @throws
	 */
	/**
	 * 登录
	 * 
	 * @return void
	 */
	@Action(value = "/exit", results = { @Result(name = "exit", location = "/login.jsp") })
	public String existSystem() {

		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.logout();
		} catch (AuthenticationException e) {
			return "exit";
		}
		return "exit";
	}

}
