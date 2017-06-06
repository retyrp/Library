<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="LoginBean" class="user.LoginBean" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<title>图书信息管理系统</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/style2.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen">
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){
				event.preventDefault();

		$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		function init()
		{
			var a = '<%=session.getAttribute("username")%>';
			if (a == 'null')
				window.location.replace("default.jsp");

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
						<a href="HomePage.html">
							<h1>
								图书信息管理系统 <span> 我的桌面</span>
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
						<li><a href="logout.jsp"> <span class="icon"> <i
									aria-hidden="true" class="icon-home glyphicon glyphicon-home"></i>
							</span> <span>安全退出</span>
						</a></li>
						<li><a href="a.jsp"> <span class="icon"> <i
									aria-hidden="true"
									class="icon-services glyphicon glyphicon-picture"></i>
							</span> <span>借书</span>
						</a></li>
						<li><a href="MyPage.jsp"> <span class="icon"> <i
									aria-hidden="true"
									class="icon-portfolio glyphicon glyphicon-check"></i>
							</span> <span>还书</span>
						</a></li>
						<li><a href="c.jsp"> <span class="icon"> <i
									aria-hidden="true"
									class="icon-blog glyphicon glyphicon-info-sign"></i>
							</span> <span>个人信息</span>
						</a></li>
						<li><a href="d.jsp"> <span class="icon"> <i
									aria-hidden="true" class="icon-team glyphicon glyphicon-cog"></i>
							</span> <span>帮助</span>
						</a></li>
						<li><a href="e.jsp"> <span class="icon"> <i
									aria-hidden="true"
									class="icon-contact glyphicon glyphicon-envelope"></i>
							</span> <span>捐赠</span>
						</a></li>
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
</body>
</html>