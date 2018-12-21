<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标签分类管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			/* var date  =  new Date();
			var seperator1 = "-"; 
		    var seperator2 = ":"; 
		    var month = date.getMonth() + 1; 
		    var strDate = date.getDate(); 
		    if (month >= 1 && month <= 9) { 
		        month = "0" + month; 
		    } 
		    if (strDate >= 0 && strDate <= 9) { 
		        strDate = "0" + strDate; 
		    } 

			var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate 
            + " " + date.getHours() + seperator2 + date.getMinutes() 
            + seperator2 + date.getSeconds(); 
			alert(currentdate); */
			
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, rootId = "${not empty tagClassify.id ? tagClassify.id : '0'}";
			addRow("#treeTableList", tpl, data, rootId, true);
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('us_tag_category_type'))}, row.type)
						}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/utsm/tagClassify/list?id=${tagClassify.id}&parentIds=${tagClassify.parentIds}">标签分类列表</a></li>
		<shiro:hasPermission name="utsm:tagClassify:edit"><li><a href="${ctx}/utsm/tagClassify/form?parent.id=${tagClassify.id}">标签分类添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>标签分类名称</th><th>分类描述</th><th>创建时间</th><shiro:hasPermission name="utsm:tagClassify:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td><a href="${ctx}/utsm/tagClassify/form?id={{row.id}}">{{row.category}}</a></td>
			<td>{{row.comment}}</td>
			<td>{{row.createTime}}</td>
			<shiro:hasPermission name="utsm:tagClassify:edit"><td>
				<a href="${ctx}/utsm/tagClassify/form?id={{row.id}}">修改</a>
				<a href="${ctx}/utsm/tagClassify/delete?id={{row.id}}" onclick="return confirmx('要删除该分类及所有子分类项吗？', this.href)">删除</a>
				<a href="${ctx}/utsm/tagClassify/form?parent.id={{row.id}}">添加下属分类</a> 
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>