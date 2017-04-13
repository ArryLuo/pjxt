$(function () {
    var $datatab = $("#datatab");   //表格jquery对戏那个
    var $dlg = $("#dlg");           //新增和修改的对话框jquery对象
    var $fm = $("#fm");             //新增和修改中的表单jquery对象
     
    function search(){
		loadDataGrid({
			datagridObj : $datatab,
			searchFormObj : $("#searchForm"),
			url : path + "/transportation/carshot!selectPage.action",
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
            formname:"carshot"
        });
        
    });

    //删除
    $("#toolbar .tremove").click(function () {
        deleteItem({
            obj_datagrid: $datatab,
            title: "删除",
            url_delete: path+"/transportation/carshot!batchDelete.action",
            url_reload: path+"/transportation/carshot!selectPage.action"
        });
    });

    //保存数据
    $("#dlg-buttons .save").click(function () {
    	saveItem({
			obj_datagrid : $datatab,
			obj_dialog : $dlg,
			obj_form : $fm,
			url_add : path + "/transportation/carshot!save.action",
			url_reload : path + "/transportation/carshot!selectPage.action"
		});
    	 
    });

    //关闭对话框
    $("#dlg-buttons .closedlg").click(function () {
        //关闭对话框
        $dlg.dialog("close");
    });

});