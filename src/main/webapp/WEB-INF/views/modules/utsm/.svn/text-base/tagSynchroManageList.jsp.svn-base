<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户标签数据同步管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			function page(n,s){
				if(n) $("#pageNo").val(n);
				if(s) $("#pageSize").val(s);
				$("#searchForm").attr("action","${ctx}/utsm/tagSynchroManage/list");
				$("#searchForm").submit();
		    	return false;
			}
	    });
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/utsm/tagSynchroManage/list">标签同步管理列表</a></li>
		<%-- <shiro:hasPermission name="utsm:tagManage:edit"><li><a href="${ctx}/utsm/tagManage/form">标签添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="tagSynchroManage" action="${ctx}/utsm/tagSynchroManage/list" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<%-- <ul class="ul-form">
			<li><label>归属公司：</label><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
				title="公司" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/></li>
			<li><label>登录名：</label><form:input path="loginName" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="clearfix"></li>
			<li><label>归属部门：</label><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
				title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></li>
			<li><label>标签搜索：</label><form:input path="tag" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
			<li class="clearfix"></li>
		</ul> --%>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>序号</th><th>同步月份</th><th>标签ID</th><th>标签名</th><th>同步开始时间</th><th>同步结束时间</th><th>同步耗时</th><th>同步状态</th><th>备注</th><th><%-- <shiro:hasPermission name="utsm:tagSynchroManage:edit"> --%>操作<%-- </shiro:hasPermission> --%></th></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="tagSynchroManage">
			<tr>
				<td>${tagSynchroManage.id}</td>
				<td>${tagSynchroManage.synchroMonth}</td>
				<td>${tagSynchroManage.tagId}</td>
				<td>${tagSynchroManage.tag}</td>
				<td><fmt:formatDate value="${tagSynchroManage.synchroStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${tagSynchroManage.synchroEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${tagSynchroManage.createTiem}</td>
				
				<td><c:if test="${tagSynchroManage.status=='00'}">成功</c:if><c:if test="${tagSynchroManage.status=='01'}">失败</c:if><c:if test="${tagSynchroManage.status=='02'}">同步中</c:if></td>
				<%-- <td><fmt:formatDate value="${tagSynchroManage.createTiem}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
				<td>${tagSynchroManage.comment}</td>
				<shiro:hasPermission name="utsm:tagManage:edit"><td>
    				<%-- <a href="${ctx}/utsm/tagSynchroManage/start?id=${tagSynchroManage.id}">重新同步</a> --%>
    				<span>重新同步</span>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>