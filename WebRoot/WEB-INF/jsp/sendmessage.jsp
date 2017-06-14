<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
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
<!--/meta 作为公共模版分离出去-->

<title>发送消息</title>
</head>
<body>
	<article class="page-container">
	<form class="form form-horizontal" id="form-article-add"
		action="sendMessages.do" method="post">
		<input type="hidden" value="${messagenumber+1 }" id="messageid"
			name="messageid">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>消息标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="Title"
					id="messagetitle" name="messagetitle">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">消息内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="messagecontent" name="messagecontent" cols="" rows="" class="textarea"
					placeholder="请在这里添加消息的详细内容" onKeyUp="$.Huitextarealength(this,100)"></textarea>
				<p class="textarea-numberbar">
					<em class="textarea-length">0</em>/100
				</p>
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>消息类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box"> <select id="messagetype"
					name="messagetype" class="select"
					style="appearance: none; -moz-appearance: none; -webkit-appearance: none; -ms-appearance: none;">
						<c:forEach items="${messatypelist }" var="messatypelist">
							<option value="${messatypelist.t_messagetype_id }">${messatypelist.t_messagetype_name }</option>
						</c:forEach>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>开始有效时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" placeholder="BeginTime"
					onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'commentdatemin\')}' })"
					id="commentdatemin" name="commentdatemin" class="input-text Wdate">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>有效结束时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" placeholder="EndTime"
					onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'commentdatemax\')}' })"
					id="commentdatemax" name="commentdatemax" class="input-text Wdate">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>发送者：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"
					value="${sessionScope.username }" readonly="readonly"
					id="createuser" name="createuser">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>是否发布：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box"> <select id="ifpublish"
					name="ifpublish" class="select"
					style="appearance: none; -moz-appearance: none; -webkit-appearance: none; -ms-appearance: none;">
						<optgroup label="温馨提示：1 表示消息发布；2 表示消息不发布。请选择："></optgroup>
						<option value="1">1</option>
						<option value="2">2</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>发送时间：</label>
			<%
				String datetime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			%>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="sendtime" name="sendtime"
					class="input-text Wdate" readonly="readonly"
					value="<%out.print(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));%>">
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;发送消息&nbsp;&nbsp;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					class="btn btn-primary radius" type="reset"
					value="&nbsp;&nbsp;重置消息&nbsp;&nbsp;">
			</div>
		</div>
	</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript"
		src="lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript"
		src="lib/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript"
		src="lib/ueditor/1.4.3/ueditor.all.min.js"></script>
	<script type="text/javascript"
		src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>