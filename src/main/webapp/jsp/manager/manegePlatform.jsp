<%--
  Created by IntelliJ IDEA.
  User: 管理员
  Date: 2021/11/16
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理平台</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="../../css/page.css" rel="stylesheet" type="text/css" />
    <link href="../../plugins/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../plugins/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../../plugins/css/icons.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="page" id="app">
    <div class="nav-left" v-show="navLeftFlag" ref="navLeft">
        <div class="LogoName">
            管理平台
        </div>
        <div class="navDiv">
            <div class="navName">导航</div>
            <div class="nav-list">                <ul>
                    <li class="nav-tab nav-ul">
                        <a href="jsp/manager/1-2.jsp" class="li-a" target="iframe"><i class="far fa-address-card"></i> 读者</a>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="jsp/manager/2-2.jsp" class="li-a" target="iframe"><i class="fas fa-book-open"></i> 小说</a>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="jsp/manager/3-2.jsp" class="li-a" target="iframe"><i class="fas fa-book-reader"></i> 漫画</a>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="jsp/manager/4-2.jsp" class="li-a" target="iframe"><i class="fas fa-chart-bar"></i> 漫画分析</a>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="jsp/manager/5-2.jsp" class="li-a" target="iframe"><i class="fas fa-chart-bar"></i> 小说分析</a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
    <div class="nav-right" ref="navRight">
        <div class="nav-top">
            <button type="button" class="btn btn-primary btn-sm hiddenBtn" style="line-height: 10px;" @click="isShowLeft">
                <i class="fas fa-sliders-h" style="font-size: 16px;"></i>
            </button>
            <a href="../../login.jsp" style="line-height: 60px;float: right"><i class="fas fa-sign-out-alt" style="font-size: 25px;"></i></a>
        </div>
        <div class="content-page" ref="cPage">
            <iframe name="iframe" width="100%" height="100%" frameborder="0" src="jsp/manager/1-2.jsp"></iframe>
        </div>
    </div>
</div>
<script src="../../js/vue.min.js"></script>
<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(function() {
        const vue = new Vue({
            el: '#app',
            data: {
                navLeftFlag: true
            },
            methods: {
                isShowLeft() {
                    if (this.navLeftFlag ) {
                        this.$refs.navRight.style.paddingLeft = '0px'
                        this.$refs.cPage.style.left = '0px';
                        this.navLeftFlag = false;
                    } else {
                        this.$refs.navRight.style.paddingLeft = '240px';
                        this.$refs.cPage.style.left = '240px';
                        this.navLeftFlag = true;
                    }
                }
            }
        })
    })

</script>
</body>
</html>
