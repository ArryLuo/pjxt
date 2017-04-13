<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/common/taglibs.jsp"%>
<title>系统用户管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/permission.js"></script>
<style type="text/css">
.datagrid-btable tr td {
 height: auto;
}
</style>

</head>
<body>
	<div id="toolbar" class="easyui-toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton tadd" iconCls="icon-add" plain="true">新增</a>
		<a href="javascript:void(0)" class="easyui-linkbutton tmodify" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton tremove" iconCls="icon-remove" plain="true">删除</a>
	</div>
	<table id="permissiontab"></table>
	<div id="dlg" class="easyui-dialog" closed="true" buttons="#dlg-buttons" style="width: 380px">
		<form id="fm" method="post">
			<input name="permissions.id" type="hidden" />
			<p>
				<label>权限名称:</label>
				<input name="permissions.permissionName" type="text" class="easyui-validatebox" required="true" validType="length[1,50]" />
			</p>
			<p>
				<label>url:</label>
				<input name="permissions.permissionUrl" type="text" class="easyui-validatebox" validType="length[1,120]" />
			</p>

			<p>
				<label>父菜单:</label>
				<input id="selectText" name="permissions.parentid" class="easyui-combotree" value="1" style="width: 180px; height: 28px" required="true" />
			</p>
			<p>
				<label>权限类型:</label>
				<select name="permissions.permissionType">
					<option value="01">菜单权限</option>
					<option value="02">按钮权限</option>
				</select>
			</p>
			<p>
				<label>按钮ID:</label>
				<input name="permissions.buttonId" type="text" class="easyui-validatebox" validType="length[0,120]" />
			</p>
			
			<p>
				<label>样式:</label>
				<input name="permissions.icolcss" type="text" class="easyui-validatebox" validType="length[1,25]" />
			</p>
            <p>
				<label>顺序:</label>
				<input name="permissions.orders" type="text" class="easyui-validatebox" validType="length[1,10]" />
			</p>

		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton save" iconCls="icon-ok">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton closedlg" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>