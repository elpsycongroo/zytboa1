<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>供应商列表导出</title>
    <%@include file="/common/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-table.css"/>
    <script type="text/javascript" src="${proPath}/js/bootstrap-table.js"></script>
    <script type="text/javascript" src="${proPath}/js/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="${proPath}/js/bootstrap-editable.min.js"></script>
    <script type="text/javascript" src="${proPath}/js/jquery.bootstrap-growl.min.js"></script>

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
<%@include file="/nav.jsp" %>
<!-- BEGIN: .row -->
<%@include file="/menu.jsp" %>
<div class="container-fluid col-md-10 clo-md-offset-2 p-t-15">
    <h1>供应商列表导出 /
        <small>Supplier List Export</small>
    </h1>
    <div class="panel panel-collapse panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">您可以做什么</h3>
        </div>
        <div class="panel-body">
            ${user.name},所有人可以进行供应商列表的导出。
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-collapse panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">供应商列表</h3>
                </div>
                <div class="panel-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">操作指南</div>
                        <div class="panel-body">
                            <strong>导出</strong>：点击在表格右上方的<span class="glyphicon glyphicon-export icon-share"></span>导出按钮即可。<br/>
                            <strong>选择导出数据</strong>：点击表格左上方的下拉菜单确定你要导出的数据范围。
                        </div>
                    </div>
                    <div class="alert alert-info" role="alert">
                        <strong>请注意</strong>:该导出功能最多只会导出当前显示的所有数据，请调整表格下方的每页显示数据量来确定导出的范围。
                    </div>
                    <div id="toolbar" class="btn-group">
                        <select id="sel_exportoption" class="form-control">
                            <option value="">导出内容选择</option>
                            <option value="all">导出全部</option>
                            <option value="selected">导出选中行</option>
                        </select>
                    </div>
                    <table id="tb_suppliers"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--export relation js-->
<script type="text/javascript" src="${proPath}/js/tableExport.min.js"></script>
<script type="text/javascript" src="${proPath}/js/extensions/bootstrap-table-export.js"></script>
<script>
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();

        //2.初始化select的change事件
        $('#sel_exportoption').change(function () {
            $('#tb_suppliers').bootstrapTable('refreshOptions', {
                exportDataType: $(this).val()
            });
        });
    });
    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_suppliers').bootstrapTable('destroy')
                .bootstrapTable({
                    url: '/supplier/supplierList',         //请求后台的URL（*）
                    toolbar: '#toolbar',                //工具按钮用哪个容器
                    method: 'get',                      //请求方式（*）
                    striped: true,                      //是否显示行间隔色
                    cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: true,                   //是否显示分页（*）
                    sortable: true,                     //是否启用排序
                    sortOrder: "asc",                   //排序方式
                    queryParams: oTableInit.queryParams,//传递参数（*）
                    sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                    pageNumber: 1,                       //初始化加载第一页，默认第一页
                    pageSize: 5,                       //每页的记录行数（*）
                    pageList: [5, 10, 25, 50],        //可供选择的每页的行数（*）
                    search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    strictSearch: true,
                    showColumns: true,                  //是否显示所有的列
                    showRefresh: false,                  //是否显示刷新按钮
                    minimumCountColumns: 2,             //最少允许的列数
                    height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                    uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                    showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                    cardView: false,                    //是否显示详细视图
                    detailView: false,                   //是否显示父子表
                    clickToSelect: true,                //是否启用点击选中行
                    showExport: true,                     //是否显示导出
                    exportDataType: "basic",              //basic', 'all', 'selected'.
                    //导出相关参数
                    exportOptions: {
                        fileName: '供应商名单_' + '${user.name}_' + new Date().getTime(),
                        ignoreColumn: [0]
                    },
                    columns: [{
                        checkbox: true
                    }, {
                        field: 'supName',
                        title: '供应商名称'
                    }, {
                        field: 'supLinkman',
                        title: '联系人'
                    }, {
                        field: 'supPhone',
                        title: '电话'
                    }, {
                        field: 'supAddress',
                        title: '地址'
                    }, {
                        field: 'supType',
                        title: '供应商类型'
                    }, {
                        field: 'supRemark',
                        title: '供应商备注'
                    }],
                })
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset,  //页码
                filter: params.filter,  //查询字段条件
                flag: "true"
            };
            return temp;
        };
        return oTableInit;
    };
</script>
</body>
</html>
