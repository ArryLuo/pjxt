<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%@ include file="/common/taglibs.jsp"%>
    <title>管理</title>
<script type="text/javascript">
$(function () {
    var $datatab = $("#datatab");   //表格jquery对戏那个
    var $dlg = $("#dlg");           //新增和修改的对话框jquery对象
    var $fm = $("#fm");             //新增和修改中的表单jquery对象
     
    function search(){
		loadDataGrid({
			datagridObj : $datatab,
			searchFormObj : $("#searchForm"),
			url : path + "/baseMessage/teacher!selectPage.action",
			original : {
				toolbar : "#toolbar"
			}
		});
    }
    
    //查询
	$("#tb_search").click(function() {
		search();
	});
	
    //初始化表格
    search();

    //增加
    $("#toolbar .tadd").click(function () {
        addItem({
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "新增"
        });
    });

    //修改
    $("#toolbar .tmodify").click(function () {
        modifyItem({
            obj_datagrid: $datatab,
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "修改",
            formname:"teacher"
        });
        
    });

    //删除
    $("#toolbar .tremove").click(function () {
        deleteItem({
            obj_datagrid: $datatab,
            title: "删除",
            url_delete: path+"/baseMessage/teacher!batchDelete.action",
            url_reload: path+"/baseMessage/teacher!selectPage.action"
        });
    });

    //保存数据
    $("#dlg-buttons .save").click(function () {
    	saveItem({
			obj_datagrid : $datatab,
			obj_dialog : $dlg,
			obj_form : $fm,
			url_add : path + "/baseMessage/teacher!save.action",
			url_reload : path + "/baseMessage/teacher!selectPage.action"
		});
    	 
    });

    //关闭对话框
    $("#dlg-buttons .closedlg").click(function () {
        //关闭对话框
        $dlg.dialog("close");
    });

});
</script>
    
</head>
<body class="pl20" style="padding-top: 20px;">
<div>
			<form id="searchForm">
			<table class="search_table">
			<tr>
			<td>
			<label for="inputText">id</label> 
					<input id="inputText" class="input-hasValue" value="" name="teacher.id"  style="width:170px;height:24px;"/> 
					<a href="javascript:void(0)" class="easyui-linkbutton btn btn-primary tb_search" id="tb_search" iconCls="icon-search">查询</a>
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
    </div>
</div>
<table id="datatab" class="easyui-datagrid">
    <thead>
	    <tr>
	    	<th data-options="field:'ck',checkbox:true"></th>
	    		    	<th field="id" width="100" ></th>
    			    	<th field="name" width="100" >学生名字</th>
    			    	<th field="basemessageid" width="100" >基本信息id</th>
    			    	<th field="no" width="100" >编号</th>
    			    	<th field="sex" width="100" >性别</th>
    			    	<th field="birthday" width="100" >生日</th>
    			    	<th field="emial" width="100" >邮件</th>
    			    	<th field="phone" width="100" >电话</th>
    			    	<th field="imageurl" width="100" >图像地址</th>
    			    	<th field="schoolname" width="100" >学校名字</th>
    			    	<th field="remark" width="100" >备注</th>
    			    </tr>
    </thead>
</table>
<div id="dlg" class="easyui-dialog" closed="true" buttons="#dlg-buttons" style="width:700px">
    <form id="fm" method="post">
    	<p>
                <label>：</label>
		<input name="teacher.id" type="text" class="easyui-validatebox"  /> 
		    	        <label>学生名字：</label>
		<input name="teacher.name" type="text" class="easyui-validatebox"  /> 
		</p><p>    	        <label>基本信息id：</label>
		<input name="teacher.basemessageid" type="text" class="easyui-validatebox"  /> 
		    	        <label>编号：</label>
		<input name="teacher.no" type="text" class="easyui-validatebox"  /> 
		</p><p>    	        <label>性别：</label>
		<input name="teacher.sex" type="text" class="easyui-validatebox"  /> 
		    	        <label>生日：</label>
		<input name="teacher.birthday" type="text" class="easyui-validatebox"  /> 
		</p><p>    	        <label>邮件：</label>
		<input name="teacher.emial" type="text" class="easyui-validatebox"  /> 
		    	        <label>电话：</label>
		<input name="teacher.phone" type="text" class="easyui-validatebox"  /> 
		</p><p>    	        <label>图像地址：</label>
		<input name="teacher.imageurl" type="text" class="easyui-validatebox"  /> 
		    	        <label>学校名字：</label>
		<input name="teacher.schoolname" type="text" class="easyui-validatebox"  /> 
		</p><p>    	        <label>备注：</label>
		<input name="teacher.remark" type="text" class="easyui-validatebox"  /> 
		    	    	</p>
    </form>
</div>

<div id="dlg-buttons" style="margin-top: 20px" >
    <a href="javascript:void(0)" class="easyui-linkbutton btn btn-primary save" iconCls="icon-ok">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton btn btn-default closedlg" iconCls="icon-cancel" >关闭</a>
</div>
</body>
</html>