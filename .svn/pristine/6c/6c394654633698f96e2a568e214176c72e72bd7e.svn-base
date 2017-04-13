$(function () {
	 //$("#pvcity").ProvinceCity();
	$form=$("#info");
//	$cps=$("#confirmpswd");
		
//	$('#orgId').combotree({
//		url : path+"/system/organization!selectTree.action",
//		editable : false,
//		onClick: function (node) {
//			var code = node.id ;
//			var name = node.text;
//			$("#orgId").val(code);	
//			$("#name").val(name);
//		}
//	});

	
	$("#save").click(function(){
	/*	if(($("#newpswd").val()!=null ||$("#newpswd").val()!='')&&($cps.val()!=null||$cps.val()!='')){
			$("#oldpswd").val($("#newpswd").val());
		}*/
//		//只选择省级
//    	if($("#pvcity #site2").val()==''&&$("#pvcity #site1").val()!="请选择"){
//    	    $("#prin").val($("#pvcity #site1").val());
//    	   // 选择省级+市级
//    	}else if($("#pvcity #site2").val()!=(''||null)&&$("#pvcity #site1").val()!=("请选择"||null)){
//    		 $("#prin").val($("#pvcity #site1").val());
//    		 $("#city").val($("#pvcity #site2").val());
//     	    
//    	}
		$form.form("submit",{
			url : path+"/userCenter/personal-info!operatePInfo.action",
			onSubmit : function() {
				return $(this).form('validate');
			},
			success:function(data){
				data = $.parseJSON(data);
				if (data.result == "true") {
					$.messager.alert("提示信息", "操作成功！", "info",function(){
						//formClear($form);
						//我把 登录密码  新密码  确认新密码  都清空
//						$("#oldpswd").val("");
//						$("#newpswd").val("");
//						$("#confirmpswd").val("");
					});				
				} else {
					$.messager.alert("错误信息", data.message, "error");
				}
			}
		});
	});
	 //重置
    $(".tb_redo").click(function () {
    	formClear($form);
    });
    
//    $("#orgId").combobox({    
//        url: path+"/system/organization!loadAllCompany.action?organization.isorg="+1,    
//        valueField:'id',    
//        textField:'orgname',
//        onSelect:function(record){
//        	
//        	$("input[name='operator.organization']").val(record.orgname);
//        	$("#department").combotree({
//				url:path+"/system/organization!loadOrganiztionByComany.action?organization.parentid="+record.id,
//				onSelect:function(node){
//					
//		        	$("input[name='operator.department']").val(node.text);
//		        }
//			});
//        }
//    }); 
//    
//  
//    
//
//				$("#department").combotree({
//	    			url:path+"/system/organization!loadOrganiztionByComany.action?organization.parentid="+$("#orgId").combobox("getValue"),
//	    			onSelect:function(node){
//	    				
//	    	        	$("input[name='operator.department']").val(node.text);
//	    	        }
//	    		});



});

