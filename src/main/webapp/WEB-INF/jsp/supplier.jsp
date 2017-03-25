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
  <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-table.css"/>
  <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-editable.css"/>
  <link rel="stylesheet" type="text/css" href="${proPath}/css/bootstrap-table-filter-control.css"/>
  <script type="text/javascript" src="${proPath}/js/bootstrap-table.js"></script>
  <script type="text/javascript" src="${proPath}/js/locale/bootstrap-table-zh-CN.js"></script>
  <script type="text/javascript" src="${proPath}/js/bootstrap-editable.min.js"></script>
  <script type="text/javascript" src="${proPath}/js/jquery.bootstrap-growl.min.js"></script>
  <script type="text/javascript" src="${proPath}/js/extensions/bootstrap-table-editable.js"></script>
  <script type="text/javascript" src="${proPath}/js/extensions/bootstrap-table-filter-control.js"></script>
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
  <h1>供应商管理 / <small>Supplier</small></h1>
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
          <table id="tb_suppliers" data-filter-control="true">
            <!--初始化表头 方便加载过滤器-->
            <thead>
              <tr>
                <th data-field="SUP_NAME" data-filter-control="select">供应商名称</th>
                <th data-field="SUP_LINKMAN" data-filter-control="select">联系人</th>
                <th data-field="SUP_PHONE" data-filter-control="select">联系电话</th>
                <th data-field="SUP_ADDRESS" data-filter-control="select">地址</th>
                <th data-field="SUP_REMARK" data-filter-control="select">备注</th>
                <th data-field="SUP_TYPE" data-filter-control="select">类型</th>
              </tr>
            </thead>
          </table>
        </div>
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
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表

            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset  //页码
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

</body>
</html>