<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../lib/layui-v2.6.3/css/layui.css" rel="stylesheet">
    <style>
        body {
            padding: 6px 16px;
        }

        .center {
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
        }
    </style>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>
        <c:choose>
            <c:when test="${sessionScope.type.equals('admin')}">
                ${sessionScope.admin.realName}督导秘书,
            </c:when>
            <c:when test="${sessionScope.type.equals('supervisor')}">
                ${sessionScope.supervisor.supName}督导,
            </c:when>
        </c:choose> 欢迎来到督导听课信息系统
    </legend>
</fieldset>

<hr class="layui-border-red">

<div>
    <div class="layui-carousel center" id="mimico">
        <div carousel-item>
            <div><img src="../../images/720x360-1.jpg"></div>
            <div><img src="../../images/720x360-2.jpg"></div>
            <div><img src="../../images/720x360-3.jpg"></div>
            <div><img src="../../images/720x360-4.jpg"></div>
        </div>
    </div>
</div>


<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['carousel'], function () {
        let carousel = layui.carousel

        //图片轮播
        carousel.render({
            elem: '#mimico'
            , width: '720px'
            , height: '360px'
            , interval: 3000
            , arrow: 'none'
        });
    });
</script>
</body>
</html>

