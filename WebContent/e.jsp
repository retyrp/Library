<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="servlet.*"%>
<jsp:useBean id="LoginBean" class="user.LoginBean" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐赠中心</title>

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

<style type="text/css">
<!--
.black_overlay {
	display: none;
	position: fixed;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: fixed;
	top: 25%;
	left: 15%;
	width: 70%;
	height: 50%;
	padding: 16px;
	border: 3px solid rgb(45, 148, 162);
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
-->
</style>

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
	function opendiv(lixing) {
		document.getElementById('light').style.display = 'block';
		if (lixing == 0)
			document.getElementById('fade').style.display = 'block';
	}
	function colsediv(lixing) {
		document.getElementById('light').style.display = 'none';
		if (lixing == 0)
			document.getElementById('fade').style.display = 'none';
	}
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
	function confirm() {
		/*if (document.getElementById('key').value == "") {
			document.getElementById('lady').value = "请正确填写书籍名称";
			document.getElemnetById('cButton').disabled = "disabled";
		} else {
			//document.getElementById('lady').value="感谢您的捐赠";
			//document.getElemnetById('cButton').disabled = "none";
		}*/
		var a =document.getElementById("key").value;
		document.getElementById("lday2").value="《"+a+"》";
		if(a=="")
			{
			document.getElementById("lday2").value="请正确输入书籍名称!";
			document.getElementById("cButton").disabled="disabled";
			}
		else
			document.getElementById("cButton").disabled="";
		opendiv();
	}
	
	function dojz()
	{
		document.getElementById("form1").submit();
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
								图书信息管理系统 <span>捐赠中心</span>
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
				<p>请填写下列信息，我们将更好的工作</p>
			</div>
			<div id="light" class="white_content">
				<a href="javascript:void(0)" onclick="colsediv()">关闭</a>
				<div class="selectdiy">
					<input type="text" readonly="true" name="lday1"  id="lday2" value="" />
				</div>
				<div class="send-button">
					<button id="cButton" class="buttona" onclick="dojz();">同意捐赠</button>
					<button class="buttona" onclick="colsediv();">我还要再考虑</button>
				</div>
				<hr
					style="height: 100; border-top: 1px solid #a02020; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(160, 32, 32); layout-flow: vertical-ideographic" />
				<h2>温馨提示</h2>
				<p>1.感谢您的捐赠，我们将提供更好的服务。2.同意捐赠后不可退还。3。如有疑问请联系管理人员或发送邮件至retyrp@outlook.com</p>
			</div>
		</div>
		<div id="fade" class="black_overlay"></div>
		<div class="about">
			<div class="container">
				<form id="form1" method="post" action="give">
					<div class="login">
						<h2>请填写书籍名称:</h2>
						<div class="inputb">
							<input type="text" id="key" name="key" value=""
								placeholder="请填好书籍名称，仔细核对，我们将更好的工作" required="" />
						</div>
						<h2>请填写您的联系电话（可选）:</h2>
						<div class="inputb">
							<input type="text" id="key2" name="key2" value=""
								placeholder="必要时我们会给您联系，参加我们的读书活动" required="" />
						</div>
						<h2>请填写您的姓名（可选）:</h2>
						<div class="inputb">
							<input type="text" id="key3" name="key3" value=""
								placeholder="感谢您的捐赠，我们将提供更好的服务" required="" />
						</div>
						<div class="send-button">
							<input type="button" value="提交" onclick="confirm()">
						</div>
					</div>
				</form>
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