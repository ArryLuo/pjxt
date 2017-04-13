/**
 * 
 */
package com.populook.system.shiro;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.populook.system.entity.Permission;
import com.populook.util.SitePermissionListener;
import com.populook.util.SysConfig;

/**
 * @author zhangchao
 * 
 */
public class ShiroInterceptor implements Interceptor {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.interceptor.Interceptor#destroy()
	 */
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.interceptor.Interceptor#init()
	 */
	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.opensymphony.xwork2.interceptor.Interceptor#intercept(com.opensymphony
	 * .xwork2.ActionInvocation)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("IMG_PREFIX_URL", SysConfig.IMG_PREFIX_URL);
		Map<String, List<Permission>> buttonMap = (Map<String, List<Permission>>) SecurityUtils
				.getSubject().getSession().getAttribute("buttonMap");
		
		if (buttonMap != null) {
			List<Permission> buttonList = buttonMap.get(request
					.getServletPath().substring(1));

			if (buttonList != null) {
				StringBuilder sb = new StringBuilder();
				for (Permission button : buttonList) {
					if (button != null
							&& StringUtils.isNotEmpty(button.getButtonId())) {
						sb.append(button.getButtonId());
						sb.append(",");
					}
				}
				String ids = sb.toString();
				// sb.substring(0, sb.length()-1);
				if (ids.length() > 1) {
					request.setAttribute("buttonIds",
							ids.substring(0, ids.length() - 1));
				}
			}
		}
		boolean checkSiteCol=false;
		List<String> platFormSiteList=(List<String>) SecurityUtils.getSubject().getSession().getAttribute("siteList");
		if(platFormSiteList!=null){
			checkSiteCol = platFormSiteList.size()<2?true:false;
		}
		request.setAttribute("checkSiteCol", checkSiteCol);
//		request.setAttribute("checkHr", UserInfo.isCheckHr());
		return invocation.invoke();
	}

}
