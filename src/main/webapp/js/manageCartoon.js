$(function () {

    $.ajax({
        url:"../../toShowAllCartoons",
        type:"post",
        dataType:"JSON",
        success:function (cartoons) {

            let page = 1;//第几页
            let no = 0;//显示的页数的第一个对象是数组中的第几个对象，初始下标为0
            let stuNumber = cartoons.length;
            let cartoon={};

            if(stuNumber<10){
                for (let i = 0; i < stuNumber; i++) {//初始页面信息显示
                    cartoon = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + cartoons[i].cartoonName + "</td>" + "<td>" + cartoons[i].cartoonAuthor + "</td>" + "<td class=\"synopsis\">" + cartoons[i].cartoonSynopsis + "</td>" + "<td>" + cartoons[i].cartoonCover + "</td>" + "<td>"
                        + cartoons[i].cartoonClassOfStory + "</td>" + "<td>" + cartoons[i].cartoonClassOfSex + "</td>" + "<td>" + cartoons[i].cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                    $("tbody").append(cartoon);
                }
            }else {
                for (let i = 0; i < 10; i++) {//初始页面信息显示
                    cartoon = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + cartoons[i].cartoonName + "</td>" + "<td>" + cartoons[i].cartoonAuthor + "</td>" + "<td class=\"synopsis\">" + cartoons[i].cartoonSynopsis + "</td>" + "<td>" + cartoons[i].cartoonCover + "</td>" + "<td>"
                        + cartoons[i].cartoonClassOfStory + "</td>" + "<td>" + cartoons[i].cartoonClassOfSex + "</td>" + "<td>" + cartoons[i].cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                    $("tbody").append(cartoon);
                }
            }

            $("tbody").trigger("create");//trigger() 方法触发被选元素上指定的事件以及事件的默认行为（比如表单提交）
            $("#pgn").text(page);
            $("#en").text(stuNumber);
            $("#add").click(function () {//点击新增按钮触发的动作
                $("#sbg").addClass("sbg");
                $("#asi").show();
            });


            $("#addBtn").click(function () {//提交按钮点击触发的动作
                let student = {};

                $.ajax({
                    url:"../../toAddOneCartoon",
                    type:"POST",
                    data:{
                        "addCartoonName":$("#assn").val(),
                        "addCartoonAuthor":$("#asn").val(),
                        "addCartoonSynopsis": $("#asac").val(),
                        "addCartoonCover":$("#asm").val(),
                        "addCartoonClassOfStory":$("#asg").val(),
                        "addCartoonClassOfSex":$("#asc").val(),
                    },
                    success:function (data){
                        student={
                            cartoonName:$("#assn").val(),
                            cartoonAuthor:$("#asn").val(),
                            cartoonSynopsis: $("#asac").val(),
                            cartoonCover:$("#asm").val(),
                            cartoonClassOfStory:$("#asg").val(),
                            cartoonClassOfSex:$("#asc").val(),
                            cartoonReadingVolume:0
                        }

                        cartoons.push(student);
                        stuNumber++;
                        $("#en").text(stuNumber);

                        let lpren = $("tbody tr").length - 1;//最后一页剩余的条目数;
                        if (no + 10 > stuNumber && lpren < 10) {//增加一个append函数，如果显示的是最后一页那么需要更新界面。
                            $("tbody tr:last").after("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + lpren + 1) + "</td>" + "<td>" + student.cartoonName + "</td>" + "<td>" + student.cartoonAuthor + "</td>" + "<td  class=\"synopsis\">" + student.cartoonSynopsis + "</td>" + "<td>" + student.cartoonCover + "</td>" + "<td>"
                                + student.cartoonClassOfStory + "</td>" + "<td>" + student.cartoonClassOfSex + "</td>" + "<td>" + student.cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");

                        }

                        $("#sbg").removeClass("sbg");
                        $("#asi").hide();
                    }
                });


            });


            let objKeys = ["cartoonName","cartoonAuthor","cartoonSynopsis","cartoonCover","cartoonClassOfStory","cartoonClassOfSex"]
            let modifyNumber;
            $("tbody").on("click", ".modify", function () {//点击修改按钮触发的动作,解决了jQuery出现的新添加元素点击事件无效问题
                $("#sbg").addClass("sbg");
                $("#chasi").show();
                modifyNumber = $(this).parent().parent().find("td")[1].innerText - 1;

                let i = 0;
                $("#chasi").find("input").each(function (index, domEle) {
                    domEle.value = cartoons[modifyNumber][objKeys[i++]];
                });
            });


            $("#save").click(function () {//点击保存按钮触发的动作

                $.ajax({
                    url:"../../toUpdateOneCartoon",
                    type: "POST",
                    data: {
                        "updateCartoonName":$("#chassn").val(),
                        "updateCartoonAuthor":$("#chasn").val(),
                        "updateCartoonSynopsis": $("#chasac").val(),
                        "updateCartoonCover":$("#chasm").val(),
                        "updateCartoonClassOfStory":$("#chasg").val(),
                        "updateCartoonClassOfSex":$("#chasc").val(),
                        "oldCartoonName":cartoons[modifyNumber].cartoonName
                    },
                    success:function (date) {


                        $("tbody tr").eq(modifyNumber - no + 1).remove();
                        $("tbody tr").eq(modifyNumber - no).after("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (modifyNumber - no + 1) + "</td>" + "<td>" + $("#chassn").val() + "</td>" + "<td>" + $("#chasn").val() + "</td>" + "<td class=\"synopsis\">" + $("#chasac").val() + "</td>" + "<td>" + $("#chasm").val() + "</td>" + "<td>"
                            + $("#chasg").val() + "</td>" + "<td>" + $("#chasc").val() + "</td>" + "<td>" + cartoons[modifyNumber].cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");

                        $("#sbg").removeClass("sbg");
                        $("#chasi").hide();

                    }
                })
            });


            $(".cancel").click(function () {//多个取消按钮点击触发的动作
                $("#sbg").removeClass("sbg");
                $(".achaesi").hide();
            });

            $("tbody tr td:first").click(function () {//全选操作用到了JQuery的隐示迭代
                $("tbody tr td input").prop("checked", $("tbody tr:first td:first input").prop("checked"));
            });

            $("tbody").on("click", $("tbody tr:nth-of-type(1)").siblings().find("input"), function () {
                let isSelectAll = true;
                $("tbody tr:nth-of-type(1)").siblings().find("input").each(function (index, domEle) {
                    if ($(domEle).prop("checked") == false)
                        isSelectAll = false;
                });
                $("tbody tr:first td:first input").prop("checked", isSelectAll);
            });

            let update = (no) => {
                let i = 0;//用于增加信息条目的变量;
                $("tbody tr:first").siblings().remove();//清空界面
                while (i < 10 && no + i < stuNumber) {
                    let cartoon = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + cartoons[no + i].cartoonName + "</td>" + "<td>" + cartoons[no + i].cartoonAuthor + "</td>" + "<td class=\"synopsis\">" + cartoons[no + i].cartoonSynopsis + "</td>" + "<td>" + cartoons[no + i].cartoonCover + "</td>" + "<td>"
                        + cartoons[no + i].cartoonClassOfStory + "</td>" + "<td>" + cartoons[no + i].cartoonClassOfSex + "</td>" + "<td>" + cartoons[no + i].cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                    $("tbody").append(cartoon);
                    i++;
                }
                $("tbody").trigger("create");
            }

            $("#delete").click(function () {
                if (confirm("确认要删除这些信息吗？")) {
                    let delNumber = 0;//删除的信息条目数;
                    let delIndexs = []; //删除信息条目的下标;用于后期处理避免“落空”导致移动无效
                    // let i = 0;//用于增加信息条目的变量;
                    $("tbody tr td input").each(function (index, domEle) {
                        if (index != 0 && $(domEle).prop("checked")) {//index != 0,防止标题行被删除
                            delIndexs[delIndexs.length] = $(domEle).parent().next().text() - 1;

                            $.ajax({
                                url:"../../toDeleteOneCartoon",
                                type:"POST",
                                data:{"deleteCartoonName":cartoons[$(domEle).parent().next().text()-1].cartoonName},
                                success: function (data) {
                                    if(data == "true"){
                                        $(domEle).parent().parent().remove();
                                    }
                                }
                            });

                            delNumber++;
                        }
                    });

                    for (let j = delIndexs.length - 1; j >= 0; j--) {
                        for (let k = delIndexs[j]; k < stuNumber - 1; k++) {//低效的代码，需要大量移动对象索引;对JS不太熟悉，还没有想到高效的解决办法!
                            cartoons[k] = cartoons[k + 1];
                        }
                    }

                    stuNumber -= delNumber;//指向储存底层数据(学生对象)的数组尾部的指针“移动”
                    $("#en").text(stuNumber);//更新条目数
                    if (stuNumber == no) {
                        no -= 10;
                        page--;
                        $("#pgn").text(page);
                    }
                    update(no);

                    $("tbody tr td:first input").prop("checked", false);
                }
            });

            $("#nextpage").click(function () {
                if (no + 10 < stuNumber) {
                    no += 10;
                    page++;
                    $("#pgn").text(page);
                    update(no);
                    $("tbody tr:first td:first input").prop("checked", false);

                } else {
                    alert("已经是最后一页。");
                }
            });

            $("#lastpage").click(function () {
                if (no - 10 >= 0) {
                    no -= 10;
                    page--;
                    $("#pgn").text(page);
                    update(no);
                    $("tbody tr:first td:first input").prop("checked", false);

                } else {
                    alert("已经是第一页。");
                }
            });

            //用bind监听input的内容
            $("#cartoonSelectInput").bind("input propertychange",function(){
                let searchText = $("#cartoonSelectInput").val();
                if (searchText.length > 0) {
                    for (let i = 0; i < cartoons.length; i++) {
                        if (searchText === cartoons[i].cartoonName) {

                            $("tbody tr:first").siblings().remove();//清空界面
                            let cartoon = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + cartoons[i].cartoonName + "</td>" + "<td>" + cartoons[i].cartoonAuthor + "</td>" + "<td class=\"synopsis\">" + cartoons[i].cartoonSynopsis + "</td>" + "<td>" + cartoons[i].cartoonCover + "</td>" + "<td>"
                                + cartoons[i].cartoonClassOfStory + "</td>" + "<td>" + cartoons[i].cartoonClassOfSex + "</td>" + "<td>" + cartoons[i].cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                            $("tbody").append(cartoon);
                            break;
                        }
                    }
                }
                else{
                    $("tbody tr:first").siblings().remove();//清空界面
                    if(stuNumber<10){
                        for (let i = 0; i < stuNumber; i++) {//初始页面信息显示
                            cartoon = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + cartoons[i].cartoonName + "</td>" + "<td>" + cartoons[i].cartoonAuthor + "</td>" + "<td class=\"synopsis\">" + cartoons[i].cartoonSynopsis + "</td>" + "<td>" + cartoons[i].cartoonCover + "</td>" + "<td>"
                                + cartoons[i].cartoonClassOfStory + "</td>" + "<td>" + cartoons[i].cartoonClassOfSex + "</td>" + "<td>" + cartoons[i].cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                            $("tbody").append(cartoon);
                        }
                    }else {
                        for (let i = 0; i < 10; i++) {//初始页面信息显示
                            cartoon = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + cartoons[i].cartoonName + "</td>" + "<td>" + cartoons[i].cartoonAuthor + "</td>" + "<td class=\"synopsis\">" + cartoons[i].cartoonSynopsis + "</td>" + "<td>" + cartoons[i].cartoonCover + "</td>" + "<td>"
                                + cartoons[i].cartoonClassOfStory + "</td>" + "<td>" + cartoons[i].cartoonClassOfSex + "</td>" + "<td>" + cartoons[i].cartoonReadingVolume + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                            $("tbody").append(cartoon);
                        }
                    }
                }
            });

        }
    });
})