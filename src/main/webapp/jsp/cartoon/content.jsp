<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2021/12/30
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body{
            background-color: rgba(122, 160, 218, 0.56);
        }
    </style>


</head>
<body>
<div class="container">
    <c:forEach items="${List}" var="list">
        <div class="row clearfix">
            <div class="col-md-4 column">
            </div>
            <div class="col-md-4 column">
                <!-- 标准的按钮 -->
                <button type="button" class="btn btn-default">
                    <a href="toPreviousChapter2?id=<%=request.getParameter("id")%>&CartoonName=${list.cartoonName}">上一章</a>
                </button>
                <!-- 标准的按钮 -->
                <button type="button" class="btn btn-default">
                    <a href="toCartoonName?Name=${list.cartoonName}">目录</a>
                </button>
                <!-- 标准的按钮 -->
                <button type="button" class="btn btn-default">
                    <a href="toNextChapter2?id=<%=request.getParameter("id")%>&CartoonName=${list.cartoonName}">下一章</a>
                </button>
            </div>
            <div class="col-md-4 column">
            </div>
        </div>

        <script type="text/javascript">
            $(function(){
                $.getJSON("${pageContext.request.contextPath }/jsp/cartoon/${list.cartoonName}.json",function(data){
                    var $jsontip = $("#jsonTip");
                    var strHtml = "";//存储数据的变量
                    let ID = "<%=request.getParameter("id")%>"
                    $jsontip.empty();//清空内容
                    $.each(data,function(infoIndex,info){
                        var id=info["id"];
                        if (ID===id){
                            strHtml +=info["chapter"]+"   "+info["chapterName"]+"<br><br>";
                                <%--"${pageContext.request.contextPath}/jsp/cartoon/${list.cartoonName}/"+id+".png";--%>
                        }
                    })
                    $jsontip.html(strHtml.replaceAll("。","。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));//显示处理后的数据

                })
            })
        </script>
        <div class="row clearfix">
            <div class="col-md-1 column">

            </div>
            <div class="col-md-10 column">

                    <span id="jsonTip">
                    </span>
                <div>
                    <img src="${pageContext.request.contextPath}/jsp/cartoon/${list.cartoonName}/<%=request.getParameter("id")%>.png" alt="无"/>
                </div>

            </div>
            <div class="col-md-1 column">

            </div>
        </div>
</div>
    </c:forEach>



</body>
</html>
