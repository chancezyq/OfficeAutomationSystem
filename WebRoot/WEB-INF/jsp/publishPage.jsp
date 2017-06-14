<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function timer(opj) {
		$(opj).find('ul').animate({
			marginTop : "-3.5rem"
		}, 500, function() {
			$(this).css({
				marginTop : "0.7rem"
			}).find("li:first").appendTo(this);
		})
	}
	$(function() {
		var num = $('.notice_active').find('li').length;
		if (num > 1) {
			var time = setInterval('timer(".notice_active")', 3500);
			$('.gg_more a').mousemove(function() {
				clearInterval(time);
			}).mouseout(function() {
				time = setInterval('timer(".notice_active")', 3500);
			});
		}

		$(".news_ck").click(
				function() {
					location.href = $(".notice_active .notice_active_ch")
							.children(":input").val();
				})
	});

	function publishes(e) {
		window
				.open(
						"publishDetails.do?publishid=" + e,
						"newwindow",
						"top=200px,left=650px,height=600,width=650,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no")
	}
</script>
<style type="text/css">
/*border-bottom: 1px solid #F0F0F0;*/
.huadong {
	width: 80rem;
	height: 3rem;
	padding: 0.3rem 0 0 0;
	border-bottom: 0px solid #F0F0F0;
	position: relative;
	font: 12px/1.5 "Hiragino Sans GB", "Microsoft YaHei", simsun;
	margin:0 auto;
}

.huadong .huabox {
	margin: 0 auto;
	width: 60%;
	line-height: 4rem;
}

.huadong h6 {
	font-size: 1rem;
	float: left;
	line-height: 2.2rem;
	margin: 0 auto;
}

.huadong .gg_more {
	float: left;
	margin: -0.9rem 0 1rem 2rem;
}

.huadong .gg_more a {
	font-size: 0.8rem;
	text-decoration: none;
}

.huadong .notice_active {
	float: left;
	width: 65%;
	height: 4rem;
	padding: 0;
	overflow: hidden;
	position: relative;
}

.huadong .notice_active li {
	list-style-type: none;
	line-height: 2.4rem;
	overflow: hidden;
}

.huadong .notice_active li.notice_active_ch span {
	color: white;
	font-size: 1rem;
	display: block;
	overflow: hidden;
	width: 80%;
	float: left;
	overflow: hidden;
	margin: -0.8rem 0 2rem 0;
}

.huadong .gg_more .news_ck {
	float: left;
	margin: 0 1rem 0 1rem;
	color: #888;
	width: 5rem;
	height: 2rem;
	line-height: 2rem;
	display: block;
	border: 1px solid #656972;
	text-align: center;
	border-radius: 0.7rem;
	font-size: 0.8rem;
	margin-top: 1rem;
}

.huadong .notice_active li.notice_active_ch em {
	text-align: right;
	float: right;
	color: white;
	font-size: 0.8rem;
	font-style:normal ;
	margin: -0.8rem;
}

.alink {
	color: #ffe153;
}

.alink1 {
	color: white;
}
</style>
</head>
<body>
	<div class="huadong">
		<div class="huabox">
			<h6>【公告】</h6>
			<div class="notice_active">
				<ul>
					<c:forEach items="${sessionScope.publishlist }" var="publishlist">
						<li class="notice_active_ch"><span><a class="alink"
								id="${publishlist.t_message_id }" href="#"
								onclick="publishes(this.id);return false">${publishlist.t_messagetype_name}:${publishlist.t_message_content}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${publishlist.t_message_recordtime }</span>
							</li>
					</c:forEach>
				</ul>
			</div>
			<div class="gg_more">
				<a class="alink1" title="news_more" href="publish.do">更多+</a>
			</div>
		</div>
	</div>
</body>
</html>