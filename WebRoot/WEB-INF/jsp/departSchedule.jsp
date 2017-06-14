<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>显示便签</title>
</head>
<link rel="stylesheet" href="style/documentation.css" type="text/css" />
<link rel="stylesheet" href="style/jalendar.css" type="text/css" />
<script type="text/javascript" src="jq/jquery-1.10.2.min.js"></script><!--jQuery-->
<script type="text/javascript" src="jq/jalendar.js"></script>
<script type="text/javascript">
$(function () {
    $('#myId').jalendar({
        customDay: '2017/12/01',  // Format: Year/Month/Day
        color: '#ed145a', // Unlimited Colors
        lang: 'EN' // Format: English — 'EN', Türkçe — 'TR'
    });
    $('#myId2').jalendar({
        customDay: '2016/02/29',
        color: '#023447',
        lang: 'ES'
    });
    $('#myId3').jalendar();
});
</script>
<body>
<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 资讯管理 <span class="c-gray en">&gt;</span>
	资讯列表 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>

	<!--            
              CONTENT 
                        -->
                        <br>
	<br>
	<form action="findschedule.do" method="post" id="lcform">
		<div id="content" class="white">
			<div class="text-c">
				机构名称:<span class="select-box inline"> <select name="branch" onchange="if(confirm('是否提交'))document.getElementById('lcform').submit()"
					id="branchid" class="select">
						<option value="0">--选择机构--</option>
						<c:forEach items="${branchlist}" var="branch">
							<option value="${branch.t_branchinfo_id}">${branch.t_branchinfo_name}
							</option>
						</c:forEach>
				</select>
				</span> 部门名称:<span class="select-box inline"> <select name="depart" onchange="if(confirm('是否提交'))document.getElementById('lcform').submit()"
					id="departid" class="select">
						<option value="0">--选择部门--</option>
						<c:forEach items="${departlist}" var="depart">
							<option value="${depart.t_departinfo_id}">${depart.t_departinfo_name}</option>
						</c:forEach>

				</select>
				</span> 日期范围: <input type="text"
					onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
					id="logmin" class="input-text Wdate" style="width: 120px;" name="starttime">
				- <input type="text"
					onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
					id="logmax" class="input-text Wdate" style="width: 120px;" name="endtime">
				用户姓名:<span class="select-box inline"> <select name="user" onchange="if(confirm('是否提交'))document.getElementById('lcform').submit()"
					id="userid" class="select">
						<option value="0">-选择用户--</option>
						<c:forEach items="${userlist}" var="user">
							<option value="${user.t_userinfo_id}">${user.t_userinfo_name}</option>
						</c:forEach>
				</select>
				</span>
				<button type="submit" name="" id="findschedule"
					class="btn btn-success" type="submit">
					<i class="Hui-iconfont">&#xe665;</i> 搜日程
				</button>
			</div>
	</form>
	<article>

    
<div id="myId3" class="jalendar mid">
    <div class="added-event" data-date="9/8/2013" data-time="Tüm Gün" data-title="WWDC 13 on San Francisco, LA"></div>
    <div class="added-event" data-date="16/8/2013" data-time="20:45" data-title="Tarkan İstanbul Concert on Harbiye Açık Hava Tiyatrosu"></div>
    <div class="added-event" data-date="17/8/2013" data-time="21:00" data-title="CodeCanyon İstanbul Meeting on Starbucks, Kadıköy"></div>
    <div class="added-event" data-date="17/8/2013" data-time="22:00" data-title="Front-End Design and Javascript Conferance on Haliç Kongre Merkezi"></div>
    <div class="added-event" data-date="17/12/2017" data-time="22:00" data-title="Lorem ipsum dolor sit amet"></div>
</div>
</article>
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
		$(function() {
			$('#userid').change(function() {
				$('findschedule').submit();
			});
			$('#departid').change(function() {
				$('findschedule').submit();
			});
			$('#branchid').change(function() {
				$('findschedule').submit();
			});
		})
		$('.table-sort').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"pading" : false,
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 8 ]
			} // 不参与排序的列
			]
		});

		/*资讯-添加*/
		function article_add(title, url, w, h) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*资讯-编辑*/
		function article_edit(title, url, id, w, h) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*资讯-删除*/
		function article_del(obj, id) {
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

	
	</script>
</body>
</html>