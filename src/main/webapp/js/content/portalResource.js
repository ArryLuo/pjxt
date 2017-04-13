$(function () {
    var $usertab = $("#usertab");   //表格jquery对戏那个
    var $dlg = $("#dlg");           //新增和修改的对话框jquery对象
    var $fm = $("#fm");             //新增和修改中的表单jquery对象
    

    //初始化表格
    loadDataGrid({
    	datagridObj:$usertab,
    	url:path+"/content/resource!queryPortalResourceForPage.action",
    	original:{
    		toolbar: "#toolbar",
            rownumbers: true,
            singleSelect: false,
            pagination: true
    	}
    });
    
    //添加文章
    $("#toolbar .tb_addArticle").click(function () {
    	UM.getEditor('myEditor');
    	UM.getEditor('myEditor').setContent("");
        addItem({
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "添加文章"
        });     
    });
    
    //修改文章
    $("#toolbar .tb_editArticle").click(function () {
    	UM.getEditor('myEditor');
    	var rows = getSelectRows($usertab);
    	if(typeof rows[0].content != "undefined"){
    		UM.getEditor('myEditor').setContent(rows[0].content);
    	}else{
    		UM.getEditor('myEditor').setContent("");
    	}
    	
        modifyItem({
        	obj_datagrid:$usertab,
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "修改文章",
            formname:"portalResource"
        });     
    });

    //保存文章
    $("#dlg-buttons .saveArtical").click(function () {
    	 saveItem({
             obj_datagrid: $usertab,
             obj_dialog: $dlg,
             obj_form: $fm,
             url_add: path+"/content/resource!editPortalResource.action",
             url_reload: path+"/content/resource!queryPortalResourceForPage.action"
         });
    });
    
    //删除文章
    $("#toolbar .tb_deleteArtical").click(function () {
    	deleteItem({
            obj_datagrid:$usertab,
            title: "删除文章",                	
            url_delete: path+"/content/resource!batchDeletePortalResource.action",
            url_reload: path+"/content/resource!queryPortalResourceForPage.action"
        }); 
    });

    //关闭对话框
    $("#dlg-buttons .closedlg").click(function () {
        $dlg.dialog("close");
    });

    //查询
    $("#toolbar .tb_search").click(function () {
    	var beginDate = $("input[name='portalResource.createStartTime']").val();
    	var endDate = $("input[name='portalResource.createEndTime']").val();
    	if(beginDate != "" && endDate != ""){
    		var flag = compareDateString(beginDate, endDate);
        	if(!flag){
        		alert("您选择的日期不符合要求！");
        		return;
        	}
    	}
    	
        loadDataGrid({
        	datagridObj:$usertab,
        	searchFormObj:$("#searchForm"),
        	url:path+"/content/resource!queryPortalResourceForPage.action",
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
});

//截取字符串，文章标题不超过20个字符
function formatTitle(value,row,index){
	if(value.length > 20){
		return value.substring(0,20) + "...";
	}else{
		return value;
	}
}

//类型
function formatType(value,row,index){
	if(value == "1"){
		return "新闻";
	}else if (value == "2"){
		return "公告";
	}else if (value == "3"){
		return "政策";
	}else if (value == "4"){
		return "法规";
	}else {
		return "其他";
	}
}

//是否显示
function formatShow(value,row,index){
	if(value == "2"){
		return "显示";
	}else{
		return "隐藏";
	}
}
