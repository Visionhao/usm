<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>推荐效果测试</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.bootcss.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.8.3.min.js"></script>

<style type="text/css">
.body{font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;}
#title_search{font-size: 25px;color: #5BC0DE;margin-top: 5px;}
#inp_search{height: 32px;float: left;width: 100%;}
</style>  	

<script type="text/javascript">
	 function search(){
		 var val = $("#inp_search").val();
		 
	 }
</script>
</head>
<body class="bady">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/apiam/recommendEffectTest/index">推荐效果测试</a></li>
	</ul>
	<br/>
	<div class="container">
		<div class="row">
			<div class="col-sm-3" style="text-align: center;">
			  	<label class="control-label" id="title_search">输入测试关键字：</label>
			</div>
			<div class="col-sm-7">
			    <input type="text" id="inp_search" class="form-control" placeholder="输入关键字"/>
			</div>
			<div class="col-sm-2">
			    <input type="button" class="btn btn-primary" value="搜索" onclick="search()"/>
			</div>
		</div>	
		<div style="border: 1px solid #3F97CA;width: 100%;margin-bottom: 10px;"></div>
		<label><label style="text-align: right;width: 85px;">分词结果：</label><span style="color: red;">&nbsp;&nbsp;倚天，屠龙记</span></label>
		<br/>
		<div style="border: 1px solid #3F97CA;width: 100%;margin-bottom: 10px;"></div>
		<label><label style="text-align: right;width: 85px;">相关词结果：</label><span style="color: red;">&nbsp;&nbsp;倚天屠龙记，历史，小说，屠龙记，文化，背景，金庸，题材，倚天</span></label>
		<br/>
		<div style="border: 1px solid #3F97CA;width: 100%;margin-bottom: 10px;"></div>
		<div style="width: 100%">
			<div style="width: 85px;float: left;">
				<label style="text-align: right;width: 85px;">推荐标签：</label>
				<!-- 封装好遍历的内容，后台传值过来 -->
				<%-- <table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead><tr><th>标签名称</th><th>关键词</th><th>相关词</th><th>相关词类型</th><shiro:hasPermission name="apiam:tagRelatedMapping:edit"><th>操作</th></shiro:hasPermission></tr></thead>
					<tbody>
					<c:forEach items="${page.list}" var="tagRelatedMapping">
						<tr>
							<td>${tagRelatedMapping.relatedType}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table> --%>
			</div>
			<div style="width: 90%;float: right;">	
				<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead><tr><th>标签ID</th><th>标签名称</th><th>相关度</th><th>本标签预先识别的相关词</th></tr></thead>
					<tbody>
					<%-- <c:forEach items="" var=""> --%>
						<tr>
							<td>F311093</td>
							<td>历史爱好者</td>
							<td>2.074529</td>
							<td>历史，爱好者，世界</td>
						</tr>
					<%-- </c:forEach> --%>
					</tbody>
				</table>
				
				<!-- <div class="table table-striped table-bordered table-hover table-condensed">
				  <div class="col-sm-2">标签ID</div>
				  <div class="col-sm-2">标签名称</div>
				  <div class="col-sm-2">相关度</div>
				  <div class="col-sm-6">本标签预先识别的相关词</div>
				</div>
				<div class="table table-striped table-bordered table-hover table-condensed">
				  <div class="col-sm-2">F311093</div>
				  <div class="col-sm-2">历史爱好者</div>
				  <div class="col-sm-2">2.074529</div>
				  <div class="col-sm-6">历史，爱好者，世界</div>
				</div> -->
			</div>
		</div>
	</div>
</body>
</html>