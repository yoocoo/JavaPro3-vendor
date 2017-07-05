<%--
  Created by IntelliJ IDEA.
  User: 王娇 改版后后台，重新做物理分页
  Date: 2017/7/1
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--Meta, title, CSS, favicons, etc.--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>系统用户列表</title>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/bootstrap/dist/css/bootstrap.min.css'/>">
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/font-awesome/css/font-awesome.min.css'/>">
    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/nprogress/nprogress.css'/>">
    <!-- iCheck -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/iCheck/skins/flat/green.css'/>">
    <!-- Datatables -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css'/>">
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css'/>">
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css'/>">
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css'/>">
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css'/>">
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">
    <%--引入CSS 样式 end --%>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <%--引入左部内容，包括左侧权限菜单，以及修改个人头像模态弹窗--%>
        <%--引入顶部导航jsp  --%>
        <%@ include file="/WEB-INF/jsp/index_body/index_left_col.jsp" %>

        <%--引入顶部导航栏，包括下拉菜单，以及查看个人资料模态弹窗--%>
        <!-- top navigation -->
        <%@ include file="/WEB-INF/jsp/index_body/index_top_nav.jsp" %>
        <!-- /top navigation -->

        <%--右侧Tab主要内容--%>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>用户系统管理列表
                            <%--<small> ---------</small>--%>
                        </h3>
                    </div>
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="请输入内容">
                                <span class="input-group-btn">
                <button class="btn btn-default" type="button">开始</button>
                </span></div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">

                    <%--<div class="col-md-12 col-sm-12 col-xs-12">--%>
                        <%--<div class="x_panel">--%>
                            <%--<div class="x_title">--%>
                                <%--&lt;%&ndash;<h2>系统用户列表&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<small>说明：</small>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</h2>&ndash;%&gt;--%>
                                <%--<div class="fontawesome-icon-list">--%>
                                    <%--<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a href="#/ambulance"><i--%>
                                            <%--class="fa fa-eye"></i> 审核用户信息</a>--%>
                                    <%--</div>--%>
                                    <%--<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a--%>
                                            <%--href="<%=request.getContextPath()%>/mvc/userAction/sysuserResSheng"><i--%>
                                            <%--class="fa fa-user"></i> 新增一级用户</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<ul class="nav navbar-right panel_toolbox">--%>
                                    <%--<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>--%>
                                    <%--&lt;%&ndash;<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;role="button" aria-expanded="false"><i&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;class="fa fa-wrench"></i></a>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<ul class="dropdown-menu" role="menu">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<li><a href="#">设置 1</a></li>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<li><a href="#">设置 2</a></li>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<li><a class="close-link"><i class="fa fa-close"></i></a></li>&ndash;%&gt;--%>
                                <%--</ul>--%>
                                <%--<div class="clearfix"></div>--%>
                            <%--</div>--%>
                            <%--<div class="x_content">--%>
                                <%--&lt;%&ndash;<div class="fontawesome-icon-list" >&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a href="#/ambulance"><i class="fa fa-eye"></i> 审核用户信息</a>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a href="<%=request.getContextPath()%>/mvc/userAction/sysuserResSheng"><i class="fa fa-user"></i> 新增一级用户</a>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                                <%--<table id="mytable" class="table table-striped table-bordered">--%>
                                    <%--<thead>--%>
                                    <%--<tr>--%>
                                        <%--<th>用户ID</th>--%>
                                        <%--<th>账户名</th>--%>
                                        <%--<th>真实姓名</th>--%>
                                        <%--<th>角色</th>--%>
                                        <%--<th>电子邮箱</th>--%>
                                        <%--<th>手机</th>--%>
                                        <%--<th>QQ号码</th>--%>
                                        <%--<th>邮编</th>--%>
                                        <%--<th>身份证</th>--%>
                                        <%--<th>创建时间</th>--%>
                                        <%--<th>是否冻结</th>--%>
                                        <%--<th>操作</th>--%>
                                    <%--</tr>--%>
                                    <%--</thead>--%>
                                    <%--<tbody>--%>
                                    <%--<tr>--%>
                                        <%--<td>1王娇</td>--%>
                                        <%--<td>上海虹桥</td>--%>
                                        <%--<td>销售部</td>--%>
                                        <%--<td>1</td>--%>
                                        <%--<td>343@qq.com</td>--%>
                                        <%--<td>1877800</td>--%>
                                        <%--<td>34574385</td>--%>
                                        <%--<td>272200</td>--%>
                                        <%--<td>1234578997778877855</td>--%>
                                        <%--<td>2011/04/25</td>--%>
                                        <%--<td>1</td>--%>
                                        <%--<td>--%>
                                            <%--<button type="button" class="btn btn-round btn-default btn-sm">编辑</button>--%>
                                            <%--<button type="button" class="btn btn-round btn-default btn-sm">冻结</button>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                    <%--</tbody>--%>
                                <%--</table>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>测试table
                                    <small>-----</small>
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    <%--<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"--%>
                                    <%--role="button" aria-expanded="false"><i--%>
                                    <%--class="fa fa-wrench"></i></a>--%>
                                    <%--<ul class="dropdown-menu" role="menu">--%>
                                    <%--<li><a href="#">设置 1</a></li>--%>
                                    <%--<li><a href="#">设置 2</a></li>--%>
                                    <%--</ul>--%>
                                    <%--</li>--%>
                                    <%--<li><a class="close-link"><i class="fa fa-close"></i></a></li>--%>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <p class="text-muted font-13 m-b-30"> 基于 by the Bootstrap CSS framework设计的静态表格 </p>

                                <table id="listtable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>

                                        <th>ID</th>
                                        <th>下一</th>
                                        <th>账户名</th>
                                        <th>密码</th>
                                        <th>姓名</th>
                                        <th>角色</th>
                                        <th>昵称</th>
                                        <th>电子邮箱</th>
                                        <th>最近一次登录</th>
                                        <th>电话</th>
                                        <th>手机</th>
                                        <th>QQ</th>
                                        <th>邮编</th>
                                        <th>身份证</th>
                                        <th>次数</th>
                                        <th>地址</th>
                                        <th>创建时间</th>
                                        <th>头像地址</th>
                                        <th>是否删除</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!-- footer content -->
        <footer>
            <div class="pull-right"> ZJNU
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>
<!-- jQuery -->
<script type="text/javascript" src="<c:url value='/static/vendors/jquery/dist/jquery.min.js'/>"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="<c:url value='/static/vendors/bootstrap/dist/js/bootstrap.min.js'/>"></script>
<!-- FastClick -->
<script type="text/javascript" src="<c:url value='/static/vendors/fastclick/lib/fastclick.js'/>"></script>
<!-- NProgress -->
<script type="text/javascript" src="<c:url value='/static/vendors/nprogress/nprogress.js'/>"></script>
<!-- iCheck -->
<script type="text/javascript" src="<c:url value='/static/vendors/iCheck/icheck.min.js'/>"></script>
<!-- Datatables -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js'/>"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#listtable').DataTable({
            "serverSide": true,//开启服务器处理模式
            "paging": true,//是否分页
            "pagingType": "full_numbers",//除首页、上一页、下一页、末页四个按钮还有页数按钮
            "sAjaxSource": '<%=request.getContextPath()%>/userAction/listAllUser',
            "fnServerData": function (sSource, aoData, fnCallback) {
                $.ajax({
                    'type': "POST",
                    "url": sSource,
                    "dataType": 'json',
                    "data": {"aoData": JSON.stringify(aoData)},
                    "success": function (resp) {
                        fnCallback(resp);
                    }
                });
            },
            "columns": [
                {data: "userId"},
                {data: "accountName"},
                {data: "nextUrl"},
                {data: "password"},
                {data: "realName"},
                {data: "roleId"},
                {data: "nickName"},
                {data: "email"},
                {data: "lastLoginTime"},
                {data: "fixPhone"},
                {data: "mobilePhone"},
                {data: "qq"},
                {data: "postcode"},
                {data: "idcard"},
                {data: "loginCount"},
                {data: "postAdress"},
                {data: "headImage"},
                {data: "approved"}
            ]
        });
    })
