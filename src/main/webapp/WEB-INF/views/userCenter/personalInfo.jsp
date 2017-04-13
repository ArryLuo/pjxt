<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/common/taglibs.jsp"%>
<title>个人信息管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/userCenter/personalInfo.js"></script>

<script>
$(function () {
	if($("#hsex").val()=='1'){
		$("#girl").attr("selected","selected");
	}else{
		$("#boy").attr("selected","selected");
	}
	
	$("#oldpswd").val("");
	
});
</script>

<style type="text/css">
label{margin-right:10px;display:inline-block;width:90px;line-height:30px;} 
form{margin:0px} 
input{width: 170px;height:25px;} 
textarea{width: 450px;height: 80px;} 
br{clear: left;} 
#main{margin-left:200px;margin-top:40px;}
#pvcity #site1{width:85px;height:25px;}
#pvcity #site2{width:85px;height:25px;}
</style>

</head>
<body>

<div id="main">
<form id="info">
<input id="id" name="operator.id" type="hidden" value="${operator.id}"/>
									
						<label>登录用户名:</label>
						<input type="text" name="" value="${operator.username}"  required="true" class="easyui-validatebox" disabled="disabled"/>
						<input type="hidden" name="operator.username" value="${operator.username}"/>
						
					<br />
				 
					
						<label>备注:</label>
						<textarea name="operator.memo">${operator.memo}</textarea>
					
				 <br />
					<p style="margin-left:250px;">
					<a href="javascript:void(0)" id="save" class="easyui-linkbutton btn btn-primary save" iconCls="icon-ok">保存</a>
			</p>
	 </form>			
</div>

</body>
</html>