package com.populook.system.action;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.populook.framework.action.PageAction;
import com.populook.system.entity.Permission;
import com.populook.system.service.PermissionService;
/**
 * 权限管理里的菜单
 * @author zengbiao
 * @date 2014-06-16
 */
@Namespace("/system")
@ParentPackage(value="default")
@Results({ @Result(name="treeData", type="json",params={"root","permissionList"})}
		)
public class PermissionAction extends PageAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7698632554552927238L;

	@Resource
	private PermissionService permissionService;
	
	
	private Permission permissions;
	
	private List<Permission> permissionList;
	
	private String id;
	
	public List<Permission> getPermissionList() {
		return permissionList;
	}

	public void setPermissionList(List<Permission> permissionList) {
		this.permissionList = permissionList;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public Permission getPermissions() {
		return permissions;
	}

	public void setPermissions(Permission permissions) {
		this.permissions = permissions;
	}
	
	/**
	 * 添加或者修改菜单
	 * @return void
	 */
	public String operatorPermission() throws Exception {
		if("".equals(permissions.getId()) || permissions.getId() == null) {
			permissions.setId(UUID.randomUUID().toString().replace("-", ""));
	        this.permissionService.insertPermission(permissions);
		} else {
			 this.permissionService.updatePermission(permissions);
		}
		this.commonResult.setResult("true");
		return COMMONJSON;
	}

	/**
	 * 查询菜单并分页
	 * @return void
	 */
	public String getPermission() throws Exception {
		this.commonResult=this.permissionService.selectPermission(permissions, pager);
		return COMMONJSON;
	}
	
	/**
	 * 返回菜单页面
	 * @return void
	 */
	public String permission() {
		return "permission";
	}
	
	/**
	 * 批量删除菜单
	 * @return void
	 */
	public String batchDeletePermission() throws Exception {
		String[] ids = id.split(",");
		List<Permission> list = new ArrayList<Permission>();
		for(int i = 0; i < ids.length; i++) {
			Permission permission = new Permission();
			permission.setId(ids[i]);
			list.add(permission);
		}
		this.permissionService.batchDeletePermission(list);
		this.commonResult.setResult("true");
		return COMMONJSON;
	}
	
	public String queryPermissionTreeGrid(){
		
		this.permissionList=this.permissionService.selectPermissionTree();
		
		return "treeData";
	}
  
}
