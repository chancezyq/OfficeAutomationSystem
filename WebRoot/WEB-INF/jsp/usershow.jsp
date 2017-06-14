<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
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
<title>显示用户</title>
<script type="text/javascript">
	function del(form) {
		var userids = document.getElementsByName("checkbox");
		var userid="";
		for (var i = 0; i < userids.length; i++) {
			if(userids[i].checked){
				userid+=userids[i].value+",";
			}
			
		}
		window.location.href = "usersdelete.do?ids=" + userid;
	}
</script>
</head>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span>
	用户管理 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<form action="usersearch.do">
			<div class="text-c">
				搜索条件： <input type="text" class="input-text" style="width: 250px"
					placeholder="输入用户名" id="username1" name="username1">
				<button type="submit" class="btn btn-success radius" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜用户
				</button>
			</div>
		</form>


		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:del(this.form)"
				onclick="datadel()" class="btn btn-danger radius"><i
					class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="useradd1.do"
				onclick="member_add('添加用户','member-add.html','','510')"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加用户</a></span> <span class="r">共有数据：<strong><c:out
						value="${page.totalCount }"></c:out></strong> 条
			</span>
		</div>

		<form>
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">ID</th>
							<th width="100">用户名</th>
							<th width="100">所在部门</th>
							<th width="80">性别</th>
							<th width="150">用户角色</th>
							<th width="130">用户状态</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${users }" var="userinfo">
							<tr class="text-c">
								<td><input type="checkbox"
									value="${userinfo.t_userinfo_id }" name="checkbox"></td>
								<td>${userinfo.t_userinfo_id }</td>
								<td>${userinfo.t_userinfo_name }</td>
								<td><c:if test="${userinfo.t_departinfo_id==1 }">
										<c:out value="研发部"></c:out>
									</c:if> <c:if test="${userinfo.t_departinfo_id==2 }">
										<c:out value="销售部"></c:out>
									</c:if> <c:if test="${userinfo.t_departinfo_id==3 }">
										<c:out value="财务部"></c:out>
									</c:if> <c:if test="${userinfo.t_departinfo_id==4 }">
										<c:out value="技术部"></c:out>
									</c:if></td>
								<td>${userinfo.t_userinfo_gender }</td>
								<td><c:if test="${userinfo.t_roleinfo_id==1 }">
										<c:out value="系统管理员"></c:out>
									</c:if> <c:if test="${userinfo.t_roleinfo_id==2 }">
										<c:out value="普通用户"></c:out>
									</c:if></td>
								<td><c:if test="${userinfo.t_userstate_id==1 }">
										<c:out value="正常状态"></c:out>
									</c:if> <c:if test="${userinfo.t_userstate_id==0 }">
										<c:out value="被屏蔽"></c:out>
									</c:if></td>
								<td class="td-manage"><a style="text-decoration: none"
									class="ml-5"
									onClick="change_password('修改用户','change-password.html','10001','600','270')"
									href="userupdate1.do?id=${userinfo.t_userinfo_id }&name=${userinfo.t_userinfo_name }&departid=${userinfo.t_departinfo_id }&gender=${userinfo.t_userinfo_gender }&roleid=${userinfo.t_roleinfo_id }&stateid=${userinfo.t_userstate_id }"
									title="修改用户"><i class="Hui-iconfont">&#xe6df;</i></a> <a
									title="删除" href="userdelete.do?id=${userinfo.t_userinfo_id }"
									onclick="member_del(this,'1')" class="ml-5"
									style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
							</tr>
						</c:forEach>
					</tbody>

					<div align="center">
						<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
							${page.pageNow} 页</font> <a href="myProductPage.do?pageNow=1">首页</a>
						<c:choose>
							<c:when test="${page.pageNow - 1 > 0}">
								<a href="myProductPage.do?pageNow=${page.pageNow - 1}">上一页</a>
							</c:when>
							<c:when test="${page.pageNow - 1 <= 0}">
								<a href="myProductPage.do?pageNow=1">上一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a href="myProductPage.do?pageNow=${page.pageNow}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 < page.totalPageCount}">
								<a href="myProductPage.do?pageNow=${page.pageNow + 1}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
								<a href="myProductPage.do?pageNow=${page.totalPageCount}">下一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a href="myProductPage.do?pageNow=${page.pageNow}">尾页</a>
							</c:when>
							<c:otherwise>
								<a href="myProductPage.do?pageNow=${page.totalPageCount}">尾页</a>
							</c:otherwise>
						</c:choose>
					</div>
				</table>
			</div>
		</form>
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
	<!--  
	<script type="text/javascript">
		$(function() {
			$('.table-sort').dataTable({
				"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
				"bStateSave" : true,//状态保存
				"aoColumnDefs" : [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				{
					"orderable" : false,
					"aTargets" : [ 0, 8, 9 ]
				} // 制定列不参与排序
				]
			});

		});
		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-查看*/
		function member_show(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-停用*/
		function member_stop(obj, id) {
			layer
					.confirm(
							'确认要停用吗？',
							function(index) {
								$
										.ajax({
											type : 'POST',
											url : '',
											dataType : 'json',
											success : function(data) {
												$(obj)
														.parents("tr")
														.find(".td-manage")
														.prepend(
																'<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
												$(obj)
														.parents("tr")
														.find(".td-status")
														.html(
																'<span class="label label-defaunt radius">已停用</span>');
												$(obj).remove();
												layer.msg('已停用!', {
													icon : 5,
													time : 1000
												});
											},
											error : function(data) {
												console.log(data.msg);
											},
										});
							});
		}

		/*用户-启用*/
		function member_start(obj, id) {
			layer
					.confirm(
							'确认要启用吗？',
							function(index) {
								$
										.ajax({
											type : 'POST',
											url : '',
											dataType : 'json',
											success : function(data) {
												$(obj)
														.parents("tr")
														.find(".td-manage")
														.prepend(
																'<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
												$(obj)
														.parents("tr")
														.find(".td-status")
														.html(
																'<span class="label label-success radius">已启用</span>');
												$(obj).remove();
												layer.msg('已启用!', {
													icon : 6,
													time : 1000
												});
											},
											error : function(data) {
												console.log(data.msg);
											},
										});
							});
		}
		/*用户-编辑*/
		function member_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*密码-修改*/
		function change_password(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-删除*/
		function member_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : '',
					dataType : 'json',
					success : function(data) {
						$(obj).parents("tr").remove();
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
	</script>
	-->
</body>
</html>