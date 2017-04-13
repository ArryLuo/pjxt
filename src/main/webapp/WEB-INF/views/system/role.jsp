<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%@ include file="/common/taglibs.jsp"%>
    <title>系统用户管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/system/role.js?_20150924"></script>
     <script>
  
    function enableformat(value,row,index){
		if(value=="0")
			return "启用" ;
		if(value=="1")
			return "禁用" ;
	}  
    </script>
</head>
<body class="pl20" style="padding-top: 20px;">
<div id="toolbar" class="easyui-toolbar">
    <div>
      	<a href="javascript:void(0)" class="easyui-linkbutton tadd" iconCls="icon-add" plain="true">新增</a>    
       	<a href="javascript:void(0)" class="easyui-linkbutton tmodify" iconCls="icon-edit" plain="true">修改</a>    
     	<a href="javascript:void(0)" class="easyui-linkbutton tremove" iconCls="icon-remove" plain="true">删除</a>           
    </div>
</div>
<table id="usertab" class="easyui-datagrid">
    <thead>
	    <tr>
	    	<th data-options="field:'ck',checkbox:true"></th>
	        <th field="id" width="100" hidden="true">角色ID</th>
	        <th field="dataRoleName" width="150">功能角色名称</th>
	        <th field="isEnable" width="100" formatter="enableformat">是否启用</th>
	        <th field="creatorName" width="80">创建人</th>
	        <th field="createTime" width="150">创建时间</th>
	        <th field="updatorName" width="80">最后修改人</th>
	        <th field="updateTime" width="150">最后修改时间</th>
	    </tr>
    </thead>
</table>
<div id="dlg" class="easyui-dialog" closed="true" buttons="#dlg-buttons" style="width:650px">
    <form id="fm" method="post">
        <input name="role.id"  type="hidden"/>
        <!-- <p>
            <label>角色名称:</label>
            <input name="role.dataRoleName" type="text" class="easyui-validatebox" required="true" validType="length[1,25]"/>
        </p>
        <p>
            <label>是否启用：</label>
            <input type="radio" name="role.isEnable" value="0" checked="checked"/><strong>启用</strong>
            <input type="radio" name="role.isEnable" value="1" /><strong>禁用</strong>
        </p> -->
		<div id="panelMenu">
		<div class="pm_content" style="height:380px;">
		<p>
            <label>角色名称:</label>
            <input name="role.dataRoleName" type="text" class="easyui-validatebox" required="true" validType="length[1,25]"/>
        </p>
        <p>
            <label>是否启用：</label>
            <input type="radio" name="role.isEnable" value="0" checked="checked"/><strong>启用</strong>
            <input type="radio" name="role.isEnable" value="1" /><strong>禁用</strong>
        </p>
		</div>
		<div class="pm_menu" style="height:380px;">
		<ul id="menutree" class="easyui-tree"></ul>
		</div>
	        <%-- <div class="pm_menu">
	            <ul id="menutree" class="easyui-tree"></ul>
	        </div>
	        <div class="pm_content">
	            <div>
	            	功能操作权限：
	                <a id="checkAll" href="javascript:void(0)" style="width: 65px;height: 25px" class="easyui-linkbutton">全选</a>
	                <a id="reverseCheck" href="javascript:void(0)" style="width: 65px;height: 25px" class="easyui-linkbutton">反选</a>
	            </div>
	            <div>
		            <c:forEach var="menu" items="${menuList}">         
		                <div class="pmenu">
		                    <span>${menu.menuName}</span>
		                    <input type="button" style="display:none" value="${menu.id}" name="menuid"/>
		                    <div class="subContent">
			                    <input name="selectitem" type="checkbox" /><strong>浏览</strong>
			                    <input name="additem" type="checkbox"/><strong>新增</strong>
			                    <input name="updateitem" type="checkbox"/><strong>修改</strong>
			                    <input name="deleteitem" type="checkbox"/><strong>删除</strong>
		                    </div>
		                </div>
		            </c:forEach>                          
	            </div>
	        </div> --%>
	    </div>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton btn btn-primary saveuser" iconCls="icon-ok">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton btn btn-default closedlg" iconCls="icon-cancel" >关闭</a>
</div>
</body>
</html>