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
    <title>菜单管理</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式 start--%>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>
    <%--引入公共CSS 样式 end --%>
    <%--<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">--%>
    <%--=================6.12研究bootstrap table 组件==引入的 css======= start =======--%>
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstraptable/bootstrap-table.css'/>">
    <%--=================6.12研究bootstrap table 组件==引入的 css======= end =======--%>

</head>
<%--=========角色菜单关联表开始===========--%>

<script type="application/javascript">
    function GetRoleMenu() {
        $.ajax({
            type: "POST",  //http请求方式为POST
            url: "<%=request.getContextPath()%>/listMenu/getRoleInMenu",//请求
//            data: {
//            },
            dataType: 'json',//返回值类型 一般设置为json
            cache: false,
            success: function (data) {
                alert(data.msg);
                location.reload() //点击按钮刷新页面
            }
        });

        function goEdit1() {

        }

        function doDelete1() {

        }
    }
</script>

<%--=====================权限菜单 开始======--%>
<%--<script type="application/javascript">--%>
    <%--&lt;%&ndash;function GetMenu() {&ndash;%&gt;--%>
        <%--&lt;%&ndash;$.ajax({&ndash;%&gt;--%>
            <%--&lt;%&ndash;type: "POST",  //http请求方式为POST&ndash;%&gt;--%>
            <%--&lt;%&ndash;url: "<%=request.getContextPath()%>/listMenu/getMenu",//请求&ndash;%&gt;--%>
<%--&lt;%&ndash;//            data: {&ndash;%&gt;--%>
<%--&lt;%&ndash;//            },&ndash;%&gt;--%>
            <%--&lt;%&ndash;dataType: 'json',//返回值类型 一般设置为json&ndash;%&gt;--%>
            <%--&lt;%&ndash;cache: false,&ndash;%&gt;--%>
            <%--&lt;%&ndash;success: function (data) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;alert(data.msg);&ndash;%&gt;--%>
                <%--&lt;%&ndash;location.reload() //点击按钮刷新页面&ndash;%&gt;--%>
            <%--&lt;%&ndash;}&ndash;%&gt;--%>
        <%--&lt;%&ndash;});&ndash;%&gt;--%>

        <%--function goEdit() {--%>

        <%--}--%>

        <%--function doDelete() {--%>

        <%--}--%>
    <%--}--%>
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

        <%--<hr>--%>
        <div class="row-fluid">
            <div class="span12">

                <%--=============================表二===================================--%>
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
                        <h5>权限菜单管理 </h5>
                        <div align="right">
                            <%--<i class="icon-arrow-left">--%>
                            <i class="previous fg-button ui-button ui-state-default ui-state-disabled"
                               id="DataTables_Table_0_previous">
                                <a onclick="goToLastPage()" style="width: 110px;">上一页</a>
                            </i>
                            <%--<i class="icon-map-marker">--%>
                            <i class="fg-button ui-button ui-state-default ui-state-disabled-marker">
                                <a id="log-controller-now">1</a>
                            </i>
                            <%--<i class="icon-arrow-right">--%>
                            <i class="next fg-button ui-button ui-state-default ui-state-disabled"
                               id="DataTables_Table_0_next">
                                <a title="下一页" onclick="goToNextPage()" style="width: 110px;">下一页</a>
                            </i>

                        </div>
                    </div>
                    <div class="widget-content nopadding">
                        </hr>
                        <%--=======================页面原模板设计的 table   start=======================--%>
                        <table class="table table-bordered data-table ">
                            <thead>
                            <tr>
                                <th>ID值</th>
                                <th>角色ID值</th>
                                <th>菜单ID值</th>
                                <th>操作</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--<tr class="gradeX">--%>
                            <%--<td>沃尔玛</td>--%>
                            <%--<td>9527IG</td>--%>
                            <%--<td>100</td>--%>
                            <%--<td>--%>
                            <%--<div class="dropdown">--%>
                            <%--<i class="icon icon-folder-open" id="dropdownMenu1" data-toggle="dropdown"></i>--%>
                            <%--<ul class="dropdown-menu pull-right" role="menu"--%>
                            <%--aria-labelledby="dropdownMenu1">--%>
                            <%--<li role="presentation"><a class="icon icon-edit" role="menuitem"--%>
                            <%--tabindex="-1" href="#">编辑</a></li>--%>
                            <%--<li role="presentation" class="divider"></li>--%>
                            <%--<li role="presentation"><a class="icon icon-shopping-cart" role="menuitem"--%>
                            <%--tabindex="-1" href="#">货道管理</a>--%>
                            <%--</li>--%>
                            <%--<li role="presentation" class="divider"></li>--%>
                            <%--<li role="presentation"><a class="icon  icon-warning-sign" role="menuitem"--%>
                            <%--tabindex="-1" href="#">审核</a></li>--%>
                            <%--<li role="presentation" class="divider"></li>--%>
                            <%--<li role="presentation"><a class="icon icon-trash" role="menuitem"--%>
                            <%--tabindex="-1" href="#">删除</a></li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>
                            <%--</td>--%>
                            <%--<td> ---</td>--%>
                            <%--</tr>--%>

                            <tr class="gradeX">
                            <c:forEach items="${listRoleInMenuJson}" var="list">
                            <td><c:out value="${list.id}"/></td>
                            <td><c:out value="${list.roleId}"/></td>
                            <td><c:out value="${list.menuId}"/></td>
                            <td onclick='goEdit1(<c:out value="${list.id}"/>)'>编辑</td>
                            <td onclick='doDelete1(<c:out value="${list.id}"/>)'>删除</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <%--=======================模板设计的 table end ========================--%>
                    </div>
                </div>
            </div>
            <%--span12 1 end--%>
        </div>
        <%--row-fluid  1  end--%>

        <%--=========== row-fluid  2  start==============--%>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
                        <h5>
                            权限菜单列表
                        </h5>
                    </div>
                    <div class="widget-content nopadding">
                        </hr>
                        <table id="example" class="display"  width="100%">
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
                            <tr >
                                <c:forEach items="${listMenuJson}" var="item">
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
            </div>
            <%--===================================================================--%>
        </div>
        <%--row-fluid  2  end--%>

        <div class="row-fluid">
            <%--==============================测试开始6.14=  表一===============--%>

                <div class="span5">
                <div class="widget-box">
                <div class="widget-title"><span class="icon"> <i class="icon-list"></i> </span>
                <h5>表单2 <code>模块2</code></h5>
                </div>
                <div class="widget-content"> 描述2</div>
                </div>
                </div>
                <div class="span5">
                <div class="widget-box">
                <div class="widget-title"><span class="icon"> <i class="icon-list"></i> </span>
                <h5>表单3 <code>模块三</code></h5>
                </div>
                <div class="widget-content"> 描述3</div>
                </div>
                </div>
        </div>

    </div>
    <%--container-fluid  end--%>


