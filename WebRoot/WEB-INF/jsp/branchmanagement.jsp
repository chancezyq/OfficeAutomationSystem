<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<title>机构列表</title>

</head>
<body>

	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 人事管理 <span class="c-gray en">&gt;</span>
	机构管理 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<form action="searchBranch.do" metod="post">
			<div class="text-c">
				搜索条件： <input type="text" class="input-text" style="width: 250px"
					placeholder="输入机构名称" id="searchbranch" name="searchbranch">
				<button type="submit" class="btn btn-success">
					<i class="Hui-iconfont">&#xe665;</i> 搜机构
				</button>
			</div>
		</form>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="#" onclick="alldelete();return false"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>批量删除</a>
				<a href="addbranch.do" class="btn btn-primary radius"><i
					class="Hui-iconfont">&#xe600;</i> 添加机构</a></span> <span class="r">共有数据：<strong>${count }</strong>
				条
			</span>
		</div>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="9">机构列表</th>
				</tr>
				<tr class="text-c">
					<th width="25">&nbsp;</th>
					<th width="40">机构ID</th>
					<th width="300">机构名称</th>
					<th width="150">机构简称</th>
					<th width="130">加入时间</th>
					<th width="100">是否已启用</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${branchmanagement}" var="branchs">
					<tr class="text-c">
						<td><input type="checkbox"
							value="${branchs.t_branchinfo_id }" name="checkid" id="checkid"></td>
						<td>${branchs.t_branchinfo_id }</td>
						<td>${branchs.t_branchinfo_name }</td>
						<td>${branchs.t_branchinfo_shortname }</td>
						<%
							String datetime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
						%>
						<td>
							<%
								out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
							%>
						</td>
						<td class="td-status"><span
							class="label label-success radius">已启用</span></td>
						<td class="td-manage"><a style="text-decoration: none"
							onClick="admin_stop(this,'10001')" href="javascript:;" title="停用"><i
								class="Hui-iconfont">&#xe631;</i></a> <a title="编辑"
							href="updatebranch.do?id=${branchs.t_branchinfo_id }&name=${branchs.t_branchinfo_name }&shortname=${branchs.t_branchinfo_shortname }"
							onclick="updatebranch(id,name,shortname)" class="ml-5"
							style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a title="删除"
							href="DeleteBranch.do?branchid=${branchs.t_branchinfo_id }"
							class="ml-5" style="text-decoration: none"><i
								class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 分页功能 start -->
		<div align="right">
			<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
				${page.pageNow} 页</font> <a href="branch_management.do?pageNow=1">首页</a>
			<c:choose>
				<c:when test="${page.pageNow - 1 > 0}">
					<a href="branch_management.do?pageNow=${page.pageNow - 1}">上一页</a>
				</c:when>
				<c:when test="${page.pageNow - 1 <= 0}">
					<a href="branch_management.do?pageNow=1">上一页</a>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${page.totalPageCount==0}">
					<a href="branch_management.do?pageNow=${page.pageNow}">下一页</a>
				</c:when>
				<c:when test="${page.pageNow + 1 < page.totalPageCount}">
					<a href="branch_management.do?pageNow=${page.pageNow + 1}">下一页</a>
				</c:when>
				<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
					<a href="branch_management.do?pageNow=${page.totalPageCount}">下一页</a>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${page.totalPageCount==0}">
					<a href="branch_management.do?pageNow=${page.pageNow}">尾页</a>
				</c:when>
				<c:otherwise>
					<a href="branch_management.do?pageNow=${page.totalPageCount}">尾页</a>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 分页功能 End -->
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
		var array = [];
		var string="";
		function alldelete() {
			$("input[name='checkid']:checkbox:checked").each(function() {
				array.push($(this).val());
			})
			location.href = "deleteAllBranch.do?branchid=" + array;
		}
	</script>
	<script type="text/javascript">
		/*
		 参数解释：
		 title	标题
		 url		请求的url
		 id		需要操作的数据id
		 w		弹出层宽度（缺省调默认值）
		 h		弹出层高度（缺省调默认值）
		 */

		/*机构-修改*/

		/*机构-添加*/
		function branch_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*机构删除-删除*/
		function branch_del(obj, id) {
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

		//停用、启用功能有时间再制作
		/*机构-编辑*/
		function admin_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*机构-停用*/
		function admin_stop(obj, id) {
			layer
					.confirm(
							'确认要停用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……

								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-default radius">已禁用</span>');
								$(obj).remove();
								layer.msg('已停用!', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*管理员-启用*/
		function admin_start(obj, id) {
			layer
					.confirm(
							'确认要启用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……

								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
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
							});
		}
	</script>
</body>
</html>