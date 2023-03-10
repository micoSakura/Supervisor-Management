<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>前台课程评教</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">课程名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="courseName" id="courseName" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">教师姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="teacherName" id="teacherName" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">听课状态</label>
                            <div class="layui-input-inline">
                                <select class="layui-input" name="listenState" id="listenState">
                                    <option value=""></option>
                                    <option value="1">已听课</option>
                                    <option value="3">已评教</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                    lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-btn-primary layui-border-black" lay-event="export">
                    已听课程导出
                </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            {{# if(d.verifyState=='1' && d.listenState=='1'){ }}
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="evaluate">评教</a>
            {{# } }}
        </script>
    </div>
</div>
<script src="../../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: 'queryListenList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            where: {
                supNum: ${sessionScope.supervisor.supNum},
                verifyState: '1'
            },
            cols: [[
                {type: 'checkbox', width: 50},
                {field: 'listenNum', width: 80, title: '听课编号', hide: true},
                {field: 'supNum', width: 80, title: '督导编号', hide: true},
                {field: 'courseNum', width: 80, title: '课程编号', hide: true},
                {
                    field: 'courseName', width: 120, title: '课程名称',
                    templet: '<div>{{d.courseList[0].courseName}}</div>'
                },
                {
                    field: 'teacherName', width: 100, title: '教师姓名',
                    templet: '<div>{{d.courseList[0].teacherName}}</div>'
                },
                {
                    field: 'courseTime', width: 120, title: '上课时间',
                    templet: "<div>{{d.courseList[0].courseTime}}</div>"
                },
                {
                    field: 'courseAddress', width: 200, title: '上课地点',
                    templet: '<div>{{d.courseList[0].courseAddress}}</div>'
                },
                {
                    field: 'verifyState', width: 100, title: '审核状态', align: "center", templet: function (res) {
                        if (res.verifyState === "0") {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm">待审核</span>'
                        } else if (res.verifyState === "1") {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal">通过</span>'
                        } else if (res.verifyState === "2") {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">不通过</span>'
                        }
                    }
                },
                {
                    field: 'listenState', width: 100, title: '听课状态', align: "center", templet: function (res) {
                        if (res.listenState === "0" && ((res.verifyState === "0") || (res.verifyState === "1"))) {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal">待听课</span>'
                        } else if (res.listenState === "1" && res.verifyState === "1") {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal">已听课</span>'
                        } else if (res.listenState === "2" && res.verifyState === "1") {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">未听课</span>'
                        } else if (res.listenState === "3" && res.verifyState === "1") {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">已评教</span>'
                        } else {
                            return '<span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm">状态异常</span>'
                        }
                    }
                },
                {fixed: 'right', title: '操作', minWidth: 220, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 10,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            let courseName = $('#courseName').val();
            let teacherName = $('#teacherName').val();
            let listenState = $('#listenState').val();
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    supNum: ${sessionScope.supervisor.supNum},
                    courseName: courseName,
                    teacherName: teacherName,
                    verifyState: '1',
                    listenState: listenState
                }
            }, 'data');
            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            let checkStatus = table.checkStatus('currentTableId')
                , data = checkStatus.data;
            let listenNum = [];
            for (let i = 0; i < data.length; i++) {
                listenNum += data[i].listenNum + ",";
            }
            if (obj.event === 'export') {  // 监听添加操作
                location.href = "downloadByListenNumWithListenEvaluation?listenNum=" + listenNum;
            }
        });

        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let supNum = ${sessionScope.supervisor.supNum};
            let listenNum = data.listenNum;
            if (obj.event === 'evaluate') {
                $.post("/queryRecordAllWithSame", {supNum: supNum, listenNum: listenNum},
                    function (result) {
                        if (result.code === 0) {
                            layer.open({
                                title: '课程评教',
                                type: 2,
                                shade: 0.2,
                                maxmin: true,
                                shadeClose: true,
                                area: ['80%', '80%'],
                                content: '${pageContext.request.contextPath}/recordAddView?listenNum=' + data.listenNum
                            });
                        } else {
                            layer.msg(result.msg);
                        }
                    });
            }
        });
    });
</script>
</body>
</html>
