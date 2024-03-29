<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>督导听课信息管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="../../images/favicon.ico">
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="../../lib/jquery-cookie/jquery.cookie.js" charset="utf-8"></script>
    <script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="../../lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden
        }

        body {
            background: url(../../images/banner_sub.jpg) 0 0 / cover no-repeat;
            position: static;
            font-size: 12px;
        }

        body:after {
            content: '';
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-filter: blur(3px);
            -moz-filter: blur(3px);
            -o-filter: blur(3px);
            -ms-filter: blur(3px);
            filter: blur(3px);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: -1;
        }

        .layui-container {
            width: 100%;
            height: 100%;
            overflow: hidden
        }

        .admin-login-background {
            width: 360px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 40%;
            margin-left: -180px;
            margin-top: -100px;
        }

        .logo-title {
            text-align: center;
            letter-spacing: 2px;
            padding: 14px 0;
        }

        .logo-title h1 {
            color: #1E9FFF;
            font-size: 25px;
            font-weight: bold;
        }

        .login-form {
            background-color: #fff;
            border: 1px solid #fff;
            border-radius: 3px;
            padding: 14px 20px;
            box-shadow: 0 0 8px #eeeeee;
        }

        .login-form .layui-form-item {
            position: relative;
        }

        .login-form .layui-form-item label {
            position: absolute;
            left: 1px;
            top: 1px;
            width: 38px;
            line-height: 36px;
            text-align: center;
            color: #d2d2d2;
        }

        .login-form .layui-form-item input {
            padding-left: 36px;
        }

        .captcha {
            width: 60%;
            display: inline-block;
        }

        .captcha-img {
            display: inline-block;
            width: 34%;
            float: right;
        }

        .captcha-img img {
            height: 34px;
            border: 1px solid #e6e6e6;
            height: 36px;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="layui-container">
    <div class="admin-login-background">
        <div class="layui-form login-form">
            <form class="layui-form" lay-filter="add_form" action="${pageContext.request.contextPath}/loginIn">
                <div class="layui-form-item logo-title">
                    <h1>督导听课信息管理系统</h1>
                    <div style="color: red;text-align: center;">${msg}</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username"></label>
                    <input type="text" name="loginName" lay-verify="required|account" placeholder="登录名"
                           autocomplete="on" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password"></label>
                    <input type="password" name="password" lay-verify="required|password" placeholder="密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username"></label>
                    <select name="type" lay-verify="required">
                        <option value="">请选择用户类型</option>
                        <option value="1">督导秘书</option>
                        <option value="2">督导</option>
                    </select>
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-vercode"></label>
                    <input type="text" name="captcha" lay-verify="required|captcha" placeholder="图形验证码"
                           autocomplete="off" class="layui-input verification captcha">
                    <div class="captcha-img">
                        <div class="field">
                            <a href="javascript:void(0)" onclick="getCode()"><img id="code"></a>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <input type="checkbox" name="remember_user" id="remember_user" lay-skin="primary"
                           lay-filter="remember" title="记住密码">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid"
                            lay-submit="" lay-filter="login">登 入
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    getCode();

    function getCode() {
        document.getElementById("code").src = timestamp("verifyCode");
    }

    function timestamp(url) {
        let getTime = new Date().getTime();
        if (url.indexOf("?") > -1) {
            url = url + "&timestamp=" + getTime;
        } else {
            url = url + "?timestamp=" + getTime;
        }
        return url;
    }

    layui.use(['form'], function () {
        let form = layui.form,
            layer = layui.layer;

        if ($.cookie("remember_user")) {
            $("#remember_user").prop("checked", true);
            form.val("add_form", {
                "loginName": $.cookie("user_name"),
                "password": $.cookie("user_password"),
                "type": $.cookie("user_type")
            });
        }

        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            if (data.loginName === '') {
                layer.msg('用户名不能为空');
                return false;
            }
            if (data.password === '') {
                layer.msg('密码不能为空');
                return false;
            }
            if (data.captcha === '') {
                layer.msg('验证码不能为空');
                return false;
            }
            //勾选记住密码
            if (data.remember_user === "on") {
                let user_name = data.loginName;
                let user_password = data.password;
                let user_type = data.type;
                $.cookie("remember_user", "true", {
                    expires: 7
                }); // 存储一个带7天期限的 cookie
                $.cookie("user_name", user_name, {
                    expires: 7
                }); // 存储一个带7天期限的 cookie
                $.cookie("user_password", user_password, {
                    expires: 7
                }); // 存储一个带7天期限的 cookie
                $.cookie("user_type", user_type, {
                    expires: 7
                }); // 存储一个带7天期限的 cookie
            } else {
                $.cookie("remember_user", "false", {
                    expires: -1
                }); // 删除 cookie
                $.cookie("user_name", '', {
                    expires: -1
                });
                $.cookie("user_password", '', {
                    expires: -1
                });
                $.cookie("user_type", '', {
                    expires: -1
                });
            }
        });
    });
</script>
</body>
</html>
