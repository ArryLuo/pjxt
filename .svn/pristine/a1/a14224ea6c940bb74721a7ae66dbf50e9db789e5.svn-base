<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%@ include file="/common/taglibs.jsp"%>
    <title>管理</title>
<script type="text/javascript">
var add="true";
$(function () {
    var $dlg = $("#dlg");           //新增和修改的对话框jquery对象
    var $fm = $("#fm");             //新增和修改中的表单jquery对象
    var schoolid="0";
    
    selectbaseMeaaageTree(schoolid);

    //增加
    $("#toolbar .tadd").click(function () {
    	if(add == "false"){
    		$.messager.alert("错误信息", "此目录树下不能再新增！！", "error");
    		return false;
    	}
    	$dlg.dialog({
    		maximizable:true,
    		modal:true,
    		onMove: function(left,top){
    			if(left < 0 || top < 0){
    				adjustDialogPosition($dlg,{
    					left:0,
    					top:0
    				});
    			}
    		}
    	});
    	$dlg.dialog('open').dialog('setTitle', '增加'); // 打开对话框	
    	adjustDialogPosition($dlg,{
    		left:50,
    		top:50
    	});
    	
    });

    //修改
    $("#toolbar .tmodify").click(function () {
        modifyItem({
            obj_dialog: $dlg,
            obj_form: $fm,
            title: "修改",
            formname:"basemessage"
        });
        
    });

    //删除
    $("#toolbar .tremove").click(function () {
        $fm.form('submit', {
    		url :  path+"/baseMessage/basemessage!deleteTree.action",
    		onSubmit : function() {
    			return $(this).form('validate');
    		},
    		onBeforeLoad:function(param){

    		},
    		success : function(data) {
    			data = $.parseJSON(data);
    			if (data.result == "true") {
    					$.messager.alert("提示信息", "操作成功！", "info",function(){
    						//关闭弹出框
    						$dlg.dialog("close");
    						//刷新信息 
    						selectbaseMeaaageTree(schoolid);
    						
    					});	
    			} else {    				
    				if(data.message==null){
    					$.messager.alert("错误信息", "操作失败！", "error");
    				}else if(data.message!=null&&data.message!=''){
    					$.messager.alert("错误信息", data.message, "error");
    				}
    			}
    		},
    		onLoadError:function(){

    		}   	 
       });
    });

    //保存数据
    $("#dlg-buttons .save").click(function () {
	    	$fm.form('submit', {
	    		url :  path + "/baseMessage/basemessage!save.action",
	    		onSubmit : function() {
	    			return $(this).form('validate');
	    		},
	    		onBeforeLoad:function(param){
	
	    		},
	    		success : function(data) {
	    			data = $.parseJSON(data);
	    			if (data.result == "true") {
	    					$.messager.alert("提示信息", "操作成功！", "info",function(){
	    						//关闭弹出框
	    						$dlg.dialog("close");
	    						//刷新信息 
	    						selectbaseMeaaageTree(schoolid);
	    						
	    					});	
	    			} else {    				
	    				if(data.message==null){
	    					$.messager.alert("错误信息", "操作失败！", "error");
	    				}else if(data.message!=null&&data.message!=''){
	    					$.messager.alert("错误信息", data.message, "error");
	    				}
	    			}
	    		},
	    		onLoadError:function(){
	
	    		}   	 
	       });
    });
    
    //关闭对话框
    $("#dlg-buttons .closedlg").click(function () {
        $dlg.dialog("close");
    });

});

