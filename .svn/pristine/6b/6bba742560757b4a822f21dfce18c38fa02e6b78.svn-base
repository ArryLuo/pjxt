package com.populook.system.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.populook.system.entity.Permission;

/**
 * 菜单类
 * 
 * @author 曾标
 * @date 2014-06-16
 */
public class TreePermission implements Serializable {
	private static final long serialVersionUID = -1837699104579478927L;
	private List<Permission> list;
	private Permission root;

	public TreePermission(List<Permission> list) {
		this.list = list;
		this.root = new Permission();
	}

	/**
	 * 组合json
	 * 
	 * @param list
	 * @param node
	 */
	private Tree<Permission> getNodeJson(List<Permission> list, Permission node) {
		Tree<Permission> tree = new Tree<Permission>();
		tree.setId(node.getId());
		tree.setText(node.getPermissionName());
		tree.setIconCls(node.getIcolcss());
		tree.setChildren(new ArrayList<Tree<Permission>>());
		if (list == null) {
			// 防止没有权限菜单时
			return tree;
		}
		if (hasChild(list, node)) {
			List<Tree<Permission>> lt = new ArrayList<Tree<Permission>>();
			tree.setUrl("");
			List<Permission> childList = getChildList(list, node);
			Iterator<Permission> it = childList.iterator();
			while (it.hasNext()) {
				Permission modules = (Permission) it.next();
				// 递归
				lt.add(getNodeJson(list, modules));
			}
			tree.setChildren(lt);
			tree.setState("closed");
		} else {
			tree.setUrl(node.getPermissionUrl());
		}
		return tree;
	}

	/**
	 * 判断是否有子节点
	 */
	private boolean hasChild(List<Permission> list, Permission node) {
		return getChildList(list, node).size() > 0 ? true : false;
	}

	/**
	 * 得到子节点列表
	 */
	private List<Permission> getChildList(List<Permission> list, Permission menu) {
		List<Permission> li = new ArrayList<Permission>();
		Iterator<Permission> it = list.iterator();
		while (it.hasNext()) {
			Permission temp = (Permission) it.next();
			if (menu.getId().equals(temp.getParentid())) {
				li.add(temp);
			}
		}
		return li;
	}

	public Tree<Permission> getTreeJson() {
		// 父菜单的id为0
		this.root.setId("0");
		return this.getNodeJson(this.list, this.root);
	}
}
