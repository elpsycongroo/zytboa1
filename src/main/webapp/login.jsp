<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/22
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/common.jsp" %>
<!DOCTYPE HTML>
<head>
    <link rel="stylesheet" href="${proPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${proPath}/css/form-elements.css">
    <link rel="stylesheet" href="${proPath}/css/style.css">
    <link rel="shortcut icon" href="${proPath}/img/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${proPath}/img/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${proPath}/img/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${proPath}/img/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${proPath}/img/apple-touch-icon-57-precomposed.png">
    <script src="${proPath}/js/jquery.backstretch.min.js"></script>
    <script src="${proPath}/js/loginscripts.js"></script>
    <script src="${proPath}/js/jquery.validate.js"></script>
    <style>
        body{
            font-family: "Microsoft YaHei";
        }
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
<body>
<!-- Top content -->
<div class="top-content">
    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>企业OA系统</strong>登录</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>登录OA系统</h3>
                            <p>输入您的账号和密码登录:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="javascript:alert('验证成功,可以提交.');" method="post" class="login-form" id="loginForm">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">Username</label>
                                <input type="text" name="name" placeholder="账号..."
                                       class="form-username form-control" id="form-username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">Password</label>
                                <input type="password" name="password" placeholder="密码..."
                                       class="form-password form-control" id="form-password">
                            </div>
                            <button type="submit" class="btn">登录!</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 social-login">

                    <h3>您还可以...:</h3>
                    <div class="social-login-buttons">
                        <a class="btn btn-link-2" href="#">
                            <i class="fa fa-weixin"></i> 联系我们
                        </a>
                        <a class="btn btn-link-2" href="#">
                            <i class="fa fa-github-square"></i> 关于作者
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#loginForm").validate({
        errorElement : 'span',
        errorClass : 'help-block',
        focusInvalid : false,
        rules : {
            name : {
                required : true
            },
            password : {
                required : true
            }
        },
        messages : {
            name : {
                required : "请输入用户名."
            },
            password : {
                required : "请输入密码."
            }
        },

        highlight : function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },

        success : function(label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },

        errorPlacement : function(error, element) {
            element.parent('div').append(error);
            console.log(error);
        },

        submitHandler : function(form) {
            form.submit();
        }
    });
    $('#loginForm input').keypress(function(e) {
        if (e.which == 13) {
            if ($('#loginForm').validate().form()) {
                $('#loginForm').submit();
            }
            return false;
        }
    });
</script>
</body>
</html>
