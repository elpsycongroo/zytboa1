<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>供应商管理</title>
    <%@include file="/common/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-editable.css"/>
    <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-table-filter-control.css"/>
    <script type="text/javascript" src="${proPath}/js/bootstrap-table.js"></script>
    <script type="text/javascript" src="${proPath}/js/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="${proPath}/js/bootstrap-editable.min.js"></script>
    <script type="text/javascript" src="${proPath}/js/jquery.bootstrap-growl.min.js"></script>
    <script type="text/javascript" src="${proPath}/js/extensions/bootstrap-table-filter-control.js"></script>
    <script src="${proPath}/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${proPath}/js/extensions/bootstrap-table-editable.js"></script>
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
    <h1>供应商管理 /
        <small>Supplier Manage</small>
    </h1>
    <div class="panel panel-collapse panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">您可以做什么</h3>
        </div>
        <div class="panel-body">
            ${user.name},所有人可以查看供应商列表。如果您有足够的权限，还可以新增/修改/删除供应商。<br/>
            如果您没有权限进行其他操作，请与管理员联系。
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
                            <strong>查询</strong>：在相应表头下方的搜索框内输入即可查询。<br/>
                            <strong>增加</strong>：点击按钮，在弹出对话框内输入内容即可。<br/>
                            <strong>修改</strong>：点击要修改的行，在行内修改并确认即可。<br/>
                            <strong>删除</strong>：勾选一行或多行，点击删除并且确认即可。
                        </div>
                    </div>
                    <div id="toolbar" class="btn-group">
                        <button id="btn_add" type="button" class="btn btn-default"
                                data-toggle="modal" data-target="#addSupplierModal">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-default"
                                data-toggle="modal">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                    </div>
                    <table id="tb_suppliers"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--新增供应商信息模态框-->
<div class="modal fade" id="addSupplierModal" tabindex="-1" role="dialog" aria-labelledby="addSupplierModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addSupplierModalLabel">新增供应商信息</h4>
            </div>
            <div class="modal-body">
                <form id="addSupplier">
                    <div class="form-group">
                        <!--想要序列化一定要加name属性!-->
                        <label for="supName" class="control-label">供应商名称(*):</label>
                        <input type="text" class="form-control" id="supName" name="supName">
                    </div>
                    <div class="form-group">
                        <label for="supLinkman" class="control-label">联系人(*):</label>
                        <input type="text" class="form-control" id="supLinkman" name="supLinkman">
                    </div>
                    <div class="form-group">
                        <label for="supPhone" class="control-label">联系电话:</label>
                        <input type="text" class="form-control" id="supPhone" name="supPhone">
                    </div>
                    <div class="form-group">
                        <label for="supAddress" class="control-label">地址:</label>
                        <input type="text" class="form-control" id="supAddress" name="supAddress">
                    </div>
                    <div class="form-group">
                        <label for="supRemark" class="control-label">备注:</label>
                        <textarea class="form-control" id="supRemark" name="supRemark" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="supType" class="control-label">类型:</label>
                        <input type="text" class="form-control" id="supType" name="supType">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="submitAdd">提交更改</button>
            </div>
        </div>
    </div>
</div>
<!--确认删除模态框-->
<div class="modal fade" id="deleteSupplierModal" tabindex="-1" role="dialog" aria-labelledby="deleteSupplierModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="deleteSupplierModalLabel">请确认</h4>
            </div>
            <div class="modal-body">是否确认删除？</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-danger" id="submitDelete">确认删除</button>
            </div>
        </div>
    </div>
