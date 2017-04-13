$(function() {
	var $permissiontab = $("#permissiontab"); // 表格jquery对象
	var $dlg = $("#dlg"); // 新增和修改的对话框jquery对象
	var $fm = $("#fm"); // 新增和修改中的表单jquery对象
	var $selectText = $("#selectText");

	// 初始化combotree
	$selectText.combotree({
		url : path + "/system/operator!selectByPermission.action",
	});

	$permissiontab.treegrid({
		toolbar : "#toolbar",
		url : path + "/system/permission!queryPermissionTreeGrid.action",
		idField : 'id',
		treeField : 'permissionName',
		singleSelect : true,
		selectOnCheck : false,
		columns : [ [ {
			field : 'ck',
			checkbox : true
		}, {
			field : 'id',
			hidden : true
		}, {
			field : 'permissionName',
			title : '名称',
			width : 150
		}, {
			field : 'permissionUrl',
			title : 'url',
			width : 220
		}, {
			field : 'permissionType',
			title : '权限类型',
			width : 150,
			formatter : function(value, row, index) {
				if (value == '01') {
					return '菜单权限';
				} else {
					return '按钮权限';
				}
			}
		}, {
			field : 'buttonId',
			title : '按钮ID',
			width : 150
		}, {
			field : 'icolcss',
			title : '样式',
			width : 80
		}, {
			field : 'orders',
			title : '顺序',
			width : 80
		}

		] ],
		onLoadSuccess:function(){
			var roots = $permissiontab.treegrid('getRoots');
			for(var i=0;i<roots.length;i++){
				$permissiontab.treegrid('collapseAll', roots[i].target);
			}
		}
	});

	// 增加
	$("#toolbar .tadd").click(function() {
		addItem({
			obj_dialog : $dlg,
			obj_form : $fm,
			title : "新增菜单"
		});
		var rows = $permissiontab.treegrid('getSelections');
		if (rows.length > 0) {
			$selectText.combotree("setValue", rows[0].id);
		}

	});

	// 修改
	$("#toolbar .tmodify").click(function() {
		modifyItem({
			obj_datagrid : $permissiontab,
			obj_dialog : $dlg,
			obj_form : $fm,
			title : "修改菜单",
			formname : "permissions"
		});
	});

	// 删除
	$("#toolbar .tremove")
			.click(
					function() {
						var title = "删除菜单";
//						var rows = $permissiontab.treegrid('getSelections');
						var rows = getSelectRows($permissiontab);

						if (rows.length > 0) {
							$.messager
									.confirm(
											title,
											'确定要删除选中行？',
											function(r) {
												if (r) {
													var rowsid = [];
													for (var i = 0, l = rows.length; i < l; i++) {
														rowsid.push(rows[i].id);
													}
													rowsid.join(",");

													$
															.ajax({
																url : path
																		+ "/system/permission!batchDeletePermission.action",
																type : 'post',
																data : "id="
																		+ rowsid,
																dataType : 'json',
																success : function(
																		data) {
																	if (data.result) {
																		$.messager
																				.alert(
																						"提示信息",
																						"删除成功！",
																						"info");
																		$permissiontab
																				.treegrid('reload');
																	} else {
																		$.messager
																				.alert(
																						"错误信息",
																						"删除失败！",
																						"error");
																	}
																}

															});
												}
											});
						} else {
							$.messager.alert(title, "请选择要删除的行！");
						}
					});

	// 保存数据
	$("#dlg-buttons .save").click(function() {

		$fm.form('submit', {
			url : path + "/system/permission!operatorPermission.action",
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(data) {
				data = $.parseJSON(data);
				if (data.result == "true") {
					$.messager.alert("提示信息", "操作成功！", "info", function() {
						$permissiontab.treegrid('reload');
						$dlg.dialog("close");
					});
				} else {
					$.messager.alert("错误信息", "操作失败！", "error");
				}
			}
		});
	});

	// 关闭对话框
	$("#dlg-buttons .closedlg").click(function() {
		$dlg.dialog("close");
	});

	//重置
	$("#toolbar .tb_redo").click(function() {
		$("#toolbar form")[0].reset();
	});
});