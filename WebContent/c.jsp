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
	var xmlHttp;
	var xmlHttp2;
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	function searchbook() {
		
		createXMLHttpRequest();
		var value;
		value='<%=session.getAttribute("username")%>';
		xmlHttp.onreadystatechange = callback;
		xmlHttp.open("POST", "search_tj", true);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp.send("value=" + value);
	}
	function callback() {

		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				makeTable();
			}
		}
	}
	function makeTable() {
		var results = xmlHttp.responseXML.getElementsByTagName("t")[0].firstChild.nodeValue;
		document.getElementById('key2').value=("《"+results.split("--")[0]+"》《"+results.split("--")[1]+"》《"+results.split("--")[2]+"》");

	}
	
	
	function createXMLHttpRequest2() {
		if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp2 = new XMLHttpRequest();
		}
	}
function searchbook2() {
		
		createXMLHttpRequest2();
		var value;
		value='<%=session.getAttribute("username")%>';
		xmlHttp2.onreadystatechange = callback2;
		xmlHttp2.open("POST", "search_sw", true);
		xmlHttp2.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp2.send("value=" + value);
	}
	function callback2() {

		if (xmlHttp2.readyState == 4) {
			if (xmlHttp2.status == 200) {
				makeTable2();
			}
		}
	}
	function makeTable2() {
		var results = xmlHttp2.responseXML.getElementsByTagName("x")[0].firstChild.nodeValue;
		var s = results.split("--");
		var temp="";
		for(x in s)
		{
			if(s[x].indexOf("天")>=0)
			temp+=s[x];
		}
		document.getElementById('key').value=temp;

	}
	
	
	
	
	
	
	
	
	
	

	function init() {
		var a = '<%=session.getAttribute("username")%>';
		if (a == 'null')
			window.location.replace("default.jsp");
		scrollToBottom();
		searchbook();
		searchbook2();
	}
	
	var delay = 7;//in milliseconds
	var scroll_amount = 22;// in pixels
	var interval;
	function scroller() {
	 var old = document.body.scrollTop;//保存当前滚动条到顶端的距离
	 document.body.scrollTop += scroll_amount;//让滚动条继续往下滚动	 
	 if(scroll_amount>1)
		 scroll_amount-=3;
	 if (document.body.scrollTop <= old) {//到底部后就无法再增加scrollTop的值
	clearInterval(interval);
	}
	}
	function scrollToBottom()
	{
	 interval = setInterval("scroller()",delay);
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
								图书信息管理系统 <span> 个人中心</span>
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
				<h3>欢迎您,<%=session.getAttribute("username")%></h3>
				<p>请查看您的事务</p>
			</div>
			<div class="about">
				<div class="container">
					<div class="login">
						<h2>您最近待还书籍:</h2>
						<div class="inputb">
							<input type="text" id="key" name="key"
								placeholder="书太少了，快去借书吧！" required="" readonly="true"/>
						</div>
						<h2>根据您的兴趣推荐:</h2>
						<div class="inputb">
							<input type="text" id="key2" name="key2"
								placeholder="我们需要根据您的借书情况进行推荐，快去借书吧" required="" readonly="true"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<div class="container">
				<div class="clearfix"> </div>
			</div>
			<div class="footer-bottom">
				<p>© 2017 图书信息管理系统 . All rights reserved | Design by retyrp</p>
			</div>
		</div>
	<a href="#" id="toTop"><span
		id="toTopHover" style="opacity: 10px;"></span>To Top</a>
</body>
</html>