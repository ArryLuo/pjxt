package com.populook.util;

import java.util.List;

import org.apache.shiro.SecurityUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.PreResultListener;

public class SitePermissionListener implements PreResultListener {

	@SuppressWarnings("unchecked")
	@Override
	public void beforeResult(ActionInvocation invocation, String resultCode) {
		List<String> platFormSiteList=(List<String>) SecurityUtils.getSubject().getSession().getAttribute("siteList");
		if(platFormSiteList!=null){
			ActionContext.getContext().put("checkSiteCol", platFormSiteList.size()<2?true:false);
		}
	}

}
