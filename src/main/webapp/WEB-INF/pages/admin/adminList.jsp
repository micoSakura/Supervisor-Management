<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
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
                            <label class="layui-form-label">督导姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="supName" id="supName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">登录名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="loginName" id="loginName" autocomplete="off"
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add">添加</button>
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
            url: 'queryAdminList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: 'id', hide: true},
                {field: 'realName', width: 120, title: '督导秘书姓名'},
                {field: 'loginName', width: 120, title: '登录名'},
                {field: 'password', width: 120, title: '密码'},
                {field: 'sex', width: 80, title: '性别'},
                {field: 'phone', width: 150, title: '电话'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            let realName = $('#realName').val();
            let loginName = $('#loginName').val();

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    realName: realName,
                    loginName: loginName
                }
            }, 'data');
            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                let index = layer.open({
                    title: '添加秘书',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/adminAdd',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                let checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                let id = [];
                for (let i = 0; i < data.length; i++) {
                    id += data[i].id + ",";
                }
                console.log(id);
                $.post("deleteAdminById", {id: id},
                    function (result) {
                        if (result.code === 0) {
                            table.reload("currentTableId", {});
                        }
                    });
            }
        });

        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let id = data.id;
            if (obj.event === 'edit') {
                let index = layer.open({
                    title: '编辑秘书',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '${pageContext.request.contextPath}/queryAdminById?id=' + data.id,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    $.post("deleteAdminById", {id: id},
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
