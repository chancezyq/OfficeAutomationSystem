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
<title>我的日程</title>

</head>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 日程管理 <span class="c-gray en">&gt;</span>
	部门日程 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			搜索条件： <input type="text" class="input-text" style="width: 250px"
				placeholder="输入日程名字" id="" name="">
			<button type="submit" class="btn btn-success" id="" name="">
				<i class="Hui-iconfont">&#xe665;</i> 搜日程
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a href="addmyscheduleforword.do?count=${schedulecount}"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加日程</a></span> <span class="r">共有日程：<strong>${schedulecount}</strong> 条
			</span>
		</div>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="18"><center>日程列表</center></th>
				</tr>
				<tr class="text-c">
					<th width="25">&nbsp;</th>
					<th width="50">日程ID</th>
					<th width="50">部门ID</th>
					<th width="100">日程标题</th>
					<th width="100">会议地址</th>
					<th width="30">会议类型</th>
					<th width="160">日程开始时间</th>
					<th width="160">日程结束时间</th>
					<th width="200">日程内容</th>
					<th width="60">创建者</th>
					<th width="160">创建时间</th>
					<th width="30">是否私有</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${myschedulelist}" var="myschedules">
					<tr class="text-c">
						<td><input type="checkbox"
							value="${myschedules.t_schedule_id }" name=""></td>
						<td>${myschedules.t_schedule_id }</td>
						<td>${myschedules.t_departinfo_id }</td>
						<td>${myschedules.t_schedule_title }</td>
						<td>${myschedules.t_schedule_address }</td>
						<td>${myschedules.t_meetinginfo_id }</td>
						<td>${myschedules.t_schedule_begintime }</td>
						<td>${myschedules.t_schedule_endtime }</td>
						<td>${myschedules.t_schedule_content }</td>
						<td>${myschedules.t_schedule_createuser }</td>
						<td>${myschedules.t_schedule_createtime }</td>
						<td>${myschedules.t_schedule_ifprivate }</td>
						<td class="td-manage"><a title="编辑"
							href="selectupdate.do?myscheduleid=${myschedules.t_schedule_id }"
							class="ml-5" style="text-decoration: none"><i
								class="Hui-iconfont">&#xe6df;</i></a>&nbsp; <a title="删除"
							href="DeleteMySchedule.do?myscheduleid=${myschedules.t_schedule_id }"
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