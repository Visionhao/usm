<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>相关词修改</title>
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
					alert("dddddddddd");
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
		<li><a href="${ctx}/apiam/tagRelatedMapping/list">标签相关词映射</a></li>
		<li class="active"><a href="${ctx}/apiam/tagRelatedMapping/edit?id=${tagRelatedMapping.id}">相关词<shiro:hasPermission name="apiam:tagRelatedMapping:edit">修改</shiro:hasPermission><shiro:lacksPermission name="apiam:tagRelatedMapping:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tagRelatedMapping" action="${ctx}/apiam/tagRelatedMapping/update" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">标签名称:</label>
			<div class="controls">
				<form:input path="tagName" htmlEscape="false" maxlength="64" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关键词:</label>
			<div class="controls">
				<form:input path="keyword" htmlEscape="false" maxlength="64" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
	
		<div class="control-group">
			<label class="control-label">相关词:</label>
			<div class="controls">
				<form:input path="relatedWord" htmlEscape="false" maxlength="32" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">相关词类型:</label>
			<div class="controls">
				<form:input path="relatedType" htmlEscape="false" maxlength="32" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="apiam:tagRelatedMapping:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>