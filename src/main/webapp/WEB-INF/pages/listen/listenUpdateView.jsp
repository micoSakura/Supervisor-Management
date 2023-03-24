<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>听课信息更新</title>
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
    <input type="hidden" name="listenNum" value="${info.listenNum}">
    <input type="hidden" name="courseNum" value="${info.courseNum}">
    <input type="hidden" name="supNum" value="${info.supNum}">
    <div class="layui-form-item">
        <label class="layui-form-label required">课程名称</label>
        <div class="layui-input-block">
            <input type="text" name="courseName" lay-reqtext="课程名称不能为空" disabled
                   placeholder="请输入课程名称" value="${info.courseList[0].courseName}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">教师姓名</label>
        <div class="layui-input-block">
            <input type="text" name="teacherName" lay-reqtext="教师姓名不能为空" disabled
                   placeholder="请输入教师姓名" value="${info.courseList[0].teacherName}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">报名督导</label>
        <div class="layui-input-block">
            <input type="text" name="supName" lay-verify="required" lay-reqtext="督导姓名不能为空"
                   placeholder="请输入督导姓名" value="${info.supervisorList[0].supName}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">督导电话</label>
        <div class="layui-input-block">
            <input type="text" name="phone" lay-verify="required" lay-reqtext="电话不能为空"
                   placeholder="请输入电话" value="${info.supervisorList[0].phone}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课星期</label>
        <div class="layui-input-block">
            <input type="text" name="courseWeek" disabled value="${info.courseList[0].courseWeek}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课时间</label>
        <div class="layui-input-block">
            <input type="text" name="courseTime" id="courseTime" placeholder="请选择时间" disabled class="layui-input"
                   value="<fmt:formatDate value='${info.courseList[0].courseTime}' pattern='HH:mm:ss'/>">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课地点</label>
        <div class="layui-input-block">
            <input type="text" name="courseAddress" placeholder="请输入上课地点" disabled
                   value="${info.courseList[0].courseAddress}"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">审核状态</label>
        <div class="layui-input-block">
            <select name="verifyState" disabled>
                <option value="${info.verifyState}"><c:choose><c:when
                        test="${info.verifyState=='0'}">待审核</c:when><c:when
                        test="${info.verifyState=='1'}">通过</c:when><c:when
                        test="${info.verifyState=='2'}">不通过</c:when></c:choose></option>
                <option value="0">待审核</option>
                <option value="1">通过</option>
                <option value="2">不通过</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">听课状态</label>
        <div class="layui-input-block">
            <select name="listenState">
                <option value="${info.listenState}"><c:choose><c:when
                        test="${info.listenState=='0'}">待听课</c:when><c:when
                        test="${info.listenState=='1'}">已听课</c:when><c:when
                        test="${info.listenState=='2'}">未听课</c:when><c:when
                        test="${info.listenState=='3'}">已评教</c:when><c:otherwise>状态异常</c:otherwise></c:choose>
                </option>
                <option value="0">待听课</option>
                <option value="1">已听课</option>
                <option value="2">未听课</option>
                <option value="3">已评教</option>
            </select>
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
                url: "updateListenView",
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
