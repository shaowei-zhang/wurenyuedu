<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2022/1/5
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>css/mangerLoginStyle.css">

</head>
<body>
<div class="container_manager">
<!-- 登录 -->
    <form action="administrators" class="form" id="form2" method="Post">
        <h2 class="form_title">管理员登录</h2>
        <label>
            <input type="text" placeholder="username" class="input" name="username"/>
        </label>
        <label>
            <input type="password" placeholder="Password" class="input" name="password"/>
        </label>
        <button class="btn">登录</button>
        <a href="<%=request.getContextPath()%>/login.jsp" class="link">返回</a>

    </form>`
</div>

</body>
</html>