</script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-buttons/js/dataTables.buttons.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-buttons/js/buttons.flash.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-buttons/js/buttons.html5.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-buttons/js/buttons.print.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-responsive/js/dataTables.responsive.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-scroller/js/dataTables.scroller.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/jszip/dist/jszip.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/pdfmake.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/vfs_fonts.js'/>"></script>

<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>



<%--<script type="text/javascript">--%>
    <%--var tbl;--%>
    <%--$(function () {--%>
        <%--tbl = $('#listtable').dataTable({--%>
            <%--"bServerSide": true,--%>
            <%--"sAjaxSource": "<%=request.getContextPath()%>/userAction/listAllUser",      //mvc后台ajax调用接口。--%>
            <%--'bPaginate': true,                      //是否分页。--%>
<%--//            "bProcessing": true,                    //当datatable获取数据时候是否显示正在处理提示信息。--%>
            <%--'bFilter': true,                       //是否使用内置的过滤功能。--%>
<%--//            'bLengthChange': false,                  //是否允许用户自定义每页显示条数。--%>
            <%--'sPaginationType': 'full_numbers',      //分页样式--%>
            <%--"bLengthChange": true,// 每行显示记录数--%>
            <%--"iDisplayLength": 10,// 每页显示行数--%>
            <%--"aoColumns": [--%>
                <%--{"sName": "userId"},--%>
                <%--{"sName": "accountName"},--%>
                <%--{"sName": "nextUrl"},--%>
                <%--{"sName": "password"},--%>
                <%--{"sName": "realName"},--%>
                <%--{"sName": "roleId"},--%>
                <%--{"sName": "nickName"},--%>
                <%--{"sName": "email"},--%>
                <%--{"sName": "lastLoginTime"},--%>
                <%--{"sName": "fixPhone"},--%>
                <%--{"sName": "mobilePhone"},--%>
                <%--{"sName": "qq"},--%>
                <%--{"sName": "postcode"},--%>
                <%--{"sName": "idcard"},--%>
                <%--{"sName": "loginCount"},--%>
                <%--{"sName": "postAdress"},--%>
                <%--{"sName": "headImage"},--%>
                <%--{"sName": "approved"}--%>
            <%--]--%>
        <%--});--%>

<%--//Ajax重新load控件数据。（server端）--%>
        <%--$("#btnTest").click(function () {--%>
            <%--var oSettings = tbl.fnSettings();--%>
            <%--oSettings.sAjaxSource = "<%=request.getContextPath()%>/userAction/listAllUser";--%>
            <%--alert(oSettings.sAjaxSource);--%>
            <%--tbl.fnClearTable(0);--%>
            <%--tbl.fnDraw();--%>

        <%--});--%>
    <%--});--%>
<%--</script>--%>
</body>
</html>
