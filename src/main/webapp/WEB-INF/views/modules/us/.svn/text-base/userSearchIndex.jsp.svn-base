<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户搜索</title>
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
#recommend_tag{color: #5BC0DE;margin-left: 30%;}

.mid_form{margin-top: 10px;}
.mid_form_div1{width: 102%;height: auto;}
.mid_form_div2{border:1px solid #E5E5E4;width: 100%; height: 36px;}
.mid_div{width: 100%;background-color: #F9FAFA;}
.mid_form_div_common{border:1px solid #E5E5E4; height: 37px;width: 100%}
.mid_form_property{padding-top: 8px;text-align: center;background-color:#3E9FD7;color: white;width: 108px;height: 36px;font-weight: bold;}
#age{padding-top: 8px;text-align: center;width: 108px;height: 36px;margin-left: 30px;}


.inp_div{border:1px solid #E5E5E4;height: 55px;}
.inp_div1{text-align: left;;margin-left: 20px;margin-top: 12px;}
.div_lab{font-weight:normal;}
.div_lab_inp{width: 50px;height: 20px;margin-top: 5px;}
.res_div{border:1px solid #E5E5E4;height: 46px;margin-top: 10px;width: 102%;}
.res_div1{width: 100%;background-color: #F9FAFA;}
.res_div1_lab1{width: 20%;text-align: center;margin-left: 50px;margin-top: 12px;}
.res_div1_lab2{width: 20%;text-align: center;margin-top: 12px;}
.res_div1_lab3{width: 19%;text-align: center;margin-top: 12px;}
.res_div1_lab4{width: 23%;text-align: center;margin-top: 12px;}


.grid_title_div{border:1px solid #E5E5E4;height:47px;margin-top: 10px;width: 102%;}
.grid_title_lab{border: 1px solid #E5E5E4;width: 120px;height: 46px;text-align: center;padding-top: 12px;}
.grid_title_lab1{border: 1px solid #E5E5E4;width: 120px;height: 46px;text-align: center;padding-top: 12px;margin-left: -4px;}
.grid_title_lab2{float: right;background-color:#E7E7E6;width:69px;height: 28px;margin-right: 10px;margin-top: 9px;text-align: center;padding-top: 5px;}
.grid_div{border:1px solid #E5E5E4;height:100%;margin-top: -2px;width: 102%;}

</style>  	

<script type="text/javascript">

//点击属性的更多，显示的下拉选项内容
function searchCriteriaspan(){ 
	if($("#stretch").text()=="更多∨"){
		$("#stretch").text("更多∧");
		$("#ss").show();
		$(".mid_form_div2").animate({height:'72px'});
	}else{
		$("#stretch").text("更多∨");
		$(".mid_form_div2").animate({height:'36px'},"fast",function(){
			$("#ss").hide();
		}); 
	}
}

//标签弹出层
function show(obj,id) {    
    var objDiv = $("#"+id+"");
    $(objDiv).css("display","block");
}

//年龄选择标签
function ageSelect(id){
	var a="";
	var age = "";
	$("#selectsx").html("");
    $('input[type="checkbox"][name="age"]:checked').each(
        function() {
               a=$(this).val();   
               if(a == "少年"){
            	   age = "1";
	               $("#selectsx").append("<label id="+age+" style='border: -4px solid #F9FAFA;background-color: #F9FAFA;width: 85px;margin-right:5px;'>年龄：<span style='color:#3FA0D8'>"+a+"</span><span style='margin-left:10px;color:#3FA0D8;' onclick='closesx("+age+")'>x</span></label>");
               }
               if(a == "青年"){
            	   age = "2";
	               $("#selectsx").append("<label id="+age+" style='border: -4px solid #F9FAFA;background-color: #F9FAFA;width: 85px;margin-right:5px;'>年龄：<span style='color:#3FA0D8'>"+a+"</span><span style='margin-left:10px;color:#3FA0D8;' onclick='closesx("+age+")'>x</span></label>");
               }
               if(a == "中年"){
            	   age = "3";
	               $("#selectsx").append("<label id="+age+" style='border: -4px solid #F9FAFA;background-color: #F9FAFA;width: 85px;margin-right:5px;'>年龄：<span style='color:#3FA0D8'>"+a+"</span><span style='margin-left:10px;color:#3FA0D8;' onclick='closesx("+age+")'>x</span></label>");
               }
               if(a == "老年"){
            	   age = "4";
	               $("#selectsx").append("<label id="+age+" style='border: -4px solid #F9FAFA;background-color: #F9FAFA;width: 85px;margin-right:5px;'>年龄：<span style='color:#3FA0D8'>"+a+"</span><span style='margin-left:10px;color:#3FA0D8;' onclick='closesx("+age+")'>x</span></label>");
               }
        }
    );
    var objDiv = $("#"+id+"");
	$(objDiv).css("display", "none");
}

//关闭选中的标签
function closesx(id){
	var objDiv = $("#"+id+"");
	$(objDiv).remove();
}


//关闭标签弹出层
function closeDiv(id){
	var objDiv = $("#"+id+"");
    $(objDiv).css("display", "none");
}

//全选
function selectAll(){  
	$('input:checkbox').each(function() {
        $(this).attr('checked', true);
	});
} 

//全不选
function cancelSelect(){
	$('input:checkbox').each(function () {
        $(this).attr('checked',false);
	});
}

//页面展示添加新的列
function addShowView(id){
	var a="";
	$(".addcol").remove();
    $('input[type="checkbox"][name="cb"]:checked').each(
        function() {
               a=$(this).val();   
               //$html = $("<th style='text-align: center;'>"+a+"</th>");
               //$html.remove();
               $("#addth").before("<th class='addcol' style='text-align: center;'>"+a+"</th>");
        }
    );
	var objDiv = $("#"+id+"");
	$(objDiv).css("display", "none");
}

</script>
  	
	
</head>
<body class="bady">
<span></span>
	<div class="container">
	<!-- top  start -->
		<div class="row">
			<div class="col-sm-3" style="text-align: center;">
			  	<label class="control-label" id="title_search">用户搜索</label>
			</div>
			<div class="col-sm-7">
			    <input type="text" id="inp_search" class="form-control" placeholder="输入关键字">
			</div>
			<div class="col-sm-2">
			    <input type="button" class="btn btn-primary" value="搜索"/>
			</div>
		</div>
		<div style="margin-left: 24%;" class="col-sm-7"><label class="control-label" style="color: #5BC0DE;">推荐词：<a href="#">更多</a></label> <label class="control-label" id="recommend_tag">推荐标签：<a href="#">更多</a></label></div>
		<br/><br/>
		<!-- top  end -->	
	
		<!-- mid start -->
		<br/>
		<div>所选属性  > <span id="selectsx"></span></div>
		
		<form class="mid_form">
			<div class="mid_form_div1">
				<div class="mid_form_div2">
					<div class="mid_div">
						<label class="mid_form_property">社会属性    ></label>
						<label id="age" class="icon-plus-sign-alt">&nbsp;&nbsp;<a id="t1" onclick="javascript:show(this,'ageDiv');">年龄</a></label>
						<div id="ageDiv" style="position:absolute;display:none;border:1px solid #3F97CA;background:#F1F7FC;width: 250px;height: 150px;margin-top: -12px;margin-left: 142px;overflow: auto;">
							<lable style="margin-left:30px;"><input name="age" type="checkbox" value="少年"/>少年</lable>
							<lable style="margin-left:70px;"><input name="age" type="checkbox" value="青年"/>青年</lable><br/>
							<lable style="margin-left:30px;"><input name="age" type="checkbox" value="中年"/>中年</lable>
							<lable style="margin-left:70px;"><input name="age" type="checkbox" value="老年"/>老年</lable><br/>
							
							<div style="border: 1px solid #3F97CA;width: 100%;margin-bottom: 10px;"></div>
							<div style="margin-left: 5px;width: 30px;height: 20px;float: left;">
							    <input type="button" class="btn btn-primary" value="确定" onclick="ageSelect('ageDiv')"/>
							</div>
							<div style="margin-left: 30px;width: 30px;height: 20px;float: left;">
							    <input type="button" class="btn btn-btn-default" value="关闭" onclick="javascript:closeDiv('ageDiv');"/>
							</div>
							<div style="width: 60px;height: 20px;float: right;margin-left:10px;cursor:pointer;margin-top: 6px;"><a onclick="cancelSelect()">取消选择</a></div>
							<div id="selectAll" style="width: 30px;height: 20px;float: right;cursor:pointer;margin-top: 6px;"><a onclick="selectAll()">全选</a></div>
						</div>
						
						<label style="padding-top: 8px;text-align: center;width: 108px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;性别</label>
						<label style="padding-top: 8px;text-align: center;width: 108px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;民族</label>
						<label style="padding-top: 8px;text-align: center;width: 108px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;政治面貌</label>
						<label style="padding-top: 8px;text-align: center;width: 108px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;归属地</label>
						<label style="padding-top: 8px;text-align: center;width: 108px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;职业类型</label>
						<label id="stretch" style="text-align: center;width: 49px;height: 24px;padding-top: 5px;background-color:#E7E7E6;color:while;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px;" onclick="searchCriteriaspan()">更多∨</label>
						<!-- <button type="button" style="text-align: center;height: 24px;background-color:#E7E7E6;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px; data-toggle="modal" data-target="#myModal">更多   ></button> -->
					</div>
					<div id="ss" style="display: none;" >
						<label id="hide_lab" style="padding-top: 8px;text-align: center;width: 108px;height: 36px;margin-left: 142px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;年龄</label>
						<label style="padding-top: 8px;text-align: center;width: 30px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;性别</label>
						<label style="padding-top: 8px;text-align: center;width: 30px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;民族</label>
						<label style="padding-top: 8px;text-align: center;width: 30px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;政治面貌</label>
						<label style="padding-top: 8px;text-align: center;width: 30px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;归属地</label>
					</div>
				</div> 
				<div class="mid_form_div_common">
					<div class="mid_div">
						<label class="mid_form_property">通讯特征    ></label>
						<label style="padding-top: 8px;text-align: center;width: 100px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;产品需求</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;业务特征</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;消费特征</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;渠道特征</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;终端偏好</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;客户服务评价</label>
						<label style="text-align: center;width: 49px;height: 24px;padding-top: 5px;background-color:#E7E7E6;color:while;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px;" onclick="#">更多   ></label>
						<!-- <button type="button" style="text-align: center;height: 24px;background-color:#E7E7E6;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px; data-toggle="modal" data-target="#myModal">更多   ></button> -->
					</div>
				</div>
				<div class="mid_form_div_common">
					<div class="mid_div">
						<label class="mid_form_property">地理位置    ></label>
						<label style="padding-top: 8px;text-align: center;width: 100px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;交通出行</label>
						<label style="padding-top: 8px;text-align: center;width: 100px;height: 36px;margin-left: 25px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;工作区域</label>
						<label style="padding-top: 8px;text-align: center;width: 100px;height: 36px;margin-left: 25px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;住宅小区</label>
						<label style="padding-top: 8px;text-align: center;width: 100px;height: 36px;margin-left: 25px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;旅游景点</label>
						<label style="padding-top: 8px;text-align: center;width: 100px;height: 36px;margin-left: 25px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;休闲商区</label>
						<label style="text-align: center;width: 49px;height: 24px;padding-top: 5px;background-color:#E7E7E6;color:while;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px;" onclick="#">更多   ></label>
						<!-- <button type="button" style="text-align: center;height: 24px;background-color:#E7E7E6;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px; data-toggle="modal" data-target="#myModal">更多   ></button> -->
					</div>
				</div>
				<div class="mid_form_div_common">
					<div class="mid_div">
						<label class="mid_form_property">兴趣爱好    ></label>
						<label style="padding-top: 8px;text-align: center;width: 100px;height: 36px;margin-left: 30px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;饮食</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;休闲娱乐</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;购物</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;美容</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;运动健身</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;居住</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;投资</label>
						<label style="padding-top: 8px;text-align: center;width: 80px;height: 36px;margin-left: 10px;" class="icon-plus-sign-alt" onclick="">&nbsp;&nbsp;生活服务</label>
						<label style="text-align: center;width: 49px;height: 24px;padding-top: 5px;background-color:#E7E7E6;color:while;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px;" onclick="#">更多   ></label>
						<!-- <button type="button" style="text-align: center;height: 24px;background-color:#E7E7E6;float: right;margin-top: 5px;margin-left: 5px;margin-right: 10px; data-toggle="modal" data-target="#myModal">更多   ></button> -->
					</div>
				</div>
		
				<div class="inp_div">
					<div class="inp_div1">
						<label>指标：</label><label class="div_lab">流量</label>&nbsp;&nbsp;<input type="text" class="div_lab_inp"/><label class="div_lab">&nbsp;&nbsp;MB&nbsp;至&nbsp;&nbsp;</label><input type="text" class="div_lab_inp"/><label class="div_lab">&nbsp;&nbsp;MB</label>
					</div>
				</div>
			</div>
		</form>		
			<div class="res_div">
				<div class="res_div1">
					<label class="res_div1_lab1">原文搜索结果：29797条</label>
					<label class="res_div1_lab2">AND搜索结果：29797条</label>
					<label class="res_div1_lab3">OR搜索结果：29797条</label>
					<label class="res_div1_lab4">语义分析搜索结果：29797条</label>
				</div>
			</div>
			<!-- mid end -->
				
			<!-- end stsrt -->
			<div class="grid_title_div">
				<label class="grid_title_lab" onclick="">通话时长∨</label>
				<label class="grid_title_lab1" onclick="">用户总流量∧</label>
				<label class="grid_title_lab1" onclick="">总出账收入∧</label>
				<label class="grid_title_lab2" onclick=""><span class="icon-upload-alt"></span><label >导出</label></label>
			</div>
				
			<div class="grid_div">
				<table class="table table-hover">
				    <thead>
				      <tr>
				        <th style="text-align: center;">用户编号</th>
				        <th style="text-align: center;">性别</th>
				        <th style="text-align: center;">年龄</th>
				        <th style="text-align: center;">收入层次</th>
				        <th style="text-align: center;">体育</th>
				        <th style="text-align: center;">购物</th>
				        <th style="text-align: center;">通话时长</th>
				        <th style="text-align: center;">用户总流量</th>
				        <th style="text-align: center;">总出账收入</th>
				        <th id="addth"><label class="icon-plus-sign-alt" onclick="javascript:show(this,'viewsx');"></label></th>
				        <div id="viewsx" style="position:absolute;display:none;border:1px solid silver;background:#F1F7FC;width: 250px;height: 150px;margin-top: 27px;margin-left: 681px;overflow: auto;">
				        	<lable style="margin-left:30px;"><input name="cb" type="checkbox" value="少年"/>少年</lable>
							<lable style="margin-left:70px;"><input name="cb" type="checkbox" value="青年"/>青年</lable><br/>
							<lable style="margin-left:30px;"><input name="cb" type="checkbox" value="中年"/>中年</lable>
							<lable style="margin-left:70px;"><input name="cb" type="checkbox" value="老年"/>老年</lable><br/><br/>
							<div style="border: 1px solid #3F97CA;width: 100%;margin-bottom: 10px;"></div>
							<div style="margin-left: 5px;width: 30px;height: 20px;float: left;">
							    <input type="button" class="btn btn-primary" value="确定" onclick="addShowView('viewsx')"/>
							</div>
							<div style="margin-left: 30px;width: 30px;height: 20px;float: left;">
							    <input type="button" class="btn btn-btn-default" value="关闭" onclick="javascript:closeDiv('viewsx');"/>
							</div>
							<div style="width: 60px;height: 20px;float: right;margin-left:10px;cursor:pointer;margin-top: 6px;"><a onclick="cancelSelect()">取消选择</a></div>
							<div id="selectAll" style="width: 30px;height: 20px;float: right;cursor:pointer;margin-top: 6px;"><a onclick="selectAll()">全选</a></div>
						</div>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td style="text-align: center;">25461253</td>
				        <td style="text-align: center;">男</td>
				        <td style="text-align: center;">青年</td>
				        <td style="text-align: center;">20-30万</td>
				        <td style="text-align: center;">篮球</td>
				        <td style="text-align: center;">大乐透</td>
				        <td style="text-align: center;">200分钟</td>
				        <td style="text-align: center;">1024MB</td>
				        <td style="text-align: center;">120元</td>
				        <td style="text-align: center;"></td>
				      </tr>
				      <tr>
				        <td style="text-align: center;">25461253</td>
				        <td style="text-align: center;">男</td>
				        <td style="text-align: center;">青年</td>
				        <td style="text-align: center;">20-30万</td>
				        <td style="text-align: center;">篮球</td>
				        <td style="text-align: center;">大乐透</td>
				        <td style="text-align: center;">200分钟</td>
				        <td style="text-align: center;">1024MB</td>
				        <td style="text-align: center;">120元</td>
				        <td style="text-align: center;"></td>
				      </tr>
				      <tr>
				        <td style="text-align: center;">25461253</td>
				        <td style="text-align: center;">男</td>
				        <td style="text-align: center;">青年</td>
				        <td style="text-align: center;">20-30万</td>
				        <td style="text-align: center;">篮球</td>
				        <td style="text-align: center;">大乐透</td>
				        <td style="text-align: center;">200分钟</td>
				        <td style="text-align: center;">1024MB</td>
				        <td style="text-align: center;">120元</td>
				        <td style="text-align: center;"></td>
				      </tr>
				     
				    </tbody>
				  </table>
			</div>
			<!-- end stsrt -->
	</div>

</body>
</html>