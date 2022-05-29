<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小说管理</title>
    <link rel="stylesheet" href="../../css/manageCartoon.css">
    <link rel="stylesheet" href="../../plugins/css/icons.min.css">
</head>
<body>
<div>
    <header>
        <hr/>
        <h1>漫画信息管理</h1>
        <hr/>
    </header>
    <main>
        <div>
            <div id="adbt">
                <button class="gre" id="add" style="width: 80px;height: 35px;border-radius: 6px;">新增</button>
                <button class="red" id="delete" style="width: 35px;height: 35px;border-radius: 6px;"><i class="fas fa-trash-alt"></i></button>
                <input class="cartoonSelectInput" type="text" id="cartoonSelectInput" placeholder="请输入名称查询...">
            </div>

            <table>
                <tbody>
                <tr id="thead">
                    <td><input type="checkbox"></td>
                    <th>序号</th>
                    <th>名称</th>
                    <th>作者</th>
                    <th>简介</th>
                    <th>封面</th>
                    <th>以故事分类</th>
                    <th>以性别分类</th>
                    <th>阅读量</th>
                    <th>操作</th>
                </tr>
                </tbody>
            </table>
            <div id="navigate">
                <p>第<span id="pgn"></span>页,共<span id="en"></span>条 (每页最多显示10条)</p><!--Number of entries-->
                <div id="tpbt">
                    <button class="gre" id="lastpage"><i class="fas fa-chevron-left"></i></button>
                    <button class="gre" id="nextpage"><i class="fas fa-chevron-right"></i></button>
                </div>
            </div>
        </div>
    </main>
</div>
<div id="sbg"></div><!--增删改查时的阴影背景-->
<div class="achaesi" id="asi">
    <!--    <form action="" method="post">-->
    <h2>新增漫画信息</h2>
    <div class="ifm">
        <div><input id="assn" type="text" placeholder="名称" required="required" maxlength="20" pattern=""></div>
        <div><input id="asn" type="text" placeholder="作者" required="required" maxlength="16" pattern=""></div>
        <div><input id="asac" type="text" placeholder="简介" required="required" maxlength="12" pattern=""></div>
        <div><input id="asm" type="text" placeholder="封面" required="required" minlength="2" maxlength="25" pattern=""></div>
        <div><input id="asg" type="text" placeholder="以故事分类" required="required" maxlength="10" pattern=""></div>
        <div><input id="asc" type="text" placeholder="以性别分类" required="required" maxlength="2"></div>
    </div>
    <hr/>
    <div class="scbt">
        <button id="addBtn">提交</button>
        <button class="cancel">取消</button>
    </div>
    <!--    </form>-->
</div>
<div class="achaesi" id="chasi">
    <!--    <form action="" method="post">-->
    <h2>修改漫画信息</h2>
    <div class="ifm">
        <div><input id="chassn" type="text" required="required" minlength="2" maxlength="16"></div>
        <div><input id="chasn" type="text" required="required"  maxlength="16" ></div>
        <div><input id="chasac" type="text" required="required" maxlength="12"></div>
        <div><input id="chasm" type="text" required="required" minlength="2" maxlength="25"></div>
        <div><input id="chasg" type="text" required="required" maxlength="10"></div>
        <div><input id="chasc" type="text" required="required" maxlength="2"></div>
    </div>
    <hr/>
    <div class="scbt">
        <button id="save">保存</button>
        <button class="cancel">取消</button>
    </div>
    <!--    </form>-->
</div>

<script src="../../js/jquery-3.6.0.min.js"></script>
<script src="../../js/manageCartoon.js"></script>
</body>
</html>
