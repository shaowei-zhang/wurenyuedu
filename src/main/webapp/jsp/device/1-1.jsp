<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>小说</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%--    引用链接--%>
<%--    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js" ></script>--%>
<%--    &lt;%&ndash;    <!-- 引入jQuery UI的js文件 -->&ndash;%&gt;--%>
<%--    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js" ></script>--%>
<%--    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">--%>
    <style>
        .books {
            display: none;
        }
    </style>

<%--    <script>--%>
<%--        function search() {--%>
<%--            //取值--%>
<%--            const name = document.getElementById("search").value;--%>

<%--            //判断--%>
<%--            if (name == "") {--%>
<%--                alert("搜索不能为空请重新输入");--%>
<%--                name.focus();--%>
<%--                window.location.href = "1-1.jsp";--%>
<%--            } else {--%>
<%--                //跳转--%>
<%--                window.location.href = "toSelectNovelsName?novelName=" + name;--%>
<%--            }--%>

<%--        }--%>
<%--        $(function() {--%>

<%--            $.ajax({--%>
<%--                url: "SelectOneNovel",--%>
<%--                type : "post",--%>
<%--                dataType : "json",--%>
<%--                success : function(msg) {--%>

<%--                    $("#search").autocomplete({--%>
<%--                        source : msg--%>
<%--                    });--%>
<%--                }--%>

<%--            });--%>

<%--        });--%>
<%--    </script>--%>
</head>
<body>
<%--<input type="text" style="border: 1px red solid; width: 200px; height: 30px; font-size: 16px;" placeholder="搜索小说或作者的名字" name="search" id="search"  >--%>
<%--<input type="button" value="搜索" onclick="search()">--%>

<%--//武侠类--%>
<div id="w" class="books">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels2}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">
                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div style="color: black">
                                <h3>${novel.novelName}</h3>
                            </div>
                        </div>
                    </a>
                    <div>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%--悬疑类--%>
<div id="x" class="books">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels2}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">

                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div style="color: black">
                                <h3>${novel.novelName}</h3>
                            </div>
                        </div>
                    </a>

                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%--言情类--%>
<div id="y" class="books">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels2}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">

                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div style="color: black">
                                <h3>${novel.novelName}</h3>
                            </div>
                        </div>
                    </a>

                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%--神话类--%>
<div id="s" class="books">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels2}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">

                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div style="color: black">
                                <h3>${novel.novelName}</h3>
                            </div>
                        </div>
                    </a>

                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%--名著类--%>
<div id="m" class="books">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels2}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">

                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div style="color: black">
                                <h3>${novel.novelName}</h3>
                            </div>
                        </div>
                    </a>

                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%--恐怖类--%>
<div id="k" class="books">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels2}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">

                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div style="color: black">
                                <h3>${novel.novelName}</h3>
                            </div>
                        </div>
                    </a>

                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%--玄幻类--%>
<div id="h" class="books">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels2}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">

                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div style="color: black">
                                <h3>${novel.novelName}</h3>
                            </div>
                        </div>
    </a>

                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>

    window.onload = function () {

        let novel = "<%=request.getParameter("Novel")%>"
        if (novel == "武侠类") {
            document.getElementById("w").style.display = "block";
        } else if (novel == "悬疑类") {
            document.getElementById("x").style.display = "block";
        } else if (novel == "言情类") {
            document.getElementById("y").style.display = "block";
        } else if (novel == "神话类") {
            document.getElementById("s").style.display = "block";
        } else if (novel == "名著类") {
            document.getElementById("m").style.display = "block";
        } else if (novel == "恐怖类") {
            document.getElementById("k").style.display = "block";
        } else if (novel == "玄幻类") {
            document.getElementById("h").style.display = "block";
        }
    }

</script>
</body>
</html>
