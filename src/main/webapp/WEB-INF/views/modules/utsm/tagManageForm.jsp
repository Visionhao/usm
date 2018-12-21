<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标签管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#tag").focus();
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
		<li><a href="${ctx}/utsm/tagManage/list">标签列表</a></li>
		<li class="active"><a href="${ctx}/utsm/tagManage/form?id=${tagManage.id}">标签<shiro:hasPermission name="utsm:tagManage:edit">${not empty tagManage.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="utsm:tagManage:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tagManage" action="${ctx}/utsm/tagManage/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		
		<div class="control-group">
			<label class="control-label">标签名:</label>
			<div class="controls">
				<form:input path="tag" htmlEscape="false" maxlength="64" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签描述:</label>
			<div class="controls">
				<form:textarea path="comment" htmlEscape="false" rows="3" maxlength="1000" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属分类:</label>
			<div class="controls">
                <sys:treeselect id="tagClassify" name="tagClassify.id" value="${tagManage.tagClassify.id}" labelName="tagManage.tagClassify.category" labelValue="${tagManage.tagClassify.category}"
					title="标签" url="/utsm/tagClassify/treeData" cssClass="required" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签接口方式:</label>
			<div class="controls">
				<%-- <span><form:radiobutton path="connectType" htmlEscape="false" maxlength="32" class="required" value="FTP"/>FTP</span> --%>
				<form:radiobuttons path="connectType" items="${fns:getDictList('connect_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接口机IP:</label>
			<div class="controls">
				<form:input path="connectIp" htmlEscape="false" maxlength="32" class="required"  />
				<span class="help-inline"><font color="red">*</font> </span>
				<%-- <form:radiobutton path="roleIdList" items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false" class="required"/> --%>
				<!-- <span class="help-inline"><font color="red">*</font> </span> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接口机端口:</label>
			<div class="controls">
				<form:input path="connectPort" htmlEscape="false" maxlength="32" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">FTP连接帐户:</label>
			<div class="controls">
				<form:input path="connectUser" htmlEscape="false" maxlength="32" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">FTP连接密码:</label>
			<div class="controls">
				<input id="connectPassword" name="connectPassword" type="password"  maxlength="32"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">FTP文件目录:</label>
			<div class="controls">
				<form:input path="connectFilePath" htmlEscape="false" maxlength="256"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">月标签文件命名规范:</label>
			<div class="controls">
				<form:input path="monthTagNameRule" htmlEscape="false" maxlength="64"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签同步频率:</label>
			<div class="controls">
				<form:radiobuttons path="synchroFrequency" items="${fns:getDictList('synchro_frequency')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<%-- <span><form:radiobutton path="synchroFrequency" htmlEscape="false" maxlength="32" class="required" value="月同步"/>月同步</span> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签同步日期:</label>
			<div class="controls">
				<span>每月<form:input path="synchroDate" htmlEscape="false" maxlength="32"/>号</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签数据更新方式:</label>
			<div class="controls">
				<form:radiobuttons path="updateType" items="${fns:getDictList('update_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<%-- <span><form:radiobutton path="updateType" htmlEscape="false" maxlength="32" class="required" value="全量覆盖"/>全量覆盖</span> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签显示中文名称:</label>
			<div class="controls">
				<form:input path="tagShowName" htmlEscape="false" maxlength="64" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签字段名:</label>
			<div class="controls">
				<form:input path="tagColumnName" htmlEscape="false" maxlength="64" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签字段取值类型:</label>
			<div class="controls">
				<form:radiobuttons path="tagColumnDatatype" items="${fns:getDictList('tag_column_datatype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<%-- <form:input path="tagColumnDatatype" htmlEscape="false" maxlength="32" /> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签字段长度:</label>
			<div class="controls">
				<form:input path="tagColumnLength" htmlEscape="false" maxlength="11" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">同步类型:</label>
			<div class="controls">
				<form:radiobuttons path="synchroType" items="${fns:getDictList('synchro_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				<span class="help-inline"><font color="red">*</font> </span>
				<%-- <span><form:radiobutton path="synchroType" htmlEscape="false" maxlength="32" class="required" value="定时同步"/>定时同步</span> --%>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="utsm:tagManage:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>