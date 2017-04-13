$(function () {
    var $usertab = $("#menutab");   //表格jquery对戏那个
    var $dlg = $("#dlg");           //新增和修改的对话框jquery对象
    var $fm = $("#fm");             //新增和修改中的表单jquery对象
    var $selectText = $("#selectText");
    
    //初始化combotree
    $selectText.combotree({
        url:path+"/system/operator!selectByMenu.action",
    });

    //初始化表格   
    loadDataGrid({
    	datagridObj:$usertab,
    	url: path+"/system/menu!getMenu.action", 
    	original:{
            toolbar: "#toolbar",
            rownumbers: true,
            singleSelect: false,
            pagination: true
        }
    });

    //增加
    $("#toolbar .tadd").click(function () {
        addItem({
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "新增菜单"
        });
    });

    //修改
    $("#toolbar .tmodify").click(function () {
        modifyItem({
            obj_datagrid: $usertab,
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "修改菜单",
            formname:"menus"
        });
    });

    //删除
    $("#toolbar .tremove").click(function () {
        deleteItem({
            obj_datagrid: $usertab,
            title: "删除菜单",
            url_delete: path+"/system/menu!batchDeleteMenu.action",
            url_reload: path+"/system/menu!getMenu.action"
        });
    });

    //保存数据
    $("#dlg-buttons .saveuser").click(function () {
        saveItem({
            obj_datagrid: $usertab,
            obj_dialog: $dlg,
            obj_form: $fm,
            url_add: path+"/system/menu!operatorMenu.action",
            url_reload: path+"/system/menu!getMenu.action"
        });
    });

    //关闭对话框
    $("#dlg-buttons .closedlg").click(function () {
        $dlg.dialog("close");
    });

    //重置
    $("#toolbar .tb_redo").click(function () {
        $("#toolbar form")[0].reset();
    });
});