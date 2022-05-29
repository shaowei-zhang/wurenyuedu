<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2021/12/30
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<p>成功</p>
<div class="row clearfix">
    <div class="col-md-12 ">
        <c:forEach items="${novels2}" var="novel">
            <div class="col-md-2 ">
                <a href="${pageContext.request.contextPath}/toNovelName?title=${novel.novelName}">

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

            </div>
        </c:forEach>
    </div>
</div>

<div class="row clearfix">
    <div class="col-md-12 ">
        <c:forEach items="${cartoons2}" var="cartoon">
            <div class="col-md-2 ">
                <a href="toCartoonName?Name=${cartoon.cartoonName}">
                    <img alt="无" class="img-rounded"
                         src="${pageContext.request.contextPath }/img/cartoon/${cartoon.cartoonCover}.png"
                         style=" width: 150px;height: 200px"/>
                    <div class="caption" style="font-weight: bold">
                        <div style="color: black">
                            <h3>
                                    ${cartoon.cartoonName}
                            </h3>
                        </div>

                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>


</body>
</html>
