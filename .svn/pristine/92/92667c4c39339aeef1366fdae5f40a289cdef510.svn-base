package com.populook.util;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**caiwenhong 
 * @author Administrator
 *
 */
public class RequestAndResponst {

	/**
	 * @param paramet
	 * @return  request请求得到结果
	 */
	public static String myRequest(String paramet) {
		HttpServletRequest request = ServletActionContext.getRequest();
		String paremat = request.getParameter(paramet);
		return paremat;
	}

	/**
	 * @return response
	 */
	public static HttpServletResponse myRsponse() {
		HttpServletResponse response = ServletActionContext.getResponse();
		return response;
	}

}
