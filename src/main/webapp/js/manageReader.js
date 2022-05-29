$(function () {

    $.ajax({
        url:"../../toShowAllReaders",
        type:"post",
        dataType:"JSON",
        success:function (readers) {

            let page = 1;//第几页
            let no = 0;//显示的页数的第一个对象是数组中的第几个对象，初始下标为0
            let stuNumber = readers.length;
            let reader={};

            if(stuNumber<10){
                for (let i = 0; i < stuNumber; i++) {//初始页面信息显示
                    reader = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + readers[i].readerName + "</td>" + "<td>" + readers[i].readerPassword + "</td>" + "<td>" + readers[i].registerDate + "</td>" + "<td>" + readers[i].borrowCartoon + "</td>" + "<td>"
                        + readers[i].borrowNovel + "</td>" + "<td>" + readers[i].notYetCartoon + "</td>" + "<td>" + readers[i].notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                    $("tbody").append(reader);
                }
            }else {
                for (let i = 0; i < 10; i++) {//初始页面信息显示
                    reader = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + readers[i].readerName + "</td>" + "<td>" + readers[i].readerPassword + "</td>" + "<td>" + readers[i].registerDate + "</td>" + "<td>" + readers[i].borrowCartoon + "</td>" + "<td>"
                        + readers[i].borrowNovel + "</td>" + "<td>" + readers[i].notYetCartoon + "</td>" + "<td>" + readers[i].notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                    $("tbody").append(reader);
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
                    url:"../../toAddOneReader",
                    type:"POST",
                    data:{"addReaderName":$("#assn").val(),"addReaderPassword":$("#asn").val()},
                    success:function (data){
                        student={
                            readerName:$("#assn").val(),
                            readerPassword:$("#asn").val(),
                            registerDate: data,
                            borrowCartoon:0,
                            borrowNovel:0,
                            notYetCartoon:0,
                            notYetNovel:0
                        }

                        readers.push(student);
                        stuNumber++;
                        $("#en").text(stuNumber);

                        let lpren = $("tbody tr").length - 1;//最后一页剩余的条目数;
                        if (no + 10 > stuNumber && lpren < 10) {//增加一个append函数，如果显示的是最后一页那么需要更新界面。
                            $("tbody tr:last").after("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + lpren + 1) + "</td>" + "<td>" + student.readerName + "</td>" + "<td>" + student.readerPassword + "</td>" + "<td>" + student.registerDate + "</td>" + "<td>" + student.borrowCartoon + "</td>" + "<td>"
                                + student.borrowNovel + "</td>" + "<td>" + student.notYetCartoon + "</td>" + "<td>" + student.notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");

                        }

                        $("#sbg").removeClass("sbg");
                        $("#asi").hide();
                    }
                });


            });


            let objKeys = ["readerName","readerPassword"];
            let modifyNumber;
            $("tbody").on("click", ".modify", function () {//点击修改按钮触发的动作,解决了jQuery出现的新添加元素点击事件无效问题
                $("#sbg").addClass("sbg");
                $("#chasi").show();
                modifyNumber = $(this).parent().parent().find("td")[1].innerText - 1;

                let i = 0;
                $("#chasi").find("input").each(function (index, domEle) {
                    domEle.value = readers[modifyNumber][objKeys[i++]];
                });
            });


            $("#save").click(function () {//点击保存按钮触发的动作

                let newReaderName = $("#chassn").val();
                let newReaderPassword = $("#chasn").val();

                $.ajax({
                    url:"../../toUpdateOneReader",
                    type: "POST",
                    data: {
                        "newReaderName":newReaderName,
                        "newReaderPassword":newReaderPassword,
                        "oldReaderName":readers[modifyNumber].readerName
                    },
                    success:function (date) {


                        $("tbody tr").eq(modifyNumber - no + 1).remove();
                        $("tbody tr").eq(modifyNumber - no).after("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (modifyNumber - no + 1) + "</td>" + "<td>" + newReaderName + "</td>" + "<td>" + newReaderPassword + "</td>" + "<td>" + readers[modifyNumber].registerDate + "</td>" + "<td>" + readers[modifyNumber].borrowCartoon + "</td>" + "<td>"
                            + readers[modifyNumber].borrowNovel + "</td>" + "<td>" + readers[modifyNumber].notYetCartoon + "</td>" + "<td>" + readers[modifyNumber].notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");

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
                    let reader = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + readers[no + i].readerName + "</td>" + "<td>" + readers[no + i].readerPassword + "</td>" + "<td>" + readers[no + i].registerDate + "</td>" + "<td>" + readers[no + i].borrowCartoon + "</td>" + "<td>"
                        + readers[no + i].borrowNovel + "</td>" + "<td>" + readers[no + i].notYetCartoon + "</td>" + "<td>" + readers[no + i].notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                    $("tbody").append(reader);
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
                                url:"../../toDeleteOneReader",
                                type:"POST",
                                data:{"deleteReaderName":readers[$(domEle).parent().next().text() - 1].readerName},
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
                            readers[k] = readers[k + 1];
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
            $("#readerSelectInput").bind("input propertychange",function(){
                let searchText = $("#readerSelectInput").val();
                if (searchText.length > 0) {
                    for (let i = 0; i < readers.length; i++) {
                        if (searchText === readers[i].readerName) {

                            $("tbody tr:first").siblings().remove();//清空界面
                            let reader = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + readers[i].readerName + "</td>" + "<td>" + readers[i].readerPassword + "</td>" + "<td>" + readers[i].registerDate + "</td>" + "<td>" + readers[i].borrowCartoon + "</td>" + "<td>"
                                + readers[i].borrowNovel + "</td>" + "<td>" + readers[i].notYetCartoon + "</td>" + "<td>" + readers[i].notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                            $("tbody").append(reader);
                            break;
                        }
                    }
                }
                else{
                    $("tbody tr:first").siblings().remove();//清空界面
                    if(stuNumber<10){
                        for (let i = 0; i < stuNumber; i++) {//初始页面信息显示
                            reader = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + readers[i].readerName + "</td>" + "<td>" + readers[i].readerPassword + "</td>" + "<td>" + readers[i].registerDate + "</td>" + "<td>" + readers[i].borrowCartoon + "</td>" + "<td>"
                                + readers[i].borrowNovel + "</td>" + "<td>" + readers[i].notYetCartoon + "</td>" + "<td>" + readers[i].notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                            $("tbody").append(reader);
                        }
                    }else {
                        for (let i = 0; i < 10; i++) {//初始页面信息显示
                            reader = $("<tr>" + "<td><input type=\"checkbox\"></td>" + "<td>" + (no + i + 1) + "</td>" + "<td>" + readers[i].readerName + "</td>" + "<td>" + readers[i].readerPassword + "</td>" + "<td>" + readers[i].registerDate + "</td>" + "<td>" + readers[i].borrowCartoon + "</td>" + "<td>"
                                + readers[i].borrowNovel + "</td>" + "<td>" + readers[i].notYetCartoon + "</td>" + "<td>" + readers[i].notYetNovel + "</td>" + "<td><a href=\"javascript:;\" class=\"modify\">修改</a></td>" + "</tr>");
                            $("tbody").append(reader);
                        }
                    }
                }
            });

        }
    });
})