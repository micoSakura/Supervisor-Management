<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台课程管理</title>
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加</button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除
                </button>
                <button type="button" class="layui-btn layui-btn-sm layui-btn-primary layui-border-black" id="upload">
                    <i class="layui-icon"></i>课程信息导入</button>
                <button class="layui-btn layui-btn-sm layui-btn-primary layui-border-black" lay-event="export">
                    课程导出
                </button>
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
            table = layui.table,
            upload = layui.upload;

        table.render({
            elem: '#currentTableId',
            url: 'queryCourseList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'courseNum', width: 80, title: '课程编号', hide: true},
                {field: 'courseName', width: 120, title: '课程名称'},
                {field: 'teacherName', width: 120, title: '教师姓名'},
                {field: 'startWeek', width: 80, title: '起始周'},
                {field: 'endWeek', width: 80, title: '结束周'},
                {field: 'courseWeek', width: 80, title: '上课星期'},
                {field: 'courseTime', width: 120, title: '上课时间'},
                {field: 'courseAddress', width: 200, title: '上课地点'},
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
            let courseNum = [];
            for (let i = 0; i < data.length; i++) {
                courseNum += data[i].courseNum + ",";
            }
            console.log(courseNum);
            if (obj.event === 'add') {  // 监听添加操作
                layer.open({
                    title: '添加课程',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['80%', '80%'],
                    content: '${pageContext.request.contextPath}/courseAdd',
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                $.post("deleteCourseByCourseNum", {courseNum: courseNum},
                    function (result) {
                        if (result.code === 0) {
                            table.reload("currentTableId", {});
                        }
                    });
            } else if (obj.event === 'export') {  // 监听删除操作
                location.href = "downloadByCourse?courseNum=" + courseNum;
            }
        });

        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let courseNum = data.courseNum;
            if (obj.event === 'edit') {
                layer.open({
                    title: '编辑课程',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/queryCourseByCourseNum?courseNum=' + data.courseNum,
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    $.post("deleteCourseByCourseNum", {courseNum: courseNum},
                        function (result) {
                            if (result.code === 0) {
                                table.reload("currentTableId", {});
                            }
                        });
                });
            }
        });

        upload.render({
            elem: '#upload'
            , url: 'courseUpload' //此处配置你自己的上传接口即可
            , accept: 'file' //普通文件
            , done: function (res) {
                layer.msg('上传成功');
                console.log(res);
            },
            fail: function (res) {
                layer.msg('上传失败');
                console.log(res);
            }
        });
    });
</script>
</body>
</html>
