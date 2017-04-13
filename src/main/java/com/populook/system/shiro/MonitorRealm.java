package com.populook.system.shiro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;

import com.populook.framework.util.EncryptUtils;
import com.populook.system.entity.Permission;
import com.populook.system.entity.dto.OperatorDto;
import com.populook.system.service.OperatorService;
import com.populook.system.service.PermissionService;

/**
 * shiro控制类
 * 
 * @author zengbiao
 * @date 2014-06-16
 */
@Component("monitorRealm")
public class MonitorRealm extends AuthorizingRealm {

	private static final Logger LOGGER = Logger.getLogger(MonitorRealm.class);

	@Resource
	private OperatorService operatorService;
	
	@Resource
	private PermissionService permissionService;
	

	public MonitorRealm() {
		super();

	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		LOGGER.info("doGetAuthorizationInfo"+((ShiroUser)principals.getPrimaryPrincipal()).getUserid());
		return null;

	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String password = String.valueOf(token.getPassword());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("username", token.getUsername());
		map.put("userpasswd", EncryptUtils.encryptMD5(password));
		try {
			OperatorDto operatorDto = this.operatorService.getUserRoleInfo(map);
			
			if (operatorDto != null) {
				List<Permission> permissionList=this.permissionService.selectPermissionByUserId(operatorDto.getUserid(),null);
				List<Permission> allPermissionList=this.permissionService.selectPermissionList(null);
				Set<String> actionList=new HashSet<String>();
				Map<String,Permission> tmpMap=new HashMap<String,Permission>();
				Map<String,List<Permission>> buttonMap=new HashMap<String,List<Permission>>();
				if(permissionList.size()==0){
					return null;
				}
				for(Permission p:permissionList){
					//所有允许访问的action列表
					actionList.add(p.getPermissionUrl());
					tmpMap.put(p.getId(), p);
				}
				
				for(Permission p:allPermissionList){				
					//创建按钮权限与菜单url的映射关系
					if(Permission.BUTTON_TYPE.equals(p.getPermissionType())){
						//保留没有的按钮权限，取禁用按钮列表
						if(tmpMap.containsKey(p.getId())){
							continue;
						}
						Permission menuPermission=tmpMap.get(p.getParentid());
						if(menuPermission!=null&&StringUtils.isNotEmpty(menuPermission.getPermissionUrl())){
							List<Permission> buttonList= buttonMap.get(menuPermission.getPermissionUrl());
							if(buttonList==null){
								buttonList=new ArrayList<Permission>();
							}
							buttonList.add(p);
							buttonMap.put(menuPermission.getPermissionUrl(), buttonList);
						}
					}
				}

				
				Subject currentUser = SecurityUtils.getSubject();
				Session session=currentUser.getSession();
				session.setAttribute("permissionList", permissionList);
				session.setAttribute("buttonMap", buttonMap);
				session.setAttribute("actionList", actionList);

				
				return new SimpleAuthenticationInfo(new ShiroUser(
						operatorDto.getUserid(), operatorDto.getUsername(),
						operatorDto.getRoleid()),
						password, getName());
			} 
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return null;

	}

	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

}
