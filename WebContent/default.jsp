<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="servlet.*"%>
<jsp:useBean id="LoginBean" class="user.LoginBean" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书信息管理系统</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link rel="stylesheet" type="text/css" href="css/Style.css" media="all" />
<script>
	<%  
        String username = "";  
        String password = "";
        String checked = "";
        Cookie[] c = request.getCookies();  
        if (c != null) {  
            for (int i = 0; i < c.length; i++) {  
                if ("username".equals(c[i].getName())) {  
                    username = c[i].getValue();  
                } else if ("password".equals(c[i].getName())) {  
                    password = c[i].getValue();  
                }
                else if ("checked".equals(c[i].getName())) {  
                    checked = c[i].getValue();  
                }  
            }  
        } else {  
            username = " ";  
            password = " ";
            checked=" ";
        }  
    %> 
</script>
</head>
<body>

	<h1>图书信息系统</h1>

	<div class="container">

		<div class="login">
			<h2>登录</h2>
			<form action="Login" method="post">
				<input type="text" name="Username" placeholder="用户名" value="<%=username %>" required="">
				<input type="password" name="Password" placeholder="密码" value="<%=password %>" required="">

				<ul class="tick">
					<li><input type="checkbox" name="RM" id="brand1" value="rm" checked="<%=checked %>"> <label
						for="brand1"><span></span>记住我</label> &nbsp;&nbsp; <input
						type="checkbox" name="MA" id="brand2" value="ma"> <label for="brand2"><span></span>管理员</label>
					</li>
				</ul>
				<div class="send-button">
					<input type="submit" value="登录">
				</div>
			</form>
			<a href="#">忘记密码了？</a>

			<div class="clear"></div>
		</div>

		<div class="register">
			<h2>快速注册</h2>
			<form action="register" method="post">
				<input type="text" name="Name" placeholder="用户名"> <input
					type="text" name="Email" placeholder="邮箱"> <input
					type="password" name="Password2" placeholder="密码"> <input
					type="text" name="PhoneNumber" placeholder="电话号码">
					<div class="send-button">		
				<input type="submit" value="提交" onclick="alert('注册正在处理中');">
			</div>
			</form>
			<p>
				注册代表你已同意以下<a class="underline" href="#">条款</a>
			</p>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>

	<div class="footer">
		<jsp:getProperty name="LoginBean" property="backNews" />
		<p>© 2017 图书信息管理系统. All Rights Reserved | Design by retyrp</p>
	</div>

</body>
</html>