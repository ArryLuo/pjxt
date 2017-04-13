/**
 * 
 */
package com.populook.system.shiro;

import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

/**
 * @author zhangchao
 * 
 */
public class PermissionFilter extends AuthorizationFilter {

	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		HttpServletRequest req = (HttpServletRequest) request;

		String action = req.getServletPath().substring(1);
		Subject subject = SecurityUtils.getSubject();
		Set<String> actionSet = (Set<String>) subject.getSession()
				.getAttribute("actionList");
		if (actionSet != null && actionSet.contains(action)) {
			return true;
		} else {
			return false;
		}
	}

}