</div>
<%--  container-fluid页面功能箱子结束--%>


<%--====================到底部了=============================--%>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
${pageN}//获取当前页码

${pageS}//获取页面长度

${toalN}//获取总的页码
<%--<!--end-Footer-part-->--%>
<script type="text/javascript">

    $(document).ready(function() {
        $('#example').dataTable();//其中example为table的id，table中必须有thead！
    } );

    var pageNum =${pageN};//获取当前页码
    alert("1获得的当前页码："+pageNum);
    var pageSize = ${pageS};//获取页面长度
    alert("2获取页面长度："+pageSize);
    var totalNum = ${toalN};//获取总的页码
    alert("3获取页面长度："+totalNum);

    function goToNextPage() {
        pageNum = parseInt(pageNum) + 1;
        alert("下一页步骤：获得的当前页码："+pageSize);
        $.ajax({
            type: "POST",
            url: '<%=request.getContextPath()%>/listMenu/getRoleInMenu',
            data: {pageNum: pageNum, pageSize: pageSize},
            dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function () {
//                if (data.code == 1) {
////                    updateList(data.data);
////                    pageNum = data.pageNum;
//                    $("#log-controller-now").html(pageNum);
                }

        });
    }

    function goToLastPage() {
        pageNum = parseInt(pageNum) - 1;
        alert("上一页步骤：获得的当前页码："+pageNum);
        $.ajax({
            type: "POST",
            url: '<%=request.getContextPath()%>/listMenu/getRoleInMenu',
            data: {pageNum: pageNum, pageSize: pageSize},
            dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function () {
//                if (data.code == 1) {
//                    updateList(data.data);
//                    pageNum = data.pageNum;
//                    $("#log-controller-now").html(pageNum);
                }
//            }
        });
    }

