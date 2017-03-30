<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品管理</title>
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
    <h1>商品管理 /
        <small>Goods Manage</small>
    </h1>
    <div class="panel panel-collapse panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">您可以做什么</h3>
        </div>
        <div class="panel-body">
            ${user.name},所有人可以查看商品列表。如果您有足够的权限，还可以新增/修改/删除商品。<br/>
            如果您没有权限进行其他操作，请与管理员联系。
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-collapse panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">商品列表</h3>
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
                                data-toggle="modal" data-target="#addGoodsModal">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-default"
                                data-toggle="modal">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                    </div>
                    <table id="tb_goods"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--新增供应商信息模态框-->
<div class="modal fade" id="addGoodsModal" tabindex="-1" role="dialog" aria-labelledby="addGoodsModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addGoodsModalLabel">新增供应商信息</h4>
            </div>
            <div class="modal-body">
                <form id="addGoods">
                    <div class="form-group">
                        <!--想要序列化一定要加name属性!-->
                        <label for="goodsName" class="control-label">商品名称(*):</label>
                        <input type="text" class="form-control" id="goodsName" name="goodsName">
                    </div>
                    <div class="form-group">
                        <label for="goodsType" class="control-label">商品类型:</label>
                        <input type="text" class="form-control" id="goodsType" name="goodsType">
                    </div>
                    <div class="form-group">
                        <label for="goodsUnit" class="control-label">计量单位:</label>
                        <input type="text" class="form-control" id="goodsUnit" name="goodsUnit">
                    </div>
                    <div class="form-group">
                        <!--动态加载生产商select-->
                        <label for="goodsProducer" class="control-label">生产商:</label>
                        <input type="text" class="form-control" id="goodsProducer" name="goodsProducer">
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
</body>
</html>
