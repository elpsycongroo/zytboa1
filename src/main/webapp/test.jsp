<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/22
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Title</title>
    <script src="${proPath}/js/jquery-3.2.0.min.js"></script>
    <script src="${proPath}/js/bootstrap.min.js"></script>
    <script src="${proPath}/js/jquery.validate.js"></script>
    <link href="${proPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="${proPath}/js/form.js"></script>
</head>
<body>
<div class="container">
    <h1 class="text-center text-danger">Form 示例</h1>
    <form role="form" class="form-horizontal" action="javascript:alert('验证成功,可以提交.');" method="post">
        <div class="form-group">
            <label class="col-md-2 control-label" for="name">Name</label>
            <div class="col-md-10">
                <input class="form-control" name="name" type="text" id="name" placeholder="Name" value="" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label" for="exampleInputPassword1">Password</label>
            <div class="col-md-10">
                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <label for="intro" class="control-label col-md-2">Intro</label>
            <div class="col-md-10">
                <textarea id="intro" class="form-control" rows="3" name="intro" placeholder="Intro"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">Gender</label>
            <div class="col-md-10">
                <label class="radio-inline">
                    <input type="radio" name="gender"  value="男" />
                    boy </label>

                <label class="radio-inline">
                    <input type="radio" name="gender"  value="女" />
                    gril </label>
            </div>
        </div>

        <div class="form-group">
            <label for="hobby" class="control-label col-md-2">Hobby</label>
            <div class="col-md-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="hobby" value="Music">
                        Music</label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="hobby" id="" value="Game" />
                        Game </label>
                </div>

                <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox1" value="option1">
                    option1 </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox2" value="option2">
                    option3</label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox3" value="option3">
                    option3 </label>
            </div>
        </div>

        <div class="form-group">
            <label for="sel" class="control-label col-md-2">Select</label>
            <div class="col-md-10">
                <select multiple="" id="sel" name="sel" class="form-control">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button type="submit" class="btn btn-primary btn-sm">
                    Submit
                </button>
                <button type="reset" class="btn btn-primary btn-sm">
                    Reset
                </button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" charset="utf-8">
    $('.form-horizontal').validate({
        errorElement : 'span',
        errorClass : 'help-block',
        focusInvalid : false,
        rules : {
            name : {
                required : true
            },
            password : {
                required : true
            },
            intro : {
                required : true
            }
        },
        messages : {
            name : {
                required : "Username is required."
            },
            password : {
                required : "Password is required."
            },
            intro : {
                required : "Intro is required."
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
        },

        submitHandler : function(form) {
            form.submit();
        }
    });

    $('.form-horizontal input').keypress(function(e) {
        if (e.which == 13) {
            if ($('.form-horizontal').validate().form()) {
                $('.form-horizontal').submit();
            }
            return false;
        }
    });
</script>
</body>
</html>
