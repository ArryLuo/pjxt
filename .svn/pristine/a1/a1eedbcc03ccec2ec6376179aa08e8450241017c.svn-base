$(function () {
    var $usertab = $("#usertab");   //表格jquery对戏那个
    var $fm = $("#fm");             //新增和修改中的表单jquery对象
    var $funcRoletab = $("#funcRoletab");  //功能角色表
    var $dataRoletab =$("#dataRoletab");  //数据角色表

    //初始化用户列表
    loadDataGrid({
    	datagridObj:$usertab,
    	url:path+"/system/role-user!getOperator.action",
    	original:{
    		toolbar: "#toolbar",
            rownumbers: true,
            singleSelect: false,
            pagination: true
    	}
    });
    
    
    //初始化功能角色列表
    loadDataGrid({
    	datagridObj:$funcRoletab,
    	url:path+"/system/role!getRoleEnable.action",
    	original:{
    		toolbar:"#funcbar",
            rownumbers: true,
            singleSelect: false,
            pagination: true
    	}
    });

  //查询
    $("#toolbar .tb_search").click(function () {
        loadDataGrid({
        	datagridObj:$usertab,
        	searchFormObj:$("#toolbar form"),
        	url:path+"/system/role-user!getOperator.action",
        	original:{
        		toolbar: "#toolbar",
                rownumbers: true,
                singleSelect: false,
                pagination: true
        	}
        });
    });

    //重置
    $("#toolbar .tb_redo").click(function () {
        $("#toolbar form")[0].reset();
    });
    
  //保存功能角色关联数据
    $("#funcbar .funlink").click(function () {
    	var userSelected = getSelectRows($usertab); 
    	if(userSelected == null || userSelected.length==0){
    		$.messager.alert("提示","请选择要操作的用户");
    		return;
    	}
    	var roleSelected = getSelectRows($funcRoletab);
    	var userChecked = [];
    	var roleChecked = [];
    	var roleName =[];
    	if(roleSelected != null && roleSelected.length>0){
    		for (var i = 0; i < roleSelected.length; i++) {
    			roleChecked.push(roleSelected[i].id)
    			roleName.push(roleSelected[i].dataRoleName)
			}
    	}
    	  	
    	if(userSelected != null){
    		for(var i=0,l=userSelected.length;i<l;i++){
    			userChecked.push(userSelected[i].id);
        	}
    	}
    	userChecked = userChecked.join(",");
    	roleChecked = roleChecked.join(",");
    	$.ajax({
        	url:path+"/system/role-user!operatorRoleUser.action?roleid="+roleChecked+"&userids="+userChecked,
    	    type: 'post',
    		dataType: 'json',
    		success:function(data){
    			if(data.result) {
    		     $.messager.alert("提示信息", "操作成功,你已成功关联功能角色:"+roleName.toString()+"!","info",function(){
    		    		//刷新当前页面
      				  var $tabs = window.parent.$("#tabs");
      				  refreshTab($tabs);
    		     });	
    			}else{
    				 $.messager.alert("错误信息", "操作失败！","error");
    			}
				
    		}
        });
        
    });
    
});