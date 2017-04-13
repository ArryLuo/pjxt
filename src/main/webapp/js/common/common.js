var zhezhao = {
		create:function(path){
			if($("#maskDiv").length>0){
			return;
			}
			
			var maskDiv=$("<div id='maskDiv' />");
			var loadingImg=$("<img src='"+path+"/images/loading.gif' style='vertical-align:middle' />");
			
			var left = $(document).width() / 2 - loadingImg.width() / 2;
			var top = $(document).height() / 2 - loadingImg.height() / 2;
			loadingImg.css({
				top : top,
				left : left,
				"z-index" : 9999,
				"position": "absolute"
			});
			
			loadingImg.appendTo(maskDiv);
			
			maskDiv.appendTo($("body"))
			.css(
					{
						"background":"url("+path+"/images/grey_20x20/tm_bg.png) repeat",
						"position":"fixed",
						"height":"100%",
						"width":"100%",
						"text-align":"center",
						"vertical-align":"middle",
						"top":0,
						"left":0,
						"z-index":900});
		},
		remove:function(){
			$("#maskDiv").remove();
		}
	};
/**
 * Description:jquery扩展方法
 */
jQuery.prototype.serializeObject=function(){  
    var obj = {};  
    $.each(this.serializeArray(),function(index,param){  
        if(!(param.name in obj)){  
            obj[param.name] = $.trim(param.value);  
        }  
    });  
    return obj;  
}; 



$.fn.tree.defaults.loadFilter = function(data, parent) {
	var opt = $(this).data().tree.options;
	var idFiled, textFiled, parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};
//扩展combotree，使其支持平滑数据格式
$.fn.combotree.defaults.loadFilter = $.fn.tree.defaults.loadFilter;

/**
 * Description:easyui datagrid公用函数
 */

/**
 * Description:加载datagrid
 * @Params:options   object
 * options.datagridObj:datagrid的jquery对象    	  jquery
 * options.searchFormObj:查询条件form的jquery对象  jquery
 * options.original:datagrid原始配置                 object
 */
function loadDataGrid(options) {
    var $datagrid = options.datagridObj;
    var formData = {};
    if (options.searchFormObj != undefined) {
//        var data = options.searchFormObj.serialize();
//        if (options.url.indexOf("?") != -1) {
//            options.url += "&" + data;
//        } else {
//            options.url += "?" + data;
//        }
    	var formData = options.searchFormObj.serializeObject();
    }
    
    //设置options.original属性
    
    //行号
    if(typeof options.original.rownumbers == "undefined"){
    	options.original.rownumbers = true;
    }
    
    //分页
    if(typeof options.original.pagination == "undefined"){
    	options.original.pagination = true;
    }
    
    //单选或多选
    if(typeof options.original.singleSelect == "undefined"){
    	options.original.singleSelect = true;
    	options.original.selectOnCheck = false;   	
    }else{   	
        if(options.original.singleSelect){	//单选
        	options.original.selectOnCheck = false;
        }else{	//多选
        	options.original.selectOnCheck = true;      	
        }
    }
    options.original.checkOnSelect = true;
    //设置lingbutton的禁用启用
    if(typeof options.disableButtons != "undefined"){
    	var btns = options.disableButtons.split(",");
    	
    	//初始化时禁用指定linkbutton
        if(options.original.onLoadSuccess == "undefined"){
            options.original.onLoadSuccess = function(data){
                setLinkButtonsDisabled(btns);
            };
        }

    	//设置选中行取消选中行时linkbutton状态
    	options.original.onClickRow = function(rowIndex,rowData){
			setLinkButtonStatus($datagrid,btns);
		};
		options.original.onCheck = function(rowIndex,rowData){
			setLinkButtonStatus($datagrid,btns);
		};
		options.original.onUncheck = function(rowIndex,rowData){
			setLinkButtonStatus($datagrid,btns);
		};
		options.original.onCheckAll = function(rows){
			setLinkButtonStatus($datagrid,btns);
		};
		options.original.onUncheckAll = function(rows){
			setLinkButtonStatus($datagrid,btns);
		};
    }
    //表格是否可编辑
    options.editable = options.editable || false;
    
//    options.original.fitColumns=true;
//    options.original.pageList=[8,10,20,30,40,50];
//    options.original.pageSize=10;
    
    if(options.editable){	//可编辑表格
    	$datagrid.edatagrid(options.original);
    }else{
    	$datagrid.datagrid(options.original);
    }
    
    //设置异步数据加载，分页
    getPageData($datagrid, options.url, formData);
}
//打开新的面板tab
function openTab(title, url) {
	if ($('#tabs').tabs('exists', title)) {
		$("#tabs").tabs('getTab', title).panel('options').href=url;
		$('#tabs').tabs('select', title);
	} else {
		$('#tabs').tabs('add', {
			border : false,
			title : title,
			href : url,
			closable : false,
			cache : false
		});
	}
}
//加载datagrid数据
function getPageData($obj, url, data) {
	var p = $obj.datagrid('getPager');
	var options = $obj.datagrid('options');
	
	if(options.pagination){
		$(p).pagination({
			onSelectPage : function(pageNumber, pageSize) {
				getData($obj, url, data, pageNumber, pageSize);
			}
		});
		var opt = $(p).pagination('options');
		getData($obj, url, data, opt.pageNumber, opt.pageSize);
	}	
}

