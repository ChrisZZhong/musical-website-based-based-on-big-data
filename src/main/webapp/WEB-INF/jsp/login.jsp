<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

#guide {
	z-index: 30;
	position: fixed;
	width: 100%;
	height: 40px;
}

#register {
	display: felx;
	align-items: center;
	width: 30%;
	height: 300px;
	position: absolute;
	top: 200px;
	right: 40px;
	background-color: rgba(255, 255, 255, 0.2);
	width: 30%;
}
</style>
<script type="text/javascript">
	function _hyz()
	{
		var img = document.getElementById("VerifyCode");
		img.src = "VerifyCodeServlet?a=" + new Date().getTime();
	}
</script>
</head>
<body style="background-image: url(homepageimg/register.jpg); background-size: cover;">

	<div class="row" id="daohanglang">
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<a href="homepage" class="navbar-brand">主页</a>
			</div>
			<ul class="nav navbar-nav">
				<li>
					<a href="singertop100?pcex=1">最火歌手</a>
				</li>
				<li>
					<a href="musictop100?pcex=1">最火歌曲</a>
				</li>
			</ul>

			<form class="navbar-form navbar-right" style="margin-right: 20px;" action="search">
				<div class="form-group">
					<input type="text" class="form-control" name="name" />
				</div>
				<button type="submit" class="btn btn-danger">搜索</button>
			</form>
		</nav>
	</div>


	<div id="register">
		<div class="container" style="width: 70%; top: 100px">
			<form action="login" method="post">
				<legend style="color: red;font-size: 25px">用户登陆</legend>
				<div class="form-group">
					<label>用户名:</label>
					<input type="text" class="form-control" name="username" id="username" placeholder="输入用户名" />
				</div>

				<div class=" form-group">
					<label>密码：</label>
					<input type="password" class="form-control" name="password" id="password" />
				</div>

				<button type="submit" class="btn btn-default">登录</button>
				<input type="button" class="btn btn-default" onclick="location.href='register'" value="注册新用户" />

			</form>
			<font style="position: relative; top: 10px; color: red; font-weight: bold;" size="5">${msg}</font>
		</div>


	</div>

</body>
</html>