</script>


<%--注: 有时候 页面 带有冲突的时候，最好是不引入这个页面了，单独引入该需要的JS页面，引入公共的js脚本，防止页面部分功能冲突--%>
<%--<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>--%>

<%--引用自身需要的 表格 JS--%>
<%--bootstrap页面基础脚本--%>
<%--======6.15jquery.min.js 版本问题测试=====--%>
<script type="text/javascript" src="<c:url value='/static/js/bootstraptable/jquery.min.js'/>"></script>
<%--======6.15jquery.min.js 版本问题测试=====--%>

<%--bootstrap页面基础脚本--%>
<%--<script type="text/javascript" src="<c:url value='/static/js/common/jquery.min.js'/>"></script>--%>
<%--==========以下三种结合 使用第一种table表现形式--%>
<script type="text/javascript" src="<c:url value='/static/js/select2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>
<%--整体UI 界面公用--%>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.ui.custom.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/common/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.peity.min.js'/>"></script>

<%--页面整体重要JS 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/common/matrix.js'/>"></script>
<%--home首页进度条，快捷菜单，按钮分类等--%>
<script type="text/javascript" src="<c:url value='/static/js/matrix.interface.js'/>"></script>

<script type="text/javascript" src="<c:url value='/static/js/jquery.uniform.js'/>"></script>

<!--end-javascript-part-->

