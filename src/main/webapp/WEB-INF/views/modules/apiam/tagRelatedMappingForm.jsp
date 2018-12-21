<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>相关词查询添加</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	//获取url后面的参数 
	function GetRequest() { 
		var url = location.search; //获取url中"?"符后的字串 
		var theRequest = new Object(); 
		if (url.indexOf("?") != -1) { 
			var str = url.substr(1); 
			strs = str.split("&"); 
			for(var i = 0; i < strs.length; i ++) { 
				theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]); 
			} 
		} 
		return theRequest; 
	} 
	
	$(document).ready(function() {
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/apiam/tagRelatedMapping/form");
			$("#searchForm").submit();
	    	return false;
		}
		var Request = new Object(); 
		Request = GetRequest(); 
		var tagId,tagName; 
		tagId = Request['tagId']; 
		tagName = Request['tagName']; 
		
		document.getElementById("tagIds").value = tagId;
		document.getElementById("tagNames").value = tagName;
    });
	
	$(document).ready(function() {
		$("#inputForm").validate({
			submitHandler: function(form){
				var Request = new Object(); 
				Request = GetRequest(); 
				var tagId,tagName; 
				tagId = Request['tagId']; 
				tagName = Request['tagName']; 
				
				document.getElementById("tagIds").value = tagId;
				document.getElementById("tagNames").value = tagName;
				var names = document.getElementsByName("relatedWord");            
		        var flag = false ;//标记判断是否选中一个                 
		        /* for(var i=0;i<names.length;i++){  
	                if(names[i].checked){  
	                	 flag = true ;  
	                        loading('正在提交，请稍等...');
							form.submit();
	                 }  
	             }  
	             if(!flag){  
	                alert("请最少选择一项！");  
	                return false ;  
	             }   */
		        var bb = "";  
		        var temp = "";  
		        for ( var i = 0; i < names.length; i++) {  
			        if (names[i].checked) {  
			        	temp = names[i].value;  
			        	bb = bb + "," +temp;  
			        	flag = true ;  
			        }  
		        }  
		        document.getElementById("relatedWord").value = bb.substring(1, bb.length); 
		        
                loading('正在提交，请稍等...');
				form.submit();
		        
		        if(!flag){  
	                alert("请最少选择一项！");  
	                return false ;  
	             }
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
	
	//点击添加按钮出现另一个页面
	function add(){
		$("#addshow").css('display','block');
		$("#addSelect").css('display','none');
	}
	
	$(document).ready(function() {
		$("#keyword").focus();
		$("#inputForms").validate({
			submitHandler: function(form){
				//调用上面的方法获取到的参数
				var Request = new Object(); 
				Request = GetRequest(); 
				var tagid,tagname; 
				tagid = Request['tagId']; 
				tagname = Request['tagName']; 
				document.getElementById("tagId").value = tagid;
				document.getElementById("tagName").value = tagname;
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
		<li><a href="${ctx}/apiam/tagRelatedMapping/list">标签相关词映射</a></li>
		<li class="active"><a href="${ctx}/apiam/tagRelatedMapping/form?tagId=${tagRelatedMapping.tagId}&tagName=${tagRelatedMapping.tagName}">相关词<shiro:hasPermission name="apiam:tagRelatedMapping:edit">添加</shiro:hasPermission><shiro:lacksPermission name="apiam:tagRelatedMapping:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div id="addSelect" style="display: block;">
		<form:form id="searchForm" modelAttribute="tagRelatedMapping" action="${ctx}/apiam/tagRelatedMapping/form?tagId=${tagRelatedMapping.tagId}&tagName=${tagRelatedMapping.tagName}" method="post" class="breadcrumb form-search ">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
			<ul class="ul-form">
				<li><label>搜索：</label><form:input path="relatedWord" htmlEscape="false" maxlength="50" class="input-medium"/></li>
				<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				<li class="btns"><input id="btnSubmit" class="btn btn-primary" value="新增" type="button" onclick="add();"/>
				<li class="clearfix"></li>
			</ul>
		</form:form>
		<sys:message content="${message}"/>
		<form:form id="inputForm" modelAttribute="tagRelatedMapping" action="${ctx}/apiam/tagRelatedMapping/select" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<input type="hidden" id="tagIds" name="tagId" value=""/>
			<input type="hidden" id="tagNames" name="tagName" value=""/>
			<input type="hidden" id="relatedWord"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead><tr><!-- <th>选择</th> --><th>标签名称</th><th>相关词</th><th>相关词</th><th>相关词类型</th></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="tagRelatedMapping">
					<tr>
						<%-- <td><input name="relatedWord" type="checkbox" value="${tagRelatedMapping.relatedWord}"></td> --%>
						<td>${tagRelatedMapping.tagName}</td>
						<td>${tagRelatedMapping.keyword}</td>
						<td>${tagRelatedMapping.relatedWord}</td>
						<td>${tagRelatedMapping.relatedType}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="pagination">${page}</div>
			<div >
					<%-- <shiro:hasPermission name="apiam:tagRelatedMapping:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission> --%>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div> 
	
	<!-- 点击添加按钮出现的页面 -->
	<div id="addshow" style="display: none;">
		<form:form id="inputForms" modelAttribute="tagRelatedMapping" action="${ctx}/apiam/tagRelatedMapping/save" method="post" class="form-horizontal">
			<%-- <form:hidden path="id"/>
			<sys:message content="${message}"/> --%>
			<input type="hidden" id="tagId" name="tagId" value="" />
			<input type="hidden" id="tagName" name="tagName" value="" />
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
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="window.location.href='${ctx}/apiam/tagRelatedMapping/form';location.reload();"/>
			</div>
		</form:form>
	</div>
</body>
</html>