<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/6/4
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <title>菜单的编辑</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式 start--%>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>
    <%--引入公共CSS 样式 end --%>

    <%--=================6.12研究bootstrap table 组件==引入的 css======= start =======--%>
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstraptable/bootstrap-table.css'/>">
    <%--=================6.12研究bootstrap table 组件==引入的 css======= end =======--%>

</head>
<script type="application/javascript">
    function GetMenu() {
        $.ajax({
            type: "POST",  //http请求方式为POST
            url: "<%=request.getContextPath()%>/listMenu/getMenu",//请求
//            data: {
//            },
            dataType: 'json',//返回值类型 一般设置为json
            cache: false,
            success: function (data) {
                alert(data.msg);
                location.reload() //点击按钮刷新页面
            }
        });

        function goEdit() {

        }

        function doDelete() {

        }
    }
</script>
<%--<script type="text/javascript">--%>
<%--function initTable() {--%>
<%--//先销毁表格--%>
<%--$('#cusTable').bootstrapTable('destroy');--%>
<%--//初始化表格,动态从服务器加载数据--%>
<%--$("#cusTable").bootstrapTable({--%>
<%--method: "post",  //使用get请求到服务器获取数据--%>
<%--url: "<%=request.getContextPath()%>/listMenu/getMenu", //获取数据的Servlet地址--%>
<%--striped: true,  //表格显示条纹--%>
<%--pagination: true, //启动分页--%>
<%--pageSize: 1,  //每页显示的记录数--%>
<%--pageNumber:1, //当前第几页--%>
<%--pageList: [5, 10, 15, 20, 25],  //记录数可选列表--%>
<%--search: true,  //是否启用查询--%>
<%--showColumns: true,  //显示下拉框勾选要显示的列--%>
<%--showRefresh: true,  //显示刷新按钮--%>
<%--sidePagination: "server", //表示服务端请求--%>
<%--//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder--%>
<%--//设置为limit可以获取limit, offset, search, sort, order--%>
<%--queryParamsType : "undefined",--%>
<%--queryParams: function queryParams(params) {   //设置查询参数--%>
<%--var param = {--%>
<%--pageNumber: params.pageNumber,--%>
<%--pageSize: params.pageSize,--%>
<%--orderNum : $("#orderNum").val()--%>
<%--};--%>
<%--return param;--%>
<%--},--%>
<%--onLoadSuccess: function(){  //加载成功时执行--%>
<%--//                alert(data.msg);--%>
<%--//                layer.msg("layer加载成功");--%>
<%--},--%>
<%--onLoadError: function(){  //加载失败时执行--%>
<%--alert("加载数据1失败");--%>
<%--//                layer.msg("laeer加载数据2失败", {time : 1500, icon : 2});--%>
<%--}--%>
<%--});--%>
<%--}--%>

