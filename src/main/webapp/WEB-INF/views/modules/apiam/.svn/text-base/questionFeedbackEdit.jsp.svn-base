<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>问题回复</title>
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
		<li><a href="${ctx}/apiam/questionFeedback/list">问题反馈列表</a></li>
		<li class="active"><a href="${ctx}/apiam/questionFeedback/edit?id=${questionFeedback.id}">问题回复</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="questionFeedback" action="${ctx}/apiam/questionFeedback/update" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<%-- <div class="control-group">
			<label class="control-label">问题内容:</label>
			<div class="controls">
				<form:input path="content" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		
		<div class="control-group">
			<label class="control-label">问题内容:</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="3" maxlength="1000" class="input-xlarge" readonly="true"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="1000" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">电子邮件:</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="100" readonly="true"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">电话:</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="100" readonly="true"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">ip:</label>
			<div class="controls">
				<form:input path="ip" htmlEscape="false" maxlength="100" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">回复内容:</label>
			<div class="controls">
				<form:input path="reContent" htmlEscape="false" maxlength="1000" class="required"/>
				<%-- <form:textarea path="reContent" htmlEscape="false" rows="3" maxlength="1000" class="input-xlarge"/> --%>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="apiam:questionFeedback:update"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>