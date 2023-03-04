<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台课程更新</title>
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
    <input type="hidden" name="courseNum" value="${info.courseNum}">
    <div class="layui-form-item">
        <label class="layui-form-label required">课程名称</label>
        <div class="layui-input-block">
            <input type="text" name="courseName" lay-verify="required" lay-reqtext="课程名称不能为空"
                   placeholder="请输入课程名称" value="${info.courseName}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">教师姓名</label>
        <div class="layui-input-block">
            <input type="text" name="teacherName" lay-verify="required" lay-reqtext="教师姓名不能为空"
                   placeholder="请输入教师姓名" value="${info.teacherName}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">起始周</label>
        <div class="layui-input-block">
            <input type="text" name="startWeek" placeholder="请输入起始周" value="${info.startWeek}"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">结束周</label>
        <div class="layui-input-block">
            <input type="text" name="endWeek" placeholder="请输入结束周" value="${info.endWeek}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课星期</label>
        <div class="layui-input-block">
            <select name="courseWeek">
                <option value="${info.courseWeek}">${info.courseWeek}</option>
                <option value="星期一">星期一</option>
                <option value="星期二">星期二</option>
                <option value="星期三">星期三</option>
                <option value="星期四">星期四</option>
                <option value="星期五">星期五</option>
                <option value="星期六">星期六</option>
                <option value="星期天">星期天</option>

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课时间</label>
        <div class="layui-input-block">
            <input type="text" name="courseTime" id="courseTime" placeholder="请选择时间"
                   value="${info.courseTime}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课地点</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点" value="${info.courseAddress}"
                   class="layui-input">
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
            let info = data.field;//form单中的数据信息
            //向后台发送数据提交添加
            $.ajax({
                url: "updateCourse",
                type: "POST",
                contentType: 'application/json',
                data: JSON.stringify(info),
                success: function (result) {
                    if (result.code === 0) {//如果成功
                        layer.msg('修改成功', {
                            icon: 6,
                            time: 500
                        }, function () {
                            parent.window.location.reload();
                            let iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        })
                    } else {
                        layer.msg("修改失败");
                    }
                }
            });
            return false;
        });

    });
</script>
</body>
</html>
