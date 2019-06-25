<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>学生管理</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>list">学生管理系统 v1.0</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
		<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.username}
				    </a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li>
				    <a href="${pageContext.request.contextPath }/list" class="active">
				      <i class="fa fa-edit fa-fw"></i> 学生管理
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 学生列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">学生管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
			<!-- 根据条件查询 -->
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/findStudentByMultiterm">
					<div class="form-group">
						<label for="studentName">学生名称</label> 
						<input type="text" class="form-control" id="studentName" 
						                   value="${name }" name="name" />
					</div>
					<div class="form-group">
						<label for="studentGenderFrom">性别</label> 
						<select	class="form-control" id="studentGenderFrom" name="gender" >
							<option value="">--请选择--</option>
							<option value="男 ">男</option>
							<option value="女">女</option>
						</select>
					</div>
					<div class="form-group">
						<label for="studentGenderFrom">状态</label> 
						<select	class="form-control" id="studentStatusFrom" name="status" >
							<option value="">--请选择--</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newStudentDialog" onclick="clearstudent()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">学生信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
									<td>name</td>
									<td>age</td>
									<td>gender</td>
									<td>number</td>
									<td>address</td>
									<td>status</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${stuList }" var="item">
								<tr>
												<td>${item.name }</td>
												<td>${item.age }</td>
												<td>${item.gender }</td>	
												<td>${item.number }</td>	
												<td>${item.address }</td>	
												<td>${item.status }</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#studentEditDialog" onclick= "editstudent(${item.id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deletestudent(${item.id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 学生列表查询部分  end-->
</div>
<!-- 创建学生模态框 -->
<div class="modal fade" id="newStudentDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_student_form">
					<input type="hidden" id="new_id" name="id"/>
					<div class="form-group">
						<label for="new_studentName" class="col-sm-2 control-label">
						    name
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_studentName" placeholder="name" name="name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_age" class="col-sm-2 control-label">age</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_age" placeholder="age" name="age" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_gender" class="col-sm-2 control-label">gender</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_gender" placeholder="gender" name="gender" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_number" class="col-sm-2 control-label">number</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_number" placeholder="number" name="number" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_address" class="col-sm-2 control-label">address</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_address" placeholder="address" name="address" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_status" class="col-sm-2 control-label">status</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_status" placeholder="status" name="status" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createstudent()">创建学生</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改学生模态框 -->
<div class="modal fade" id="studentEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_student_form">
					<input type="hidden" id="edit_id" name="id" />
					<div class="form-group">
						<label for="edit_name" class="col-sm-2 control-label">
						    name
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_name" placeholder="name" name="name" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_age" class="col-sm-2 control-label">age</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_age" placeholder="age" name="age" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_gender" class="col-sm-2 control-label">gender</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_gender" placeholder="gender" name="gender" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_number" class="col-sm-2 control-label">number</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_number" placeholder="number" name="number" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">address</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address" placeholder="address" name="address" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_status" class="col-sm-2 control-label">status</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_status" placeholder="status" name="status" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updatestudent()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
//清空新建学生窗口中的数据
	function clearstudent() {
	    $("#new_studentName").val("");
	    $("#new_age").val("")
	    $("#new_gender").val("")
	    $("#new_number").val("")
	    $("#new_address").val("");
	    $("#new_status").val("");
	}
	// 创建学生
	function createstudent() {
	$.post("<%=basePath%>addStudent",
	$("#new_student_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("学生创建成功！");
	            window.location.reload();
	        }else{
	            alert("学生创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的学生信息
	function editstudent(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>stuEdit",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_name").val(data.name);
	            $("#edit_age").val(data.age);
	            $("#edit_gender").val(data.gender);
	            $("#edit_number").val(data.number);
	            $("#edit_address").val(data.address);
	            $("#edit_status").val(data.status);
	        }
	    });
	}
    // 执行修改学生操作
	function updatestudent() {
		$.post("<%=basePath%>stuUpdate",
		$("#edit_student_form").serialize(),function(data){
			if(data =="OK"){
				alert("学生信息更新成功！");
				window.location.reload();
			}else{
				alert("学生信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除学生
	function deletestudent(id) {
	    if(confirm('确实要删除该学生吗?')) {
	$.post("<%=basePath%>stuDel",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("学生删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除学生失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>