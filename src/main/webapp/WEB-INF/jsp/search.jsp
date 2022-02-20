<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<title>搜索</title>
<style type="text/css">
.fanye li {
	float: left;
	margin-left: 10px;
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 20px;
}

.fanye {
	list-style: none;
}
</style>
</head>
<body>

	<div class="container-fluid">

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
									<a href="personalcenter">个人中心</a>
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






		<div class="container">
			<div style="width: 100%;">
				<table class="table table-striped" style="margin: 0 auto; width: 80%;">
					<c:choose>
						<c:when test="${empty singers }"></c:when>
						<c:otherwise>
							<c:forEach items="${singers}" var="Singer">
								<tr>
									<td style="width: 10%"><a href="singer?id=${Singer.id }">${Singer.id }</a></td>
									<td style="width: 30%;"><a href="singer?id=${Singer.id }">${Singer.name }</a></td>
									<td>${Singer.sale }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty musics }"></c:when>
						<c:otherwise>
							<c:forEach items="${musics}" var="Music">
								<tr>
									<td style="width: 10%"><a href="music?id=${Music.id}">${Music.id }</a></td>
									<td style="width: 30%;"><a href="music?id=${Music.id}">${Music.name }</a></td>
									<td><audio controls="controls">
											<source src="mp3/${Music.id }.mp3" type="audio/mp3"></source>
											<embed height="0" width="0" src="mp3/${Music.id }.mp3"></embed>
										</audio></td>
									<td style="width: 10%;">${Music.sale }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>

	</div>

</body>
</html>
