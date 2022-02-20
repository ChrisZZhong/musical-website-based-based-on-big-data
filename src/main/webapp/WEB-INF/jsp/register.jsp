<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	width: 30%;
	height: 570px;
	position: absolute;
	top: 100px;
	right: 40px;
	background-color: rgba(255, 255, 255, 0.2);
}

#bj {
	height: 1000px;
	width: 100%;
	background-image: url(img/6.jpg);
	background-size: 100% 100%;
	background-attachment: fixed;
	"
}
</style>
<script type="text/javascript">
	function _hyz()
	{
		var img = document.getElementById("VerifyCode");
		img.src = "VerifyCodeServlet?a=" + new Date().getTime();
	}
	function checkForm()
	{
		var usernameFlag = checkName();
		var passwordFlag = checkPassword();
		var phoneFlag = checkPhonenumber();
		var sexFlag = checkSex();
		var emailFlag = checkEmail();
		var repasswordFlag = checkRepassword();
		var addressFlag = checkAddress();
		return false;
	}
	function checkName()
	{
		if (document.getElementById("name").value == "")
		{
			document.getElementById("tips_user").innerHTML = "<em style='color:red'>用户名不能为空</em>";
			return false;
		}

		else if (document.getElementById("name").value.length < 3
				|| document.getElementById("name").value.length > 18)
		{
			document.getElementById("tips_user").innerHTML = "<em style='color:red'>用户名由3-18位字符组成</em>";

			return false;
		}

		else
		{
			document.getElementById("tips_user").innerHTML = "<em style='color:green'></em>";
			return true;
		}
	}
	function checkPassword()
	{
		if (document.getElementById("password").value == "")
		{
			document.getElementById("tips_password").innerHTML = "<em style='color:red'>密码不能为空</em>";
			return false;
		}

		else if (document.getElementById("password").value.length < 6
				|| document.getElementById("password").value.length > 18)
		{
			document.getElementById("tips_password").innerHTML = "<em style='color:red'>密码由6-18位字符组成</em>";

			return false;
		}

		else
		{
			document.getElementById("tips_password").innerHTML = "<em style='color:green'></em>";
			return true;
		}
	}

	function checkRepassword()
	{
		if (document.getElementById("password").value != document
				.getElementById("repassword").value)
		{
			document.getElementById("tips_repassword").innerHTML = "<em style='color:red'>两次密码不一致</em>";

			return false;
		} else if (document.getElementById("repassword").value == "")
		{
			document.getElementById("tips_repassword").innerHTML = "<em style='color:red'>密码不能为空</em>";

			return false;
		} else
		{
			document.getElementById("tips_repassword").innerHTML = "<em style='color:green'></em>";
			return true;
		}

	}
	function checkAddress()
	{
		if (document.getElementById("address").value == "")
		{
			document.getElementById("tips_address").innerHTML = "<em style='color:red'>地址不能为空</em>";

			return false;
		} else
		{
			document.getElementById("tips_address").innerHTML = "<em style='color:green'></em>";
			return true;
		}

	}
	function checkEmail()
	{
		var email = document.getElementById("email").value;
		var pattern = /^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\!\:\|\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if (email.length == 0)
		{
			document.getElementById("tips_e-mail").innerHTML = "<em style='color:red'>电子邮箱不能为空</em>";

			return false;
		} else if (!pattern.test(email))
		{
			document.getElementById("tips_e-mail").innerHTML = "<em style='color:red'>电子邮箱格式不正确</em>";

			return false;
		} else
		{
			document.getElementById("tips_e-mail").innerHTML = "<em style='color:green'></em>";
			return true;
		}
	}
	function checkSex()
	{
		var sexNum = document.getElemetByName("sex");
		var sex = "";
		for (var i = 0; i < sexNum.length; ++i)
		{
			if (sexNum[i].checked)
			{
				sex = sexNum[i].value;
			}
			if (sex == "")
			{
				document.getElementById("tips_sex").innerHTML = "<em style='color:red'>未选择性别</em>";
				return false;
			} else
			{
				document.getElementById("tips_sex").innerHTML = "<em style='color:green'></em>";
				return true;
			}
		}
	}
</script>
</head>
<body style="background-image: url(homepageimg/register.jpg); background-size: cover;">
	<div id="bj">
		<div class="row" id="daohanglang">
			<nav class="navbar navbar-default" style="height: 100%;">
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
				<div>
					<form class="navbar-form navbar-right" style="margin-right: 20px;" action="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name" />
						</div>
						<button type="submit" class="btn btn-danger">搜索</button>
					</form>
			</nav>
		</div>
	</div>

	<div id="register">

		<div class="container" style="width: 100%;">
			<form form action="register" method="post"
				onsubmit="return checkName()&&checkPassword()&&checkRepassword()&&checkSex()">
				<fieldset>
					<legend>用户注册</legend>

					<div class="form-group">
						<label>用户名:</label>
						<span id="tips_user"></span>
						<input type="text" class="form-control" name="username" id="name" onBlur="return checkName()"
							onsubmit="return checkName()" />
					</div>

					<div class=" form-group">
						<label>密码：</label>
						<span id="tips_password"></span>
						<br>
						<input type="password" class="form-control" name="password" id="password"
							onBlur="return checkPassword()" />
					</div>
					<div class=" form-group">
						<label>确认密码：</label>
						<span id="tips_repassword"></span>
						<br>
						<input type="password" class="form-control" name="repassword" id="repassword"
							onBlur="return checkRepassword()" />
					</div>

					<div class=" form-group">
						<label>性别：</label>
						<span id="tips_sex"></span>
						<br>
						<input type="radio" name="gender" id="male" value="male" onsubmit="return checkSex()">
						<font style="font-weight: bold; position: relative; left: 5px;">男</font>
						<input type="radio" name="gender" id="female" value="female"
							style="position: relative; left: 200px;">
						<font style="font-weight: bold; position: relative; left: 205px;">女</font>


					</div>



					<div class=" form-group">
						<label>电话：</label>
						<span id="tips_phonenumber"></span>
						<br>
						<input type="text" class="form-control" name="phonenumber" id="phonenumber" />
					</div>
					<div class=" form-group">
						<label>个人简介：</label>
						<span id="tips_phonenumber"></span>
						<br>
						<textarea class="form-control" name="intro" id="intro" onBlur=""></textarea>
					</div>
					<button type="submit" class="btn btn-default">注册</button>
					<button type="reset" class="btn btn-default">重置</button>
					<input type="button" class="btn btn-default" onclick="location.href='login'" value="返回登录" />
				</fieldset>

			</form>
			<font style="position: relative; top: 10px; color: red; font-weight: bold;" size="5">${errorMsg}</font>

		</div>


	</div>
	</div>
</body>
</html>

