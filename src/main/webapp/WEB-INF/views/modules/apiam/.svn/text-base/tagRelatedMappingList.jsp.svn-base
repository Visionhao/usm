<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>标签相关词映射</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			function page(n,s){
				if(n) $("#pageNo").val(n);
				if(s) $("#pageSize").val(s);
				$("#searchForm").attr("action","${ctx}/apiam/tagRelatedMapping/list");
				$("#searchForm").submit();
		    	return false;
			}
	    });
		
		/* function adda(tagId,tagName){
			 var url='${ctx}/apiam/tagRelatedMapping/form'; //转向网页的地址; 
	        var name='form';                            //网页名称，可为空; 
	        var iWidth=600;                          //弹出窗口的宽度; 
	        var iHeight=500;                         //弹出窗口的高度; 
	        var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置 
	        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置 
	        window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no');  
			
	        $("#addli").css('display','block');
	        $("#addli").addClass("active");
			$("#listli").removeClass("active");
		} */
		
		//function edit(id,tagId,tagName){
			//window.parent.document.getElementById("officeContent")
			//var url='${ctx}/apiam/tagRelatedMapping/edit?id='+id;                             //转向网页的地址; 
			//$(window.parent.document).find("#officeContent").attr("src",url);
			//location.href=url;
	         /* var name='edit';                            //网页名称，可为空; 
	         var iWidth=600;                          //弹出窗口的宽度; 
	         var iHeight=500;                         //弹出窗口的高度; 
	           //获得窗口的垂直位置 
	         var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
	           //获得窗口的水平位置 
	         var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
	         window.load(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
	          // window.open("AddScfj.aspx", "newWindows", 'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no'); 
		 */
		
		//}
		
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active" id="listli"><a href="${ctx}/apiam/tagRelatedMapping/list">标签相关词映射</a></li>
		<shiro:hasPermission name="apiam:tagRelatedMapping:edit"><li style="display: none;" id="addli"><a href="${ctx}/apiam/tagRelatedMapping/form">相关词添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tagRelatedMapping" action="${ctx}/apiam/tagRelatedMapping/list" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>标签搜索：</label><form:input path="tagName" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>标签名称</th><th>关键词</th><th>相关词</th><th>相关词类型</th><shiro:hasPermission name="apiam:tagRelatedMapping:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="tagRelatedMapping">
			<tr>
				<td style="display: none;"><input id="id" value="${tagRelatedMapping.id}"/></td>
				<td style="display: none;"><input id="tId" value="${tagRelatedMapping.tagId}"/></td>
				<td style="display: none;"><input id="tName" value="${tagRelatedMapping.tagName}"/></td>
				<td>${tagRelatedMapping.tagName}</td>
				<td>${tagRelatedMapping.keyword}</td>
				<td>${tagRelatedMapping.relatedWord}</td>
				<td>${tagRelatedMapping.relatedType}</td>
				<shiro:hasPermission name="apiam:tagRelatedMapping:edit"><td>
					<a href="${ctx}/apiam/tagRelatedMapping/form?tagId=${tagRelatedMapping.tagId}&tagName=${tagRelatedMapping.tagName}">相关词添加</a>
    				<a href="${ctx}/apiam/tagRelatedMapping/edit?id=${tagRelatedMapping.id}">相关词修改</a>
					<a href="${ctx}/apiam/tagRelatedMapping/delete?id=${tagRelatedMapping.id}" onclick="return confirmx('确认要删除该标签的映射关系吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>