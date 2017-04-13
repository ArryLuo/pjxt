package com.populook.system.service;

import java.util.List;
import java.util.Map;

import com.populook.framework.dto.CommonResult;
import com.populook.framework.dto.Pagination;
import com.populook.system.entity.Permission;

public interface PermissionService {
	//添加菜单
	public void insertPermission(Permission permission);
	
	//修改菜单
	public void updatePermission(Permission permission);
	
	//删除菜单
	public void deletePermissionById(String id);
	
	//查询所有菜单
	public CommonResult selectPermission(Permission permission,Pagination pager);
	
	//查询总条数
	public int selectPermissionCount(Permission permission);
	
	//批量删除菜单
    public void batchDeletePermission(List<Permission> list);
    
    public List<Permission> selectPermissionTree();
    
	//根据用户ID查询菜单信息
    public List<Permission> selectPermissionByUserId(String operatorID,String permissionType);
    
    public List<Permission> selectPermissionList(Permission permission);
    
    /**
     * 查询所有的登陆用户站点集合
     * */
    public List<String> selectPlatFormSiteIds(Map<String,Object> map);
    
    /**根据userid查询用户所属组织下面站点集合*/
    
    public List<String> selectPlatFormSiteIdsByOrg(String userId);
}