function getData($obj, url, data, pageNumber, pageSize) {
	window.top.zhezhao.create(path);
	data["pager.page"] = pageNumber - 1;
	data["pager.rows"] = pageSize;
	$.ajax({
		url : url,
		type : 'post',
//		data : "pager.page=" + (pageNumber - 1) + "&pager.rows=" + pageSize,
		data : data,
		dataType : 'json',
		success : function(result) {
			if (result&&result.rows&&result.rows.length>0) {
				var data = {
					total : result.total,
					rows : result.rows
				};
				$obj.datagrid('loadData', data);	
			}else{
				var data = {
						total : 0,
						rows : []
					};
				$obj.datagrid('loadData', data);
			}
			window.top.zhezhao.remove();
		},
		error:function(){
			window.top.zhezhao.remove();
		}
	});
}

//设置linkbutton禁用
function setLinkButtonsDisabled(btnsArr){
	for(var i=0,l=btnsArr.length;i<l;i++){
		$(btnsArr[i]).linkbutton("disable");
	}
}

//设置linkbutton启用
function setLinkButtonsEnabled(btnsArr){
	for(var i=0,l=btnsArr.length;i<l;i++){
		$(btnsArr[i]).linkbutton("enable");
	}
}

//根据是否选中设置linkbutton的状态
function setLinkButtonStatus($datagrid,btnsArr){
	var rows = getSelectRows($datagrid);	

	if(rows.length > 0){
		setLinkButtonsEnabled(btnsArr);
	}else{
		setLinkButtonsDisabled(btnsArr);
	}	
}

//根据linkbutton的selector禁用按钮，不保存状态，不能启用
function setButtonsDisabled(selectors){
	if(selectors != "null"){
		var selectorArr = selectors.split(",");
		$.each(selectorArr,function(i,a){
			//处理超链接
			var strHref = $(a).attr("href");
			if (strHref) {
                $(a).attr("href", "javascript:void(0)");
            }
			
			//处理直接耦合绑定到onclick属性上的事件
			 var onclickStr = $(this).attr("onclick");
             if (onclickStr && onclickStr != "") {
            	 $(a).attr("onclick", "");
             }
             
             //处理使用jquery绑定的事件
             var eventDatas = $(a).data("events") || $._data($(a)[0], "events");
             if (eventDatas["click"]) {
            	 $(a).unbind("click");
             }
             $(a).addClass("l-btn-disabled");
             $(a).hide();
		});
	}
}

//判断datagrid有无checkbox
function hasCheckbox($datagrid){
	return !($datagrid.prev().find("td:first input[type='checkbox']").length == 0);
}

//获取选中行数据
function getSelectRows($datagrid){
	var rows = null;
	if(hasCheckbox($datagrid)){
		rows = $datagrid.datagrid("getChecked");
	}else{
		rows = $datagrid.datagrid("getSelections");
	}
	return rows;
}

//设置dialog位置
function adjustDialogPosition($dlg, position){
	var dlgPanel = $dlg.dialog("panel");
	var offset = dlgPanel.offset();
	var left = offset.left;
	var top = offset.top;
	
	//dialod打开时对dialog位置进行调整
	if(left < 0 || top < 0){
		$dlg.dialog("move",{
			left: left < 0? position.left : left,
			top: top < 0? position.top : top
		});
	}
}

//设置dialog的onMove
function setDialogOnmoveEvent($dlg,modal){
	//拖动dialog时限制
	$dlg.dialog({
		maximizable:true,
		modal:modal===undefined ? true :modal=== false?false:true,
		onMove: function(left,top){
			if(left < 0 || top < 0){
				adjustDialogPosition($dlg,{
					left:0,
					top:0
				});
			}
		}
	});
}

//设置和打开dialog
function setAndOpenDialog($dlg,title,modal){
	setDialogOnmoveEvent($dlg,modal);
	$dlg.dialog('open').dialog('setTitle', title); // 打开对话框	
	adjustDialogPosition($dlg,{
		left:50,
		top:50
	});
//	top.dialog({
//		title: title,
//		content: $dlg[0]
//	})
//	.showModal();
}

/**
 * Description:datagrid新增一条记录
 * @Params:options   object
 * options.obj_dialog:点击新增谭处端额对话框jquery对象    jquery
 * options.obj_form:弹出的对话框中form的jquery对象      jquery
 * options.title:弹出对话框的标题                      string
 */
