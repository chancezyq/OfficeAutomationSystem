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
<title>修改文件信息</title>
<style type="text/css">
div.myhidendiv {
	display: none;
}
</style>
<script>
	function updateAcc() {
		if ($(".myhidendiv").css("display") == "none") {
			$(".myhidendiv").show();
		} else {
			$(".myhidendiv").hide();
		}
	};
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var it = $
		{
			sessionScope.messions
		}
		;
		if (it = "" || it == null) {
			$(".myselfdiv").hide();
		} else {
			$(".myselfdiv").show();
		}
	});
</script>
</head>
<body>
	<article class="page-container">
	<form class="form form-horizontal" id="form-article-add"
		action="updateFileinfo.do" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>文件ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly="readonly" class="input-text"
					value="${updatefile.t_fileinfo_id }" id="fileinfoid"
					name="fileinfoid">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>文件名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"
					value="${updatefile.t_fileinfo_name }" id="fileinfoname"
					name="fileinfoname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>文件类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box"> <select id="fileinfotype"
					name="fileinfotype" class="select"
					style="appearance: none; -moz-appearance: none; -webkit-appearance: none; -ms-appearance: none;">
						<option>${updatefile.t_fileinfo_filetypeid }</option>
						<optgroup
							label="该文件类型编号为：${updatefile.t_fileinfo_filetypeid };温馨提示（1：txt文件；2：word文件；3：excel文件）""></optgroup>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"
					value="${updatefile.t_fileinfo_remark }" id="fileinforemark"
					name="fileinforemark">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>创建者：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"
					value="${updatefile.t_fileinfo_owner }" readonly="readonly"
					id="fileowner" name="fileowner">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>修改日期：</label>
			<%
				String datetime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			%>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="updatetime" name="updatetime"
					class="input-text Wdate" readonly="readonly"
					value="<%out.print(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));%>">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>是否已删除：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box"> <select id="ifdelete"
					name="ifdelete" class="select"
					style="appearance: none; -moz-appearance: none; -webkit-appearance: none; -ms-appearance: none;">
						<option>${updatefile.t_fileinfo_ifdelete }</option>
						<optgroup
							label="本次修改文件是否删除编号为：${updatefile.t_fileinfo_ifdelete };温馨提示（1：该文件已删除；2：该文件存在未删除）"></optgroup>
						<option value="1">1</option>
						<option value="2">2</option>
				</select>
				</span>
			</div>
		</div>
		<div class="myselfdiv">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*文件动态信息：</span></label>
				<div class="formControls col-xs-8 col-sm-9">${sessionScope.messions }</div>
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;确定修改&nbsp;&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				如需要对原文件内容进行修改，请点击<span class="c-red">&nbsp;&nbsp;&nbsp;<a
					id="updateAcc" name="updateAcc" href="#"
					onclick="updateAcc();return false">修改原文件内容</a></span>
			</div>
		</div>

	</form>
	</article>
	<!-- 文件附件信息修改部分 -->
	<div class="myhidendiv" id="updateAccessory">

			<article class="page-container"> <
			<form class="form form-horizontal" id="form-article-add" name="form"
				action="updateAccessory.do" method="post">

				<input type="hidden" value="" id="infoid" name="infoid"> <input
					type="hidden" value="" id="fileowner" name="fileowner"> <input
					type="hidden" value="" id="filename" name="filename">


				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span
						class="c-red">*</span>附件修改日期：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="updatetimes" name="updatetimes"
							class="input-text Wdate" readonly="readonly"
							value="<%out.print(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));%>">
					</div>
				</div>

				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input class="btn btn-primary radius" type="submit"
							value="&nbsp;&nbsp;确定修改信息&nbsp;&nbsp;">
					</div>
				</div>
			</form>
			</article>
		
	</div>
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