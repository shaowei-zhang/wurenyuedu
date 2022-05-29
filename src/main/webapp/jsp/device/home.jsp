<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		  content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
	<title>主页</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js" ></script>
	<%--    <!-- 引入jQuery UI的js文件 -->--%>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<%--	这个是小说的自动补全查询--%>
	<script>
		$(function() {
			$.ajax({
				url: "../../SelectOneNovel",
				type : "post",
				dataType : "json",
				success : function(msg) {
					$("#novelName").autocomplete({
						source : msg
					});
				}
			});
		});
	</script>
<%--	这个是漫画的自动补全查询--%>
	    <script>
	        function search() {
	            //取值
	            const name = document.getElementById("search").value;
	            //判断
	            if (name == "") {
	                alert("搜索不能为空请重新输入");
	                name.focus();
	                window.location.href = "2-1.jsp";
	            } else {
	                //跳转
	                window.location.href = "../../toSelectCartoonsName?cartoonName=" + name;
	            }
	        }
	        $(function() {
	            $.ajax({
	                url: "../../selectOneCartoon",
	                type : "post",
	                dataType : "json",
	                success : function(msg) {

	                    $("#search").autocomplete({
	                        source : msg
	                    });
	                }
	            });
	        });
	    </script>

</head>

<body>
<div class="container">

	<div class="row clearfix">
		<div class="col-md-12 column">
			<%--			轮播图--%>
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="../../img/1.png" alt="First slide" style="width: 1200px;height: 200px">
					</div>
					<div class="item">
						<img src="../../img/2.png" alt="Second slide" style="width: 1200px;height: 200px">
					</div>
					<div class="item">
						<img src="../../img/3.png" alt="Third slide" style="width: 1200px;height: 200px">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div>
				<hr>
			</div>
			<div class="container mt-3">

	<div style="width: 100%">
<%--		漫画--%>
		<div style="float: left;">
			<label for="search"></label><input type="text" style="border: 1px black solid; width: 200px; height: 30px; font-size: 16px;margin-bottom: 0px;" placeholder="请输入小说名称" name="search" id="search">
			<input type="button" value="搜索" onclick="search()" style=" height: 30px;margin-bottom:0px;">
		</div>
<%--	小说--%>
		<div style="float: right; width: 300px;">
			<div class="d-flex mb-3">
				<div class="p-2 mr-auto "></div>
				<div class="p-2">
					<form action="${pageContext.request.contextPath}/toSelectNovelsName"
						  class="bs-example bs-example-form" role="form" method="post">
						<div class="row">
							<div class="col-md-8">
								<div class="input-group">
									<input style="border: 1px black solid; width: 200px; height: 30px; font-size: 16px;" type="text" name="novelName" id="novelName" class="form-control" placeholder="请输入漫画名称">
									<input type="submit" value="查询" >
								</div>
							</div>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<%--	这是小说的--%>


			</div>


		</div>
	</div>


	<div class="row clearfix">
		<div class="col-md-8 ">
			<h1>漫画类</h1>
			<div>
				<hr>
			</div>
			<c:forEach items="${cartoons}" var="cartoon">
				<div class="col-md-3 ">
					<a href="${pageContext.request.contextPath }/toCartoonName?Name=${cartoon.cartoonName}">
						<img alt="无" class="img-thumbnail"
							 src="${pageContext.request.contextPath }/img/cartoon/${cartoon.cartoonCover}.png"
							 style=" width: 150px;height: 180px"/>
						<div class="caption" style="font-weight: bold">
			<div style="color: black">
				<h3>
						${cartoon.cartoonName}
				</h3>
			</div>
						</div>
					</a>
			<div>

			</div>
				</div>
			</c:forEach>
		</div>

		<div class="col-md-4 column">
			<h1>小说类</h1>
			<div>
				<hr>
			</div>
			<c:forEach items="${novels}" var="novel">
				<div class="media">
					<a href="${pageContext.request.contextPath }/toNovelName?title=${novel.novelName}" class="pull-left">
						<img src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
							 class="media-object" alt='' style="width: 80px;height: 120px"/>


						<div style="color: black">
							<h3>
									${novel.novelName}
							</h3>
								${novel.novelSynopsis}
						</div>
					</a>
				</div>
				<hr>
			</c:forEach>

		</div>
	</div>
</div>

</body>
</html>
