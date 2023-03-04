<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台已选课程</title>
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
                            <label class="layui-form-label">审核状态</label>
                            <div class="layui-input-inline">
                                <select class="layui-input" name="verifyState" id="verifyState">
                                    <option value=""></option>
                                    <option value="0">待审核</option>
                                    <option value="1">通过</option>
                                    <option value="2">不通过</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">听课状态</label>
                            <div class="layui-input-inline">
                                <select class="layui-input" name="listenState" id="listenState">
                                    <option value=""></option>
                                    <option value="0">待听课</option>
                                    <option value="1">已听课</option>
                                    <option value="2">未听课</option>
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="notice">通知</button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete">取消报名
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-warm data-delete-btn" lay-event="edit">更新</button>
                <button class="layui-btn layui-btn-sm layui-btn-primary layui-border-black" lay-event="export">
                    已选课程导出
                </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            {{# if(d.verifyState=='1' && d.listenState=='0'){ }}
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="done">完成听课</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="undone">未完成听课</a>
            {{# } }}
            <%--            {{# if((d.listenState=='0' && d.verifyState!='0') || (d.listenState!='0' && d.listenState!='1')){ }}--%>
            <%--            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="notice">通知秘书</a>--%>
            <%--            {{# } }}--%>
            {{# if((d.listenState!='1' || d.listenState!='3') && d.verifyState!='1'){ }}
            <a class="layui-btn layui-btn-xs layui-btn-warm data-count-delete" lay-event="delete">取消报名</a>
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
                supNum: ${sessionScope.supervisor.supNum}
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
                    templet: "<div>{{layui.util.toDateString(d.courseList[0].courseTime,'HH:mm:ss')}}</div>"
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
            let verifyState = $('#verifyState').val();
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
                    verifyState: verifyState,
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
            if (obj.event === 'notice') {  // 监听添加操作
                layer.confirm('通知', function (index) {
                    layer.close(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                if (checkStatus.data.length === 0) {
                    layer.msg('请选择需要取消报名的课程');
                } else {
                    $.post("deleteListenByListenNum", {listenNum: listenNum},
                        function (result) {
                            if (result.code === 0) {
                                table.reload("currentTableId", {});
                            }
                        });
                }
            } else if (obj.event === 'edit') {
                if (checkStatus.data.length === 0) {
                    layer.msg("请选择一行数据");
                } else if (checkStatus.data.length === 1) {
                    layer.open({
                        title: '报名更新',
                        type: 2,
                        shade: 0.2,
                        maxmin: true,
                        shadeClose: true,
                        area: ['80%', '80%'],
                        content: '${pageContext.request.contextPath}/queryListenByListenNumView?listenNum='
                            + data[0].listenNum,
                    });
                    return false;
                } else {
                    layer.msg("请勿多选");
                }
            } else if (obj.event === 'export') {
                location.href = "downloadByListen?listenNum=" + listenNum;
            }
        });

        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let listenNum = data.listenNum;
            if (obj.event === 'done') {
                layer.confirm('确定完成听课任务', function (index) {
                    layer.close(index);
                    $.post("updateDone", {listenNum: listenNum},
                        function (result) {
                            if (result.code === 0) {
                                table.reload("currentTableId", {});
                            }
                        });
                });
            } else if (obj.event === 'undone') {
                layer.confirm('确定未完成听课任务', function (index) {
                    layer.close(index);
                    $.post("updateUndone", {listenNum: listenNum},
                        function (result) {
                            if (result.code === 0) {
                                table.reload("currentTableId", {});
                            }
                        });
                });
            } else if (obj.event === 'notice') {
                layer.open({
                    title: '',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['80%', '80%'],
                    content: '${pageContext.request.contextPath}/queryListenByListenNum?listenNum=' + data.listenNum,
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的取消报名', function (index) {
                    obj.del();
                    layer.close(index);
                    $.post("deleteListenByListenNum", {listenNum: listenNum},
                        function (result) {
                            if (result.code === 0) {
                                table.reload("currentTableId", {});
                            }
                        });
                });
            }
        });
    });
</script>
</body>
</html>
