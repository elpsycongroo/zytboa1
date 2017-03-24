<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/24
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">库存管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        Examples <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="mm-vertical.html">Vertical Menu</a></li>
                        <li><a href="mm-horizontal.html">Horizontal Menu</a></li>
                        <li><a href="mm-folder.html">Folder View</a></li>
                        <li><a href="mm-vertical-hover.html">Hover Option For Desktop</a></li>
                        <li><a href="mm-zurb.html">Foundation | Zurb</a></li>
                        <li><a href="mm-animate.html">Animate</a></li>
                        <li><a href="mm-event.html">Event</a></li>
                        <li><a href="mm-event2.html">Event 2</a></li>
                        <li><a href="mm-dispose.html">Stop & Start metisMenu</a></li>
                        <li><a href="mm-ajax.html">Ajax</a></li>
                        <li><a href="mm-faq.html">FAQ</a></li>
                    </ul>
                </li>

                <li >
                    <a href="#" >
                        个人信息 <span class="caret"></span>
                    </a>

                </li>
                <!--当前用户 -->
                <li class="navbar-text">欢迎您:${user.name}</li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
