<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name=”renderer” content=”webkit”>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/default/kyeasyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.easyui.min.js?_1"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.edatagrid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.etree.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js?_20150924"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/artDialog/dialog-plus.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/echarts/echarts-all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/echarts/helianthus.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/common/artDialog/ui-dialog.css" >
<script>
	var path = "${pageContext.request.contextPath}";
	var disableButtonIds="<%=request.getAttribute("buttonIds")%>";
	var checkOnlySite = <%=request.getAttribute("checkSiteCol")%>;
	var isCheckHr = <%=request.getAttribute("checkHr")%>;
	window.onload = function(){
		setButtonsDisabled(disableButtonIds);		
	};
	
	function siteTreeCreate(id,labelId,option,callback){
		$.ajax({
	  		url : path+"/system/plate-form-site!selectListTreeByUser.action?type=all",
	  		type : 'post',
	  		dataType : 'json',
	  		success : function(result) {
	  			var list = result[0].children;
	  			if(list.length>1){
	  				$("#"+id).combotree(option).combotree("loadData",result);
	  				$("#"+labelId).show();
	  				//优先选中广东学习网
	  				if($.inArray("f16cfcbc4e34488eb80a61c0c86d6324",list)){
	  					$("#"+id).combotree("setValue","f16cfcbc4e34488eb80a61c0c86d6324");
	  				}else{
	  					$("#"+id).combotree("setValue",list[0].id);
	  				}
	  			}else{
	  				var siteid = list[0].id;
	  				$("#"+id).val(siteid);
	  				if(typeof(callback)=='function'){
	  					callback(siteid);	
	  				}
	  			}
	  		}
	  	});
	}
	
	function siteDialogCreate(id,callback){
		if(checkOnlySite){
			$.ajax({
		  		url : path+"/system/plate-form-site!selectListTreeByUser.action?type=all",
		  		type : 'post',
		  		dataType : 'json',
		  		success : function(result) {
		  			var list = result[0].children;
		  			var siteid = list[0].id;
		  			if(typeof(callback)=='function'){
		  				callback(siteid);	
		  			}
		  		}
		  	});
		}else{
			$("#"+id).show();
		}
	}
	
	function globalCheckPermission(col){
		if((col.field=="platformSiteId" || col.field=="platformsiteid"||col.field=="siteId" || col.field=="orgPlatformSite"|| col.field=="platformSiteIdText" || col.field=="platformid"||col.field=="platformName" || col.field=="platformSiteText")&&checkOnlySite){
			return true;//返回true表示隐藏
		}else{
			return false;	
		}
	}
	
	function htTreeCreate(id,labelId){
		if(isCheckHr){
			$("#"+id).combotree({
				url:path+'/platform/hr!selectCheckTree.action',
				method:'get'
			});
			$("#"+labelId).show();
		}
	}
</script>
<!--[if lt IE  7]>
<script src="http://www.chingo.cn/template/js/cgFixPng.js" type="text/javascript"></script>
<script type="text/javascript">
cgFixPng.fix('div, a, .png, img, span, input')
</script>
<![endif]-->

