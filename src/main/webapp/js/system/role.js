$(function () {
    var $usertab = $("#usertab");   //表格jquery对戏那个
    var $dlg = $("#dlg");           //新增和修改的对话框jquery对象
    var $fm = $("#fm");             //新增和修改中的表单jquery对象
    var $menutree = $("#menutree");
     
    //初始化表格
    loadDataGrid({
    	datagridObj:$usertab,
    	url:path+"/system/role!getRoleAll.action",
    	original:{
    		toolbar: "#toolbar",
            rownumbers: true,
            singleSelect: false,
            pagination: true
    	}
    });
    
    //初始化对话框中的tree
    $menutree.tree({
        url:path+"/system/operator!selectByPermission.action",
        method: 'post',
        animate: true,
        checkbox:true
    });
    
    //全选
    var $checkbox = $(".pm_content input[type='checkbox']");
    $("#checkAll").click(function () {
        checkAll($checkbox);
    });

    //反选
    $("#reverseCheck").click(function () {
        reverseCheck($checkbox);
    });

    //增加
    $("#toolbar .tadd").click(function () {
        addItem({
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "新增角色"
        });
        
        //设置树初始为未选中
        setTreeAllUnChecked($menutree);
    });

    //修改
    $("#toolbar .tmodify").click(function () {
        modifyItem({
            obj_datagrid: $usertab,
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "修改角色",
            formname:"role"
        });
        
        //设置树初始为未选中
        setTreeAllUnChecked($menutree);
        
        var row = $usertab.datagrid('getSelected');
        var roleid = row.id;
        $.ajax({
        	url:path+"/system/role!getroleTree.action?roleid="+roleid,
    	    type: 'post',
    		dataType: 'json',
    		success:function(data){
    				
    			//根据选中的tree ids对tree进行初始化
				var treeChecked = data.id.split(",");
				setTreeChecked($menutree,treeChecked);
				
    		}
        });
        
    });

    //删除
    $("#toolbar .tremove").click(function () {
        deleteItem({
            obj_datagrid: $usertab,
            title: "删除角色",
            url_delete: path+"/system/role!batchDeleteRole.action",
            url_reload: path+"/system/role!getRoleAll.action"
        });
    });

    //保存数据
    $("#dlg-buttons .saveuser").click(function () {
    	//角色名称
        var data_role_name = $fm[0]["role.dataRoleName"].value;
        if(data_role_name==""){
        	return "";
        }        
        
        //是否启用
        var is_enable = $fm.find("input[name='role.isEnable']:checked").val();
        
        //菜单   获取以选中树节点id
        var menuids = getCheckedTreeIDs($menutree);
        //功能权限
//        var menuitem = menucheck.join(":");
        var roleid = $fm[0]["role.id"].value;
        
        var roleData={};
        roleData['permissionids']=menuids;
        roleData['dataRoleName']=data_role_name;
        roleData['isEnable']=is_enable;
        roleData['roleid']=roleid;
        
        $.ajax({
        	url:path+"/system/role!operatorRole.action",
        	type: 'post',
    		dataType: 'json',
    		data:roleData,
    		success:function(data){
    			if(data.result){
     			   $.messager.alert("提示信息", "操作成功！","info",function () {
     				  if ($fm != undefined) {
     					 $(":input",$fm)
     					 .not(':hidden,:submit,:button,:reset').val("")
     					 .removeAttr("checked")
     					 .removeAttr("selected");
     				  }
     				  
     				   //刷新当前页面
     				  var $tabs = window.parent.$("#tabs");
                      refreshTab($tabs);
     		        });
     			  
                } else {
             	   $.messager.alert("错误信息", "操作失败！","error");
                }							
    		}
        	
        });
        $dlg.dialog("close");
    	 
    });

    //关闭对话框
    $("#dlg-buttons .closedlg").click(function () {
        //关闭对话框
        $dlg.dialog("close");
    });


    //重置
    $("#toolbar .tb_redo").click(function () {
        $("#toolbar form")[0].reset();
    });
});