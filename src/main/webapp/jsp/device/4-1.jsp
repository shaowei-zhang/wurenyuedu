<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>女生</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .GBook{
            display: none;
        }
    </style>
</head>
<body>

<div id="n" class="GBook">
    <div class="row clearfix">
        <div class="col-md-12 ">
            <c:forEach items="${novels}" var="novel">
                <div class="col-md-2 ">
                    <a href="toNovelName?title=${novel.novelName}">

                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/novel/${novel.novelCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div>
                                <button class="btn btn-group">
                                    <em>${novel.novelName}</em>
                                </button>
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

<div id="c" class="GBook">
    <div class="row clearfix">
        <div class="col-md-12">
            <c:forEach items="${cartoons}" var="cartoon">
                <div class="col-md-2 ">
                    <a href="toCartoonName?Name=${cartoon.cartoonName}">
                        <img alt="无" class="img-thumbnail"
                             src="${pageContext.request.contextPath }/img/cartoon/${cartoon.cartoonCover}.png"
                             style=" width: 150px;height: 200px"/>
                        <div class="caption" style="font-weight: bold">
                            <div>
                                <button class="btn btn-group">
                                    <em>${cartoon.cartoonName}</em>
                                </button>
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
        let women = "<%=request.getParameter("women")%>"
        if (women == "nc") {
            document.getElementById("n").style.display = "block";
        } else if (women == "cc") {
            document.getElementById("c").style.display = "block";
        }
    }
</script>
</body>
</html>