function addItem(options) {
	var $obj_dlg = options.obj_dialog;
	var $obj_fm = options.obj_form;
	var title = options.title === undefined ? "新增行" : options.title;
	var modal = options.modal;
	//设置及打开dialog
	setAndOpenDialog($obj_dlg,title,modal);
	
	if ($obj_fm != undefined) {
		// 清空表单
		$("input,textarea", $obj_fm).not(':radio,:submit,:button,:reset').val("");
	}
}

/**
 * Description:datagrid修改一条记录
 * @Params:options   object
 * options.obj_datagrid:当前datagrid的jquery对象   jquery
 * options.obj_dialog:点击新增谭处端额对话框jquery对象   jquery
 * options.obj_form:弹出的对话框中form的jquery对象     jquery
 * options.title:弹出对话框的标题                     string
 * options.formname:form中name值得前缀              string
 */
function modifyItem(options,modal) {
	var $obj_dgd = options.obj_datagrid;
    var $obj_dlg = options.obj_dialog;
    var $obj_fm = options.obj_form;
    var title = options.title === undefined ? "修改行" : options.title;
    var modal = options.modal;
//    var row = $obj_dgd.datagrid('getSelections');  //获取选中的记录     
    /*var row = $obj_dgd.datagrid('getChecked');  //获取选中的记录     
    if(row.length == 0){	//没有复选框的情况
        row = $obj_dgd.datagrid("getSelections");
    }*/
    
    var rows = getSelectRows($obj_dgd);

    if (rows.length > 0) {
        if (rows.length > 1) {
            $.messager.alert(title, "不能同时选择多条记录！");
        } else {
            var obj = {};
            if (options.formname != undefined) {
                $.each(rows[0], function (i, a) {
                    obj[options.formname + "." + i] = a;
                });
            } else {
                obj = rows;
            }

          
        	setAndOpenDialog($obj_dlg,title,modal);					//设置及打开dialog
        	
            formClear($obj_fm);									//清空表单
            $obj_fm.form('load', obj);                          //加载数据
        }
    } else {
        $.messager.alert(title, "请选择一条记录！");           //未选择行提示
    }
}

/**
 * Description:datagrid删除一条记录
 * @Params:options   object
 * options.obj_datagrid:当前datagrid的jquery对象    jquery
 * options.title:弹出对话框的标题                     string
 * options.url_delete:删除记录的url                 string
 * options.url_reload:重新装载数据的url              string
 */
function deleteItem(options) {
	var $obj_dgd = options.obj_datagrid;
	var title = options.title === undefined ? "删除行" : options.title;
//	var rows = $obj_dgd.datagrid('getSelections');
	/*var rows = $obj_dgd.datagrid('getChecked');
	if(rows.length == 0){	//没有复选框的情况
		rows = $obj_dgd.datagrid("getSelections");
    }*/
	var rows = getSelectRows($obj_dgd);
	
	if (rows.length > 0) {
		$.messager.confirm(title, '确定要删除选中行？', function(r) {
			if (r) {
				var rowsid = [];
				for (var i = 0, l = rows.length; i < l; i++) {
					rowsid.push(rows[i].id);
				}
				rowsid.join(",");
				
				$.ajax({
					url : options.url_delete,
					type : 'post',
					data : "id=" + rowsid,
					dataType : 'json',
					success : function(data) {
						if (data.result) {
							$.messager.alert("提示信息", "删除成功！", "info",function(){
								if(options.callback != undefined){
									options.callback();
								}
							});
							getPageData($obj_dgd, options.url_reload,{});
							
						} else {
							$.messager.alert("错误信息", "删除失败！", "error");
						}
					}

				});
			}
		});
	} else {
		$.messager.alert(title, "请选择要删除的行！");
	}
}

/**
 * Description:datagrid保存一条记录
 * @Params:options   object
 * options.obj_datagrid:当前datagrid的jquery对象   jquery
 * options.obj_dialog:点击新增谭处端额对话框jquery对象   jquery
 * options.obj_form:弹出的对话框中form的jquery对象     jquery
 * options.url_add:新增记录的url                    string
 * options.url_reload:重新装载数据的url              string
 */
