<%--
  Created by IntelliJ IDEA.
  User: 管理员
  Date: 2021/11/17
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>css/style.css">
</head>
<body>
<div class="container right-panel-active">
    <!-- 注册 -->
    <div class="container_form container--signup">
        <form action="${pageContext.request.contextPath}/toRegister" class="form" id="form1" method="Post">
            <h2 class="form_title">用户注册</h2>
            <label>
                <input type="text" placeholder="User" class="input" name="readerName"/>
            </label>
            <label>
                <input type="password" placeholder="Password" class="input" name="readerPassword"/>
            </label>
            <button class="btn">注册</button>
<%--            <button class="btn"><a href="jsp/manager/manegePlatform.jsp">管理员</a></button>--%>


        </form>

    </div>

    <!-- 登录 -->
    <div class="container_form container--signin">
        <form action="toLogin" class="form" id="form2" method="Post">
            <h2 class="form_title">用户登录</h2>
            <label>
                <input type="text" placeholder="username" class="input" name="username"/>
            </label>
            <label>
                <input type="password" placeholder="Password" class="input" name="password"/>
            </label>
            <button class="btn">登     录</button>


            <a href="<%=request.getContextPath()%>/managerLogin.jsp" class="link">管理员</a>
        </form>
    </div>

    <!-- 浮层 -->
    <div class="container_overlay">
        <div class="overlay">
            <div class="overlay_panel overlay--left">
                <button class="btn" id="signIn">登录</button>

            </div>
            <div class="overlay_panel overlay--right">
                <button class="btn" id="signUp">注册</button>
            </div>
        </div>
    </div>
</div>

<!-- 背景 -->
<div class="slidershow">
    <div class="slidershow--image" style="background-image: url('https://source.unsplash.com/Snqdjm71Y5s')"></div>
    <div class="slidershow--image" style="background-image: url('https://source.unsplash.com/5APj-fzKE-k')"></div>
    <div class="slidershow--image" style="background-image: url('https://source.unsplash.com/wnbBH_CGOYQ')"></div>
    <div class="slidershow--image" style="background-image: url('https://source.unsplash.com/OkTfw7fXLPk')"></div>
</div>

<!-- partial -->
<script src="<%=request.getContextPath()%>js/script.js"></script>
</body>
</html>


