package com.populook.system.service;

import java.util.List;
import java.util.Map;

import com.populook.framework.dto.CommonResult;
import com.populook.framework.dto.Pagination;
import com.populook.system.entity.Operator;
import com.populook.system.entity.dto.OperatorDto;
/**
 * 角色关联操作
 * @author zengbiao
 * @date 2014-06-16
 */

public interface OperatorService {
	
	public CommonResult selectPages(Operator operator,Pagination pager);
	
//	//查询所有的操作用户
//	public List<Operator> getOperator(Map<String,Object> param,Pagination pager);
	
	//添加系统用户
	public void insertOperator(Operator operator);
	
	//修改系统用户
	public void updateOperator(Operator operator);
	
	//删除系统用户
	public void deleteOperatorById(String id);
	
	//批量添加系统用户
	public void batchInsertOperator(List<Operator> list);
	
	//批量删除系统用户
	public void batchDeleteOperator(List<Operator> list);
	
//	//根据用户名查询系统用户
//	public List<Operator> getOperatorByUserName(Map<String,Object> param);
    
//    //查询总条数
//    public int selectOperatorCount(Map<String,Object> param);
    
    
    //判断是否可以登录
    public int checklogin(Map<String,Object> param);
    
    //根据用户名和密码查询角色等信息
    public OperatorDto getUserRoleInfo(Map<String,Object> param);
    
    
    Operator  selectById(String id);

    /**
     * 检查用户名
     * @param username
     * @return
     */
	public Integer checkUserName(String username);

	public List<String> selectOperator(Operator operator);

	/**
	 * 批量禁用客户
	 * @param ids
	 */
	public void batchDisableOpertor(List<String> ids);

	/**
	 * 批量启用客户
	 * @param ids
	 */
	public void batchEnableOpertor(List<String> ids);

	
	/**得到后台操作用户列表
	 * @param operator
	 * @return
	 */
	List<Operator> selectAll(Operator operator);
}