function selectbaseMeaaageTree(schoolid){
	$("#tree").etree({
   	 	url:path+"/baseMessage/basemessage!loadTree.action?schoolid="+schoolid,
   	 	method: 'post',
   	 	animate: true,
   	 	onBeforeDrop:function(target,source,point){
        	if(source.id=='0'){
        		return false;
        	}else if($(target).text() == '所有分类' && point != 'append'){
        		return false;
        	}
        },
        onBeforeEdit:function(node){
        	return false;
        },
    	onClick:function(node){
    		var data = node.attributes;
    		if(node.id == "0"){
    			$("#basemessagelevel").val(0);
    			$("#basemessageid").val(0);
    		}else{
    			$("#basemessagelevel").val(data.level+1);
    			$("#basemessageid").val(data.id);
    		}
    		var children = node.children;	
        	if(children.length == 0){
        		search(node.id);
        	}
        	var id="";
        	var type="";
        	if(data){
        		id=data.parendbaseid;
        		type=data.basetype;
        		if(type =="00"){
        			$('#basetype').combobox({readonly:false});
            		$('#basetype').combobox("setValue","00");
        		}else{
	        		$('#basetype').combobox({readonly:true});
	        		$('#basetype').combobox("setValue",type);
        		}
        	}else{
        		id="0";
        		type="";
        		$('#basetype').combobox({readonly:false});
        		$('#basetype').combobox("setValue","00");
				
        	}
        	 $.ajax({
                 type: "post",
                 data: {"basemessage.id":id, "basemessage.basetype": type},
                 url: path+"/baseMessage/basemessage!check.action",
                 dataType: "json",
                 success: function(data){
                           if(data.result =="true"){
                        	   add="false";
                           }else{
                        	   add="true";  
                           }
                  }
             });
    	}
	});
}

function search(id){
	loadDataGrid({
		datagridObj : $("#datatab"),
		url : path + "/baseMessage/student!selectPage.action?&student.basemessageid="+id,
		original : {
			toolbar : "#toolbarstudent"
		}
	});
}
</script>   
</head>
<body class="pl20" style="padding-top: 20px;">
<div id="toolbar" class="easyui-toolbar">		
		 <a href="javascript:void(0)" class="easyui-linkbutton tadd" iconCls="icon-add" plain="true">新增</a>
		 <a href="javascript:void(0)" class="easyui-linkbutton tremove" iconCls="icon-remove" plain="true">删除</a>
		 <a href="javascript:void(0)" class="easyui-linkbutton tsave" iconCls="icon-save" plain="true">修改</a>
		 <div>
			<div class="left_tree_container" style="margin-right: 20px;">
				<div class="left_tree_header">基本信息</div>
					<ul id="tree" class="easyui-tree"></ul>
			</div>
				
		<table id="datatab" class="easyui-datagrid">
		    <thead>
			    <tr>
			    	<th data-options="field:'ck',checkbox:true"></th>
			    		    	<th field="id" hidden="true" ></th>
		    			    	<th field="basemessageid" hidden="true"  ></th>
		    			    	<th field="studentname" width="100" >姓名</th>
		    			    	<th field="no" width="100" >学号</th>
		    			    	<th field="sex" width="100" >性别</th>
		    			    	<th field="birthday" width="100" >生日</th>
		    			    	<th field="emial" width="100" >邮箱</th>
		    			    	<th field="phone" width="100" >手机号</th>
		    			    	<th field="imageurl" width="100" >图像url</th>
		    			    	<th field="remark" width="100" >查看</th>
		    	  </tr>
		    </thead>
		</table>
  </div>
</div>	 
<div id="dlg" class="easyui-dialog" closed="true" buttons="#dlg-buttons" style="width:480px">
    <form id="fm" method="post">
    <input id="basemessageid" name="basemessage.parendbaseid" type="hidden" /> 
    <input id="basemessagelevel" name="basemessage.level" type="hidden" />
    	<p><label>类型：</label><select id="basetype" class="easyui-combobox" name="basemessage.basetype" style="width:180px;height: 27px;">
    	<option value="00">目录</option>
		<option value="01">学生</option>
		<option value="02">教师</option>
		</select></p>
		<p><label>名字：</label><input name="basemessage.basename" type="text" class="easyui-validatebox"  /></p>
    </form>
</div>

<div id="dlg-buttons" style="margin-top: 20px" >
    <a href="javascript:void(0)" class="easyui-linkbutton btn btn-primary save" iconCls="icon-ok">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton btn btn-default closedlg" iconCls="icon-cancel" >关闭</a>
</div>
</body>
</html>