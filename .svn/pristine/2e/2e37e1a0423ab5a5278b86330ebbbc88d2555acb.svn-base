$(function() {
	var $usertab = $("#usertab"); // 表格jquery对戏那个
	var $dlg = $("#dlg"); // 新增和修改的对话框jquery对象
	var $fm = $("#fm"); // 新增和修改中的表单jquery对象
	
	var startTime=null;
	var endTime=null;

	// 初始化表格
	loadDataGrid({
		datagridObj : $usertab,
		url : path + "/system/operator!getOperator.action",
		original : {
			toolbar : "#toolbar"
		}
	});

	$("input[name='operators.delflag']").change(function() {

		if ($(this).val() != "01") {

			$("#starttime").datebox({
				required : false,
				disabled:true
			});
			$("#endtime").datebox({
				required : false,
				disabled:true
			});
			
		


		} else {
			$("#starttime").datebox({
				required : true,
				disabled:false
			});
			$("#endtime").datebox({
				required : true,
				disabled:false
			});
			
			$('#starttime').datebox('setValue', startTime);
			$('#endtime').datebox('setValue', endTime);
		}
	});

	// 增加
	$("#toolbar .tadd").click(function() {

		$(".tb_update").hide();
		addItem({
			obj_dialog : $dlg,
			obj_form : $fm,
			title : "新增用户"
		});
		$("#operators\\.userpasswd").prop("disabled", false);
		$("#operators\\.userpasswd").validatebox("enableValidation");
	});

	// 修改
	$("#toolbar .tmodify").click(function() {
						$(".tb_update").show();
						var rows = getSelectRows($usertab);
						if (rows.length < 1) {
							$.messager.alert("提示", "请选择要修改的用户");
							return;
						}
						$("#department")
								.combotree({
											url : path+ "/system/organization!loadOrganiztionByComany.action?organization.parentid="+ rows[0].organizationid,
											onSelect : function(node) {
												$("input[name='operators.department']").val(node.text);
											}
										});
						modifyItem({
							obj_datagrid : $usertab,
							obj_dialog : $dlg,
							obj_form : $fm,
							title : "修改用户",
							formname : "operators"
						});
						if (rows[0].delflag != "01") {
							$("#starttime").datebox({
								required : false
							});
							$("#endtime").datebox({
								required : false
							});
							
							 startTime=null;
							 endTime=null;
							
						} else {
							$("#starttime").datebox({
								required : true,
								disabled:false
							});
							$("#endtime").datebox({
								required : true,
								disabled:false
							});
							
							 startTime=rows[0].starttime;
							 endTime=rows[0].endtime;
							
							$('#starttime').datebox('setValue', startTime);
							$('#endtime').datebox('setValue', endTime);
							
							
						}
						var orgId = $("#orgId").next().find(".combo-text")
								.val();
						var department = $("#department").next().find(
								".combo-text").val();
						$("input[name='operators.department']").val(department);
						$("input[name='operators.organization']").val(orgId);
						$("#operators\\.userpasswd").val("********");
						$("#operators\\.userpasswd").prop("disabled", true);
						$("#operators\\.userpasswd").validatebox(
								"disableValidation");
						
						
						
					});

	$(".tb_update").click(function() {
		$.ajax({
			url : path + "/system/operator!checkUserRole.action",
			type : "post",
			data : {
				"id" : $("#operatorsid").val()
			},
			dataType : 'json',
			success : function(data) {
				if (data.result == "true") {
					addItem({
						obj_dialog : $('#updatepwd'),
						obj_form : $("pwdft"),
						title : "修改密码"
					});
				} else {
					$.messager.alert("提示", "你没有操作权限");
				}
			}
		});
	});

	// 删除
	$("#toolbar .tremove").click(function() {
		var rows = getSelectRows($usertab);
		if (rows.length < 1) {
			$.messager.alert("提示", "请选择要修改的用户");
			return;
		}
		var flag = false;
		for (var i = 0; i < rows.length; i++) {

			if (rows[i].delflag == "02") {
				flag = true;
				break;
			}
		}
		if (flag == false) {
			$.messager.alert("提示", "只能删除无效用户");
			return;
		}
		deleteItem({
			obj_datagrid : $usertab,
			title : "删除用户",
			url_delete : path + "/system/operator!batchDeleteOperator.action",
			url_reload : path + "/system/operator!getOperator.action"
		});
	});

	$("#pwd-buttons .closedlg").click(function() {
		$('#updatepwd').dialog("close");
	});

	$("#pwd-buttons .saveuser").click(function() {
		$("#userid").val($("#operatorsid").val());
		$('#pwdft').form('submit', {
			url : path + "/system/operator!operatorUser.action",
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if ($("#userpwd").val() != $("#reuserpwd").val()) {
					isValid == false;
					$.messager.alert("提示", "两次密码不一致");
				}
				return isValid;
			},
			success : function(data) {
				data = $.parseJSON(data);
				if (data.result == "true") {
					$.messager.alert("提示", "修改成功");
				} else {
					$.messager.alert("提示", "修改失败");
				}
				$('#updatepwd').dialog('close');
			}
		});

	});

	// 保存数据
	$("#dlg-buttons .saveuser").click(function() {
		saveItem({
			obj_datagrid : $usertab,
			obj_dialog : $dlg,
			obj_form : $fm,
			url_add : path + "/system/operator!operatorUser.action",
			url_reload : path + "/system/operator!getOperator.action"
		});

	});

	// 重置密码
	$("#toolbar .tresetPwd").click(
					function() {
						var rows = getSelectRows($usertab);
						if (rows.length > 0) {
							if (rows.length > 1) {
								$.messager.alert("重置密码", "不能同时选择多条记录！");
							} else {
								$.messager.confirm(
												"重置密码",
												'确定要重置选中人的密码？',
												function(r) {
													if (r) {
														$.ajax({
																	url : path
																			+ "/system/operator!resetPwd.action",
																	type : 'post',
																	data : "id="
																			+ rows[0].id,
																	dataType : 'json',
																	success : function(
																			data) {
																		if (data.result) {
																			$.messager.alert(
																							"提示信息",
																							"重置成功！重置为系统默认密码："
																									+ data.message,
																							"info");
																			getPageData(
																					$usertab,
																					path+ "/system/operator!getOperator.action",{});
																		} else {
																			$.messager.alert("错误信息","重置失败！","error");
																		}
																	}
																});
													}
												});
							}
						} else {
							$.messager.alert("重置密码", "请选择一条记录！"); // 未选择行提示
						}
					});

	// 关闭对话框
	$("#dlg-buttons .closedlg").click(function() {
		$dlg.dialog("close");
	});

	//查询
	$("#tb_search").click(function() {
		loadDataGrid({
			datagridObj : $usertab,
			searchFormObj : $("#searchForm"),
			url : path + "/system/operator!getOperator.action",
			original : {
				toolbar : "#toolbar"
			}
		});
	});

	//重置
	$("#tb_redo").click(function() {
		$("#searchForm")[0].reset();
	});
});