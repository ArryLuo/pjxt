package com.populook.system.dao;
import java.util.List;
import java.util.Map;
import com.populook.framework.dao.BaseDao;
import com.populook.framework.dto.CommonResult;
import com.populook.framework.dto.Pagination;
import com.populook.system.entity.Operator;
import com.populook.system.entity.dto.OperatorDto;
public interface OperatorDao extends BaseDao {
	

	public CommonResult selectOperatorPage(Operator operator,Pagination pager);
	

	public void insertOperator(Operator operator);
	

	public void updateOperator(Operator operator);
	

	public void deleteOperatorById(String id);
	
	public void batchInsertOperator(List<Operator> list);
	

	public void batchDeleteOperator(List<Operator> list);
	
	public Integer checklogin(Map<String,Object> param);
	
	public OperatorDto getUserRoleInfo(Map<String,Object> param);
	
	Operator  selectById(String id);
	
	public Integer checkUserName(String username);

	public List<String> selectOperator(Operator operator);


	public void batchDisableOpertor(List<String> ids);


	public void batchEnableOpertor(List<String> ids);

	
	/**得到后台操作用户列表
	 * @param operator
	 * @return
	 */
	List<Operator> selectAll(Operator operator);
	
}
