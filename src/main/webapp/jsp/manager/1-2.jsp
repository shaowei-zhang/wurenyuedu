<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>读者管理</title>
    <link rel="stylesheet" href="../../css/manageReader.css">
    <link rel="stylesheet" href="../../plugins/css/icons.min.css">
</head>
<body>
<div>
    <header>
        <hr/>
        <h1>读者信息管理</h1>
        <hr/>
    </header>
    <main>
        <div>
            <div id="adbt">
                <button class="gre" id="add" style="width: 80px;height: 35px;border-radius: 6px;">新增</button>
                <button class="red" id="delete" style="width: 35px;height: 35px;border-radius: 6px;"><i class="fas fa-trash-alt"></i></button>
                <input class="readerSelectInput" type="text" id="readerSelectInput" placeholder="请输入名称查询...">
            </div>

            <table>
                <tbody>
                <tr id="thead">
                    <td><input type="checkbox"></td>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>注册日期</th>
                    <th>借阅漫画次数</th>
                    <th>借阅小说次数</th>
                    <th>未还漫画本数</th>
                    <th>未还小说本数</th>
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
    <h2>新增读者信息</h2>
    <div class="ifm">
        <div><input id="assn" type="text" placeholder="姓名" required="required" maxlength="11" pattern="" oninvalid="setCustomValidity('请规范输入姓名')"></div>
        <div><input id="asn" type="text" placeholder="密码" required="required" minlength="2" maxlength="16" pattern="" oninvalid="setCustomValidity('请规范输入密码')"></div>
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
    <h2>修改读者信息</h2>
    <div class="ifm">
        <div><label for="chassn">姓名</label> <input id="chassn" type="text" required="required" minlength="2" maxlength="8" pattern=""></div>
        <div><label for="chasn">密码</label> <input id="chasn" type="text" required="required"  maxlength="11" pattern=""></div>
    </div>
    <hr/>
    <div class="scbt">
        <button id="save">保存</button>
        <button class="cancel">取消</button>
    </div>
    <!--    </form>-->
</div>

<script src="../../js/jquery-3.6.0.min.js"></script>
<script src="../../js/manageReader.js"></script>
</body>
</html>
