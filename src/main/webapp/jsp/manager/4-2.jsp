
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>阅读分析</title>
</head>
<body style="width: 1200px">

<div id="container" style="min-width:450px;height:450px"></div>


<script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
<script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>
    $(function (){
        $.ajax({
            url:"../../toCartoonReadingState",
            type:"POST",
            success:function (jsonData){
                // Build the chart

                Highcharts.chart('container', {
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: '漫画阅读量分析'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        name: 'Brands',
                        colorByPoint: true,
                        data: [{
                            name: jsonData[0].classOfStory,
                            y: jsonData[0].volumeSum,
                            sliced: true,
                            selected: true
                        }, {
                            name: jsonData[1].classOfStory,
                            y: jsonData[1].volumeSum
                        }, {
                            name: jsonData[2].classOfStory,
                            y: jsonData[2].volumeSum
                        }, {
                            name: jsonData[3].classOfStory,
                            y: jsonData[3].volumeSum
                        }, {
                            name: jsonData[4].classOfStory,
                            y: jsonData[4].volumeSum
                        }, {
                            name: jsonData[5].classOfStory,
                            y: jsonData[5].volumeSum
                        }, {
                            name: jsonData[6].classOfStory,
                            y: jsonData[6].volumeSum
                        }, {
                                name: jsonData[7].classOfStory,
                                y: jsonData[7].volumeSum
                            }]

                    }]
                });
            }
        });
    })

</script>
</body>
</html>
