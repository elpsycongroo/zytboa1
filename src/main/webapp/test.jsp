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
    <link href="${proPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${proPath}/css/mm-vertical.css" rel="stylesheet"/>
    <script src="${proPath}/js/metisMenu.js"></script>
    <link href="${proPath}/css/metisMenu.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <aside class="col-md-3">
        <nav class="sidebar-nav">
            <ul class="metismenu" id="menu1">
                <li>
                    <a class="has-arrow" href="#">
                        <span class="fa fa-fw fa-github fa-lg"></span>
                        metisMenu
                    </a>
                    <ul aria-expanded="true">
                        <li>
                            <a href="https://github.com/onokumus/metisMenu">
                                <span class="fa fa-fw fa-code-fork"></span> Fork
                            </a>
                        </li>
                        <li>
                            <a href="https://github.com/onokumus/metisMenu">
                                <span class="fa fa-fw fa-star"></span> Star
                            </a>
                        </li>
                        <li>
                            <a href="https://github.com/onokumus/metisMenu/issues">
                                <span class="fa fa-fw fa-exclamation-triangle"></span> Issues
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="#" aria-expanded="false">Menu 0</a>
                    <ul aria-expanded="false">
                        <li><a href="#">item 0.1</a></li>
                        <li><a href="#">item 0.2</a></li>
                        <li><a href="http://onokumus.com">onokumus</a></li>
                        <li><a href="#">item 0.4</a></li>
                    </ul>
                </li>
                <li id="removable">
                    <a class="has-arrow" href="#" aria-expanded="false">Menu 1</a>
                    <ul aria-expanded="false">
                        <li><a href="#">item 1.1</a></li>
                        <li><a href="#">item 1.2</a></li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false">Menu 1.3</a>
                            <ul aria-expanded="false">
                                <li><a href="#">item 1.3.1</a></li>
                                <li><a href="#">item 1.3.2</a></li>
                                <li><a href="#">item 1.3.3</a></li>
                                <li><a href="#">item 1.3.4</a></li>
                            </ul>
                        </li>
                        <li><a href="#">item 1.4</a></li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false">Menu 1.5</a>
                            <ul aria-expanded="false">
                                <li><a href="#">item 1.5.1</a></li>
                                <li><a href="#">item 1.5.2</a></li>
                                <li><a href="#">item 1.5.3</a></li>
                                <li><a href="#">item 1.5.4</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="has-arrow" href="#" aria-expanded="false">Menu 2</a>
                    <ul aria-expanded="false">
                        <li><a href="#">item 2.1</a></li>
                        <li><a href="#">item 2.2</a></li>
                        <li><a href="#">item 2.3</a></li>
                        <li><a href="#">item 2.4</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </aside>
</div>
<script type="text/javascript" charset="utf-8">
    $("#menu1").metisMenu();
</script>
</body>
</html>
