package com.populook.system.dao;

import java.util.List;
import java.util.Map;

import com.populook.framework.dao.BaseDao;
import com.populook.framework.dto.CommonResult;
import com.populook.framework.dto.Pagination;
import com.populook.system.entity.Permission;

/**
 * 菜单操作DAO
 * @author zengbiao
 * @date 2014-06-16
 */
public interface PermissionDao extends BaseDao {
	
	/**
	 * 添加菜单
	 * @param permission 菜单
	 * @return void
	 */
	public void insertPermission(Permission permission);
	
	/**
	 * 修改菜单
	 * @param permission 菜单
	 * @return void
	 */
	public void updatePermission(Permission permission);
	
	/**
	 * 删除菜单
	 * @param id 菜单ID
	 * @return void
	 */
	public void deletePermissionById(String id);
	
	/**
	 * 查询菜单列表
	 * @return void
	 */
	public List<Permission> selectPermission(Permission permission);
	
	/**
	 * 查询菜单列表的一页
	 * @param param 查询参数
	 * @param pager 分页对象
	 * 
	 * @return 分页结果对象
	 */
	public CommonResult selectPermissionPage(Permission permission,Pagination pager);
	
	/**
	 * 查询条数
	 * @param param 查询参数
	 * @return 总数
	 */
	public int selectPermissionCount(Permission permission);
	
	/**
	 * 批量删除菜单
	 * @param id 菜单列表
	 * @return void
	 */
	public void batchDeletePermission(List<Permission> list);
	

	public List<Permission> selectPermissionByUserId(String operatorID,String permissionType);
	/**
	 * 查询登陆用户所有的站点
	 * */
	public List<String> selectPlatFormSiteIds(Map<String,Object> map);
	/**
	 * 根据userid查询所属组织下面站点集合
	 * */
	public List<String> selectPlatFormSiteIdsByOrg(String userId);
	
}
