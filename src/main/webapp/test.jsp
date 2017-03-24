<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/22
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="proPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${proPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${proPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${proPath}/css/metisMenu.css"/>
    <link rel="stylesheet" href="${proPath}/css/prism.min.css"/>
    <link rel="stylesheet" href="${proPath}/css/animate.min.css"/>
    <link href="${proPath}/css/mm-vertical.css" rel="stylesheet" type="text/css"/>
    <script src="${proPath}/js/jquery-3.2.0.min.js"></script>
    <script src="${proPath}/js/bootstrap.min.js"></script>
    <script src="${proPath}/js/metisMenu.js"></script>
    <script src="${proPath}/js/prism.min.js"></script>
    <script async defer src="${proPath}/js/buttons.js"></script>
    <script src="${proPath}/js/jquery.noty.packaged.min.js"></script>
    <style>
        .navbar {
            margin-bottom: 0px;
        }

        .p-t-15 {
            padding-top: 15px;
        }
    </style>
</head>
<body>
<%@include file="nav.jsp" %>
<!-- BEGIN: .row -->
<%@include file="menu.jsp" %>
<div class="container-fluid col-md-10 clo-md-offset-2 p-t-15">
    <h1>首页 / <small>Index</small></h1>
    <div class="panel panel-collapse panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">欢迎</h3>
        </div>
        <div class="panel-body">
            欢迎${user.name}登录本系统！详细功能请参考左侧菜单和上方导航。<br/>
            <jsp:useBean id="time" class="java.util.Date"/>
            今天是<fmt:formatDate value="<%=time%>" type="date" dateStyle="long"/>。
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-collapse panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">公司公告</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th>标题</th>
                            <th>发布人</th>
                            <th>发布日期</th>
                        </tr>
                        <tr>
                            <td>欢迎使用bootstrap</td>
                            <td>Twitter.Inc</td>
                            <td><fmt:formatDate value="<%=time%>" type="date" dateStyle="short"/></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-collapse panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">系统通知</h3>
                </div>
                <div class="panel-body">
                    <h5>您有未读消息</h5>
                    <h5>您有未处理的日程</h5>
                    <h5>您有待审批的汇报</h5>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
