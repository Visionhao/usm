<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>停用词管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			function page(n,s){
				if(n) $("#pageNo").val(n);
				if(s) $("#pageSize").val(s);
				$("#searchForm").attr("action","${ctx}/apiam/stopWordManage/list");
				$("#searchForm").submit();
		    	return false;
			}
	    });
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/apiam/stopWordManage/list">停用词列表</a></li>
		<shiro:hasPermission name="apiam:stopWordManage:edit"><li><a href="${ctx}/apiam/stopWordManage/form">停用词添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="stopWordManage" action="${ctx}/apiam/stopWordManage/list" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>停用词ID</th><th>停用词</th><th>创建时间</th><shiro:hasPermission name="apiam:stopWordManage:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="stopWordManage">
			<tr>
				<td>${stopWordManage.id}</td>
				<td>${stopWordManage.stopWord}</td>
				<td><fmt:formatDate value="${stopWordManage.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<shiro:hasPermission name="apiam:tagApiManage:edit"><td>
    				<a href="${ctx}/apiam/stopWordManage/form?id=${stopWordManage.id}">修改</a>
					<a href="${ctx}/apiam/stopWordManage/delete?id=${stopWordManage.id}" onclick="return confirmx('确认要删除该停用词吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>