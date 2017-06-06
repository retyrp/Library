<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="servlet.*"%>
<jsp:useBean id="LoginBean" class="user.LoginBean" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书信息管理系统</title>

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
	function ctrlYC() {
		var d1 = document.getElementById('div_table');//获取该div节点
		d1.style.display = 'none';//值为'none'设置为隐藏。
	}
	function ctrlXS() {
		var d1 = document.getElementById('div_table');//获取该div节点
		d1.style.display = '';//值为'none'设置为隐藏。
	}
</script>
<script type="text/javascript">
	var xmlHttp;
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	function searchbook() {
		ctrlXS();
		opendiv();
		createXMLHttpRequest();
		var value = document.getElementById("key").value;
		xmlHttp.onreadystatechange = callback;
		xmlHttp.open("POST", "search", true);
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
		clearTable();
		var mybody = document.getElementById("mybody");
		var results = xmlHttp.responseXML.getElementsByTagName("book");
		for (i = 0; i < results.length; i++) {
			var row = document.createElement("tr");
			var cellPid = document.createElement("td");
			var cellPname = document.createElement("td");
			var cellCla = document.createElement("td");
			var cellPre = document.createElement("td");
			var cellTime = document.createElement("td");
			var cellN = document.createElement("td");
			cellPid.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bid")[0].firstChild.nodeValue));
			cellPname.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bname")[0].firstChild.nodeValue));
			cellCla.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bcla")[0].firstChild.nodeValue));
			cellPre.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bpre")[0].firstChild.nodeValue));
			cellTime.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("btime")[0].firstChild.nodeValue));
			if (results[i].getElementsByTagName("bn")[0].firstChild.nodeValue > 0) {
				var o = document.createElement('input');
				o.type = 'button';
				o.name = results[i].getElementsByTagName("bid")[0].firstChild.nodeValue;
				o.value = '借阅';
				o.setAttribute("onclick", "test(this.name)");
				/*o.onclick = function() {
					test(this.o.name);					
				};*/

				cellN.appendChild(o);
			} else {
				var oo = document.createElement('input');
				oo.type = 'button';
				oo.value = '预定';
				oo.name = results[i].getElementsByTagName("bid")[0].firstChild.nodeValue;
				cellN.appendChild(oo);
			}
			row.appendChild(cellPid);
			row.appendChild(cellPname);
			row.appendChild(cellCla);
			row.appendChild(cellPre);
			row.appendChild(cellTime);
			row.appendChild(cellN);
			mybody.appendChild(row);
		}

	}

	function test(a) {
		opendiv2();
		document.getElementById('book_id').value = a;
		document.getElementById('lib_card').value ='<%=session.getAttribute("username")%>';
	};

	function clearTable() {
		var mybody = document.getElementById("mybody");
		while (mybody.childNodes.length > 0) {
			mybody.removeChild(mybody.childNodes[0]);
		}
	}
	function opendiv2(lixing) {
		colsediv();
		document.getElementById('light2').style.display = 'block';
		if (lixing == 0)
			document.getElementById('fade').style.display = 'block';
	}
	function closediv2() {
		document.getElementById('light2').style.display = 'none';
	}
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
		ctrlYC();
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
	function dobr()
	{
		document.getElementById('time1').value=document.getElementById('select1').value;
		document.getElementById('form1').submit();
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
								图书信息管理系统 <span> 自助借书</span>
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
				<h3>欢迎使用自助借书服务</h3>
				<p>请按照操作使用</p>
				<div id="light2" class="white_content">
					<div class="selectdiy">
						<label style="font-size: 30px">借阅天数</label> <select id="select1" class=""
							size="1" name="power"
							style="font-family: 宋体; color: #000000; font-size: 30px; border: solid; border-color: darkgrey; font-weight: bolder; height: 60px;">
							<option value="3">3天</option>
							<option value="7">七天</option>
							<option value="14">两周</option>
							<option value="30">一个月</option>
						</select>
					</div>
					<div class="send-button">
						<button class="buttona" onclick="dobr();">确定借阅</button>
						<button class="buttona" onclick="closediv2();">我还要再考虑</button>
					</div>
					<hr
						style="height: 100; border-top: 1px solid #a02020; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(160, 32, 32); layout-flow: vertical-ideographic" />
					<h2>注意事项</h2>
					<p>1.请务必保管好图书，如有损坏遗失照价赔偿。2.请按时归还图书。3。如有疑问请联系管理人员或发送邮件至retyrp@outlook.com</p>
				</div>
				<div id="light" class="white_content">
					<a href="javascript:void(0)" onclick="colsediv()">关闭</a>
					<div class="tableSearch" id="div_table">
						<table id="mytable" border="1" width="98%">
							<tr bgcolor="#00ffff">
								<td>书号</td>
								<td>书名</td>
								<td>书类</td>
								<td>出版社</td>
								<td>出版时间</td>
								<td>能否借阅</td>
							</tr>
							<tbody id="mybody">
							</tbody>
						</table>
					</div>

				</div>
				<div id="fade" class="black_overlay"></div>
			</div>
			<div class="about">
				<div class="container">
					<div class="login">
						<h2>借书</h2>
						<div class="inputa">
							<input type="text" id="key" name="key"
								placeholder="图书编号/图书名称(书名支持模糊搜索)" required="" />
							<div class="send-button">
								<input type="button" value="搜索" onclick="searchbook()">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none">
				<form action="borrow" id="form1" method="post">
					<input type="text" name="book_id" id="book_id" value="" /> <input type="text"
						id="lib_card" name="lib_card" value="" /> <input type="text" name="time1" id="time1" value="" />
					<input type="submit" value="tijiao" id="tijiao">
				</form>
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