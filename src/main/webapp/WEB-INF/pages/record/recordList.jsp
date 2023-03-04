<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台评教管理</title>
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
                            <label class="layui-form-label">报名督导</label>
                            <div class="layui-input-inline">
                                <input type="text" name="supName" id="supName" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">督导电话</label>
                            <div class="layui-input-inline">
                                <input type="text" name="phone" id="phone" autocomplete="off"
                                       class="layui-input">
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
                    评教记录导出
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete">删除</button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
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
            url: 'queryRecordList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'recordNum', width: 80, title: '课程编号', hide: true},
                {field: 'listenNum', width: 80, title: '课程编号', hide: true},
                {
                    field: 'courseName', width: 120, title: '课程名称',
                    templet: '<div>{{d.listenList[0].courseList[0].courseName}}</div>'
                },
                {
                    field: 'teacherName', width: 100, title: '教师姓名',
                    templet: '<div>{{d.listenList[0].courseList[0].teacherName}}</div>'
                },
                {
                    field: 'supName', width: 100, title: '报名督导',
                    templet: '<div>{{d.listenList[0].supervisorList[0].supName}}</div>'
                },
                {
                    field: 'phone', width: 140, title: '督导电话',
                    templet: '<div>{{d.listenList[0].supervisorList[0].phone}}</div>'
                },
                {field: 'selection', width: 100, title: '选课人数'},
                {field: 'attendance', width: 100, title: '出勤人数'},
                {field: 'evaluation', width: 100, title: '督导评分'},
                {field: 'courseContent', width: 200, title: '授课内容'},
                {field: 'suggestion', width: 200, title: '督导意见'},
                {fixed: 'right', title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            let courseName = $('#courseName').val();
            let teacherName = $('#teacherName').val();

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    courseName: courseName,
                    teacherName: teacherName
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
            let recordNum = [];
            for (let i = 0; i < data.length; i++) {
                recordNum += data[i].recordNum + ",";
            }
            console.log(recordNum);
            if (obj.event === 'add') {  // 监听添加操作
                layer.open({
                    title: '',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['80%', '80%'],
                    content: '${pageContext.request.contextPath}/recordAdd',
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                if (checkStatus.data.length === 0) {
                    layer.msg('请选择需要删除的数据');
                } else {
                    $.post("deleteRecordByRecordNum", {recordNum: recordNum},
                        function (result) {
                            if (result.code === 0) {
                                table.reload("currentTableId", {});
                            }
                        });
                }
            } else if (obj.event === 'export') {
                location.href = "downloadByRecordList?recordNum=" + recordNum;
            }
        });

        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let recordNum = data.recordNum;
            if (obj.event === 'edit') {
                layer.open({
                    title: '',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['80%', '80%'],
                    content: '${pageContext.request.contextPath}/queryRecordByRecordNum?recordNum=' + data.recordNum,
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    $.post("deleteRecordByRecordNum", {recordNum: recordNum},
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
