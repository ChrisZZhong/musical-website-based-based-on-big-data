<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/echarts.min.js"></script>
<script src="js/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>歌曲</title>
<style type="text/css">
#daohanglang {
	background-color: #B92C28;
	height: 60px;
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
				<form class="navbar-form navbar-right" style="margin-right: 20px;" action="search">
					<div class="form-group">
						<input type="text" class="form-control" name="name" />
					</div>
					<button type="submit" class="btn btn-danger">搜索</button>
				</form>
			</nav>
		</div>
	</div>



	<div class="container" style="border: 0.5px solid gainsboro">
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-4">

						<br />
						<div class="container-fluid">
							<img src="music/121.jpg" style="width: 100%; height: 200px">
							<img src="${music.picture }" class="img-circle"
								style="width: 150px; height: 150px; position: relative; top: -173px; left: 24px">
						</div>
					</div>
					<div class="col-md-8">
						<div>
							<br />

							<h3>
								<span class="label label-danger" style="position: relative; top: -2px;">歌曲</span>${music.name }</h3>
						</div>
						<br />
						<div style="word-wrap: break-word; word-break: normal;">
							<font color="#ADADAD">歌手：</font>
							<a href="#">
								<span style="font-size: 20px;">${music.singers }</span>
							</a>
						</div>
						<br />
						<div class="row">
							<div class="col-md-8">
								<audio controls="controls">
									<source src="mp3/${music.id }.mp3" type="audio/mp3"></source>
									<embed height="0" width="0" src="mp3/${music.id }.mp3"></embed>
								</audio>
							</div>
							<div class="col-md-4">
								<c:choose>
									<c:when test="${empty curUser }">
										<a href="login" class="btn btn-danger btn-lg" role="button">收藏</a>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${iscollect eq 0}">
												<a href="collect?musicid=${music.id }" class="btn btn-danger btn-lg" role="button">收藏</a>
											</c:when>
											<c:otherwise>
												<a href="uncollect?musicid=${music.id }" class="btn btn-danger btn-lg" role="button">已收藏</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>

								</c:choose>
							</div>
						</div>


						<div></div>
						<br />
						<div class="row" style="width: 100%;">

							<ul class="nav nav-tabs">
								<li>
									<a href="#pan1" data-toggle="tab" style="font-size: 20px">歌词</a>
								</li>
								<li>
									<a href="#pan2" data-toggle="tab" style="font-size: 20px">echarts图</a>
								</li>

							</ul>
							<!--面板-->
							<div class="tab-content">
								<div class="tab-pane active" id="pan1">
									<div class="row"
										style="height: auto; width: 100%; word-wrap: break-word; word-break: normal; position: relative; left: 13px;">
										<p style="font-size: 14px; color: #444444;">${music.words }</p>
									</div>
								</div>
								<div class="tab-pane" id="pan2">
									<div id="main" style="width: 600px; height: 400px;"></div>
								</div>
								<script type="text/javascript">
									function loadLocalDataAndShow()
									{
										// 基于准备好的dom，初始化echarts实例
										var myChart = echarts.init(document
												.getElementById('main'));

										// 设置图表的配置项目
										myChart.setOption(
										{
											title :
											{
												text : '整体销量走势'
											},
											tooltip : {},
											legend : {},
											xAxis :
											{
												data : []
											},
											yAxis :
											{
												splitLine :
												{
													show : false
												},
												name : '销量'
											},
											dataZoom : [
											{
												type : 'slider',
												show : true,
												xAxisIndex : [ 0 ],
												start : 1,
												end : 15
											},
											{
												type : 'inside',
												xAxisIndex : [ 0 ],
												start : 1,
												end : 35
											} ],
											series : [
											{
												barWidth : "10px",
												name : '销量(单位：k)', // 和 legend 中的 data 必须一致，如果不同，不会显示。
												type : 'line',
												itemStyle :
												{
													normal :
													{
														label :
														{
															show : true,
															position : 'top',
															textStyle :
															{
																color : '#00F'
															}
														}
													}
												},
												data : []
											} ]
										});
										myChart.showLoading();

										var names = [];
										var nums = [];

										$
												.ajax(
												{
													type : 'get',
													url : 'http://localhost:8080/com.test.music/getdata?songname=${music.name}',
													dataType : "json",
													success : function(result)
													{
														// 提取数组中的每一个元素的 category 和 num 分别放入 names、nums
														$
																.each(
																		result,
																		function(
																				index,
																				item)
																		{
																			names
																					.push(item.categories);
																			nums
																					.push(item.data);
																		});

														myChart.hideLoading();
														myChart.setOption(
														{
															xAxis :
															{
																data : names
															},
															series : [
															{
																data : nums
															} ]
														});
													},
													error : function(errorMsg)
													{
														alert("Data is Error.");
														myChart.hideLoading();
													}
												});

									};

									loadLocalDataAndShow();
								</script>

							</div>

						</div>





					</div>

				</div>

			</div>

			<div class="col-md-4">
				<br /> <br />
				<div class="list-group" style="width: 70%; position: relative; left: 60px;">
					<a href="#" class="list-group-item list-group-item-action active">畅销歌曲</a>
					<c:forEach items="${musics2 }" var="music2">
						<a href="music?id=${music2.id }" class="list-group-item list-group-item-action">${music2.name }</a>
					</c:forEach>
				</div>


			</div>

		</div>
	</div>



	</div>

	<c:if test="${empty curUser}">
		先登录再发表评论
	</c:if>
	<c:if test="${!empty curUser}">
		<form method="post" action="comment">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">发表评论</h3>
				</div>
				<div class="panel-body">

					<input type="text" name="music_id" value="${music.id}" style="display: none" />
					<input type="text" name="user_id" value="${curUser.id}" style="display: none" />
					<input type="text" name="username" value="${curUser.username}" style="display: none" />
					<div class="form-group">
						<label for="name">评论内容</label>
						<textarea class="form-control" name="context" rows="5" cols="100"></textarea>
					</div>

				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-info">发表</button>
				</div>
			</div>
		</form>
	</c:if>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">网友评论</h3>
		</div>
		<div class="panel-body">
			<ul class="list-group">
				<c:forEach items="${l}" var="item">
					<li class="list-group-item">
						${item.context} <br> 用户名：${item.username} 时间：${item.date }
						<c:if test="${item.user_id eq curUser.id}">
							<a href="deleteComment?comment_id=${item.id}&music_id=${music.id}">
								<button type="button" class="btn btn-warning">删除</button>
							</a>
						</c:if>
					</li>
				</c:forEach>


			</ul>

		</div>
	</div>

</body>
</html>
