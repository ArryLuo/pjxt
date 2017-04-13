<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/common/taglibs.jsp"%>
<title>用户关联管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/roleuser.js"></script>
<script>
  
    function enableformat(value,row,index){
		if(value=="0")
			return "启用" ;
		if(value=="1")
			return "禁用" ;
	}  
    
    function typeformat(value,row,index){
		if(value=="03")
			return "系统用户" ;
		else
			return "平台用户" ;
			
	}
    </script>
</head>
<body class="pl20">
	<div class="easyui-tabs" style="float: left; width: 700px; height: 600px;">
		<div title="用户列表" style="padding: 20px">
			<div id="toolbar" class="easyui-toolbar">
				<form>
					<p>
						<label for="inputText">用户名</label> 
						<input id="inputText" class="input-hasValue" value="" name="operators.username" /> 
						<a href="javascript:void(0)" class="easyui-linkbutton btn btn-primary tb_search" iconCls="icon-search">查询</a> 
						<!-- <a href="javascript:void(0)" class="easyui-linkbutton btn btn-default tb_redo" iconCls="icon-redo">重置</a> -->
					</p>
				</form>
			</div>
			<table id="usertab" class="easyui-datagrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="id" width="40" hidden="true">用户ID</th>
						<th field="realname" width="80">姓名</th>
						<th field="username" width="80">登录用户名</th>
						<th field="usertype" width="80" formatter="typeformat">用户类型</th>
						<th field="organization" width="80">所属公司</th>
						<th field="department" width="80">所属组织</th>
						<th field="funRoleName" width="120">功能角色</th>
						<!-- <th field="dataRoleName" width="120">数据角色</th> -->
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<div class="easyui-tabs" data-options="tools:'#tabtools'" style="width: 400px; height: 600px; float: left; margin-left: 15px">
		<div title="功能角色" style="padding: 20px">
		<div id="funcbar" class="easyui-toolbar">
				<form>
					<p>
						<a href="javascript:void(0)" class="easyui-linkbutton funlink" plain="true" iconCls="icon-add">关联角色</a> 
					
					</p>
				</form>
			</div>
			<table id="funcRoletab" class="easyui-datagrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="id" width="100" hidden="true">角色ID</th>
						<th field="dataRoleName" width="150">功能角色名称</th>
						<th field="isEnable" width="100" formatter="enableformat">是否启用</th>
					</tr>
				</thead>
			</table>
		</div>
		
	</div>
	
</body>
</html>