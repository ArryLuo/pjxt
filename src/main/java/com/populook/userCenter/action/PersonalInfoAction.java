package com.populook.userCenter.action;

import java.util.Date;

import javax.annotation.Resource;





import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.populook.framework.action.PageAction;
import com.populook.framework.util.DateUtil;
import com.populook.framework.util.EncryptUtils;
import com.populook.system.entity.Operator;
import com.populook.system.entity.dto.OperatorDto;
import com.populook.system.service.OperatorService;
import com.populook.system.shiro.UserInfo;
import com.populook.userCenter.service.PersonalInfoService;
import com.populook.util.BackendRealName;
@Namespace("/userCenter")
@ParentPackage(value="default")
public class PersonalInfoAction extends PageAction{

	
	/**edit by 
	 * mingjing
	 * 2014-8-26
	 */
	@SuppressWarnings("unused")
	private static Log log=LogFactory.getLog(PersonalInfoAction.class);
	private static final long serialVersionUID = 1L;

	private Operator operator ;
	
	private String id ;
	

	
	@Resource
	private PersonalInfoService personalInfoService ;
	
	@Resource
	private OperatorService operatorService;
	
	public Operator getOperator() {
		return operator;
	}

	public void setOperator(Operator operator) {
		this.operator = operator;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/*跳转到个人信息维护界面*/
	 public String personalInfo(){
		 operator = this.personalInfoService.infoByID(UserInfo.getUserid());
		 return "personalInfo" ;
	 }
	 
	 public String operatePInfo(){
		 //判断登录密码是否正确  //得到数据库中的用户对象信息    
		 OperatorDto operator1= BackendRealName.getOperator2(operatorService,operator.getUsername());
		    
		 
        if (!operator1.getPassword().equals(operator.getUserpasswd().length()>12?operator.getUserpasswd():EncryptUtils.encryptMD5(operator.getUserpasswd()))) {
        	this.commonResult.setMessage("登录密码不正确");
        	 this.commonResult.setResult("false");
        	 return COMMONJSON;
		}
		 
		if(operator.getId().equals(UserInfo.getUserid())){
//		 operator.setUserpasswd(EncryptUtils.encryptMD5(operator.getNewPassword()));
		 operator.setLasteditor(UserInfo.getUserid());
		 operator.setLastedittime(DateUtil.getDateToString(new Date()));
		 this.personalInfoService.updatePersonalInfo(operator);
		 this.commonResult.setResult("true");
		 
		}
		 return COMMONJSON;
	 }
	
}
