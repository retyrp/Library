<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="servlet.*"%>
<jsp:useBean id="LoginBean" class="user.LoginBean" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>

<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/style2.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen">
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();

			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>

<script type="text/javascript">
	function init() {
		var a = '<%=session.getAttribute("username")%>';
		if (a == 'null')
			window.location.replace("default.jsp");
		scrollToBottom();
	}
	var delay = 7;//in milliseconds
	var scroll_amount = 22;// in pixels
	var interval;
	function scroller() {
		var old = document.body.scrollTop;//保存当前滚动条到顶端的距离
		document.body.scrollTop += scroll_amount;//让滚动条继续往下滚动	 
		if (scroll_amount > 1)
			scroll_amount -= 3;
		if (document.body.scrollTop <= old) {//到底部后就无法再增加scrollTop的值
			clearInterval(interval);
		}
	}
	function scrollToBottom() {
		interval = setInterval("scroller()", delay);
	}
</script>
</head>
<body onload="init()">
	<div class="banner">
		<div class="banner-info">
			<div class="banner-top">
				<div class="container">
					<div class="banner-top-grids banner-top-left">
						<ul class="social-icons">
							<li><a href="#"> </a></li>
							<li><a href="#" class="fb"> </a></li>
							<li><a href="#" class="in"> </a></li>
							<li><a href="#" class="dott"> </a></li>
						</ul>
					</div>
					<div class="banner-top-grids banner-logo">
						<a href="HomePage.jsp">
							<h1>
								图书信息管理系统 <span>帮助中心</span>
							</h1>
						</a>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
			<!-- banner-text -->
			<div class="banner-text">
				<h2>欢迎使用</h2>
				<br>
			</div>
			<!-- //banner-text -->
			<!-- top-navigation -->
			<div class="main">
				<div class="container">
					<nav id="menu" class="nav top-nav">
					<button class="navtoogle">
						<span class="icon-menu glyphicon glyphicon-menu-hamburger">
						</span> Menu
					</button>
					<ul>
							<li>
								<a href="logout.jsp">
									<span class="icon">
										<i aria-hidden="true" class="icon-home glyphicon glyphicon-home"></i>
									</span>
									<span>安全退出</span>
								</a>
							</li>
							<li>
								<a href="a.jsp">
									<span class="icon"> 
										<i aria-hidden="true" class="icon-services glyphicon glyphicon-picture"></i>
									</span>
									<span>借书</span>
								</a>
							</li>
							<li>
								<a href="MyPage.jsp">
									<span class="icon">
										<i aria-hidden="true" class="icon-portfolio glyphicon glyphicon-check"></i>
									</span>
									<span>还书</span>
								</a>
							</li>
							<li>
								<a href="c.jsp">
									<span class="icon">
										<i aria-hidden="true" class="icon-blog glyphicon glyphicon-info-sign"></i>
									</span>
									<span>个人信息</span>
								</a>
							</li>
							<li>
								<a href="d.jsp">
									<span class="icon">
										<i aria-hidden="true" class="icon-team glyphicon glyphicon-cog"></i>
									</span>
									<span>帮助</span>
								</a>
							</li>
							<li>
								<a href="e.jsp" >
									<span class="icon">
										<i aria-hidden="true" class="icon-contact glyphicon glyphicon-envelope"></i>
									</span>
									<span>捐赠</span>
								</a>
							</li>
						</ul>
					</nav>
					<!-- script-for-menu -->
					<script>
						$(".navtoogle").click(function() {
							$(".top-nav ul").slideToggle("slow", function() {
							});
						});
					</script>
					<!-- //script-for-menu -->
					<script src="js/modernizr.custom.js"></script>
				</div>
			</div>
			<!-- //top-navigation -->
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="about">
		<div class="container">
			<div class="title">
				<h3>
					欢迎您,<%=session.getAttribute("username")%></h3>
				<p>下面是一些常见的问题</p>
			</div>
			<div class="about">
				<div class="container">
					<div class="login">
						<h2>我要如何借书:</h2>
						<div class="inputb">
							<input type="text" id="key" name="key"
								value="登录您的账号，借书页面，按照相关操作即可。" required="" readonly="true" />
						</div>
						<h2>忘记还书了怎么办:</h2>
						<div class="inputb">
							<input type="text" id="key2" name="key2"
								value="请按照相关借书规则，按时还书。如有其它问题请联系管理员。" required="" readonly="true" />
						</div>
						<h2>我想要捐赠:</h2>
						<div class="inputb">
							<input type="text" id="key3" name="key3"
								value="请整理好您的书籍，按照书籍管理办法，理性捐赠。" required="" readonly="true" />
						</div>

						<h2>我要提问或建议</h2>
						<div class="inputa">
							<input type="text" id="key0" name="key0"
								placeholder="在这里，你可以写下您的建议或问题" required="" />
							<div class="send-button">
								<input type="button" value="发送" onclick="func();">
							</div>
						</div>
						<script>
							function func() {
								alert("我们已经收到您的意见");
								document.getElementById('time1').value = document.getElementById('key0').value;
								document.getElementById('form1').submit();
							}
						</script>
						<div style="display: none">
							<form action="question" id="form1" method="post">
								<input type="text" name="time1" id="time1" value="" /> <input
									type="submit" value="tijiao" id="tijiao">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="container">
			<div class="clearfix"></div>
		</div>
		<div class="footer-bottom">
			<p>© 2017 图书信息管理系统 . All rights reserved | Design by retyrp</p>
		</div>
	</div>
	<a href="#" id="toTop"><span id="toTopHover" style="opacity: 10px;"></span>To
		Top</a>
</body>
</html>