function saveItem(options) {
	var url = options.url;
	var $obj_fm = options.obj_form;
	var $obj_dlg = options.obj_dialog;
	var $obj_dgd = options.obj_datagrid;

	$obj_fm.form('submit', {
		url : options.url_add,
		onSubmit : function() {
			return $(this).form('validate');
		},
		onBeforeLoad:function(param){
//			alert(param);
		},
		success : function(data) {
			data = $.parseJSON(data);
			if(data.message == "large") {
				$.messager.alert("错误信息", "您上传的课程图片过大，请重新上传", "error");
				return ;
			}
			if (data.result == "true") {
					$.messager.alert("提示信息", "操作成功！", "info",function(){
						if(options.callback != undefined){
							options.callback();
						}
						if($obj_dgd){
						   getPageData($obj_dgd, options.url_reload,{});
						}
						$obj_dlg.dialog("close");
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
//			alert("error");
		}
	});
}


/**
 * Description:easyui form表单公用函数
 */

//设置输入框
function setInputText($obj) {
	$obj.focus(function() {
		if (this.value == this.defaultValue) {
			$(this).css("color", "#000").val("");
		}
	}).blur(function() {
		if (this.value == "") {
			$(this).css("color", "#999").val(this.defaultValue);
		}
	});
}

//全选
function checkAll($obj) {
	$obj.prop("checked", true);
}

//全不选
function uncheckAll($obj) {
	$obj.prop("checked", false);
}

//反选
function reverseCheck($obj) {
	$obj.each(function() {
		// $(this)[0].checked = !$(this).is(":checked");
		$(this).prop("checked", !$(this).is(":checked"));
	});
}

//清除表单数据
function formClear($form) {
    if ($form != undefined) {
        $('input,select,textarea', $form).each(function () {
            var t = this.type, tag = this.tagName.toLowerCase();
            if (t == 'text' || t == 'hidden' || t == 'password' || tag == 'textarea') {
                this.value = '';
            } else if (t == 'file') {
                var file = $(this);
                file.after(file.clone().val(''));
                file.remove();
            } else if (t == 'checkbox' || t == 'radio') {
                this.checked = false;
            } else if (tag == 'select') {
                this.selectedIndex = -1;
            }
        })
    }
}

//表单验证扩展
$.extend($.fn.validatebox.defaults.rules,{
	cellphone : {//手机号验证
		validator : function(value) {
			return /^1[3|4|5|7|8][0-9]\d{8}$/.test(value);
		},
		message : "请输入正确的手机号码！"
	},
	name: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            return /^[\Α-\￥]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
        },
        message: '请输入正确姓名'
    },
	account: {//param的值为[]中值
	    validator: function (value, param) {
            if (value.length < param[0] || value.length > param[1]) {
                $.fn.validatebox.defaults.rules.account.message = '用户名长度必须在' + param[0] + '至' + param[1] + '范围';
                return false;
            } else {
                if (!/^[\w]+$/.test(value)) {
                    $.fn.validatebox.defaults.rules.account.message = '用户名只能数字、字母、下划线组成.';
                    return false;
                } else {
                    return true;
                }
            }
	     }, message: ''
	},
	password: {//param的值为[]中值
	    validator: function (value, param) {
            if (value.length < param[0] || value.length > param[1]) {
                $.fn.validatebox.defaults.rules.password.message = '密码长度必须在' + param[0] + '至' + param[1] + '范围';
                return false;
            }else {
                if (!/^[\w]+$/.test(value)) {
                    $.fn.validatebox.defaults.rules.password.message = '密码只能数字、字母、下划线组成.';
                    return false;
                } else {
                    return true;
                }
            }
	     }, message: ''
	},
	intOrFloat : {// 验证整数或小数
		validator : function(value) {
			return /^\d+(\.\d+)?$/i.test(value);
		},
		message : '请输入数字，并确保格式正确'
	},
	integer : {// 验证整数
		validator : function(value) {
			return /^[+]?[1-9]+\d*$/i.test(value);
		},
		message : '请输入整数'
	},
	myinteger : {// 验证整数（包含0）
		validator : function(value) {
			return /^[+]?[0-9]+\d*$/i.test(value);
		},
		message : '请输入整数'
	},
	mymoney: {// 使用面额小于或等于500.00
		validator : function(value) {
			return /^([1-4][0-9]{2}|500|[1-9][0-9]{0,1})$/.test(value);
		},
		message : '使用面额小于或等于500.00'
	},
	telephone : {//座机号验证
		validator : function(value) {
			//"兼容格式: 区号(2到3位)-电话号码(7到8位)-分机号(3位以上)"
			return /^0\d{2,3}-\d{7,8}(-\d{3,})?$/.test(value);
		},
		message : "请输入正确的座机号码！"
	},
	postcode : {	//邮政编码验证（开头不能为0，共6位）
		validator : function(value) {
			return /^[1-9]\d{5}$/.test(value);
		},
		message : "请输入正确的邮政编码！"
	},
	mobileOrphone:{
		  validator: function (value) {
              return /^(13|15|18)\d{9}$/i.test(value) || /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
          },
          message: "格式不正确,请使用下面格式:020-88888888或手机号码."
	}
	,
	url:{	//url验证
		validator : function(value) {
			var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
				+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" // ftp的user@
				+ "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
				+ "|" // 允许IP和DOMAIN（域名）
				+ "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
				+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
				+ "[a-z]{2,6})" // first level domain- .com or .museum
				+ "(:[0-9]{1,4})?" // 端口- :80
				+ "((/?)|" // a slash isn't required if there is no file name
				+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
			var re = new RegExp(strRegex);
			return re.test(value);
		},
		message : "请输入正确的url地址！"
	},
	idcard : {
		validator : function(value) {//身份证号验证
			var provinceAndCitys = {
				11 : "北京",
				12 : "天津",
				13 : "河北",
				14 : "山西",
				15 : "内蒙古",
				21 : "辽宁",
				22 : "吉林",
				23 : "黑龙江",
				31 : "上海",
				32 : "江苏",
				33 : "浙江",
				34 : "安徽",
				35 : "福建",
				36 : "江西",
				37 : "山东",
				41 : "河南",
				42 : "湖北",
				43 : "湖南",
				44 : "广东",
				45 : "广西",
				46 : "海南",
				50 : "重庆",
				51 : "四川",
				52 : "贵州",
				53 : "云南",
				54 : "西藏",
				61 : "陕西",
				62 : "甘肃",
				63 : "青海",
				64 : "宁夏",
				65 : "新疆",
				71 : "台湾",
				81 : "香港",
				82 : "澳门",
				91 : "国外"
			};
			var powers = [ "7", "9", "10", "5", "8", "4", "2",
					"1", "6", "3", "7", "9", "10", "5", "8",
					"4", "2" ];
			var parityBit = [ "1", "0", "X", "9", "8", "7",
					"6", "5", "4", "3", "2" ];
			//15位和18位身份证号码的基本校验
			var check = /^\d{15}|(\d{17}(\d|x|X))$/.test(value);
			if (!check)
				return false;
			//判断长度为15位或18位
			if (value.length == 15) {
				return check15IdCardNo(value);
			} else if (value.length == 18) {
				return check18IdCardNo(value);
			} else {
				return false;
			}

			//校验15位的身份证号码
			function check15IdCardNo(idCardNo) {
				//15位身份证号码的基本校验
				var check = /^[1-9]\d{7}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\d{3}$/
						.test(idCardNo);
				if (!check)
					return false;
				//校验地址码
				var addressCode = idCardNo.substring(0, 6);
				check = checkAddressCode(addressCode);
				if (!check)
					return false;
				var birDayCode = '19'
						+ idCardNo.substring(6, 12);
				//校验日期码
				return checkBirthDayCode(birDayCode);
			}

			//校验18位的身份证号码
			function check18IdCardNo(idCardNo) {
				//18位身份证号码的基本格式校验
				var check = /^[1-9]\d{5}[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\d{3}(\d|x|X)$/
						.test(idCardNo);
				if (!check)
					return false;
				//校验地址码
				var addressCode = idCardNo.substring(0, 6);
				check = checkAddressCode(addressCode);
				if (!check)
					return false;
				//校验日期码
				var birDayCode = idCardNo.substring(6, 14);
				check = checkBirthDayCode(birDayCode);
				if (!check)
					return false;
				//验证校检码
				return checkParityBit(idCardNo);
			}

			function checkAddressCode(addressCode) {
				var check = /^[1-9]\d{5}$/.test(addressCode);
				if (!check)
					return false;
				if (provinceAndCitys[parseInt(addressCode
						.substring(0, 2))]) {
					return true;
				} else {
					return false;
				}
			}

			function checkBirthDayCode(birDayCode) {
				var check = /^[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))$/
						.test(birDayCode);
				if (!check)
					return false;
				var yyyy = parseInt(birDayCode.substring(0, 4),
						10);
				var mm = parseInt(birDayCode.substring(4, 6),
						10);
				var dd = parseInt(birDayCode.substring(6), 10);
				var xdata = new Date(yyyy, mm - 1, dd);
				if (xdata > new Date()) {
					return false;// 生日不能大于当前日期
				} else if ((xdata.getFullYear() == yyyy)
						&& (xdata.getMonth() == mm - 1)
						&& (xdata.getDate() == dd)) {
					return true;
				} else {
					return false;
				}
			}

			function checkParityBit(idCardNo) {
				var parityBit = idCardNo.charAt(17)
						.toUpperCase();
				if (getParityBit(idCardNo) == parityBit) {
					return true;
				} else {
					return false;
				}
			}

			function getParityBit(idCardNo) {
				var id17 = idCardNo.substring(0, 17);
				var power = 0;
				for (var i = 0; i < 17; i++) {
					power += parseInt(id17.charAt(i), 10)
							* parseInt(powers[i]);
				}
				var mod = power % 11;
				return parityBit[mod];
			}
		},
		message : '请输入正确的身份证号！'
	},
	equalTo : {
		validator : function(value, param) {
			if ($(param[0]).val() != "" && value != "") {
				return $(param[0]).val() == value;
			}
		},
		message : '两次输入的密码不一致！'
	}
});					



/**
 * Description:easyui tab公用函数
 */

//新建iframe
function createFrame(url) {
	return '<iframe scrolling="auto" frameborder="0"  src="' + url
			+ '" style="width:100%;height:100%;"></iframe>';
}

//刷新当前tab
function refreshTab($tabs) {
	var currentTab = $tabs.tabs('getSelected');
	var $iframe = $(currentTab.panel('options').content);
	var src = $iframe.attr('src');
	$tabs.tabs('update', {
		tab : currentTab,
		options : {
			content : createFrame(src)
		}
	});
}

//添加tab
function addPanel($tabs,$closemenu,subtitle,url) {
    if (!$tabs.tabs('exists', subtitle)) {
        $tabs.tabs('add', {
            title: subtitle,
            content: createFrame(url),
            closable: true
        });
    } else {
        $tabs.tabs('select', subtitle);           
        //刷新tab
        refreshTab($tabs);
    }
    tabClose($tabs,$closemenu);
}
//关闭tab绑定事件
function tabClose($tabs,$closemenu) {
    var $tabsInner = $(".tabs-inner");
    $tabsInner.bind('contextmenu', function (e) {
        $closemenu.menu('show', {
            left: e.pageX,
            top: e.pageY
        });

        var subtitle = $(this).children(".tabs-closable").text();

        $closemenu.data("currtab", subtitle);
        $tabs.tabs('select', subtitle);
        return false;
    });

    $closemenu.menu({
        onClick: function (item) {
            closeTab($tabs,item.id);
        }
    });
}

function closeTab($tabs,action) {
    var alltabs = $tabs.tabs('tabs');
    var currentTab = $tabs.tabs('getSelected');
    var currentTabIndex = $tabs.tabs('getTabIndex', currentTab);
    var currentTabTitle = currentTab.panel('options').title;

    var allTabtitle = [];
    $.each(alltabs, function (i, n) {
        allTabtitle.push($(n).panel('options').title);
    });
    var onlyOpenTitle = allTabtitle[0];

    switch (action) {
        case "refresh":	//刷新
            if (currentTabIndex > 0) {
                refreshTab($tabs);
            }
            break;

        case "close":	//关闭
            if (currentTabIndex > 0) {
                $tabs.tabs('close', currentTabTitle);
            }
            break;

        case "closeall":	//全部关闭
            $.each(allTabtitle, function (i, n) {
                if (n != onlyOpenTitle) {
                    $tabs.tabs('close', n);
                }
            });
            break;

        case "closeother":	//关闭其他
            $.each(allTabtitle, function (i, n) {
                if (n != currentTabTitle && n != onlyOpenTitle) {
                    $tabs.tabs('close', n);
                }
            });
            break;

        case "closeright":	//关闭右侧
            if (currentTabIndex == alltabs.length - 1) {
                return false;
            }
            $.each(allTabtitle, function (i, n) {
                if (i > currentTabIndex) {
                    if (n != onlyOpenTitle) {
                        $tabs.tabs('close', n);
                    }
                }
            });
            break;

        case "closeleft":	//关闭左侧
            if (currentTabIndex == 1) {
                return false;
            }
            $.each(allTabtitle, function (i, n) {
                if (i < currentTabIndex) {
                    if (n != onlyOpenTitle) {
                        $tabs.tabs('close', n);
                    }
                }
            });
            break;
    }
}

/**
 * Description:easyui tree公用函数
 */

//判断指定tree node是否有子节点
function hasChildren(node) {
	if (node.children != undefined && node.children.length > 0) {
		return true;
	} else {
		return false;
	}
}

//获取指定tree的选中节点ID集合
function getCheckedTreeIDs($treeObj) {
	var nodes = $treeObj.tree('getChecked', ['checked','indeterminate']);
	var s = [];
	var parent = {};
	for (var i = 0; i < nodes.length; i++) {
		if (!hasChildren(nodes[i])) { //没有子节点
			var parenti = $treeObj.tree("getParent", nodes[i].target);
			if (parenti != null) {
				if ($.inArray(parenti, nodes) == -1) {//父节点未选中
					//判断父节点是否已添加
					if (parenti != parent) {
						s.push(parenti.id);
						parent = parenti;
					}
				}
			}
		}
		s.push(nodes[i].id);
	}
	return s.join(",");
}
//获取选中，不包括父节点
function getCheckedFromTree($treeObj) {
	var nodes = $treeObj.tree('getChecked', ['checked']);
	var s = [];
	for (var i = 0; i < nodes.length; i++) {
		if (!hasChildren(nodes[i])) { //没有子节点
			s.push(nodes[i].id);
		}
	}
	return s.join(",");
}

function setTreeAllUnChecked($treeObj) {
	
	var nodes = $treeObj.tree('getChecked');
	for(var i=0,l=nodes.length;i<l;i++){
		$treeObj.tree("uncheck", nodes[i].target);
	}
	/*for(node in nodes){
		$treeObj.tree("uncheck", node);
	}*/
}

//根据选中的tree ids对指定的tree进行初始化
function setTreeChecked($treeObj, idsCheckedArr) {
	for (var i = 0, l = idsCheckedArr.length; i < l; i++) {
		var node = $treeObj.tree('find', idsCheckedArr[i]);
		if (node && !hasChildren(node)) {
			$treeObj.tree("check", node.target);
		}
	}
}

//在选中节点后新增项
function treeAppend($treeObj) {
    var node = $treeObj.tree('getSelected');
    $treeObj.etree('create');
}

//删除当前选中节点及其子节点
function treeRemoveit($treeObj) {
    var node = $treeObj.tree('getSelected');
    $treeObj.etree('destroy', node.target);
}

//修改当前节点
function treeEdit($treeObj){
	var node = $treeObj.tree('getSelected');
    $treeObj.etree('edit', node.target);
}

//折叠当前节点
function treeCollapse($treeObj) {
    var node = $treeObj.tree('getSelected');
    $treeObj.tree('collapse', node.target);
}

//展开当前节点
function treeExpand($treeObj) {
    var node = $treeObj.tree('getSelected');
    $treeObj.tree('expand', node.target);
}


/**
 * Description:easyui扩展方法
 */

/**
 * linkbutton方法扩展
 * @param {Object} jq
 */
$.extend($.fn.linkbutton.methods, {
    /**
     * 激活选项（覆盖重写）
     * @param {Object} jq
     */
    enable: function(jq){
        return jq.each(function(){
            var state = $.data(this, 'linkbutton');
            if ($(this).hasClass('l-btn-disabled')) {
                var itemData = state._eventsStore;
                //恢复超链接
                if (itemData.href) {
                    $(this).attr("href", itemData.href);
                }
                //回复点击事件
                if (itemData.onclicks) {
                    for (var j = 0; j < itemData.onclicks.length; j++) {
                        $(this).bind('click', itemData.onclicks[j]);
                    }
                }
                //设置target为null，清空存储的事件处理程序
                itemData.target = null;
                itemData.onclicks = [];
                $(this).removeClass('l-btn-disabled');
            }
        });
    },
    /**
     * 禁用选项（覆盖重写）
     * @param {Object} jq
     */
    disable: function(jq){
        return jq.each(function(){
            var state = $.data(this, 'linkbutton');
            if (!state._eventsStore)
                state._eventsStore = {};
            if (!$(this).hasClass('l-btn-disabled')) {
                var eventsStore = {};
                eventsStore.target = this;
                eventsStore.onclicks = [];
                //处理超链接
                var strHref = $(this).attr("href");
                if (strHref) {
                    eventsStore.href = strHref;
                    $(this).attr("href", "javascript:void(0)");
                }
                //处理直接耦合绑定到onclick属性上的事件
                var onclickStr = $(this).attr("onclick");
                if (onclickStr && onclickStr != "") {
                    eventsStore.onclicks[eventsStore.onclicks.length] = new Function(onclickStr);
                    $(this).attr("onclick", "");
                }
                //处理使用jquery绑定的事件
                var eventDatas = $(this).data("events") || $._data(this, 'events');
                if (eventDatas["click"]) {
                    var eventData = eventDatas["click"];
                    for (var i = 0; i < eventData.length; i++) {
                        if (eventData[i].namespace != "menu") {
                            eventsStore.onclicks[eventsStore.onclicks.length] = eventData[i]["handler"];
                            $(this).unbind('click', eventData[i]["handler"]);
                            i--;
                        }
                    }
                }
                state._eventsStore = eventsStore;
                $(this).addClass('l-btn-disabled');
            }
        });
    }
});


/**
 * Description:其他公用函数
 */


/**
 * @Description 根据参数名获取URL中的参数
 * @param <string>	name	参数名
 * @return <string>  参数值
 * @example getUrlArgument("name");
 */
function getUrlArgument(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

/**
 * @Description 获取所有URL的参数
 * @return <object>  参数集合
 * @example getUrlArguments();
 */
function getUrlArguments() {
    var url = unescape(window.location.href);
    var argObj = {};
    var urlSplit = url.split("?");
    if (urlSplit.length > 1) {
        var args = urlSplit[1].replace("#","&").split("&");
        for (var i = 0; i < args.length; i++) {
            var arg = args[i].split("=");
            argObj[arg[0]] = arg[1];
        }
    }
    return argObj;
}

/**
 * @Description 日期转换为Unix时间戳
 * @param <string>	d	日期
 * @return <int>		unix时间戳(毫秒)
 */
function dateToUnix(d){
    return new Date(d.replace(/-/g,"/")).getTime();
}

/**
 * @Description Unix时间戳转换为日期
 * @param <int> unixTime		待转换时间戳(毫秒)
 * @param <bool> isFull    	返回完整时间(Y-m-d 或者 Y-m-d H:i:s)
 * @param <int>  timeZone   	时区
 * @return <string>  日期
 */
function unixToDate(unixTime, isFull, timeZone){
    if (typeof(timeZone) == 'number'){
        unixTime = parseInt(unixTime/1000) + parseInt(timeZone) * 60 * 60;
    }
    var time = new Date(unixTime*1000);
    var ymdhis = "";
    ymdhis += time.getUTCFullYear() + "-";
    ymdhis += (time.getUTCMonth() + 1 <10 ? "0" + (time.getUTCMonth() + 1) : + time.getUTCMonth() + 1) + "-";
    ymdhis += time.getUTCDate() <10 ? "0" + time.getUTCDate() : time.getUTCDate();
    if(isFull === true){
        ymdhis += " " + (time.getUTCHours() <10 ? "0" + time.getUTCHours() : time.getUTCHours()) + ":";
        ymdhis += (time.getUTCMinutes() <10 ? "0" + time.getUTCMinutes() : time.getUTCMinutes()) + ":";
        ymdhis += time.getUTCSeconds() < 10? "0" + time.getUTCSeconds() : time.getUTCSeconds();
    }
    return ymdhis;
}

//比较两个日期的大小beginDate<endDate则返回true，否则返回false
function compareDateString(beginDate, endDate) {
    var bd = new Date(beginDate.replace(/-/g, "/")).getTime();
    var ed = new Date(endDate.replace(/-/g, "/")).getTime();
    return bd <= ed;
}

//判断结束时间是否比开始时间大于n个自然日
function compareDateStringNday(beginDate, endDate, n) {
    var bd = dateToUnix(beginDate);
    var ed = dateToUnix(endDate);
    var nd = n * 24 * 60 * 60 * 1000;
    return ed - bd >= nd;
}

//日期加n天
function dateAddNday(datestring,n){
	var unixTime = dateToUnix(datestring);
	unixTime += n * 24 * 60 * 60 * 1000;
	return unixToDate(unixTime,false,8);
}
//日期加N月
/*function dateAddNday(datestring,n){
	var unixTime = dateToUnix(datestring);
	unixTime += n * 24 * 60 * 60 * 1000;
	return unixToDate(unixTime,false,8);
}*/


//秒数转换为时分秒
function secondsToHMS(sec){
	if (typeof sec == "string") {
		sec = Number(sec);
    }

    var hour = sec >= 3600 ? Math.floor(sec / 3600) : 0;
    var min = sec - hour * 3600 >= 60 ? Math.floor((sec - hour * 3600) / 60) : 0;
    sec = Math.round(sec - hour * 3600 - min * 60);

    var result = "";
    if (hour > 0) {
        result += hour + "小时";
    }
    if (min > 0) {
        result += min + "分";
    }
    if (sec > 0) {
        result += sec + "秒";
    }
    return result;
}

//毫秒数转换为小时分钟秒
function milliSecondsToHMS(msec) {
    if (typeof msec == "string") {
    	msec = Number(msec);
    }

    var sec = msec / 1000;
    return secondsToHMS(sec);
} 

//毫秒数转为小时分钟秒，返回为对象
function milliSecondsToHMSObj(msec){
	if (typeof msec == "string") {
    	msec = Number(msec);
    }

    var sec = msec / 1000;
    
    var hour = sec >= 3600 ? Math.floor(sec / 3600) : 0;
    var min = sec - hour * 3600 >= 60 ? Math.floor((sec - hour * 3600) / 60) : 0;
    sec = Math.round(sec - hour * 3600 - min * 60);
    
    return {
    	hours: hour,
    	minutes: min,
    	seconds: sec
    };
}



/**
 * 
 * @requires jQuery,EasyUI
 * 
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	var l = left;
	var t = top;
	if (l < 1) {
		l = 1;
	}
	if (t < 1) {
		t = 1;
	}
	var width = parseInt($(this).parent().css('width')) + 14;
	var height = parseInt($(this).parent().css('height')) + 14;
	var right = l + width;
	var buttom = t + height;
	var browserWidth = $(window).width();
	var browserHeight = $(window).height();
	if (right > browserWidth) {
		l = browserWidth - width;
	}
	if (buttom > browserHeight) {
		t = browserHeight - height;
	}
	$(this).parent().css({/* 修正面板位置 */
		left : l,
		top : t
	});
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;
	
function getSiteVal($siteinput){
	if($siteinput.is(".combotree-f")){
		return $siteinput.combotree("getValue");
	}else{
		return $siteinput.val();
	}
}