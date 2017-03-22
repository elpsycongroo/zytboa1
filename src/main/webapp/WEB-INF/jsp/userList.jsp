<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="/common/common.jsp" %>

<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-editable.css"/>
    <script type="text/javascript" src="${proPath}/js/bootstrap-table.js"></script>
    <script type="text/javascript" src="${proPath}/js/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="${proPath}/js/bootstrap-editable.min.js"></script>
    <script type="text/javascript" src="${proPath}/js/jquery.bootstrap-growl.min.js"></script>
    <script type="text/javascript" src="${proPath}/js/extensions/bootstrap-table-editable.js"></script>
    <title>My JSP 'userList.jsp' starting page</title>
</head>

<body>
This is my JSP page. <br>
<c:forEach items="${userList}" var="u">
    用户编号：${u.id}<br/>
    用户名称：${u.name}
    <hr/>
</c:forEach>

<script type="text/javascript">

    $(function () {

        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();

        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();

    });

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_departments').bootstrapTable({
                url: '${proPath}/user/userTable',    //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    checkbox: true
                }, {
                    field: 'id',
                    title: '用户编号'
                }, {
                    field: 'name',
                    title: '用户名',
                    editable: {
                        type: 'text',
                        title: '用户名',
                        validate: function (v) {
                            if (!v) return '用户名不能为空';
                        }
                    }
                }, {
                    field: 'password',
                    title: '用户密码'
                }],
                onEditableSave: function (field, row, oldValue, $el) {
                    $.ajax({
                        type: "post",
                        url: "${proPath}/user/updateUser",
                        data: row,
                        dataType: 'text',
                        success: function (data) {
                            if(data=="success") {
                                growl("修改成功", "success");
                            }else{
                                growl("修改失败,修改值没有生效!如无法解决，请联系管理员", "danger");
                                $("#tb_departments").bootstrapTable('refresh',{slient:true});
                            }
                        },
                        error: function () {
                            growl("修改失败,修改值没有生效!如无法解决，请联系管理员", "danger");

                        }
                    });
                }
            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset,  //页码
                name: $("#txt_search_name").val()
            };
            return temp;
        };
        return oTableInit;
    };
    //其余操作要等dom加载后才能执行。放到$(document).ready(function(){方法中或者放在div后
    $(document).ready(function () {
        $("#btn_query").click(function () {
            alert("!!!");
        });
    });
    //提示模块
    function growl(msg, status) {
        $.bootstrapGrowl(msg, {
            type: status
        });
    }

    var ButtonInit = function () {
        var oInit = new Object();
        var postdata = {};

        oInit.Init = function () {
            //初始化页面上面的按钮事件
        };

        return oInit;
    };
</script>
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1" for="txt_search_name">用户名称</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_name">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table id="tb_departments"></table>
</div>
</body>
</html>
