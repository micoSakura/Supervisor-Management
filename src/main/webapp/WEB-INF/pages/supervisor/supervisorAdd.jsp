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
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">督导姓名</label>
        <div class="layui-input-block">
            <input type="text" name="supName" lay-verify="required" lay-reqtext="督导姓名不能为空"
                   placeholder="请输入督导姓名" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">登录名</label>
        <div class="layui-input-block">
            <input type="text" name="loginName" lay-verify="required" lay-reqtext="登录名不能为空"
                   placeholder="请输入登录名" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="required" lay-reqtext="密码不能为空"
                   placeholder="请输入密码" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <select name="sex">
                <option value=""></option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">手机</label>
        <div class="layui-input-block">
            <input type="number" name="phone" lay-verify="required" lay-reqtext="手机不能为空" placeholder="请输入手机"
                   value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">职业</label>
        <div class="layui-input-block">
            <input type="text" name="title" placeholder="请输入职业" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="../../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        let form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //监听提交
        form.on('submit(saveBtn)', function (data) {

            let info = data.field;

            $.ajax({
                url: "addSupervisor",
                type: "POST",
                data: info,
                success: function (result) {
                    if (result.code === 0) {//如果成功
                        layer.msg('添加成功', {
                            icon: 6,
                            time: 500
                        }, function () {
                            parent.window.location.reload();
                            let iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        })
                    } else {
                        layer.msg("添加失败");
                    }
                }
            })
            return false;
        });
    });
</script>
</body>
</html>