</body>
</html>
<%--============================ 6.15号测试表三=bootstrap 版本的 不带物理分页=====================--%>
<%--<div class="widget-box">--%>
<%--<div class="widget-title"><span class="icon"> <i class="icon-list"></i> </span>--%>
<%--<h5>表单1 <code>网测数据(<a href="www.baidu.com" target="_blank">不要点</a>)</code>--%>
<%--<input type="button" value="更进菜单"--%>
<%--onclick="GetMenu();" class="btn-success btn-mini"/>--%>
<%--</h5>--%>
<%--</div>--%>
<%--<div class="widget-content nopadding">--%>
<%--<table id="reportTable">--%>
<%--</table>--%>
<%--<script type="text/javascript">--%>
<%--function GetMenu() {--%>
<%--$('#reportTable').bootstrapTable({--%>
<%--method: 'get',--%>
<%--cache: false,--%>
<%--height: 300,--%>
<%--striped: true,--%>
<%--pagination: true,--%>
<%--pageSize: 10,--%>
<%--pageNumber: 1,--%>
<%--pageList: [10, 20, 50, 100, 200, 500],--%>
<%--search: true,--%>
<%--showColumns: true,--%>
<%--showRefresh: true,--%>
<%--showExport: true,--%>
<%--exportTypes: ['csv', 'txt', 'xml'],--%>
<%--search: true,--%>
<%--clickToSelect: true,--%>
<%--columns: [--%>
<%--{--%>
<%--field: "menuId",--%>
<%--title: "菜单ID值",--%>
<%--align: "center",--%>
<%--valign: "middle",--%>
<%--sortable: "true"--%>
<%--},--%>
<%--{--%>
<%--field: "menuName",--%>
<%--title: "菜单描述",--%>
<%--align: "center",--%>
<%--valign: "left"--%>
<%--},--%>
<%--{--%>
<%--field: "menuUrl",--%>
<%--title: "菜单地址",--%>
<%--align: "center",--%>
<%--valign: "left"--%>
<%--},--%>
<%--{--%>
<%--field: "parentId",--%>
<%--title: "父级菜单ID值",--%>
<%--align: "center",--%>
<%--valign: "middle",--%>
<%--sortable: "true"--%>
<%--},--%>
<%--{--%>
<%--field: "menuOrder",--%>
<%--title: "菜单顺序",--%>
<%--align: "center",--%>
<%--valign: "middle",--%>
<%--sortable: "true"--%>
<%--},--%>
<%--{field: "menuIcon", title: "菜单图标类名", align: "center", valign: "middle"},--%>
<%--{--%>
<%--field: "menuType",--%>
<%--title: "菜单类型",--%>
<%--align: "center",--%>
<%--valign: "middle",--%>
<%--sortable: "true"--%>
<%--},--%>
<%--{field: "parentMenu", title: "父级菜单描述", align: "center", valign: "middle"},--%>
<%--{--%>
<%--field: "hasMenu",--%>
<%--title: "是否含有子菜单",--%>
<%--align: "center",--%>
<%--valign: "middle",--%>
<%--sortable: "true"--%>
<%--},--%>
<%--{--%>
<%--field: "subMenu",--%>
<%--title: "子菜单数",--%>
<%--align: "center",--%>
<%--valign: "middle",--%>
<%--sortable: "true"--%>
<%--}],--%>
<%--data:${allMenu},--%>

<%--onPageChange: function (size, number) {--%>
<%--//$("#pageSizeInput").val(size);--%>
<%--//$("#pageNumberInput").val(number);--%>

<%--//var form = $('#tableForm');--%>
<%--//form.action= '$/showReport';--%>
<%--//form.submit();--%>
<%--},--%>
<%--//onSort: function (name, order) {--%>
<%--// },--%>
<%--//formatShowingRows: function (pageFrom, pageTo, totalRows) {--%>
<%--//	return '';--%>
<%--// },--%>
<%--//formatRecordsPerPage: function () {--%>
<%--//	return '';--%>
<%--//  },--%>
<%--//                formatNoMatches: function(){--%>
<%--//                    return 'ÎÞ·ûºÏÌõ¼þµÄ¼ÇÂ¼';--%>
<%--//                }--%>
<%--});--%>

<%--$(window).resize(function () {--%>
<%--$('#reportTable').bootstrapTable('resetView');--%>
<%--});--%>
<%--}--%>
<%--;--%>

<%--</script>--%>
<%--</div>--%>
<%--</div>--%>
<%--============================   测试结束6.15========================--%>
<%--<div class="widget-content nopadding">--%>
    <%--<table data-toggle="table"--%>
           <%--data-url="https://api.github.com/users/wenzhixin/repos"--%>
           <%--data-query-params="queryParams"--%>
           <%--data-pagination="true"--%>
           <%--data-search="true"--%>
           <%--data-height="300">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th data-field="name">姓名</th>--%>
            <%--<th data-field="stargazers_count">访问量</th>--%>
            <%--<th data-field="forks_count">拷贝量</th>--%>
            <%--<th data-field="description">详细描述</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
    <%--</table>--%>
<%--</div>--%>
<%--======== js   start 测试 6.14=== 表一 ==--%>
<%--<script type="text/javascript">--%>
    <%--function queryParams() {--%>
        <%--return {--%>
            <%--type: 'owner',--%>
            <%--sort: 'updated',--%>
            <%--direction: 'desc',--%>
            <%--per_page: 100,--%>
            <%--page: 1--%>
        <%--};--%>
    <%--}--%>
<%--</script>--%>
<%--========  js  end  测试 6.14=== 表一 ==--%>