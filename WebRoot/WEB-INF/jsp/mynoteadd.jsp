<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>便签添加</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="page-container"> <!-- 添加员工，跳转到adduser.do -->
	<form class="form form-horizontal" id="form-admin-add"
		action="mynoteadd.do" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>便签id：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="" id="mynoteId"
					name="mynoteId">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>便签标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					id="mynotetitle" name="mynotetitle">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>创建者：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus=this.blur() class="input-text"
					autocomplete="off"
					value="<%=request.getSession().getAttribute("username")%>"
					placeholder="" id="mynotecreateuser" name="mynotecreateuser">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>便签内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<!--  <script id="editor" name= "editor" type="text/plain" style="width:100%;height:400px;"></script> -->
				<input type="text" class="input-text" value="" placeholder=""
					id="mynotecontent" name="mynotecontent"
					style="width: 100%; height: 400px;">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"
					value="&nbsp;&nbsp;提交&nbsp;&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-primary radius" type="reset"
					value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
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
	<!--
	<script type="text/javascript">
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			$("#form-admin-add")
					.validate(
							{
								rules : {
									adminName : {
										required : true,
										minlength : 4,
										maxlength : 16
									},
									password : {
										required : true,
									},
									password2 : {
										required : true,
										equalTo : "#password"
									},
									sex : {
										required : true,
									},
									phone : {
										required : true,
										isPhone : true,
									},
									email : {
										required : true,
										email : true,
									},
									adminRole : {
										required : true,
									},
								},
								onkeyup : false,
								focusCleanup : true,
								success : "valid",
								submitHandler : function(form) {
									$(form)
											.ajaxSubmit(
													{
														type : 'post',
														url : "xxxxxxx",
														success : function(data) {
															layer
																	.msg(
																			'添加成功!',
																			{
																				icon : 1,
																				time : 1000
																			});
														},
														error : function(
																XmlHttpRequest,
																textStatus,
																errorThrown) {
															layer
																	.msg(
																			'error!',
																			{
																				icon : 1,
																				time : 1000
																			});
														}
													});
									var index = parent.layer
											.getFrameIndex(window.name);
									parent.$('.btn-refresh').click();
									parent.layer.close(index);
								}
							});
		});
	</script>
	/请在上方写此页面业务相关的脚本-->
</body>
</html>