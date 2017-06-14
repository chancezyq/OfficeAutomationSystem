<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
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
<title>公告详情</title>
</head>
<body>
	<center>
		<div class="pd-20">
			<table class="table">
				<tbody>
					<tr>
						<th class="text-r" width="80">公告标题：</th>
						<td>${publishes.t_message_title }</td>
					</tr>
					<tr>
						<th class="text-r">公告内容：</th>
						<td>${publishes.t_message_content }</td>
					</tr>
					<tr>
						<th class="text-r">公告类型：</th>
						<td>${publishes.t_messagetype_name }</td>
					</tr>
					<tr>
						<th class="text-r">有效开始时间：</th>
						<td>${publishes.t_message_begintime }</td>
					</tr>
					<tr>
						<th class="text-r">有效结束时间：</th>
						<td>${publishes.t_message_endtime }</td>
					</tr>
					<tr>
						<th class="text-r">发布者：</th>
						<td>${publishes.t_userinfo_name }</td>
					</tr>
					<tr>
						<th class="text-r">发布时间：</th>
						<td>${publishes.t_message_recordtime }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</center>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
</body>
</html>