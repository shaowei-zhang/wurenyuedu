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
    <style>
        body {
            background-color: rgba(122, 160, 218, 0.56);
        }
    </style>


</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2>
                五仁阅读
            </h2>
            <div>
                <hr>
            </div>
            <c:forEach items="${List}" var="list">
            <div class="row clearfix">
                <div class="col-md-3 column">
                    <img alt="140x140" src="${pageContext.request.contextPath}/img/cartoon/${list.cartoonName}.png"
                         style="width: 140px;height: 160px"/>
                </div>
                <div class="col-md-9 column">
                    <blockquote>
                        <p>
                        <h3></h3>
                        </p>
                    </blockquote>

                    <p>
                    <h4>作者：${list.cartoonAuthor}</h4>
                    </p>
                    <p>
                    <h4>最后更新：2021年12月28日</h4>
                    </p>
<%--                    将加入书架的按钮放在这里--%>
                    <button><a href="toAddCartoonShelf?CartoonName=${list.cartoonName}">加入书架</a></button>
                </div>

                <script type="text/javascript">
                    $(function(){
                        $.getJSON("${pageContext.request.contextPath }/jsp/cartoon/${list.cartoonName}.json",function(data){
                            var $jsontip = $("#jsonTip");
                            var strHtml = "";//存储数据的变量
                            $jsontip.empty();//清空内容
                            $.each(data,function(infoIndex,info){
                                var chapter=info["chapter"];
                                var id=info["id"];
                                // 跳转到章节页面
                                strHtml +="<a href=\"toCartoonChapter?cartoonName=${list.cartoonName}&id="+id+"&chapter="+chapter+"\">"
                                    +info["chapter"]+info["chapterName"]+"</a>"+"<br><br>";

                            })
                            $jsontip.html(strHtml);//显示处理后的数据
                        })
                    })
                </script>

                </c:forEach>
                <div class="col-md-4 column">
                </div>
            </div>
            <div>
                <hr>
            </div>
            <div class="row clearfix">
                <div class="col-md-1 column">


                </div>
                <div class="col-md-10 column">

                    <span id="jsonTip"></span>

                </div>
                <div class="col-md-1 column">

                </div>
            </div>

            <div class="row clearfix">
                <div class="col-md-12 column">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>