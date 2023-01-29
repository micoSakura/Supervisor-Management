<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台评教添加</title>
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
        <label class="layui-form-label required">课程名称</label>
        <div class="layui-input-block">
            <input type="text" name="courseName" placeholder="请输入课程名称" class="layui-input" disabled>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">教师姓名</label>
        <div class="layui-input-block">
            <input type="text" name="teacherName" placeholder="请输入教师姓名" class="layui-input" disabled>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课时间</label>
        <div class="layui-input-block">
            <input type="text" name="courseTime" id="courseTime" placeholder="请选择时间"
                   class="layui-input" disabled>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课地点</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点"
                   class="layui-input" disabled>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选课人数</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出勤人数</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课堂评分</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">授课内容</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">意见</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点" class="layui-input">
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

        //时间选择器
        layui.laydate.render({
            elem: '#courseTime'
            , type: 'time'
        });

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            let info = data.field;
            $.ajax({
                url: "addCourse",
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
