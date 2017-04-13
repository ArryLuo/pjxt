<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/common/taglibs.jsp"%>
<title>系统用户管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/operator.js"></script>
</head>
<body class="pl20">
<div>
			<form id="searchForm">
			<table class="search_table">
			<tr>
			<td>
			<label for="inputText">用户名</label> 
					<input id="inputText" class="input-hasValue" value="" name="operators.username"  style="width:170px;height:24px;"/> 
					<a href="javascript:void(0)" class="easyui-linkbutton btn btn-primary tb_search" id="tb_search" iconCls="icon-search">查询</a> 
					<a href="javascript:void(0)" class="easyui-linkbutton btn btn-default tb_redo" id="tb_redo" iconCls="icon-redo">重置</a>
			</td>
			</tr>
			</table>
			</form>
		</div>
	<div id="toolbar" class="easyui-toolbar">
		
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton tadd" iconCls="icon-add" plain="true">新增</a>
			<a href="javascript:void(0)" class="easyui-linkbutton tmodify" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton tremove" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton tresetPwd" iconCls="icon-redo" plain="true">重置密码</a>
		</div>
	</div>
	<table id="usertab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th field="id" width="100" hidden="true">用户ID</th>
				<th field="username" width="100">登录用户名</th>
				<th field="userstatus" width="58" data-options="
				formatter : function(value, row, index) {
					if (value == '00') {
						return '有效';
					} else{
						return '无效';
					}
				}
				">状态</th>
				<th field="createUserName" width="80">创建人</th>
				<th field="createtime" width="125">创建时间</th>
				<th field="updateUserName" width="80">最后修改人</th>
				<th field="lastedittime" width="125">最后修改时间</th>
			</tr>
		</thead>
	</table>
	<div id="dlg" class="easyui-dialog" closed="true"
		buttons="#dlg-buttons" style="width: 500px;height:270px">
		<form id="fm" method="post">
			<input name="operators.id" type="hidden" id="operatorsid"/>
			<p>
				
				<label>状态：</label>
				<input name="operators.userstatus" type="radio" value="00" checked="checked" /><strong>有效</strong> 
				<input name="operators.userstatus" type="radio" value="01" /><strong>无效</strong>
			</p>

			<p>
				<label>登录用户名：</label>
				<input name="operators.username" id="username" type="text" class="easyui-validatebox" required="true" validType="account[1,20]" />
			</p>
			<p>
				<label id="l_operators.userpasswd">登录密码：</label>
				<input id="operators.userpasswd" name="operators.userpasswd" type="password" class="easyui-validatebox" required="true" validType="password[6,12]" />
				<a href="javascript:void(0)" class="easyui-linkbutton  btn btn-default tb_update" iconCls="icon-redo">修改密码</a>
			</p>

			<p>
				<label>备注：</label>
				<textarea name="operators.memo" class="easyui-validatebox" style="width:180px;" validType="length[1,2000]"></textarea>
			</p>

		</form>
	</div>
	
	<div id="updatepwd" class="easyui-dialog" closed="true" buttons="#pwd-buttons" style="width: 400px;height:200px">	
		<form id="pwdft" method="post">
			<p>
				<label>新密码：</label>
				<input name="operators.id" type="hidden" id="userid"/>
				<input id="userpwd" name="operators.userpasswd" type="password" class="easyui-validatebox" required="true" validType="length[1,30]" />
			</p>
			<p>
				<label>确认新密码</label>
				<input id="reuserpwd" name="operators.reuserpasswd" type="password" class="easyui-validatebox" required="true" validType="length[1,30]" />
			</p>
		</form>
	</div>
	
	<div id="pwd-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton  btn btn-primary saveuser" iconCls="icon-ok">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton  btn btn-default closedlg" iconCls="icon-cancel">关闭</a>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton  btn btn-primary saveuser" iconCls="icon-ok">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton  btn btn-default closedlg" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>