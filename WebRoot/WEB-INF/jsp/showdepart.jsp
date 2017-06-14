<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>角色管理</title>
</head>
<script type="text/javascript">
	
</script>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span>
	角色管理 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray">
			<span class="l"> <a href="javascript:;" id="datadel"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius" href="javascript:;"
				onclick="admin_role_add('添加角色','adddepart.do','800')"><i
					class="Hui-iconfont">&#xe600;</i> 添加部门</a>
			</span> <span class="r">共有数据：<strong>${departcount}</strong> 条
			</span>
		</div>
		<table class="table table-border table-bordered table-hover table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="9">部门管理</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" value="" id="select"></th>
					<th width="40">ID</th>
					<th width="150">部门名称</th>
					<th>机构</th>
					<th width="70">负责人</th>
					<th width="200">联系电话</th>
					<th width="200">移动电话</th>
					<th width="180">传真</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${listDepartPojo}" var="list">
					<tr class="text-c">
						<td><input type="checkbox" value="${list.t_departinfo_id}"
							name="items"></td>
						<td>${list.t_departinfo_id}</td>
						<td>${list.t_departinfo_name}</td>
						<td>${list.t_branchinfo_name}</td>
						<td>${list.t_userinfo_name}</td>
						<td>${list.t_departinfo_tel}</td>
						<td>${list.t_departinfo_mobiletel}</td>
						<td>${list.t_departinfo_faxes}</td>
						<td class="f-14"><a title="编辑" href="javascript:;"
							onclick="admin_role_edit('部门编辑','updatedepart.do?id=${list.t_departinfo_id}','4')"
							style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a title="删除" href="javascript:;" id="${list.t_departinfo_id}"
							onclick="admin_role_del(this,'1')" class="ml-5"
							style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		/*管理员-角色-添加*/
		function admin_role_add(title, url, w, h) {
			layer_show(title, url, w, h);

		}
		/*管理员-角色-编辑*/
		function admin_role_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);

		}
		/*管理员-角色-删除*/
		function admin_role_del(obj, id) {
			layer.confirm('部门删除须谨慎，确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : 'delete.do',
					data : {
						"departid" : obj.id
					},
					success : function(data) {
						window.location.reload();//本页面刷新
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}
		$(function() {
			$("#select").click(function() {
				if ($(this).attr("checked")) {
					$("input[name=items]").each(function() {
						$(this).attr("checked", false);
					});
				} else {
					$("input[name=items]").each(function() {
						$(this).attr("checked", true);
					});
				}
			});
			//得到选中的值，ajax操作使用  
			$("#datadel").click(function() {
				var text = "";
				$("input[name=items]").each(function() {
					if ($(this).attr("checked")) {
						text += "," + $(this).val();
					}
				});
				layer.confirm('部门删除须谨慎，确认要删除吗？', function(index) {
					$.ajax({
						type : 'POST',
						url : 'deleteAll.do',
						data : {
							"text" : text
						},
						success : function(data) {
							window.location.reload();//本页面刷新
							layer.msg('已删除!', {
								icon : 1,
								time : 1000
							});
						},
						error : function(data) {
							console.log(data.msg);
						},
					});
				});
			});
		});
	</script>
</body>
</html>