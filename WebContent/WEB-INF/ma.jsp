<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="servlet.*"%>
<jsp:useBean id="LoginBean" class="user.LoginBean" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书信息管理系统[管理员]</title>

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
<script type="text/javascript" src="js/func.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />

</head>
<body onload="init()">
	<div class="banner">
		<a name="top"></a>
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
								图书信息管理系统 <span> 管理中心</span>
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
						<li><a href="#tips1"> <span class="icon"> <i
									aria-hidden="true"
									class="icon-services glyphicon glyphicon-picture"></i>
							</span> <span>书籍管理</span>
						</a></li>
						<li><a href="#tips2"> <span class="icon"> <i
									aria-hidden="true"
									class="icon-portfolio glyphicon glyphicon-check"></i>
							</span> <span>用户管理</span>
						</a></li>
						<li><a href="#tips3"> <span class="icon"> <i
									aria-hidden="true"
									class="icon-blog glyphicon glyphicon-info-sign"></i>
							</span> <span>捐赠管理</span>
						</a></li>
						<li><a href="#tips4"> <span class="icon"> <i
									aria-hidden="true" class="icon-team glyphicon glyphicon-cog"></i>
							</span> <span>留言建议</span>
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
	<div class="about">
		<div class="container">
			<div class="title">
				<a name="tips1"></a>
				<h3>欢迎使用书籍管理服务</h3>
				<p>请按照操作使用</p>
				<div id="light2" class="white_content2">
					<div class="selectdiy">
						<div class="inputa">
							<input type="text" id="b1" name="b1" placeholder="(直接输入即可)编号"
								required="" /> <input type="text" id="b2" name="b2"
								placeholder="名称" required="" /> <input type="text" id="b3"
								name="b3" placeholder="书类" required="" /> <input type="text"
								id="b4" name="b4" placeholder="出版社" required="" /> <input
								type="text" id="b5" name="b5" placeholder="总数" required="" /> <input
								type="text" id="b6" name="b6" placeholder="剩余数量" required="" />
							<input type="text" id="b7" name="b7" placeholder="出版日期"
								required="" />
							<div class="send-button3">
								<input type="button" value="确认修改" onclick="UpdateBook()">
								<input type="button" value="取消操作" onclick="closediv2()">
								<input type="button" value="【删除】" onclick="DeleteBook()">
							</div>
						</div>
					</div>
					<hr
						style="height: 100; border-top: 1px solid #a02020; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(160, 32, 32); layout-flow: vertical-ideographic" />
					<h2>注意事项</h2>
					<p>1.请务必核对操作数据。2.按操作计划删除。3。如有疑问请联系管理人员或发送邮件至retyrp@outlook.com</p>
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
								<td>总数</td>
								<td>剩余数量</td>
								<td>操作</td>
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
						<h2>图书管理</h2>
						<div class="inputa">
							<input type="text" id="key" name="key"
								placeholder="图书编号(支持ISBN和图书馆标签)" required="" />
							<div class="send-button2">
								<input type="button" value="查询" onclick="searchbook()">
								<input type="button" value="添加" onclick="opendiv2()">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="title">
				<a name="tips2"></a>
				<h3>欢迎使用用户管理服务</h3>
				<p>请按照操作使用</p>
				<div id="light4" class="white_content2">
					<div class="selectdiy">
						<div class="inputa">
							<input type="text" id="u1" name="u1" placeholder="(直接输入即可)用户名"
								required="" /> <input type="text" id="u2" name="u2"
								placeholder="用户密码" required="" /> <input type="text" id="u3"
								name="u3" placeholder="电子邮件" required="" /> <input type="text"
								id="u4" name="u4" placeholder="联系电话" required="" /> 
							<div class="send-button3">
								<input type="button" value="确认修改" onclick="UpdateUser()">
								<input type="button" value="取消操作" onclick="closediv4()">
								<input type="button" value="【删除】" onclick="DeleteUser()">
							</div>
						</div>
					</div>
					<hr
						style="height: 100; border-top: 1px solid #a02020; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(160, 32, 32); layout-flow: vertical-ideographic" />
					<h2>注意事项</h2>
					<p>1.请务必核对操作数据。2.按操作计划删除。3。如有疑问请联系管理人员或发送邮件至retyrp@outlook.com</p>
				</div>
				<div id="light3" class="white_content">
					<a href="javascript:void(0)" onclick="closediv3()">关闭</a>
					<div class="tableSearch" id="div_table">
						<table id="mytable" border="1" width="98%">
							<tr bgcolor="#00ffff">
								<td>用户名</td>
								<td>邮箱</td>
								<td>联系电话</td>
								<td>操作</td>
							</tr>
							<tbody id="mybody2">
							</tbody>
						</table>
					</div>

				</div>
				<div id="fade" class="black_overlay"></div>
			</div>
			<div class="about">
				<div class="container">
					<div class="login">
						<h2>用户账户管理</h2>
						<div class="inputa">
							<input type="text" id="key2" name="key2"
								placeholder="用户名（支持模糊搜索）" required="" />
							<div class="send-button2">
								<input type="button" value="查询" onclick="searchuser()">
								<input type="button" value="添加" onclick="opendiv4()">
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="title">
				<a name="tips3"></a>
				<h3>欢迎使用捐赠管理服务</h3>
				<p>请按照操作使用</p>
				<div id="light6" class="white_content2">
					<div class="selectdiy">
						<div class="inputa">
							<div class="send-button3">
								<input type="button" value="开始收录" onclick="dojz()">
								<input type="button" value="取消操作" onclick="closediv6()">
								<input type="button" value="不予收录" onclick="DeleteGive()">
							</div>
						</div>
					</div>
					<hr
						style="height: 100; border-top: 1px solid #a02020; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(160, 32, 32); layout-flow: vertical-ideographic" />
					<h2>注意事项</h2>
					<p>1.请务必核对操作数据。2.按操作计划删除。3。如有疑问请联系管理人员或发送邮件至retyrp@outlook.com</p>
				</div>
				<div id="light5" class="white_content">
					<a href="javascript:void(0)" onclick="closediv5()">关闭</a>
					<div class="tableSearch" id="div_table">
						<table id="mytable" border="1" width="98%">
							<tr bgcolor="#00ffff">
								<td>书名</td>
								<td>联系电话</td>
								<td>捐赠人</td>
								<td>时间</td>
								<td>操作</td>
							</tr>
							<tbody id="mybody3">
							</tbody>
						</table>
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
			</div>
			<div class="about">
				<div class="container">
					<div class="login">
						<h2>捐赠管理</h2>
						<div class="inputa">
							<div class="send-button">
								<input type="button" value="进入" onclick="searchjz()">
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="title">
				<a name="tips4"></a>
				<h3>欢迎使用留言管理服务</h3>
				<p>请按照操作使用</p>
				<div id="light11" class="white_content">
					<a href="javascript:void(0)" onclick="closediv11()">关闭</a>
					<div class="tableSearch" id="div_table">
						<table id="mytable" border="1" width="98%">
							<tr bgcolor="#00ffff">
								<td>留言者</td>
								<td>内容</td>
								<td>时间</td>
							</tr>
							<tbody id="mybody4">
							</tbody>
						</table>
					</div>
					<hr
						style="height: 100; border-top: 1px solid #a02020; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(160, 32, 32); layout-flow: vertical-ideographic" />
					<div class="selectdiy">
						<div class="inputa">
							<div class="send-button">
								<input type="button" value="已阅" onclick="doyd()">
							</div>
						</div>
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
			</div>
			<div class="about">
				<div class="container">
					<div class="login">
						<h2>阅读留言</h2>
						<div class="inputa">
							<div class="send-button">
								<input type="button" value="阅读" onclick="searchmsg()">
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
	<a href="#top" id="toTop"><span id="toTopHover"
		style="opacity: 10px;"></span>To Top</a>
</body>
</html>