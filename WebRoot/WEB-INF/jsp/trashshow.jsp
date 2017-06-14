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
<title>文件信息</title>

</head>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 文件管理 <span class="c-gray en">&gt;</span>
	文件列表 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<form action="filesearch.do">
			<div class="text-c">
				搜索条件： <input type="text" class="input-text" style="width: 250px"
					placeholder="输入文件名字" id="filename" name="filename">
				<button type="submit" class="btn btn-success" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜文件
				</button>
			</div>
		</form>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> </span> <span class="r">共有文件数：<strong>${count }</strong>
			</span>
		</div>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="18"><center>文件信息列表</center></th>
				</tr>
				<tr class="text-c">
					<th width="25">&nbsp;</th>
					<th width="50">文件ID</th>
					<th width="60">文件名称</th>
					<th width="80">创建者</th>
					<th width="80">创建时间</th>
					<th width="80">文件类型</th>
					<th width="50">文件是否删除</th>
					<th width="60">文件详情</th>
					<th width="120">备注</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${showfilelist}" var="showfilelist">
					<tr class="text-c">
						<td><input type="checkbox"
							value="${showfilelist.t_fileinfo_id }" name=""></td>
						<td>${showfilelist.t_fileinfo_id }</td>
						<td><a
							href="filedownload.do?filepath=${showfilelist.t_fileinfo_filepath }&filename=${showfilelist.t_fileinfo_name } "
							id="${showfilelist.t_fileinfo_id }" onclick="lookfile(this.id)">${showfilelist.t_fileinfo_name }</a></td>
						<td>${showfilelist.t_fileinfo_owner }</td>
						<td>${showfilelist.t_fileinfo_createdate }</td>
						<td><img src="${showfilelist.t_filetypeinfo_image}"
							width="30" height="30" border="1" alt="网络加载失败"><br>${showfilelist.t_filetypeinfo_name }</td>
						<td>${showfilelist.t_fileinfo_ifdelete }</td>
						<td><a href="${showfilelist.t_fileinfo_filepath}"
							id="${showfilelist.t_fileinfo_id }" onclick="lookfile(this.id)">详情</a></td>
						<td>${showfilelist.t_fileinfo_remark }</td>
						<td class="td-manage">&nbsp;<a style="text-decoration: none"
							onClick="member_stop(this,'10001')"
							href="canceldelete.do?filepath=${showfilelist.t_fileinfo_filepath }&fileinfoid=${showfilelist.t_fileinfo_id}&ifdelete=${showfilelist.t_fileinfo_ifdelete }"
							title="撤销删除"><i class="Hui-iconfont">&#xe631;</i></a> <a
							title="测底删除"
							href="filedelete.do?filepath=${showfilelist.t_fileinfo_filepath }&fileinfoid=${showfilelist.t_fileinfo_id}&ifdelete=${showfilelist.t_fileinfo_ifdelete }"
							class="ml-5" style="text-decoration: none"><i
								class="Hui-iconfont">&#xe6e2;</i></a></td>
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
</body>
</html>