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
<title>管理消息</title>
<style type="text/css">
.mychangediv1 {
	display:
}

.mychangediv2 {
	display: none;
}
</style>
<script type="text/javascript">
	function hold1() {
		if ($(".mychangediv2").css("display") == "none") {
			$(".mychangediv2").show();
			$(".mychangediv1").hide();
			$("#hold2").css("font-color") == "red";
		}
	}
	function send2() {
		if ($(".mychangediv1").css("display") == "none") {
			$(".mychangediv1").show();
			$(".mychangediv2").hide();
		}
	}
	function xiugai() {
		alert("非消息发送者，无权修改消息");
	}
	function shanchu() {
		alert("非消息发送者，无权删除消息");
	}
	function alldatadel() {
		alert("无权批量删除非本人发送的消息")
	}
	//发布未发布的消息，方法还没有写完
	function fabu(e,f){
		if(f==1){
			alert("消息已发布，请不要重复发布！")
		}else{
			$.ajax({
				type:"post",
				url:"",
				date:{
					"messageid":"e"
				},
				success:function(){
					$(".Hui-iconfont").click();
				},
				error:function(){
					alert("发布消息失败");
				}
			})
		}	
	}
</script>
</head>
<body>
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i><a href="fowordfromindex.do">首页</a>
	<span class="c-gray en">&gt;</span> 消息管理 <span class="c-gray en">&gt;</span>
	管理消息<a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			搜索条件： <input type="text" class="input-text" style="width: 250px"
				placeholder="输入消息名字" id="" name="">
			<button type="submit" class="btn btn-success" id="" name="">
				<i class="Hui-iconfont">&#xe665;</i> 搜消息
			</button>
		</div>
		<!-- 发送消息页面 -->
		<div class="mychangediv1" id="mychangediv1" name="mychangediv1">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a href="javascript:;" onclick="datadel()"
					class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
						批量删除</a> <a href="sendMessageFoword.do" class="btn btn-primary radius"><i
						class="Hui-iconfont">&#xe600;</i> 新建消息</a></span> <span class="r">共有消息：<strong>${count }</strong>
					条
				</span>
			</div>
			<table class="table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="18"><center>
								<a href="#" onclick="" id="send1">发送消息列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="#" onclick="hold1();return false" id="hold1">收到消息列表</a>
							</center></th>
					</tr>
					<tr class="text-c">
						<th width="25">&nbsp;</th>
						<th width="80">消息标题</th>
						<th width="160">消息内容</th>
						<th width="80">消息类型</th>
						<th width="100">消息类型描述</th>
						<th width="160">开始时间</th>
						<th width="160">结束时间</th>
						<th width="50">是否发布</th>
						<th width="80">发布者</th>
						<th width="160">发送时间</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sendmessagelist}" var="sendlist">
						<tr class="text-c">
							<td><input type="checkbox" value="${sendlist.t_message_id }"
								name=""></td>
							<td>${sendlist.t_message_title }</td>
							<td>${sendlist.t_message_content }</td>
							<td>${sendlist.t_messagetype_name }</td>
							<td>${sendlist.t_messagetype_desc }</td>
							<td>${sendlist.t_message_begintime }</td>
							<td>${sendlist.t_message_endtime }</td>
							<c:choose>
								<c:when test="${sendlist.t_message_ifpublish==1 }">
									<td>已发布</td>
								</c:when>
								<c:otherwise>
									<td>未发布</td>
								</c:otherwise>
							</c:choose>
							<td>${sessionScope.username }</td>
							<td>${sendlist.t_message_recordtime }</td>

							<td class="td-manage"><a style="text-decoration: none"
								id="${sendlist.t_message_id }"
								onClick="fabu(this.id,${sendlist.t_message_ifpublish });return false"
								href="#" title="发布"><i class="Hui-iconfont">&#xe615;</i></a>&nbsp;<a
								title="编辑"
								href="selectmessage.do?messageid=${sendlist.t_message_id }&messagetypeid=${sendlist.t_messagetype_id }"
								class="ml-5" style="text-decoration: none"><i
									class="Hui-iconfont">&#xe6df;</i></a>&nbsp; <a title="删除"
								href="DeleteMymessage.do?messageid=${sendlist.t_message_id }"
								class="ml-5" style="text-decoration: none"><i
									class="Hui-iconfont">&#xe6e2;</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 收到消息页面 -->
		<div class="mychangediv2" id="mychangediv2" name="mychangediv2">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a href="#"
					onclick="alldatadel();return false" class="btn btn-danger radius"><i
						class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
					href="sendMessageFoword.do" class="btn btn-primary radius"><i
						class="Hui-iconfont">&#xe600;</i> 新建消息</a></span> <span class="r">共有消息：<strong>${counts }</strong>
					条
				</span>
			</div>
			<table class="table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="18"><center>
								<a href="#" onclick="send2();return false" id="send2">发送消息列表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="#" onclick="" id="hold2">收到消息列表</a>
							</center></th>
					</tr>
					<tr class="text-c">
						<th width="25">&nbsp;</th>
						<th width="80">消息标题</th>
						<th width="160">消息内容</th>
						<th width="80">消息类型</th>
						<th width="100">消息类型描述</th>
						<th width="160">开始时间</th>
						<th width="160">结束时间</th>
						<th width="50">是否发布</th>
						<th width="80">发布者</th>
						<th width="160">发送时间</th>
						<th width="80">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${holdmessagelist}" var="holdlist">
						<tr class="text-c">
							<td><input type="checkbox" disabled="disabled" name=""></td>
							<td>${holdlist.t_message_title }</td>
							<td>${holdlist.t_message_content }</td>
							<td>${holdlist.t_messagetype_name }</td>
							<td>${holdlist.t_messagetype_desc }</td>
							<td>${holdlist.t_message_begintime }</td>
							<td>${holdlist.t_message_endtime }</td>
							<td><input type="hidden"
								value="${holdlist.t_message_ifpublish }">已发布</td>
							<td>${holdlist.t_userinfo_name}</td>
							<td>${holdlist.t_message_recordtime }</td>

							<td class="td-manage"><a title="编辑" href="#"
								onclick="xiugai();return false" class="ml-5"
								style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;
								<a title="删除" href="#" onclick="shanchu();return false"
								class="ml-5" style="text-decoration: none"><i
									class="Hui-iconfont">&#xe6e2;</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
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