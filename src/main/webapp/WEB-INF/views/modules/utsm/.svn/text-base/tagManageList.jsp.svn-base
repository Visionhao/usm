<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标签管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			function page(n,s){
				if(n) $("#pageNo").val(n);
				if(s) $("#pageSize").val(s);
				$("#searchForm").attr("action","${ctx}/utsm/tagManage/list");
				$("#searchForm").submit();
		    	return false;
			}
	    });
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/utsm/tagManage/list">标签列表</a></li>
		<shiro:hasPermission name="utsm:tagManage:edit"><li><a href="${ctx}/utsm/tagManage/form">标签添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tagManage" action="${ctx}/utsm/tagManage/list" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<%-- <li><label>归属公司：</label><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
				title="公司" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/></li>
			<li><label>登录名：</label><form:input path="loginName" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="clearfix"></li>
			<li><label>归属部门：</label><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
				title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></li> --%>
			<li><label>标签搜索：</label><form:input path="tag" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>标签名称</th><th>标签分类</th><th>标签描述</th><th>标签状态</th><th>创建时间</th><shiro:hasPermission name="utsm:tagManage:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="tagManage">
			<tr>
				<td>${tagManage.tag}</td>
				<td>${tagManage.tagClassify.category}</td>
				<td>${tagManage.comment}</td>
				<td><c:if test="${tagManage.tagStatus=='00'}">启用</c:if><c:if test="${tagManage.tagStatus=='01'}">暂停</c:if></td>
				<td><fmt:formatDate value="${tagManage.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<shiro:hasPermission name="utsm:tagManage:edit"><td>
    				<a href="${ctx}/utsm/tagManage/start?id=${tagManage.id}">启用</a>
    				<a href="${ctx}/utsm/tagManage/pause?id=${tagManage.id}">暂停</a>
    				<a href="${ctx}/utsm/tagManage/form?id=${tagManage.id}">修改</a>
					<a href="${ctx}/utsm/tagManage/delete?id=${tagManage.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>