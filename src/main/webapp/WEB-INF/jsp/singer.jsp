<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/echarts.min.js"></script>
<script src="js/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<title>歌手</title>
<script language="JavaScript">
	
</script>
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
	</div>

	<div class="container" style="border: 0.5px solid gainsboro">
		<div class="col-md-8 col-sm-6">
			<h3 style="position: relative; left: 10px;">
				<span class="label label-danger" style="position: relative; top: -2px; left: -10px;">歌手</span>
				${singer.name } 总销量:${singer.sale }
			</h3>

			<div class="panel-heading">
				<img src="${singer.picture }" class="img-rounded" style="width: 100%;" />
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#" data-toggle="collapse" data-target="#channel_demo3">歌手简介</a>
					</h4>
				</div>
				<div class="collapse panel-collapse in" id="channel_demo3">
					<div class="panel-body">
						<div class="row"
							style="height: auto; width: 100%; word-wrap: break-word; word-break: normal; position: relative; left: 13px;">
							${singer.intro }</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#" data-toggle="collapse" data-target="#channel_demo4">歌手唱片总销量走势</a>
					</h4>
				</div>
				<div class="collapse panel-collapse in" id="channel_demo4">
					<div class="panel-body">
						<div class="row"
							style="height: auto; width: 100%; word-wrap: break-word; word-break: normal; position: relative; left: 13px;">
							<div id="main" style="width: 300px; height: 200px;"></div>
							<!-- echarts -->

						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				function loadLocalDataAndShow()
				{
					// 基于准备好的dom，初始化echarts实例
					var myChart = echarts.init(document.getElementById('main'));

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
								url : 'http://localhost:8080/com.test.music/getsingerdata?singername=${singer.name}',
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

			<div>
				<table class="table table-striped">
					<tr>
						<th style="font-size: 20px; color: red">热销歌曲</th>
					</tr>

					<c:forEach items="${singer.musics}" var="music">
						<tr>
							<th>${music }</th>
						</tr>
					</c:forEach>

				</table>
			</div>



		</div>

		<div class="col-md-4 col-sm-6">
			<br /> <br />
			<div class="list-group" style="width: 70%; position: relative; left: 60px;">
				<a href="#" class="list-group-item list-group-item-action active"> 歌手榜 </a>
				<c:forEach items="${singers }" var="singer1">
					<a href="singer?id=${singer1.id }" class="list-group-item list-group-item-action">${singer1.name }</a>
				</c:forEach>
			</div>

		</div>

	</div>
	<br />
	<br />
	<br />
	<br />
</body>
</html>
