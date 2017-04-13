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
import com.populook.system.dao.OperatorDao;
import com.populook.system.entity.Operator;
import com.populook.system.entity.dto.OperatorDto;
/**
 * 系统用户操作DAO
 * @author zengbiao
 * @date 2014-06-16
 */
@Component("operatorDao")
public class OperatorDaoImpl extends BaseDaoSupport implements OperatorDao{
	@Resource
	 private SqlSessionFactory sqlSessionFactory;
	
	 @PostConstruct
	 public void initSqlMapClient() {
	 super.setSqlSessionFactory(sqlSessionFactory);
	 }
	
	 protected SqlSessionFactory getSqlSessionFactory(){
	 return this.sqlSessionFactory;
	 }
	
	/**
	 * 添加系统用户
	 * @param Operator 系统用户
	 * @return void
	 */
	@Override
	public void insertOperator(Operator operator) {
		getSqlSession().insert("OperatorMapper.insertOperator", operator);
	}
	
	/**
	 * 修改系统用户
	 * @param Operator 系统用户
	 * @return void
	 */
	@Override
	public void updateOperator(Operator operator) {
		getSqlSession().update("OperatorMapper.updateOperator", operator);
	}
	
	/**
	 * 删除系统用户
	 * @param id 系统用户ID
	 * @return void
	 */
	@Override
	public void deleteOperatorById(String id) {
		getSqlSession().delete("OperatorMapper.deleteOperatorById", id);
	}
	
	
	/**
	 * 批量添加系统用户
	 * @param id 系统用户ID
	 * @return void
	 */
	@Override
	public void batchInsertOperator(List<Operator> list) {
		getSqlSession().insert("OperatorMapper.batchInsertOperator", list);
	}
	
	
	/**
	 * 批量删除系统用户
	 * @param list 系统用户集合
	 * @return void
	 */
	@Override
	public void batchDeleteOperator(List<Operator> list) {
		getSqlSession().delete("OperatorMapper.batchDeleteOperator",list);
	}
	
	
	/**
	 * 批量更新用户
	 * @param list 系统用户list
	 * @return void 
	 *//*
	public void batchUpdateOperator(List<Operator> list) {
		this.getSqlSession().update("OperatorMapper.batchUpdateOperator",list);
	}*/
	
	
//	/**
//	 * 查询总条数
//	 * @param param
//	 * @return int
//	 */
//	public int selectOperatorCount(Map<String,Object> param) {
//		return this.getSqlSession().selectOne("OperatorMapper.selectOperatorCount", param);
//	}
	
	/**
	 * 判断是否可以登录
	 * @param 用户名和密码
	 * @return int
	 */
	@Override
	public Integer checklogin(Map<String,Object> param) {
		return this.getSqlSession().selectOne("OperatorMapper.checklogin", param);
	}
	
	
	/**
	 * 根据用户名和密码查询角色等信息
	 * @param 用户名和密码
	 * @return Operator
	 */
	@Override
	public OperatorDto getUserRoleInfo(Map<String,Object> param) {
		return this.getSqlSession().selectOne("OperatorMapper.getUserRoleInfo", param);
	}

	@Override
	public CommonResult selectOperatorPage(Operator operator, Pagination pager) {
		return this.queryForPagination("OperatorMapper", pager, operator);
	}

	@Override
	public Operator selectById(String id) {
		return this.getSqlSession().selectOne("OperatorMapper.selectone", id);
	}

	@Override
	public Integer checkUserName(String username) {
		return this.getSqlSession().selectOne("OperatorMapper.checkUserName",username);
	}

	@Override
	public List<String> selectOperator(Operator operator) {
		return this.getSqlSession().selectList("OperatorMapper.selectOperator",operator);
	}

	@Override
	public void batchDisableOpertor(List<String> ids) {
		this.getSqlSession().update("OperatorMapper.batchDisableOpertor", ids);
	}

	@Override
	public void batchEnableOpertor(List<String> ids) {
		this.getSqlSession().update("OperatorMapper.batchEnableOpertor", ids);
	}

	@Override
	public List<Operator> selectAll(Operator operator) {
		return this.getSqlSession().selectList("OperatorMapper.selectAll", operator);
	}

     
}