</div>
<script>
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
            $('#tb_suppliers').bootstrapTable('destroy');
            $('#tb_suppliers').bootstrapTable({
                url: '/supplier/supplierList',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
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
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                filterControl: true,                  //开启列过滤搜索
                columns: [{
                    checkbox: true
                }, {
                    field: 'supName',
                    title: '供应商名称',
                    filterControl: 'input',
                    editable: {
                        type: 'text',
                        title: '供应商名称',
                        validate: function (v) {
                            if (!v) return '供应商名称不能为空'
                        }
                    }
                }, {
                    field: 'supLinkman',
                    title: '联系人',
                    filterControl: 'input',
                    editable: {
                        type: 'text',
                        title: '联系人',
                        validate: function (v) {
                            if (!v) return '联系人不能为空'
                        }
                    }
                }, {
                    field: 'supPhone',
                    title: '电话',
                    filterControl: 'input',
                    editable: {
                        type: 'text',
                        title: '电话'
                    }
                }, {
                    field: 'supAddress',
                    title: '地址',
                    filterControl: 'input',
                    editable: {
                        type: 'text',
                        title: '地址'
                    }
                }, {
                    field: 'supType',
                    title: '供应商类型',
                    editable: {
                        type: 'select',
                        source: [{value: 1, text: "零件供应商"}, {value: 2, text: "邮箱供应商"}, {value: 3, text: "有色供应商"}],
                        title: '供应商类型'
                    }
                }, {
                    field: 'supRemark',
                    title: '供应商备注',
                    filterControl: 'input',
                    editable: {
                        type: 'text',
                        title: '供应商备注'
                    }
                }],
                onEditableSave: function (field, row, oldValue, $el) {
                    $('#tb_suppliers').bootstrapTable('resetView');
                    $.ajax({
                        type: "post",
                        url: "${proPath}/supplier/updateSupplier",
                        data: row,
                        dataType: 'text',
                        success: function (data) {
                            if (data == "success") {
                                growl("修改成功", "success");
                            } else {
                                growl("修改失败,修改值没有生效!如无法解决，请联系管理员", "danger");
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
                filter: params.filter,   //查询字段条件
                flag : "false"
            };
            return temp;
        };
        return oTableInit;
    };
    //其余操作要等dom加载后才能执行。放到$(document).ready(function(){方法中或者放在div后
    var ButtonInit = function () {
        var oInit = new Object();
        var postdata = {};

        oInit.Init = function () {
            //初始化页面上面的按钮事件
        };

        return oInit;
    };
    //校验新增信息模块
    $("#addSupplier").validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            supName: {
                required: true
            },
            supLinkman: {
                required: true
            }
        },
        messages: {
            supName: {
                required: "请输入供应商名称."
            },
            supLinkman: {
                required: "请输入联系人姓名."
            }
        },

        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },

        success: function (label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },

        errorPlacement: function (error, element) {
            element.parent('div').append(error);
            console.log(error);
        },

        submitHandler: function (form) {
            form.submit();
        }
    });

    $("#submitAdd").click(function () {
        if ($('#addSupplier').validate().form()) {
            saveSupplier();
        }
        return false;
    });
    $('#btn_delete').click(function(){
        if ($("#tb_suppliers").bootstrapTable('getAllSelections').length == 0) {
            growl("请至少选中一行", "danger");
            return;
        }
        $('#deleteSupplierModal').modal('toggle');
    });
    $('#submitDelete').click(function () {
        deleteRows();
    });

    function deleteRows() {
        $.ajax({
            url: '${proPath}/supplier/deleteSupplier',
            type: 'post',
            data: 'data=' + JSON.stringify($("#tb_suppliers").bootstrapTable('getAllSelections')),
            success: function (data) {
                if (data == "success") {
                    growl("删除成功", "success");
                    $('#deleteSupplierModal').modal('hide');
                } else {
                    growl("删除失败,请联系管理员：" + data, "danger");
                }
            },
            error: function () {
                growl("删除失败，与服务器连接错误，请联系管理员！", "danger");
            }
        });
    }
    function saveSupplier() {
        $.ajax({
            url: '${proPath}/supplier/saveSupplier',
            type: 'post',
            data: $("#addSupplier").serialize(),
            success: function (data) {
                if (data == "success") {
                    growl("修改成功", "success");
                    $("#addSupplierModal").modal('hide');
                } else {
                    growl("修改失败,修改值没有生效!如无法解决，请联系管理员", "danger");
                }
            },
            error: function () {
                growl("修改失败,修改值没有生效!如无法解决，请联系管理员", "danger");
            }
        });
    }
    //如果模态框被隐藏table自动刷新
    $("#addSupplierModal").on('hidden.bs.modal', function () {
        $("#tb_suppliers").bootstrapTable('refresh', {silent: true});
    });
    $("#deleteSupplierModal").on('hidden.bs.modal', function () {
        $("#tb_suppliers").bootstrapTable('refresh', {silent: true});
    });
    //提示模块
    function growl(msg, status) {
        $.bootstrapGrowl(msg, {
            type: status
        });
    }


</script>

</body>
</html>