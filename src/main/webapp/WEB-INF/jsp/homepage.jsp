<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>双鹰云</title>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
#daohanglang {
	background-color: #B92C28;
	height: 60px;
}

#Lubotu {
	background-color: #66AFE9;
	height: 400px;
}

#small {
	list-style: none;
	display: inline-flex;
}

#di {
	position: relative;
	top: 10px;
	width: 60px;
}
</style>
</head>
<body>
	<div class="container-fluid" id="frame">

		<div class="row" id="daohanglang">
			<nav class="navbar navbar-default" style="height: 100%;">
				<div class="navbar-header active">
					<a href="homepage" class="navbar-brand">主页</a>
				</div>
				<ul class="nav navbar-nav" style="display: felx; justify-content: space-around">
					<li>
						<a href="singertop100?pcex=1">最火歌手</a>
					</li>
					<li>
						<a href="musictop100?pcex=1">最火歌曲</a>
					</li>
					<li>
						<form class="navbar-form navbar-right" style="margin-right: 20px;" action="search">
							<div class="form-group">
								<input type="text" class="form-control" name="name" />
							</div>
							<button type="submit" class="btn btn-danger">搜索</button>
						</form>
					</li>
				</ul>


				<div class="dropdown col-sm-3 col-sm-offset-2"
					style="position: relative; left: 450px; top: 10px;">

					<c:choose>
						<c:when test="${empty curUser}">
							<button type="button" class="btn btn-danger" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"></span>
								点击登陆
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-left">
								<li>
									<a href="login">登录</a>
								</li>
								<li>
									<a href="register">注册</a>
								</li>
							</ul>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-danger" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"></span>
								${curUser.username }
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-left">
								<li>
									<a href="personalcenter?id=${curUser.id }">个人中心</a>
								</li>
								<li>
									<a href="unlog">注销</a>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		</div>
	</div>





	<div class="container" style="border: 0.5px solid grey">
		<div class="row" id="Lubotu">
			<div id="lunbotu" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#lunbotu" data-slide-to="0" class="active"></li>
					<li data-target="#lunbotu" data-slide-to="1"></li>
					<li data-target="#lunbotu" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="homepageimg/taylor.jpg" alt="..." style="width: 100%; height: 400px;">
						<div class="carousel-caption">...</div>
					</div>
					<div class="item">
						<img src="homepageimg/Maroon 5.jpg" alt="..." style="width: 100%; height: 400px;">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="homepageimg/Ed Sheeran.jpg" alt="..." style="width: 100%; height: 400px;">
						<div class="carousel-caption">...</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#lunbotu" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#lunbotu" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>




			</div>

		</div>

		<div class="row">
			<div class="col-md-8 col-sm-6" style="margin-top: 40px;">
				<div class="row">
					<div class="col-md-3" style="display: inline-block; text-align: right; left: 70px;">
						<font size="5">榜单推荐歌曲</font>
					</div>
				</div>
				<hr style="color: red; width: 60%;" />
				<c:forEach items="${musics }" var="music">
					<div class="col-md-4" style="float: left;">
						<a href="music?id=${music.id }">
							<img src="${music.picture }" style="height: 150px; width: 150px;" />
						</a>
						<br />
						<span>${music.name }</span>
						<br /> <br />
					</div>
				</c:forEach>

				<div class="col-md-4"></div>

			</div>
			<div class="col-md-4 col-sm-6">
				<div class="list-group" style="width: 60%; margin-top: 40px">
					<a href="#" class="list-group-item list-group-item-action active">畅销歌曲</a>
					<c:forEach items="${musics2 }" var="music2">
						<a href="music?id=${music2.id }" class="list-group-item list-group-item-action">${music2.name }</a>
					</c:forEach>
				</div>


			</div>

		</div>


		<div class="row">
			<div class="col-md-8 col-sm-6">

				<font size="5" style="position: relative; left: 70px;">榜单推荐歌手</font>

				<hr style="color: red; width: 60%;" />
				<table width="500px" class="table table-bordered table-striped table-hover"
					style="width: 70%; margin: 0 auto; text-align: center; margin-botton: 30px">
					<c:forEach items="${singers1 }" var="singer">
						<tr>
							<td style="width: 33%;">${singer.id }</td>
							<td style="width: 33%;">${singer.name }</td>
							<td>${singer.sale }</td>
						</tr>
					</c:forEach>
				</table>

				<div style="width: 220px; position: absolute; left: 799px; top: 20px">
					<a href="#" class="list-group-item list-group-item-action active"> 歌手榜 </a>
					<c:forEach items="${singers }" var="singer1">
						<a href="singer?id=${singer1.id }" class="list-group-item list-group-item-action">${singer1.name }</a>
					</c:forEach>
				</div>

			</div>

		</div>

	</div>
	<br />
	<br />
	<br />
	<br />
</body>
</html>
