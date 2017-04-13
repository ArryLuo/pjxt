/**   
 * @Description: populook 2014
 */
package com.populook.util;

import java.math.BigDecimal;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.util.StrutsTypeConverter;

/** 
 * @Description: 传给action的bigdecimal类型转换错误
 * @author zhangkai
 * @date 2014年9月12日 下午1:45:26 
 *  
 */
public class BigDecimalConverter extends StrutsTypeConverter {

	/* (non-Javadoc)
	 *  
	 *  
	 * @param context
	 * @param values
	 * @param toClass
	 * @return 
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class) 
	 */
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		if(BigDecimal.class ==toClass){ 
			String value= values[0];
			if(StringUtils.isNotBlank(value)&&value.matches("^\\d+(\\.?\\d*)$")){
				return new BigDecimal(value);
			}
		}
		return null;
	}

	/* (non-Javadoc)
	 *  
	 *  
	 * @param context
	 * @param o
	 * @return 
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object) 
	 */
	@Override
	public String convertToString(Map context, Object o) {
		if(o!=null && o instanceof BigDecimal){
			BigDecimal bigDecimal = (BigDecimal)o;
			return String.format("%.2f",bigDecimal);
		}
		return "0.00";
	}

}
