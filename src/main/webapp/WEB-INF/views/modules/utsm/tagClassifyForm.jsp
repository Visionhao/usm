<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标签分类管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#category").focus();
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
		<li><a href="${ctx}/utsm/tagClassify/list?id=${tagClassify.parent.id}&parentIds=${tagClassify.parentIds}">标签分类列表</a></li>
		<li class="active"><a href="${ctx}/utsm/tagClassify/form?id=${tagClassify.id}&parent.id=${tagClassify.parent.id}">标签分类<shiro:hasPermission name="utsm:tagClassify:edit">${not empty tagClassify.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="utsm:tagClassify:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tagClassify" action="${ctx}/utsm/tagClassify/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		
		<div class="control-group">
			<label class="control-label">分类名称:</label>
			<div class="controls">
				<form:input path="category" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">分类节点:</label>
			<div class="controls">
                <sys:treeselect id="tagClassify" name="parent.id" value="${tagClassify.parent.id}" labelName="tagClassify.category" labelValue="${tagClassify.parent.category}"
					title="分类" url="/utsm/tagClassify/treeData" extId="${tagClassify.id}" cssClass="" />
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">分类描述:</label>
			<div class="controls">
				<form:textarea path="comment" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="utsm:tagClassify:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>