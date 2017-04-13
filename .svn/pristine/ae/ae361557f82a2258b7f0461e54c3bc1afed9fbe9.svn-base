package com.populook.util;

import java.util.Map;

import com.populook.framework.util.MapUtils;
import com.populook.system.entity.Operator;
import com.populook.system.entity.dto.OperatorDto;
import com.populook.system.service.OperatorService;
import com.populook.system.shiro.UserInfo;


/**caiwenhong
 * @author Administrator
 *
 */
public class BackendRealName {
	
	/**
	 * @param operatorService
	 * @return 后台对象
	 */
	public static Operator getOperator(OperatorService operatorService){
		Operator operator = operatorService.selectById(UserInfo.getUserid());
		return operator;
	}
	
	//根据用户名得到 用户对象
	public  static  OperatorDto getOperator2(OperatorService operatorService,String userName){
	    //要得到用户真实的名字
		Map<String, Object> params = MapUtils.newHashMap();
		params.put("username",userName); 
		/*params.put("userpasswd", null);*/
		OperatorDto operatorDto = operatorService.getUserRoleInfo(params);
		return operatorDto;
	}
	
}
