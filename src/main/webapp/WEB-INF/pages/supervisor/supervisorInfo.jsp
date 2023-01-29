<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>基本资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../css/public.css" media="all">
    <style>
        .layui-form-item .layui-input-company {width: auto;padding-right: 10px;line-height: 38px;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-form layuimini-form">
            <input type="hidden" name="supNum" value="${info.supNum}">
            <div class="layui-form-item">
                <label class="layui-form-label required">督导姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="supName" lay-verify="required" lay-reqtext="督导姓名不能为空"
                           placeholder="请输入督导姓名" value="${info.supName}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">登录名</label>
                <div class="layui-input-block">
                    <input type="text" name="loginName" lay-verify="required" lay-reqtext="登录名不能为空"
                           placeholder="请输入登录名" value="${info.loginName}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">密码</label>
                <div class="layui-input-block">
                    <input type="text" name="password" lay-verify="required" lay-reqtext="密码不能为空"
                           placeholder="请输入密码" value="${info.password}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <select name="sex">
                        <option value="${info.sex}">${info.sex}</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">手机</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" lay-reqtext="手机不能为空" placeholder="请输入手机"
                           value="${info.phone}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">职业</label>
                <div class="layui-input-block">
                    <input type="text" name="title" placeholder="请输入职业" value="${info.title}" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../../../js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form','miniTab'], function () {
        let form = layui.form,
            layer = layui.layer,
            miniTab = layui.miniTab;

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            let index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
                layer.close(index);
                miniTab.deleteCurrentByIframe();
            });
            return false;
        });
    });
</script>
</body>
</html>