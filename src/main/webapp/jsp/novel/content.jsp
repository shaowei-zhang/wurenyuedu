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
                <a href="toPreviousChapter?id=<%=request.getParameter("id")%>&NovelName=${list.novelName}">上一章</a>
            </button>
            <!-- 标准的按钮 -->
            <button type="button" class="btn btn-default">
                <a href="toNovelName?title=${list.novelName}">目录</a>
            </button>
            <!-- 标准的按钮 -->
            <button type="button" class="btn btn-default">
                <a href="toNextChapter?id=<%=request.getParameter("id")%>&NovelName=${list.novelName}">下一章</a>
            </button>
        </div>
        <div class="col-md-4 column">
        </div>
    </div>

    <script type="text/javascript">
        $(function(){
            $.getJSON("${pageContext.request.contextPath }/jsp/novel/${list.novelName}.json",function(data){
                var $jsontip = $("#jsonTip");
                var strHtml = "";//存储数据的变量
                // 接受后台传过来的id
                let ID = "<%=request.getParameter("id")%>"
                $jsontip.empty();//清空内容
                $.each(data,function(infoIndex,info){
                    // 验证id来提取全部的content
                    var id=info["id"];
                    if (ID===id){
                        strHtml +=info["chapter"]+"   "+info["chapterName"]+"<br><br>"+info["content"];
                    }

                })
                $jsontip.html(strHtml.replaceAll("。","。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));//显示处理后的数据

            })
        })
    </script>

        </c:forEach>

    <div class="row clearfix">
        <div class="col-md-1 column">

        </div>
        <div class="col-md-10 column">
            <h3>
                <span id="jsonTip"></span>
            </h3>
        </div>
        <div class="col-md-1 column">

        </div>
    </div>
</div>
    </div>
</body>
</html>
