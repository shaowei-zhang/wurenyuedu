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
    <title>五仁阅读</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="css/page.css" />
    <link href="plugins/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/css/icons.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page" id="app">
    <div class="nav-left" v-show="navLeftFlag" ref="navLeft">
        <div class="LogoName">
            五仁阅读
        </div>
        <div class="navDiv">
            <div class="navName">导航</div>
            <div class="nav-list">
                <ul>
                    <li class="nav-tab a_active waves-effect">
                        <a href="jsp/device/home.jsp" class="li-a active" target="iframe"><i class="fas fa-home"></i> 主页
                        </a>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a" target="iframe"><i class="fas fa-book-open"></i> 小说
                            <i class='bx bx-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="toSelectNovelsOfStory?Novel=武侠类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>武侠类</a>
                            <a href="toSelectNovelsOfStory?Novel=悬疑类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>悬疑类</a>
                            <a href="toSelectNovelsOfStory?Novel=言情类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>言情类</a>
                            <a href="toSelectNovelsOfStory?Novel=神话类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>神话类</a>
                            <a href="toSelectNovelsOfStory?Novel=名著类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>名著类</a>
                            <a href="toSelectNovelsOfStory?Novel=恐怖类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>恐怖类</a>
                            <a href="toSelectNovelsOfStory?Novel=玄幻类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>玄幻类</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a" target="iframe"><i class="fas fa-book-reader"></i> 漫画
                            <i class='bx bx-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="toSelectCartoonsOfStory?Cartoon=校园类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>校园类</a>
                            <a href="toSelectCartoonsOfStory?Cartoon=仙侠类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>仙侠类</a>
                            <a href="toSelectCartoonsOfStory?Cartoon=玄幻类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>玄幻类</a>
                            <a href="toSelectCartoonsOfStory?Cartoon=灵异类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>灵异类</a>
                            <a href="toSelectCartoonsOfStory?Cartoon=热血类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>热血类</a>
                            <a href="toSelectCartoonsOfStory?Cartoon=悬疑类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>悬疑类</a>
                            <a href="toSelectCartoonsOfStory?Cartoon=古风类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>古风类</a>
                            <a href="toSelectCartoonsOfStory?Cartoon=搞笑类" class="li-a-a" target="iframe"><i class="fas fa-share"></i>搞笑类</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a"><i class="fas fa-chess-king"></i> 男生
                            <i class='bx bx-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="toSelectNovelsOfSex?pageName=boy" class="li-a-a" target="iframe"><i class="fas fa-book-open"></i>小说类</a>
                            <a href="toSelectCartoonsOfSex?pageName=boy" class="li-a-a" target="iframe"><i class="fas fa-book-reader"></i>漫画类</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a"><i class="fas fa-chess-queen"></i> 女生
                            <i class='bx bx-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="toSelectNovelsOfSex?pageName=girl" class="li-a-a" target="iframe"><i class="fas fa-book-open"></i></i>小说类</a>
                            <a href="toSelectCartoonsOfSex?pageName=girl" class="li-a-a" target="iframe"><i class="fas fa-book-reader"></i>漫画类</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a"><i class='fas fa-book'></i>  书架
                            <i class='bx bx-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="toShowNovels" class="li-a-a" target="iframe"><i class="fas fa-book-open"></i>小说类</a>
                            <a href="toShowCartoons" class="li-a-a" target="iframe"><i class="fas fa-book-reader"></i>漫画类</a>
                        </div>
                    </li>
                    <li class="nav-tab nav-ul">
                        <a href="javascript:void[0]" class="li-a"><i class="fas fa-chart-bar"></i> 阅读情况
                            <i class='bx bx-chevron-right' style="float: right;"></i></a>
                        <div class="nav-box">
                            <a href="toShowNovelReadingVolume?RS=chart" class="li-a-a" target="iframe"><i class="fas fa-synagogue"></i>排行榜</a>
                            <a href="toEcharts?RS=figure" class="li-a-a" target="iframe"><i class="fas fa-eye"></i>阅读分析图</a>
                        </div>
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
            <a href="login.jsp" style="line-height: 60px;float: right"><i class="fas fa-sign-out-alt" style="font-size: 25px;"></i></a>
        </div>
        <div class="content-page" ref="cPage">
            <iframe name="iframe" width="100%" height="100%" frameborder="0" src="jsp/device/home.jsp"></iframe>
        </div>
    </div>
</div>
<script src="js/vue.min.js"></script>
<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(function() {
        let navflag = false;
        $('.nav-tab').click(function() {
            $(this).siblings().each(function() {
                $(this).removeClass('a_active');
                // $(this).removeClass('a_active');
                $(this).find('.nav-box').css('height', '0')
                //关闭右侧箭头
                if ($(this).attr('class').indexOf('nav-ul') != -1) {
                    $(this).find('.bx-chevron-right').css('transform', 'rotateZ(0deg)')
                    $(this).find('.bx-chevron-right').css('transition', 'all .5s')
                    $(this).removeClass('nav-show')
                    // $(this).find('div').removeClass('nav-box')
                }
            })
            //当前选中
            $(this).addClass('a_active')
            $(this).find('.li-a').addClass('active')
            // 打开右侧箭头
            $(this).find('.bx-chevron-right').css('transform', 'rotateZ(90deg)')
            $(this).find('.bx-chevron-right').css('transition', 'all .5s')
            $(this).addClass('nav-show')
            // $(this).find('div').addClass('nav-box')
        })
        /* 二级菜单a点击事件 */
        $(".li-a-a").click(function() {
            $(".li-a-a").each(function() {
                $(this).removeClass('active-li-a');
            })
            $(this).addClass('active-li-a');
        })

    })
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
                    // this.$refs.navLeft.style.width = '0px';
                    // setTimeout(()=>{
                    // 	this.navLeftFlag = false;
                    // },200)
                } else {
                    this.$refs.navRight.style.paddingLeft = '240px';
                    this.$refs.cPage.style.left = '240px';
                    this.navLeftFlag = true;
                    // this.$refs.navLeft.style.width = '240px';
                    // setTimeout(()=>{
                    // 	this.navLeftFlag = true;
                    // },200)
                }
            }
        }
    })
</script>
</body>
</html>
