<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>问题反馈</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			function page(n,s){
				if(n) $("#pageNo").val(n);
				if(s) $("#pageSize").val(s);
				$("#searchForm").attr("action","${ctx}/apiam/questionFeedback/list");
				$("#searchForm").submit();
		    	return false;
			}
	    });
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/apiam/questionFeedback/list">问题反馈列表</a></li>
		<shiro:hasPermission name="apiam:questionFeedback:save"><li><a href="${ctx}/apiam/questionFeedback/form">问题添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="questionFeedback" action="${ctx}/apiam/questionFeedback/list" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>问题内容</th><th>提出人</th><th>问题时间</th><th>回复人</th><th>回复内容</th><th>回复时间</th><shiro:hasPermission name="apiam:questionFeedback:view"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="questionFeedback">
			<tr>
				<td>${questionFeedback.content}</td>
				<td>${questionFeedback.name}</td>
				<td><fmt:formatDate value="${questionFeedback.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${questionFeedback.reUser.name}</td>
				<td>${questionFeedback.reContent}</td>
				<td><fmt:formatDate value="${questionFeedback.reDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<shiro:hasPermission name="apiam:questionFeedback:view"><td>
    				<a href="${ctx}/apiam/questionFeedback/edit?id=${questionFeedback.id}">修改</a>
					<a href="${ctx}/apiam/questionFeedback/delete?id=${questionFeedback.id}" onclick="return confirmx('确认要删除该问题吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>