package com.populook.system.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Component;

import com.populook.framework.dao.impl.BaseDaoSupport;
import com.populook.framework.dto.CommonResult;
import com.populook.framework.dto.Pagination;
import com.populook.system.dao.PermissionDao;
import com.populook.system.entity.Permission;
/**
 * 菜单操作DAO
 * @author zengbiao
 * @date 2014-06-16
 */
@Component("permissionDao")
public class PermissionDaoImpl extends BaseDaoSupport implements PermissionDao{
	
	@Resource
	 private SqlSessionFactory sqlSessionFactory;
	
	 @PostConstruct
	 public void initSqlMapClient() {
	 super.setSqlSessionFactory(sqlSessionFactory);
	 }
	
	 protected SqlSessionFactory getSqlSessionFactory(){
	 return this.sqlSessionFactory;
	 }
	 
	 @Override
	public void insertPermission(Permission permission) {
		getSqlSession().insert("PermissionMapper.insertPermission", permission);
	}
	
	@Override
	public void updatePermission(Permission permission) {
		getSqlSession().update("PermissionMapper.updatePermission", permission);
	}
	
	/**
	 * 删除菜单
	 * @param id 菜单ID
	 * @return void
	 */
	@Override
	public void deletePermissionById(String id) {
		getSqlSession().delete("PermissionMapper.deletePermissionById",id);
	}
	
	/**
	 * 查询菜单列表
	 * @return void
	 */
	@Override
	public List<Permission> selectPermission(Permission permission) {
		return getSqlSession().selectList("PermissionMapper.selectList",permission);
	}
	
	/**
	 * 查询条数
	 * @param param 查询参数
	 * @return int
	 */
	@Override
	public int selectPermissionCount(Permission permission) {
		return 10;
	}
	
	/**
	 * 批量添加系统用户
	 * @param id 系统用户ID
	 * @return void
	 */
	@Override
	public void batchDeletePermission(List<Permission> list) {
		getSqlSession().delete("PermissionMapper.batchDeletePermission",list);
	}

	@Override
	public CommonResult selectPermissionPage(Permission permission,
			Pagination pager) {
		return this.queryForPagination("PermissionMapper", pager, permission);
	}
	
	/**
	 * 根据用户ID查询对应的菜单
	 * @param operatorID 系统用户ID
	 * @return List<Menu> 
	 */
	@Override
	public List<Permission> selectPermissionByUserId(String operatorID,String permissionType) {
		Map<String,String> params= new HashMap<String,String>();
		params.put("operatorID", operatorID);
		if(permissionType!=null){
		params.put("permissionType", permissionType);
		}
		return this.getSqlSession().selectList("PermissionMapper.selectPermissionByUserId",params);
	}

	@Override
	public List<String> selectPlatFormSiteIds(Map<String,Object> map) {
		return this.getSqlSession().selectList("PermissionMapper.selectPlatFormSiteIdsByUserId",map);
	}

	@Override
	public List<String> selectPlatFormSiteIdsByOrg(String userId) {
		return this.getSqlSession().selectList("PermissionMapper.selectPlatFormSiteIdsByOrgName", userId);
	}

}
