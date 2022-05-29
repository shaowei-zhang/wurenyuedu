<%--
  Created by IntelliJ IDEA.
  User: 管理员
  Date: 2021/11/17
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>书架</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .BookshelfBook{
            display: none;
        }
    </style>

    <%--    全选操作--%>
    <script>
        function checkAll(){
            var check=document.getElementsByName("check");
            for (var i = 0; i <check.length ; i++) {
                check[i].checked = "checked";
            }
        }
    </script>
    <%--    反选操作--%>
    <script>
        function  NoCheck(){
            var chickobj=document.getElementsByName("check");
            for (let i = 0; i <chickobj.length ; i++) {
                chickobj[i].checked=!chickobj[i].checked;
            }
        }
    </script>
</head>
<body>

<div id="n" class="BookshelfBook">

    <form action="deleteSomeBooks" method="post">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <c:forEach items="${books}" var="book">
                    <div class="col-md-2 ">
                            <%--            点击小说，跳转到NovelController——>Novel.jsp--%>
                        <input type="checkbox" name="check"  value="${book.bookId}"/>
                        <a href="toNovelName?title=${book.bookName}">
                            <img alt="无" class="img-thumbnail"
                                 src="${pageContext.request.contextPath }/img/novel/${book.bookCover}.png"
                                 style=" width: 150px;height: 200px"/>
                            <div class="caption" style="font-weight: bold">
                                <div>
                                    <button class="btn btn-group">
                                        <em>${book.bookName}</em>
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <hr>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">

                    <input type="button" value="全选"  onclick="checkAll()">
                    <input type="button" value="反选"  onclick="NoCheck()">
                    <input type ="submit" value ="批量删除"  />
                </div>
            </div>
        </div>

    </form>

</div>

<div id="c" class="BookshelfBook">
    <form action="deleteSomeCartoons" method="post">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <c:forEach items="${Cartoons}" var="cartoon">
                    <div class="col-md-2 ">
                            <%--       点击小说，跳转到CartoonController——>Cartoon.jsp--%>
                                <input type="checkbox" name="check"  value="${cartoon.cartoonId}"/>
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
        <hr>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">

                    <input type="button" value="全选"  onclick="checkAll()">
                    <input type="button" value="反选"  onclick="NoCheck()">
                    <input type ="submit" value ="批量删除"  />
                </div>
            </div>
        </div>

    </form>

</div>


<script>
    window.onload = function () {
        let bookshelf = "<%=request.getParameter("bookshelf")%>"
        if (bookshelf == "nc") {
            document.getElementById("n").style.display = "block";
        } else if (bookshelf == "cc") {
            document.getElementById("c").style.display = "block";
        }
    }
</script>
</body>
</html>
