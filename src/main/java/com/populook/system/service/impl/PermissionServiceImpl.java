package com.populook.system.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.populook.framework.dto.CommonResult;
import com.populook.framework.dto.Pagination;
import com.populook.system.dao.PermissionDao;
import com.populook.system.entity.Permission;
import com.populook.system.service.PermissionService;

/**
 * 菜单操作Service
 * @author zengbiao
 * @date 2014-06-16
 */
@Component("permissionService")
public class PermissionServiceImpl implements PermissionService{
	
	@Resource
	private PermissionDao permissionDao;
	
	/**
	 * 添加菜单
	 * @param permission 菜单
	 * @return void
	 */
	public void insertPermission(Permission permission) {
		this.permissionDao.insertPermission(permission);
	}
	
	/**
	 * 修改菜单
	 * @param permission 菜单
	 * @return void
	 */
	public void updatePermission(Permission permission) {
		this.permissionDao.updatePermission(permission);
	}
	
	/**
	 * 删除菜单
	 * @param id 菜单ID
	 * @return void
	 */
	public void deletePermissionById(String id) {
		this.permissionDao.deletePermissionById(id);
	}
	
	/**
	 * 查询菜单列表
	 * @return void
	 */
	public CommonResult selectPermission(Permission permission,Pagination pager) {
		return this.permissionDao.selectPermissionPage(permission, pager);
	}
	
	/**
	 * 查询总条数
	 * @param param
	 * @return int
	 */
	public int selectPermissionCount(Permission permission) {
		return this.permissionDao.selectPermissionCount(permission);
	}
	
	/**
	 * 批量删除菜单
	 * @param list 菜单ID集合
	 * @return void
	 */
	public void batchDeletePermission(List<Permission> list) {
		this.permissionDao.batchDeletePermission(list);
	}

	@Override
	public List<Permission> selectPermissionTree() {
		List<Permission> permissionList=this.permissionDao.selectPermission(null);
		
		return this.createPermissionTree(permissionList, null);
	}
	
	/**
	 * 判断是否有子节点
	 */
	private boolean hasChild(List<Permission> list, Permission node) {
		return getChildList(list, node).size() > 0 ? true : false;
	}

	/**
	 * 得到子节点列表
	 */
	private List<Permission> getChildList(List<Permission> list, Permission permission) {
		List<Permission> li = new ArrayList<Permission>();
		Iterator<Permission> it = list.iterator();
		while (it.hasNext()) {
			Permission temp = (Permission) it.next();
			if (permission.getId().equals(temp.getParentid())) {
				li.add(temp);
			}
		}
		return li;
	}
	
	private List<Permission> findRoots(List<Permission> list){
		List<Permission> treeRoots=new ArrayList<Permission>();
		for(Permission node:list){
			if(StringUtils.isEmpty(node.getParentid())){
				treeRoots.add(node);
			}
		}
		return treeRoots;
	}
	
	private List<Permission> createPermissionTree(List<Permission> list, List<Permission> nodeList) {
		
		List<Permission> treeRoots=new ArrayList<Permission>();
		
		
		
		if (nodeList == null) {
			treeRoots = findRoots(list);
		} else {
			treeRoots = nodeList;
		}
		
		if (list == null) {
			// 防止没有权限菜单时
			return treeRoots;
		}
		for(Permission node:treeRoots){
		if (hasChild(list, node)) {
			List<Permission> lt = new ArrayList<Permission>();
			List<Permission> childList = getChildList(list, node);
			lt.addAll(createPermissionTree(list, childList));
			node.setChildren(lt);
		} 
		}
		
		return treeRoots;
	}
	
	/**
	 * 根据用户ID查询对应的菜单
	 * @param operatorID 系统用户ID
	 * @return List<Permission> 
	 */
	@Override
	public List<Permission> selectPermissionByUserId(String operatorID,String permissionType) {
		return this.permissionDao.selectPermissionByUserId(operatorID,permissionType);
	}
	
	@Override
	public List<Permission> selectPermissionList(Permission permission){
		return this.permissionDao.selectPermission(permission);
	}

	@Override
	public List<String> selectPlatFormSiteIds(Map<String,Object> map) {
		return permissionDao.selectPlatFormSiteIds(map);
	}

	@Override
	public List<String> selectPlatFormSiteIdsByOrg(String userId) {
		return permissionDao.selectPlatFormSiteIdsByOrg(userId);
	}
	
}
