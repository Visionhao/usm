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
		<li class="active"><a href="${ctx}/utsm/tagManage/info">标签修改</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tagManage" action="${ctx}/utsm/tagManage/info" method="post" class="form-horizontal"><%--
		<form:hidden path="email" htmlEscape="false" maxlength="255" class="input-xlarge"/>
		<sys:ckfinder input="email" type="files" uploadPath="/mytask" selectMultiple="false"/> --%>
		<sys:message content="${message}"/>
		
		<div class="control-group">
			<label class="control-label">标签名:</label>
			<div class="controls">
				<form:input path="tag" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签描述:</label>
			<div class="controls">
				<form:textarea path="comment" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签分类:</label>
			<div class="controls">
                <%-- <sys:treeselect id="tagClassify" name="tagClassify.id" value="${tagManage.tagClassify.id}" labelName="tagClassify.name" labelValue="${tagManage.tagClassify.name}"
					title="标签" url="/utsm/tagClassify/treeData" cssClass="required" /> --%>
					<label class="lbl">${tagManage.tagClassify.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签接口方式:</label>
			<div class="controls">
				<span><form:radiobutton path="connect_type" htmlEscape="false" maxlength="50" class="required" value="FTP"/>FTP</span>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接口机IP:</label>
			<div class="controls">
				<form:input path="connect_ip" htmlEscape="false" maxlength="50" class="required"  />
				<span class="help-inline"><font color="red">*</font> </span>
				<%-- <form:radiobutton path="roleIdList" items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false" class="required"/> --%>
				<!-- <span class="help-inline"><font color="red">*</font> </span> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">接口机端口:</label>
			<div class="controls">
				<form:input path="connect_port" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">FTP连接帐户:</label>
			<div class="controls">
				<form:input path="connect_user" htmlEscape="false" maxlength="50" class="required userName"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">FTP连接密码:</label>
			<div class="controls">
				<input id="connect_password" name="connect_password" type="password"  maxlength="50" minlength="3" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">FTP文件目录:</label>
			<div class="controls">
				<form:input path="connect_file_path" htmlEscape="false" maxlength="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">月标签文件命名规范:</label>
			<div class="controls">
				<form:input path="month_tag_name_rule" htmlEscape="false" maxlength="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签同步频率:</label>
			<div class="controls">
				<span><form:radiobutton path="synchro_frequency" htmlEscape="false" maxlength="50" class="required" value="月同步"/>月同步</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签同步日期:</label>
			<div class="controls">
				<span>每月<form:input path="synchro_date" htmlEscape="false" maxlength="100"/>号</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签数据更新方式:</label>
			<div class="controls">
				<span><form:radiobutton path="update_type" htmlEscape="false" maxlength="50" class="required" value="全量覆盖"/>全量覆盖</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签显示中文名称:</label>
			<div class="controls">
				<form:input path="tag_show_name" htmlEscape="false" maxlength="100" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签字段名:</label>
			<div class="controls">
				<form:input path="tag_column_name" htmlEscape="false" maxlength="100" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签字段取值类型:</label>
			<div class="controls">
				<form:input path="tag_column_datatype" htmlEscape="false" maxlength="100" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签字段长度:</label>
			<div class="controls">
				<form:input path="tag_column_length" htmlEscape="false" maxlength="100" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">同步类型:</label>
			<div class="controls">
				<span><form:radiobutton path="synchro_type" htmlEscape="false" maxlength="50" class="required" value="定时同步"/>定时同步</span>
			</div>
		</div>
		
		<%-- <div class="control-group">
			<label class="control-label">归属公司:</label>
			<div class="controls">
				<label class="lbl">${user.company.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属部门:</label>
			<div class="controls">
				<label class="lbl">${user.office.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱:</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="50" class="email"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话:</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机:</label>
			<div class="controls">
				<form:input path="mobile" htmlEscape="false" maxlength="50"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户类型:</label>
			<div class="controls">
				<label class="lbl">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户角色:</label>
			<div class="controls">
				<label class="lbl">${user.roleNames}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上次登录:</label>
			<div class="controls">
				<label class="lbl">IP: ${user.oldLoginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></label>
			</div>
		</div> --%>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
		</div>
	</form:form>
</body>
</html>