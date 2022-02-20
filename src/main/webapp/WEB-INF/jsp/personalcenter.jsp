<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/echarts.min.js"></script>
<script src="js/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script language="JavaScript" src="../js/bootstrap.min.js"></script>
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
			</nav>
		</div>
	</div>




	<div class="container" style="border: 0.5px solid gray; height: 700px; border-radius: 10px;">

		<h1>数据展示</h1>
		<div class="row"></div>
		<div class="col-md-3">

			<ul class="nav nav-pills nav-stacked">
				<li class="active">
					<a href="#pan1" data-toggle="tab">个人信息</a>
				</li>
				<li>
					<a href="#pan2" data-toggle="tab">我的收藏</a>
				</li>
				<c:choose>
					<c:when test="${curUser.level eq 2 }">

						<li>
							<a href="#pan3" data-toggle="tab">echarts图</a>
						</li>


					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>


			</ul>




		</div>

		<div class="col-md-9">


			<div class="tab-content">
				<div class="tab-pane active" id="pan1">
					<div class="row" style="height: auto;">
						<p class="h4" style="height: 40px;">
							<small>名称:</small>${curUser.username}</p>
						<p class="h4" style="height: 40px;">
							<small>密码:</small>${curUser.password}</p>
						<p class="h4" style="height: 40px;">
							<small>性别:</small>${curUser.gender}</p>
						<p class="h4" style="height: 40px;">
							<small>电话:</small>${curUser.phonenumber}</p>
						<p class="h4" style="height: auto;">
							<small>其他信息:</small>${curUser.intro}</p>
					</div>

				</div>




				<div class="tab-pane" id="pan2">
					<div class="row" style="word-wrap: break-word; word-break: normal; font-size: 16px;">
						<table class="table table-striped">
							<tr>
								<th>歌曲id</th>
								<th>歌曲名</th>
								<th>播放</th>
								<th>取消收藏</th>
							</tr>
							<c:forEach items="${musics_collects }" var="music">
								<tr>
									<td><a href="music?id=${music.id }">${music.id }</a></td>
									<td><a href="music?id=${music.id }">${music.name }</a></td>
									<td>播放</td>
									<td>取消收藏</td>

								</tr>
							</c:forEach>

						</table>


					</div>


				</div>
				<div class="tab-pane" id="pan3">
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
									url : 'http://localhost:8080/com.test.music/getsaledata?',
									dataType : "json",
									success : function(result)
									{
										// 提取数组中的每一个元素的 category 和 num 分别放入 names、nums
										$.each(result, function(index, item)
										{
											names.push(item.categories);
											nums.push(item.data);
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
</body>
</html>