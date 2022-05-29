<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>漫画</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js" ></script>
    <%--    <!-- 引入jQuery UI的js文件 -->--%>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js" ></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

    <style>
        .books{
            display:none;
        }
    </style>
<%--    <script>--%>
<%--        function search() {--%>
<%--            //取值--%>
<%--            const name = document.getElementById("search").value;--%>
<%--            alert(name);--%>
<%--            //判断--%>
<%--            if (name == "") {--%>
<%--                alert("搜索不能为空请重新输入");--%>
<%--                name.focus();--%>
<%--                window.location.href = "2-1.jsp";--%>
<%--            } else {--%>
<%--                //跳转--%>

<%--                window.location.href = "toSelectCartoonsName?cartoonName=" + name;--%>
<%--            }--%>

<%--        }--%>
<%--        $(function() {--%>

<%--            $.ajax({--%>
<%--                url: "selectOneCartoon",--%>
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
<%--<input type="text" style="border: 1px red solid; width: 200px; height: 30px; font-size: 16px;" placeholder="搜索小说或作者的名字" name="search" id="search">--%>
<%--<input type="button" value="搜索" onclick="search()">--%>
<div id="xyu" class="books">
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
</div>

<div id="xx" class="books">
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
</div>

<div id="xh" class="books">
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
</div>

<div id="l" class="books">
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
</div>

<div id="r" class="books">
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
</div>

<div id="xyi" class="books">
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
</div>

<div id="gf" class="books">
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
</div>

<div id="gx" class="books">
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
</div>

<script>

    window.onload=function() {

        let cartoon = "<%=request.getParameter("Cartoon")%>"
        if (cartoon == "校园类") {
            document.getElementById("xyu").style.display="block";
        } else if (cartoon == "仙侠类") {
            document.getElementById("xx").style.display="block";
        } else if (cartoon == "玄幻类") {
            document.getElementById("xh").style.display="block";
        } else if (cartoon == "灵异类") {
            document.getElementById("l").style.display="block";
        } else if (cartoon == "热血类") {
            document.getElementById("r").style.display="block";
        } else if (cartoon == "悬疑类") {
            document.getElementById("xyi").style.display="block";
        } else if (cartoon == "古风类") {
            document.getElementById("gf").style.display="block";
        } else if (cartoon == "搞笑类") {
            document.getElementById("gx").style.display="block";
        }
    }

</script>
</body>
</html>
