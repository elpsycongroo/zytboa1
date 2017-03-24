<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/24
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="col-md-2" style="padding-left: 0px;">
    <nav class="sidebar-nav">
        <ul class="metismenu" id="menu1">
            <li>
                <a class="has-arrow" href="#" aria-expanded="false">
                    <span class="fa fa-fw fa-book fa-lg"></span>货源管理
                </a>
                <ul aria-expanded="false">
                    <li><a href="#">供应商管理</a></li>
                    <li><a href="#">商品管理</a></li>
                </ul>
            </li>
            <li id="removable">
                <a class="has-arrow" href="#" aria-expanded="false">
                    <span class="fa fa-fw fa-cny fa-lg"></span>进出货管理
                </a>
                <ul aria-expanded="false">
                    <li><a href="#">进货明细</a></li>
                    <li><a href="#">出货明细</a></li>
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false">进货管理</a>
                        <ul aria-expanded="false">
                            <li><a href="#">新增进货订单</a></li>
                            <li><a href="#">删除进货订单</a></li>
                            <li><a href="#">进货明细查询</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false">出货管理</a>
                        <ul aria-expanded="false">
                            <li><a href="#">新增出货清单</a></li>
                            <li><a href="#">删除出货清单</a></li>
                            <li><a href="#">出货明细查询</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <a class="has-arrow" href="#" aria-expanded="false">
                    <span class="fa fa-fw fa-bar-chart fa-lg"></span>报表查看
                </a>
                <ul aria-expanded="false">
                    <li><a href="#">进货相关报表</a></li>
                    <li><a href="#">出货相关报表</a></li>
                    <li><a href="#">利润报表</a></li>
                </ul>
            </li>
            <li>
                <a class="has-arrow" href="#" aria-expanded="false">
                    <span class="fa fa-fw fa-bar-calendar fa-lg"></span>个人事务
                </a>
                <ul aria-expanded="false">
                    <li><a href="#">消息管理</a></li>
                    <li><a href="#">工作汇报</a>
                        <ul aria-expanded="false">
                            <li>工作汇报填写</li>
                            <li>工作汇报审批</li>
                        </ul>
                    </li>
                    <li><a href="#"></a>日程管理
                        <ul aria-expanded="false">
                            <li>工作汇报填写</li>
                            <li>工作汇报审批</li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <a class="has-arrow" href="#" aria-expanded="false">
                    <span class="fa fa-fw fa-bar-chart fa-lg"></span>系统管理
                </a>
                <ul aria-expanded="false">
                    <li><a href="#">个人设置</a></li>
                    <li><a href="#">人员权限设置</a></li>
                    <li><a href="#">系统日志</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</aside>
<script type="text/javascript" charset="utf-8">
    $('#menu1').metisMenu();
</script>
