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

<title>修改部门 - 管理员管理 - H-ui.admin v3.0</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="page-container">
	<form action="update.do" method="post" class="form form-horizontal"
		id="lcform">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>部门名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" readonly="true"
					value="${departPojo.t_departinfo_name}" placeholder=""
					id="roleName" name="departName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">机构名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" readonly="true" class="input-text"
					value="${departPojo.t_branchinfo_name}" placeholder="" id=""
					name="branchname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>修改机构：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<c:forEach items="${branchBean}" var="list">
					<div class="radio-box">
						<input type="radio" value="${list.t_branchinfo_id}"
							name="branchId" id="branch"> <label for="sex">${list.t_branchinfo_name}</label>
					</div>
				</c:forEach>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">负责人：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" readonly="true" class="input-text"
						value="${departPojo.t_userinfo_name}" placeholder="" id=""
						name="userName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>修改负责人：</label>
				<div class="formControls col-xs-8 col-sm-9 skin-minimal">
					<c:forEach items="${userBean}" var="list">
						<div class="radio-box">
							<input type="radio" value="${list.t_userinfo_id}" name="userId"
								id="" user> <label for="sex">${list.t_userinfo_name}</label>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">部门固话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"
						value="${departPojo.t_departinfo_tel}" placeholder=""
						id="departTel" name="departTel">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">移动电话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"
						value="${departPojo.t_departinfo_mobiletel}" placeholder=""
						id="departMobileTel" name="departMobileTel">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">部门传真：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"
						value="${departPojo.t_departinfo_faxes}" placeholder=""
						id="dapartFaxes" name="dapartFaxes">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<button class="btn btn-success radius" id="admin-role-save1"
						name="admin-role-save">
						<i class="icon-ok"></i> 确定
					</button>
				</div>
			</div>
	</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		$('#admin-role-save1').on('click', function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			//$("#lcform").submit();

			$.ajax({
				type : 'post', //post方式
				url : "update.do", //发送的接收地址。
				data : {
					"departName" : '${departPojo.t_departinfo_name}',
					"branchId" : $('#branch').val(),
					"userId" : $('user').val(),
					"departTel" : $('departTel').val(),
					"departMobileTel" : $('departMobileTel').val(),
					"dapartFaxes" : $('dapartFaxes').val()
				},
				success : function(data) {
					
					parent.location.reload();//父页面刷新
					
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);

				},
				error : function() {

				},

			});

		})
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>