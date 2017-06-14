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
<title>更多公告</title>
<style type="text/css">
changediv {
	display: none;
}

.detailsdiv {
	width: 300px;
	height: 200px;
	position: relative;
	z-index: 99;
	font-size: 12px;
	display: none;
	margin: auto;
}
</style>
<script type="text/javascript">
	function publishes(e) {
		window
				.open(
						"publishDetails.do?publishid=" + e,
						"newwindow",
						"top=200px,left=650px,height=800,width=650,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no")
	}
</script>
</head>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> <a
		href="fowordfromindex.do">首页</a> <span class="c-gray en">&gt;</span>
	公告 <span class="c-gray en">&gt;</span> 更多公告<a
		class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			搜索条件： <input type="text" class="input-text" style="width: 250px"
				placeholder="输入公告名字" id="" name="">
			<button type="submit" class="btn btn-success" id="" name="">
				<i class="Hui-iconfont">&#xe665;</i> 搜公告
			</button>
		</div>

		<div class="mychangediv" id="mychangediv" name="mychangediv">
			<div class="cl pd-5 bg-1 bk-gray mt-20" style="text-align: center;">
				共有公告：<strong>${counts }</strong> 条

			</div>
			<table class="table table-border table-bordered table-bg"
				style="border: 0">
				<thead>
					<tr class="text-c">
						<th width="150">公告类型</th>
						<th width="300">公告标题</th>
						<th width="100">详情</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.publishlist }" var="publishlist">
						<tr class="text-c">
							<c:choose>
								<c:when test="${publishlist.t_messagetype_name=='奖惩消息' }">
									<td style="color: red">${publishlist.t_messagetype_name }</td>
								</c:when>
								<c:when test="${publishlist.t_messagetype_name=='公告消息' }">
									<td style="color: yellow;">${publishlist.t_messagetype_name }</td>
								</c:when>
								<c:otherwise>
									<td>${publishlist.t_messagetype_name }</td>
								</c:otherwise>
							</c:choose>
							<td>${publishlist.t_message_content}</td>
							<td><a href="#" id="${publishlist.t_message_id}"
								onclick="publishes(this.id);return fasle">详情</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
		<script type="text/javascript"
			src="static/h-ui.admin/js/H-ui.admin.js"></script>
		<!--/_footer 作为公共模版分离出去-->

		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript"
			src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
		<script type="text/javascript"
			src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
</body>
</html>