package com.populook.system.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.populook.framework.dto.CommonResult;
import com.populook.framework.dto.Pagination;
import com.populook.system.dao.OperatorDao;
import com.populook.system.entity.Operator;
import com.populook.system.entity.dto.OperatorDto;
import com.populook.system.service.OperatorService;

/**
 * 系统用户操作Service
 * 
 * @author zengbiao
 * @date 2014-06-16
 */
@Component("operatorService")
public class OperatorServiceImpl implements OperatorService {

	@Resource
	private OperatorDao operatorDao;

	/**
	 * 添加系统用户
	 * 
	 * @param Operator
	 *            系统用户
	 * @return void
	 */
	@Override
	public void insertOperator(Operator operator) {
		this.operatorDao.insertOperator(operator);
	}

	/**
	 * 修改系统用户
	 * 
	 * @param Operator
	 *            系统用户
	 * @return void
	 */
	@Override
	public void updateOperator(Operator operator) {
		this.operatorDao.updateOperator(operator);
	}

	/**
	 * 删除系统用户
	 * 
	 * @param id
	 *            系统用户ID
	 * @return void
	 */
	@Override
	public void deleteOperatorById(String id) {
		this.operatorDao.deleteOperatorById(id);
	}

	/**
	 * 批量添加系统用户
	 * 
	 * @param list
	 *            系统用户集合
	 * @return void
	 */
	@Override
	public void batchInsertOperator(List<Operator> list) {
		this.operatorDao.batchInsertOperator(list);
	}

	/**
	 * 批量删除系统用户
	 * 
	 * @param list
	 *            系统用户集合
	 * @return void
	 */
	@Override
	public void batchDeleteOperator(List<Operator> list) {
		this.operatorDao.batchDeleteOperator(list);
	}

	/**
	 * 判断是否可以登录
	 * 
	 * @param 用户名和密码
	 * @return int
	 */
	@Override
	public int checklogin(Map<String, Object> param) {
		return this.operatorDao.checklogin(param);
	}

	/**
	 * 根据用户名和密码查询角色等信息
	 * 
	 * @param 用户名和密码
	 * @return Operator
	 */
	@Override
	public OperatorDto getUserRoleInfo(Map<String, Object> param) {
		return this.operatorDao.getUserRoleInfo(param);
	}

	@SuppressWarnings("unchecked")
	@Override
	public CommonResult selectPages(Operator operator, Pagination pager) {
		CommonResult result = this.operatorDao.selectOperatorPage(operator, pager);
		return result;
	}

	@Override
	public Operator selectById(String id) {
		return operatorDao.selectById(id);
	}

	@Override
	public Integer checkUserName(String username) {
		return this.operatorDao.checkUserName(username);
	}

	@Override
	public List<String> selectOperator(Operator operator) {
		return this.operatorDao.selectOperator(operator);
	}

	@Override
	public void batchDisableOpertor(List<String> ids) {
		this.operatorDao.batchDisableOpertor(ids);
	}

	@Override
	public void batchEnableOpertor(List<String> ids) {
		this.operatorDao.batchEnableOpertor(ids);
	}


	@Override
	public List<Operator> selectAll(Operator operator) {
		return this.operatorDao.selectAll(operator);
	}

}
