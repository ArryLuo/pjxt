package com.populook.system.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Operator implements java.io.Serializable {

	private static final long serialVersionUID=1L;
	private String id = null;
	private String usertype = null;
	private String username = null;
	private String userpasswd = null;
	
	private String oldPassword = null;
	private String renewPassword = null;
	
	private String memo = null;
	private java.math.BigDecimal logonnum = null;
	private String lastlogontime = null;
	private String userstatus = null;
	private String creator = null;
	private String lasteditor = null;
	private String createtime = null;
	private String lastedittime = null;
	private String updateUserName;
	
	private String createUserName;
	
	private String dataRoleName; //关联数据角色名称
	
	private String funRoleName; //关联功能角色名称

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpasswd() {
		return userpasswd;
	}

	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getRenewPassword() {
		return renewPassword;
	}

	public void setRenewPassword(String renewPassword) {
		this.renewPassword = renewPassword;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public java.math.BigDecimal getLogonnum() {
		return logonnum;
	}

	public void setLogonnum(java.math.BigDecimal logonnum) {
		this.logonnum = logonnum;
	}

	public String getLastlogontime() {
		return lastlogontime;
	}

	public void setLastlogontime(String lastlogontime) {
		this.lastlogontime = lastlogontime;
	}

	public String getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getLasteditor() {
		return lasteditor;
	}

	public void setLasteditor(String lasteditor) {
		this.lasteditor = lasteditor;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getLastedittime() {
		return lastedittime;
	}

	public void setLastedittime(String lastedittime) {
		this.lastedittime = lastedittime;
	}

	public String getUpdateUserName() {
		return updateUserName;
	}

	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getDataRoleName() {
		return dataRoleName;
	}

	public void setDataRoleName(String dataRoleName) {
		this.dataRoleName = dataRoleName;
	}

	public String getFunRoleName() {
		return funRoleName;
	}

	public void setFunRoleName(String funRoleName) {
		this.funRoleName = funRoleName;
	}
	
}
