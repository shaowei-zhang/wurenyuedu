<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>阅读情况</title>
    <style>
        .RState{
            display: none;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- 引入刚刚下载的 ECharts 文件 -->
    <script src="<%=request.getContextPath()%>js/echarts.js"></script>

</head>
<body>
<div id="c" class="RState">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-6 column">
                <h1>今日小说排行</h1>
                <c:forEach items="${Novels}" var="novel">
                    <div class="col-md-4 ">
                            <%--点击小说，跳转到NovelController——>Novel.jsp--%>
                        <a href="toNovelName?title=${novel.novelName}">
                            <img alt="无" class="img-thumbnail"
                                 src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                                 style=" width: 150px;height: 200px"/>
                            <div class="caption" style="font-weight: bold">
                                <div>
                                    <button class="btn btn-group">
                                        <em>${novel.novelName}</em>
                                        <br>
                                        <em>&nbsp;点击数:${novel.novelReadingVolume}</em>
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div class="col-md-6 column">
                <h1>今日漫画排行</h1>
                <c:forEach items="${Cartoons}" var="cartoon">
                    <div class="col-md-4 ">
                            <%--点击小说，跳转到NovelController——>Novel.jsp--%>
                        <a href="toCartoonName?title=${cartoon.cartoonName}">
                            <img alt="无" class="img-thumbnail"
                                 src="${pageContext.request.contextPath}/img/cartoon/${cartoon.cartoonCover}.png"
                                 style=" width: 150px;height: 200px"/>
                            <div class="caption" style="font-weight: bold">
                                <div>
                                    <button class="btn btn-group">
                                        <em>${cartoon.cartoonName}</em>
                                        <br>
                                        <em>&nbsp;点击数:${cartoon.cartoonReadingVolume}</em>
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>







</div>
<div id="f" class="RState">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-6 column">
                <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
                <div id="main1" style="width: 550px;height:400px;"></div>
                <script type="text/javascript">
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main1'));
                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '小说'
                        },
                        tooltip: {},
                        legend: {
                            data: ['点击量']
                        },
                        xAxis: {
                            data: ['<%=request.getParameter("NovelName1")%>',
                                '<%=request.getParameter("NovelName2")%>',
                                '<%=request.getParameter("NovelName3")%>',
                                '<%=request.getParameter("NovelName4")%>',
                                '<%=request.getParameter("NovelName5")%>']
                        },
                        yAxis: {},
                        series: [
                            {
                                name: '点击量',
                                type: 'bar',
                                data: ['<%=request.getParameter("Volume1")%>',
                                    '<%=request.getParameter("Volume2")%>',
                                    '<%=request.getParameter("Volume3")%>',
                                    '<%=request.getParameter("Volume4")%>',
                                    '<%=request.getParameter("Volume5")%>']
                            }
                        ]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                </script>
            </div>
            <div class="col-md-6 column">
                <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
                <div id="main2" style="width: 550px;height:400px;"></div>
                <script type="text/javascript">
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main2'));
                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '漫画'
                        },
                        tooltip: {},
                        legend: {
                            data: ['点击量']
                        },
                        xAxis: {
                            data: ['<%=request.getParameter("Cartoon1")%>',
                                '<%=request.getParameter("Cartoon2")%>',
                                '<%=request.getParameter("Cartoon3")%>',
                                '<%=request.getParameter("Cartoon4")%>',
                                '<%=request.getParameter("Cartoon5")%>']
                        },
                        yAxis: {},
                        series: [
                            {
                                name: '点击量',
                                type: 'bar',
                                data: ['<%=request.getParameter("VolumeCartoon1")%>',
                                    '<%=request.getParameter("VolumeCartoon2")%>',
                                    '<%=request.getParameter("VolumeCartoon3")%>',
                                    '<%=request.getParameter("VolumeCartoon4")%>',
                                    '<%=request.getParameter("VolumeCartoon5")%>']
                            }
                        ]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                </script>
            </div>
        </div>
    </div>



</div>

<script>
    window.onload = function () {
        let RS = "<%=request.getParameter("RS")%>"
        if (RS == "chart") {
            document.getElementById("c").style.display = "block";
        } else if (RS == "figure") {
            document.getElementById("f").style.display = "block";
        }
    }
</script>
</body>
</html>
