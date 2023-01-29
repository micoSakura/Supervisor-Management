<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台选课安排</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">

    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">督导姓名</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="supName" id="supName" autocomplete="off">
            </div>
            <button type="submit" class="layui-hide" lay-submit lay-filter="data-search-btn1"></button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">督导列表</label>
            <div class="layui-input-block">
                <table class="layui-hide" id="supervisorTableId" lay-filter="supervisorTableFilter"></table>
            </div>
        </div>
    </form>

    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">课程名称</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="courseName" id="courseName" autocomplete="off">
            </div>
            <button type="submit" class="layui-hide" lay-submit lay-filter="data-search-btn2"></button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教师姓名</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="teacherName" id="teacherName" autocomplete="off">
            </div>
            <button type="submit" class="layui-hide" lay-submit lay-filter="data-search-btn2"></button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程列表</label>
            <div class="layui-input-block">
                <table class="layui-hide" id="courseTableId" lay-filter="courseTableFilter"></table>
            </div>
        </div>
    </form>

    <input type="hidden" name="verifyState" value="2">
    <input type="hidden" name="listenState" value="1">

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认选课安排</button>
        </div>
    </div>
</div>

<script src="../../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        let form = layui.form,
            layer = layui.layer,
            table = layui.table,
            $ = layui.$;

        table.render({
            elem: '#supervisorTableId',
            url: 'querySupervisorList',
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'supNum', width: 80, title: '督导编号', hide: true},
                {field: 'supName', width: 120, title: '督导姓名'},
                {field: 'loginName', width: 120, title: '登录名'},
                {field: 'password', width: 120, title: '密码'},
                {field: 'sex', width: 80, title: '性别'},
                {field: 'title', width: 120, title: '职业'},
                {field: 'phone', width: 150, title: '电话'}
                // {fixed: 'right', title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [5, 10, 15, 20, 25, 50, 100],
            limit: 5,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn1)', function (data) {
            let supName = $('#supName').val();

            //执行搜索重载
            table.reload('supervisorTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    supName: supName
                }
            }, 'data');
            return false;
        });

        table.render({
            elem: '#courseTableId',
            url: 'queryCourseList',
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'courseNum', width: 80, title: '课程编号', hide: true},
                {field: 'courseName', width: 120, title: '课程名称'},
                {field: 'teacherName', width: 120, title: '教师姓名'},
                {field: 'startWeek', width: 80, title: '起始周'},
                {field: 'endWeek', width: 80, title: '结束周'},
                {field: 'courseWeek', width: 100, title: '上课星期'},
                {
                    field: 'courseTime', width: 120, title: '上课时间',
                    templet: "<div>{{layui.util.toDateString(d.courseTime,'HH:mm:ss')}}</div>"
                },
                {field: 'courseAddress', width: 200, title: '上课地点'}
                // {fixed: 'right', title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [5, 10, 15, 20, 25, 50, 100],
            limit: 5,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn2)', function (data) {
            let courseName = $('#courseName').val();
            let teacherName = $('#teacherName').val();

            //执行搜索重载
            table.reload('courseTableId', {
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


        //监听提交
        form.on('submit(saveBtn)', function (data) {
            let supervisorTableId = layui.table.checkStatus('supervisorTableId').data;
            let courseTableId = layui.table.checkStatus('courseTableId').data;
            let info = data.field;
            let supNum = [];
            let courseNum = [];
            for (let i = 0; i < supervisorTableId.length; i++) {
                supNum += supervisorTableId[i].supNum + ",";
            }
            for (let i = 0; i < courseTableId.length; i++) {
                courseNum += courseTableId[i].courseNum + ",";
            }

            for (let i = 0; i < supNum.length; i++) {
                info.supNum = supNum.slice(0, supNum.length - 1);
            }
            for (let i = 0; i < courseNum.length; i++) {
                info.courseNum = courseNum.slice(0, courseNum.length - 1);
            }

            console.log(supNum);
            console.log(courseNum);
            console.log(info.supNum);
            console.log(info.courseNum);
            console.log(info);

            $.ajax({
                url: "addListen",
                type: "POST",
                data: info,
                success: function (result) {
                    if (result.code === 0) {//如果成功
                        layer.msg('安排成功', {
                            icon: 6,
                            time: 500
                        }, function () {
                            parent.window.location.reload();
                            let iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        })
                    } else {
                        layer.msg(result.msg);
                    }
                }
            })
            return false;
        });
    });
</script>
</body>
</html>
