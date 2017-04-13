package com.populook.system.entity;

import java.util.List;

public class Permission implements java.io.Serializable {

	private static final long serialVersionUID=1L;
	
	public static final String MENU_TYPE="01";
	
	public static final String BUTTON_TYPE="02";
	
	private String id;
	
	private String permissionName;
	
	private String permissionUrl;
	
	private String parentid;
	
	private String icolcss;
	
	private String orders;
	
	private String permissionType;
	
	private String buttonId;
	
	private List<Permission> children;
	
	public String getPermissionName() {
		return permissionName;
	}

	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}

	public String getPermissionUrl() {
		return permissionUrl;
	}

	public void setPermissionUrl(String permissionUrl) {
		this.permissionUrl = permissionUrl;
	}

	public String getPermissionType() {
		return permissionType;
	}

	public void setPermissionType(String permissionType) {
		this.permissionType = permissionType;
	}

	public String getButtonId() {
		return buttonId;
	}

	public void setButtonId(String buttonId) {
		this.buttonId = buttonId;
	}

	/**
	 * @return the children
	 */
	public List<Permission> getChildren() {
		return children;
	}

	/**
	 * @param children the children to set
	 */
	public void setChildren(List<Permission> children) {
		this.children = children;
	}

	public Permission() {
		
	}

	public String getOrders() {
		return orders;
	}

	public void setOrders(String orders) {
		this.orders = orders;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	public String getIcolcss() {
		return icolcss;
	}

	public void setIcolcss(String icolcss) {
		this.icolcss = icolcss;
	}
}