<%--$(document).ready(function () {--%>
<%--//调用函数，初始化表格--%>
<%--initTable();--%>

<%--//当点击查询按钮的时候执行--%>
<%--$("#search").bind("click", initTable);--%>
<%--});--%>
<%--</script>--%>
<body>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_body/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="../index_body/index_siderbar.jsp" %>
<%--页面功能箱子--%>
<div id="content">

    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来" class="tip-bottom"><i
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/listMenu/getMenu"
                                                 class="current">菜单管理</a>
        </div>
    </div>

    <%--container-fluid  start--%>
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">
                <%--============================ 表一====================================--%>
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
                        <h5>
                            <input type="button" value="更进菜单"
                                   onclick="GetMenu();" class="btn-success btn-mini"/>
                        </h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered data-table ">
                            <thead>
                            <tr>
                                <th>菜单ID</th>
                                <th>菜单描述</th>
                                <th>菜单地址</th>
                                <th>父级ID</th>
                                <th>菜单顺序</th>
                                <th>菜单图标</th>
                                <th>菜单类型</th>
                                <th>操作</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <c:forEach items="${allMenu}" var="item">
                                <td><c:out value="${item.menuId}"/></td>
                                <td><c:out value="${item.menuName}"/></td>
                                <td><c:out value="${item.menuUrl}"/></td>
                                <td><c:out value="${item.parentId}"/></td>
                                <td><c:out value="${item.menuOrder}"/></td>
                                <td><i class=" <c:out value="${item.menuIcon}"/> "></i></td>
                                <td><c:out value="${item.menuType}"/></td>
                                <td onclick='goEdit(<c:out value="${item.menuId}"/>)'>编辑</td>
                                <td onclick='doDelete(<c:out value="${item.menuId}"/>)'>删除</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--=============================表二===================================--%>
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
                        <h5>权限菜单管理</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <%--=======================模板设计的 table   start=======================--%>
                        <table class="table table-bordered data-table ">
                            <thead>
                            <tr>
                                <th>ID值</th>
                                <th>角色ID值</th>
                                <th>菜单ID值</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr class="gradeX">
                                <td>沃尔玛</td>
                                <td>9527IG</td>
                                <td>100</td>
                                <td>
                                    <div class="dropdown">
                                        <i class="icon icon-folder-open" id="dropdownMenu1" data-toggle="dropdown"></i>
                                        <ul class="dropdown-menu pull-right" role="menu"
                                            aria-labelledby="dropdownMenu1">
                                            <li role="presentation"><a class="icon icon-edit" role="menuitem"
                                                                       tabindex="-1" href="#">编辑</a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a class="icon icon-shopping-cart" role="menuitem"
                                                                       tabindex="-1" href="#">货道管理</a>
                                            </li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a class="icon  icon-warning-sign" role="menuitem"
                                                                       tabindex="-1" href="#">审核</a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a class="icon icon-trash" role="menuitem"
                                                                       tabindex="-1" href="#">删除</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr class="gradeX">
                                <td>沃尔玛</td>
                                <td>9527IG</td>
                                <td>100</td>
                                <td> ---</td>
                            </tr>
                            <tr class="gradeX">
                                <td>沃尔玛</td>
                                <td>9527IG</td>
                                <td>100</td>
                                <td> ---</td>
                            </tr>

                            </tbody>
                        </table>
                        <%--=======================模板设计的 table end ========================--%>
                    </div>
                </div>
                <%--=============================表三===================================--%>
                <%--<div class="widget-box">--%>
                <%--<div class="widget-title"><span class="icon"><i class="icon-th"></i></span>--%>
                <%--<h5>权限菜单管理标准版</h5>--%>
                <%--</div>--%>
                <%--<div class="widget-content nopadding">--%>
                <%--<h3>权限菜单    <input type="button" value="更进菜单"--%>
                <%--onclick="initTable();" class="btn-success btn-mini"/></h3>--%>
                <%--&lt;%&ndash;<div id="toolbar" class="btn-group">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<button id="btn_add" type="button" class="btn btn-success"><span&ndash;%&gt;--%>
                <%--&lt;%&ndash;class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增&ndash;%&gt;--%>
                <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<button id="btn_edit" type="button" class="btn btn-success"><span&ndash;%&gt;--%>
                <%--&lt;%&ndash;class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改&ndash;%&gt;--%>
                <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<button id="btn_delete" type="button" class="btn btn-success"><span&ndash;%&gt;--%>
                <%--&lt;%&ndash;class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除&ndash;%&gt;--%>
                <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--<table id="cusTable"--%>
                <%--data-toggle="table"--%>
                <%--data-toolbar="#toolbar"--%>
                <%--data-search="true"--%>
                <%--data-show-refresh="true"--%>
                <%--data-show-toggle="true"--%>
                <%--data-show-columns="true"--%>
                <%--data-show-export="true"--%>
                <%--data-show-pageination-switch="true"--%>
                <%--data-detail-view="true"--%>
                <%--data-detail-formatter="detailFormatter"--%>
                <%--data-minimum-count-columns="2"--%>
                <%--data-show-pagination-switch="true"--%>
                <%--data-pagination="true"--%>
                <%--data-id-field="id"--%>
                <%--data-page-list="[10, 25, 50, 100, ALL]"--%>
                <%--data-show-footer="false"--%>
                <%--&lt;%&ndash;data-side-pagination="server"&ndash;%&gt;--%>
                <%--data-response-handler="responseHandler">--%>
                <%--<thead>--%>
                <%--<tr>--%>
                <%--<th data-field="menuId" data-sortable="true" >菜单ID</th>--%>
                <%--<th data-field="menuName">菜单描述</th>--%>
                <%--<th data-field="menuUrl">菜单地址</th>--%>
                <%--<th data-field="parentId" data-sortable="true">父级ID</th>--%>
                <%--<th data-field="menuOrder" data-sortable="true">菜单顺序</th>--%>
                <%--<th data-field="menuIcon">菜单图标</th>--%>
                <%--<th data-field="menuType">菜单类型</th>--%>
                <%--<th>操作</th>--%>
                <%--</tr>--%>
                <%--</thead>--%>
                <%--</table>--%>

                <%--</div>--%>


                <%--&lt;%&ndash;<script type="text/javascript">&ndash;%&gt;--%>
                <%--&lt;%&ndash;var $table = $('#table');&ndash;%&gt;--%>
                <%--&lt;%&ndash;var    $remove = $('#remove'),&ndash;%&gt;--%>
                <%--&lt;%&ndash;selections = [];&ndash;%&gt;--%>
                <%--&lt;%&ndash;function initTable() {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.bootstrapTable({&ndash;%&gt;--%>
                <%--&lt;%&ndash;url:"<%=request.getContextPath()%>/listMenu/getMenu",&ndash;%&gt;--%>
                <%--&lt;%&ndash;method: "post",&ndash;%&gt;--%>
                <%--&lt;%&ndash;dataType:"json",&ndash;%&gt;--%>
                <%--&lt;%&ndash;striped: "true",&ndash;%&gt;--%>
                <%--&lt;%&ndash;height: getHeight(),&ndash;%&gt;--%>
                <%--&lt;%&ndash;columns:&ndash;%&gt;--%>
                <%--&lt;%&ndash;[&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'menuId',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '菜单ID',&ndash;%&gt;--%>
                <%--&lt;%&ndash;sortable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;editable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;footerFormatter: totalNameFormatter,&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center'&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'menuName',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '菜单描述',&ndash;%&gt;--%>
                <%--&lt;%&ndash;sortable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;editable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;footerFormatter: totalNameFormatter,&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center'&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'menuUrl',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '菜单地址',&ndash;%&gt;--%>
                <%--&lt;%&ndash;sortable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;editable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;footerFormatter: totalNameFormatter,&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center'&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'parentId',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '父级ID',&ndash;%&gt;--%>
                <%--&lt;%&ndash;sortable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;editable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;footerFormatter: totalNameFormatter,&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center'&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'menuOrder',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '菜单顺序',&ndash;%&gt;--%>
                <%--&lt;%&ndash;sortable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;editable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;footerFormatter: totalNameFormatter,&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center'&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'menuIcon',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '菜单图标',&ndash;%&gt;--%>
                <%--&lt;%&ndash;sortable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;editable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;footerFormatter: totalNameFormatter,&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center'&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'menuType',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '菜单类型',&ndash;%&gt;--%>
                <%--&lt;%&ndash;sortable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;editable: true,&ndash;%&gt;--%>
                <%--&lt;%&ndash;footerFormatter: totalNameFormatter,&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center'&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'id',&ndash;%&gt;--%>
                <%--&lt;%&ndash;title: '操作',&ndash;%&gt;--%>
                <%--&lt;%&ndash;align: 'center',&ndash;%&gt;--%>
                <%--&lt;%&ndash;formatter:function(value,row,index) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;//value 能够获得当前列的值&ndash;%&gt;--%>
                <%--&lt;%&ndash;//====================================&ndash;%&gt;--%>
                <%--&lt;%&ndash;var e = '<button href="#" class="btn btn-default" mce_href="#" onclick="edit(\'' + row.id + '\')">编辑</button> ';&ndash;%&gt;--%>
                <%--&lt;%&ndash;var d = '<button href="#" class="btn btn-default" mce_href="#" onclick="del(\'' + row.id + '\')">删除</button> ';&ndash;%&gt;--%>
                <%--&lt;%&ndash;return e + d;&ndash;%&gt;--%>
                <%--&lt;%&ndash;//&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;]&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;// sometimes footer render error.&ndash;%&gt;--%>
                <%--&lt;%&ndash;setTimeout(function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.bootstrapTable('resetView');&ndash;%&gt;--%>
                <%--&lt;%&ndash;}, 200);&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.on('check.bs.table uncheck.bs.table ' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;'check-all.bs.table uncheck-all.bs.table', function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$remove.prop('disabled', !$table.bootstrapTable('getSelections').length);&ndash;%&gt;--%>
                <%--&lt;%&ndash;// save your data, here just save the current page&ndash;%&gt;--%>
                <%--&lt;%&ndash;selections = getIdSelections();&ndash;%&gt;--%>
                <%--&lt;%&ndash;// push or splice the selections if you want to save all data selections&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.on('expand-row.bs.table', function (e, index, row, $detail) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (index % 2 == 1) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$detail.html('Loading from ajax request...');&ndash;%&gt;--%>
                <%--&lt;%&ndash;$.get('LICENSE', function (res) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$detail.html(res.replace(/\n/g, '<br>'));&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.on('all.bs.table', function (e, name, args) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;console.log(name, args);&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;$remove.click(function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;var ids = getIdSelections();&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.bootstrapTable('remove', {&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'id',&ndash;%&gt;--%>
                <%--&lt;%&ndash;values: ids&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;$remove.prop('disabled', true);&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;$(window).resize(function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.bootstrapTable('resetView', {&ndash;%&gt;--%>
                <%--&lt;%&ndash;height: getHeight()&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;function getIdSelections() {&ndash;%&gt;--%>
                <%--&lt;%&ndash;return $.map($table.bootstrapTable('getSelections'), function (row) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;return row.id&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;function responseHandler(res) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$.each(res.rows, function (i, row) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;row.state = $.inArray(row.id, selections) !== -1;&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;return res;&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;function detailFormatter(index, row) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;var html = [];&ndash;%&gt;--%>
                <%--&lt;%&ndash;$.each(row, function (key, value) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;html.push('<p><b>' + key + ':</b> ' + value + '</p>');&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;return html.join('');&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;function operateFormatter(value, row, index) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;return [&ndash;%&gt;--%>
                <%--&lt;%&ndash;'<a class="like" href="javascript:void(0)" title="Like">',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'<i class="glyphicon glyphicon-heart"></i>',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'</a>  ',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'<a class="remove" href="javascript:void(0)" title="Remove">',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'<i class="glyphicon glyphicon-remove"></i>',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'</a>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;].join('');&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;window.operateEvents = {&ndash;%&gt;--%>
                <%--&lt;%&ndash;'click .like': function (e, value, row, index) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;alert('You click like action, row: ' + JSON.stringify(row));&ndash;%&gt;--%>
                <%--&lt;%&ndash;},&ndash;%&gt;--%>
                <%--&lt;%&ndash;'click .remove': function (e, value, row, index) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;$table.bootstrapTable('remove', {&ndash;%&gt;--%>
                <%--&lt;%&ndash;field: 'id',&ndash;%&gt;--%>
                <%--&lt;%&ndash;values: [row.id]&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;};&ndash;%&gt;--%>
                <%--&lt;%&ndash;function totalTextFormatter(data) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;return 'Total';&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;function totalNameFormatter(data) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;return data.length;&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;function totalPriceFormatter(data) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;var total = 0;&ndash;%&gt;--%>
                <%--&lt;%&ndash;$.each(data, function (i, row) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;total += +(row.price.substring(1));&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;return '$' + total;&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;function getHeight() {&ndash;%&gt;--%>
                <%--&lt;%&ndash;return $(window).height() - $('h1').outerHeight(true);&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;$(function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;var scripts = [&ndash;%&gt;--%>
                <%--&lt;%&ndash;location.search.substring(1) || 'assets/bootstrap-table/src/bootstrap-table.js',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'assets/bootstrap-table/src/extensions/export/bootstrap-table-export.js',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'http://rawgit.com/hhurz/tableExport.jquery.plugin/master/tableExport.js',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'assets/bootstrap-table/src/extensions/editable/bootstrap-table-editable.js',&ndash;%&gt;--%>
                <%--&lt;%&ndash;'http://rawgit.com/vitalets/x-editable/master/dist/bootstrap3-editable/js/bootstrap-editable.js'&ndash;%&gt;--%>
                <%--&lt;%&ndash;],&ndash;%&gt;--%>
                <%--&lt;%&ndash;eachSeries = function (arr, iterator, callback) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;callback = callback || function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;};&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (!arr.length) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;return callback();&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;var completed = 0;&ndash;%&gt;--%>
                <%--&lt;%&ndash;var iterate = function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;iterator(arr[completed], function (err) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (err) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;callback(err);&ndash;%&gt;--%>
                <%--&lt;%&ndash;callback = function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;};&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;else {&ndash;%&gt;--%>
                <%--&lt;%&ndash;completed += 1;&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (completed >= arr.length) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;callback(null);&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;else {&ndash;%&gt;--%>
                <%--&lt;%&ndash;iterate();&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;};&ndash;%&gt;--%>
                <%--&lt;%&ndash;iterate();&ndash;%&gt;--%>
                <%--&lt;%&ndash;};&ndash;%&gt;--%>
                <%--&lt;%&ndash;eachSeries(scripts, getScript, initTable);&ndash;%&gt;--%>
                <%--&lt;%&ndash;});&ndash;%&gt;--%>
                <%--&lt;%&ndash;function getScript(url, callback) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;var head = document.getElementsByTagName('head')[0];&ndash;%&gt;--%>
                <%--&lt;%&ndash;var script = document.createElement('script');&ndash;%&gt;--%>
                <%--&lt;%&ndash;script.src = url;&ndash;%&gt;--%>
                <%--&lt;%&ndash;var done = false;&ndash;%&gt;--%>
                <%--&lt;%&ndash;// Attach handlers for all browsers&ndash;%&gt;--%>
                <%--&lt;%&ndash;script.onload = script.onreadystatechange = function () {&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (!done && (!this.readyState ||&ndash;%&gt;--%>
                <%--&lt;%&ndash;this.readyState == 'loaded' || this.readyState == 'complete')) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;done = true;&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (callback)&ndash;%&gt;--%>
                <%--&lt;%&ndash;callback();&ndash;%&gt;--%>
                <%--&lt;%&ndash;// Handle memory leak in IE&ndash;%&gt;--%>
                <%--&lt;%&ndash;script.onload = script.onreadystatechange = null;&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;};&ndash;%&gt;--%>
                <%--&lt;%&ndash;head.appendChild(script);&ndash;%&gt;--%>
                <%--&lt;%&ndash;// We handle everything using the script element injection&ndash;%&gt;--%>
                <%--&lt;%&ndash;return undefined;&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;</script>&ndash;%&gt;--%>
                <%--</div>--%>

            </div>
            <%--span12 1 end--%>

        </div>
        <%--row-fluid end--%>

        <%--container-fluid  end--%>
    </div>

    <%--页面功能箱子结束--%>
</div>

<%--====================到底了=============================--%>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
<!--end-Footer-part-->

<%--注: 有时候 页面 带有冲突的时候，最好是不引入这个页面了，单独引入该需要的JS页面，引入公共的js脚本，防止页面部分功能冲突--%>
<%--<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>--%>

<%--引用自身需要的 表格 JS--%>
<%--bootstrap页面基础脚本--%>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.min.js'/>"></script>
<%--整体UI 界面公用--%>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.ui.custom.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.ui.custom.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/common/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.uniform.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/select2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>

<%--=================6.12研究bootstrap table 组件==引入的 js======= start =======--%>
<script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/js/bootstraptable/bootstrap-table-locale-all.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table-zh-CN.js'/>"></script>
<%--=================6.12研究bootstrap table 组件==引入的 js======= end =======--%>
<!--end-javascript-part-->

</body>
</html>
