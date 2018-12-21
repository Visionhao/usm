<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标签管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/apiam/tagApiManage/info">接口修改</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tagApiManage" action="${ctx}/apiam/tagApiManage/info" method="post" class="form-horizontal">
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">接口名称:</label>
			<div class="controls">
				<form:input path="apiName" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接口描述:</label>
			<div class="controls">
				<form:textarea path="comment" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接入机器IP:</label>
			<div class="controls">
               <div class="controls">
				<form:input path="joinIp" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">帐号名:</label>
			<div class="controls">
				<form:input path="userName" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码:</label>
			<div class="controls">
				<form:input path="userPassword" htmlEscape="false" maxlength="50" class="required userName"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
		</div>
	</form:form>
</body>
</html>