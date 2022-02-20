<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Musics——Top100</title>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
				<div>
					<form class="navbar-form navbar-right" style="margin-right: 20px;" action="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name" />
						</div>
						<button type="submit" class="btn btn-danger">搜索</button>
					</form>
				</div>
			</nav>
		</div>
	</div>
	</div>


	<div class="container">
		<div style="text-align: center;">
			<img src="music/120.jpg" width="80%" height="300px" style="display: inline-block;" />
		</div>
		<div style="width: 100%;">
			<table class="table table-striped" style="margin: 0 auto; width: 80%;">
				<tr>
					<th>排行</th>
					<th>歌曲</th>
					<th>播放</th>
					<th>销量</th>
				</tr>
				<c:forEach items="${pb.listbeans}" var="Music">
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
			</table>



		</div>
		<div class="row" style="position: relative; left: 400px">
			<ul class="fanye">
				<c:choose>
					<c:when test="${pb.pc eq 1 }">
						<li>
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${pb.url}?pcex=${pb.pc-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="1" end="${pb.tp}" var="i">
					<c:choose>
						<c:when test="${i eq pb.pc }">
							<li class="active">
								<a href="${pb.url}?pcex=${i}">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="${pb.url}?pcex=${i}">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pb.pc eq pb.tp }">
						<li class="disabled">
							<a href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${pb.url}?pcex=${pb.pc+1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>