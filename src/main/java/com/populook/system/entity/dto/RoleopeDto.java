package com.populook.system.entity.dto;
/**
 * 根据角色ID查询功能权限
 * @author zengbiao
 * @date 2014-06-16
 */
public class RoleopeDto {
	private String allitem;
	
	private String menuId;

	public String getAllitem() {
		return allitem;
	}

	
	
	public String getMenuId() {
		return menuId;
	}



	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}



	public RoleopeDto() {
		
	}

	public RoleopeDto(String allitem, String menuId) {
		super();
		this.allitem = allitem;
		this.menuId = menuId;
	}

	public void setAllitem(String allitem) {
		this.allitem = allitem;
	}


	
	

}
