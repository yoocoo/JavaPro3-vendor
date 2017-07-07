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

    <link rel="shortcut icon" href="<c:url value='/static/img/favicon.ico'/>"/>
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
                                <h2>系统用户数据表格<br/>
                                    <small> 1.对新注册用户，信息审核，审核通过后，可登陆。
                                        2.冻结过期，可疑账户。</small>
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
                                <p class="text-muted font-13 m-b-30">

                                <div class="fontawesome-icon-list">
                                    <%--<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a href="#/ambulance"><i--%>
                                            <%--class="fa fa-eye"></i> 审核用户信息</a>--%>
                                    <%--</div>--%>
                                    <div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a
                                            href="<%=request.getContextPath()%>/mvc/userAction/sysuserResSheng"><i
                                            class="fa fa-user"></i> 新增一级用户</a>
                                    </div>
                                </div>
                                    <%--基于 by the Bootstrap CSS framework设计的静态表格 --%>
                                </p>

                                <table id="table_id"
                                       class="table table-striped table-bordered ">
                                    <%--class="table table-striped table-bordered">--%>
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <%--<th>下一</th>--%>
                                        <th>账户名</th>
                                        <th>密码</th>
                                        <th>姓名</th>
                                        <th>角色</th>
                                        <%--<th>昵称</th>--%>
                                        <th>电子邮箱</th>
                                        <%--<th>最近一次登录</th>--%>
                                        <%--<th>电话</th>--%>
                                        <th>手机</th>
                                        <th>QQ</th>
                                        <%--<th>邮编</th>--%>
                                        <th>身份证</th>
                                        <%--<th>次数</th>--%>
                                        <%--<th>创建时间</th>--%>
                                        <th>地址</th>
                                        <%--<th>头像地址</th>--%>
                                        <th>是否删除</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
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

<script type="text/javascript">
    $(document).ready(function () {
        var tables = $('#table_id').DataTable({
//    var oTable = $("#listtable")
//        .DataTable({
            ajax: {
                url: "<%=request.getContextPath()%>/userAction/listAllUser",
                type: "POST",
//dataSrc : "list",//这个参数是自己封装的json里面的key
                data: {
//args1: "我是固定传参的值，在服务器接收参数[args1]"
                }
            },
            serverSide: true,//开启服务器模式:启用服务器分页
            lengthChange: false,//是否允许用户改变表格每页显示的记录数
//            ordering: true,//是否允许用户排序
            paging: true,//是否分页
//            pagingType: "full_numbers",//首页，上一页、中间数字下一页、尾页四个按钮还有页数按钮
            pagingType: "simple_numbers",//上一页、中间数字下一页、四个按钮还有页数按钮
            processing: true,//是否显示处理状态
          scrollX: true,//允许水平滚动
//          scrollY: "200px",
//          scrollCollapse: true,
            searching: true,//是否开始本地搜索
//         'bStateSave': true,//配置好这个,刷新页面会让页面停留在之前的页码
            stateSave: true,//刷新时是否保存状态
//          autoWidth: true,//自动计算宽度
            //deferRender : true,//延迟渲染
            columns: [
                {data: "userId"},
                <%--{data: "nextUrl"},--%>
                {data: "accountName"},
                {data: "password"},
                {data: "realName"},
                {data: "roleId"},
                <%--{data: "nickName"},--%>
                {data: "email"},
                <%--{data: "lastLoginTime"},--%>
                <%--{data: "fixPhone"},--%>
                {data: "mobilePhone"},
                {data: "qq"},
//                {data: "postcode"},
                {data: "idcard"},
                <%--{data: "loginCount"},--%>
                <%--{data: "creatTime"},--%>
                 {data: "postAdress"},
//                {data: "headImage"},
                {data: "approved"},
                {data: null}
            ],
            columnDefs: [{
                "targets": 11,//编辑
                "data": null,//下面这行，添加了编辑按钮和，删除按钮
                "defaultContent": "<button id='editrow' class='btn btn-primary btn-sm' type='button' style='margin-right:10px;'>审核</button>" +
                "<button id='delrow' class='btn btn-primary btn-sm' type='button'>冻结</button>"
            }],
            "createdRow": function (row, data, dataIndex) {
                //每加载完一行的回调函数
                $('td', row).eq(10).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
                return row;
            }
        });
//    －－－－－－－－－－－//以下为自定义的删除按钮事件，可以忽略，也可以参考写法－－－－－－－－－－－－－－－－
//================================冻结可疑账户==================================================
        $('#table_id tbody').on('click', 'button#delrow', function () {
            var oTable = $('#table_id').dataTable();
            var data = oTable.fnGetData($(this).parent().parent());
            var datastr = JSON.stringify(data);
            var dataObj = JSON.parse(datastr);
            console.log("====JsonObj中userid :" + dataObj.userId);
//            var data = tables.rows($(this).parents("tr")).data();
//            alert("=========" +tables.rows('.selected').data().length +' row(s) selected' );
            //tables.ajax.reload();重新获取数据
            //tables.draw(false);重新刷新页面
            if (confirm("是否确认冻结该账户")) {
                var userid = dataObj.userId;
                console.log("====  确认选择 冻结账户的userid===:" + userid);
                $.ajax({
                    type: "POST",  //http请求方式为POST
                    url: '<%=request.getContextPath()%>/userAction/listAllUserRemove',
//                type:'delete',
//                type : 'json',
                    dataType: 'json',//返回值类型 一般设置为json
//                    timeout: "3000",
                    cache: "false",
                    data: {userId: userid},
                    success: function (data) {
                        if (data.code == 1) {
                            alert(data.msg);
                            window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                        } else {
                            alert(data.msg);
                            $("#user").focus();
                        }
                    },
                    error: function (err) {
                        alert("冻结成功");
                        window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)

                    }
                });
            }
        });
//        ===========================审核用户信息======================================
        $('#table_id tbody').on('click', 'button#editrow', function () {
            var oTable1 = $('#table_id').dataTable();
            var data1 = oTable1.fnGetData($(this).parent().parent());
            var datastr1 = JSON.stringify(data1);
            var dataObj1 = JSON.parse(datastr1);
            console.log("====JsonObj中userid :" + dataObj1.userId);
//            var data = tables.rows($(this).parents("tr")).data();
//            alert("=========" +tables.rows('.selected').data().length +' row(s) selected' );
            //tables.ajax.reload();重新获取数据
            //tables.draw(false);重新刷新页面
            if (confirm("是否确认通过该账户信息")) {
                var userid = dataObj1.userId;
                console.log("====  确认选择 冻结账户的userid===:" + userid);
                $.ajax({
                    type: "POST",  //http请求方式为POST
                    url: '<%=request.getContextPath()%>/userAction/listAllUserPass',
//                type:'delete',
//                type : 'json',
                    dataType: 'json',//返回值类型 一般设置为json
//                    timeout: "3000",
                    cache: "false",
                    data: {userId: userid},
                    success: function (data) {
                        if (data.code == 1) {
                            alert(data.msg);
                            window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                        } else {
                            alert(data.msg);
                            $("#user").focus();
                        }
                    },
                    error: function (err) {
                        alert("新用户信息，通过审核");
                        window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)

                    }
                });
            }
        });
//            $('#table_id tbody i').css({"fontStyle": "normal"});
//            $('#table_id tbody').on('click', 'button#editrow', function () {
//                //获取数据
//                var data = tables.row($(this).parents('tr')).data();
////
//                alert("====获得的要编辑的data:" + data);
//                //清空内容
//                $('.pop_clear_text input').val('');
//                //弹出层展示
//                $('.pop').show();
//                //填充内容
//                $('.pop_userId').val(data.userId);
//                $('.pop_accountName').val(data.accountName);
//                alert("===打印accountName：" + $('.pop_accountName').val(data.accountName));
//
//                $('.pop_password').val(data.password);
//                $('.pop_realName').val(data.realName);
//                $('.pop_roleId').val(data.roleId);
//                $('.pop_email').val(data.email);
//                $('.pop_mobilePhone').val(data.mobilePhone);
//                $('.pop_qq').val(data.qq);
//                $('.pop_postcode').val(data.postcode);
//                $('.pop_idcard').val(data.idcard);
//                $('.pop_creatTime').val(data.creatTime);
//                $('.pop_postAdress').val(data.postAdress);
//                $('.pop_headImage').val(data.headImage);
//                $('.pop_approved').val(data.approved);
//            });
        //弹出层的功能
//            $('.pop_cancel,.pop_close').on("click", function () {
//                $('.pop').hide();
//            });
        <%--$('.pop_confirm').on('click', function () {--%>
        <%--var n = parseInt($('.pop_userId').val());--%>
        <%--console.log(typeof(n));--%>
        <%--$.ajax({--%>
        <%--url: '<%=request.getContextPath()%>/userAction/listAllUserRemove',--%>
        <%--//                    type: 'POST',--%>
        <%--type: 'PUT',--%>
        <%--contentType: "application/json",--%>
        <%--timeout: "3000",--%>
        <%--cache: false,--%>
        <%--data: JSON.stringify({--%>
        <%--userId: n,--%>
        <%--//                    "name":$('.pop_name').val(),--%>
        <%--//                    "industry":$('.pop_industry').val(),--%>
        <%--//                    "location":$('.pop_location').val(),--%>
        <%--//                    "source":$('.pop_source').val(),--%>
        <%--approved: $('.pop_approved').val()--%>
        <%--}),--%>
        <%--dataType: "json",--%>
        <%--success: function (str) {--%>
        <%--//弹窗关闭--%>
        <%--$('.pop').hide();--%>
        <%--window.location.reload();--%>
        <%--},--%>
        <%--error: function (err) {--%>
        <%--alert("数据刷新失败,请重新刷新");--%>
        <%--}--%>
        <%--});--%>
        <%--});--%>
//        //添加事件
//        $('.table_list_add').on("click",function(){
//            //先清空
//            $('.table_list_name').val('');
//            $('.table_list_industry').val('');
//            $('.table_list_source').val('');
//            $('.table_list_location').val('');
//            $('.table_list_serviceStatus').val('');
//            //展示
//            $('.listtable').show();
//        });
//        //增加弹窗的功能
//        $('.listtable_close,.listtable_cancel').on("click",function(){
//            $('.listtable').hide();
//        });
//        $('.listtable_confirm').on("click",function(){
//            $.ajax({
//                url:'http://10.10.1.183:8080/crm/enterprise',
//                type:'POST',
//                contentType: "application/json",
//                timeout : "3000",
//                cache:false,
//                data: JSON.stringify({
//                    "name":$('.table_list_name').val(),
//                    "industry":$('.table_list_industry').val(),
//                    "location":$('.table_list_location').val(),
//                    "source":$('.table_list_source').val(),
//                    "serviceStatus":$('.table_list_serviceStatus').val()
//                }),
//                dataType: "json",
//                success:function(str){
//                    //弹窗关闭
//                    $('.table_list').hide();
//                    window.location.reload();
//                    $('#table_id_last').click();
//                },
//                error:function(err){
//                    alert("数据刷新失败,请重新刷新");
//                }
//            });
//        });
        //控制这个表格大小
//            $('#table_id_wrapper').css({"width": "1400px", "margin": "20px auto"});

    });


    //==========================================end=================================================================
    //                columnDefs: [
    //                    {
    //                        targets: 14,
    //                        render: function (a, b, c, d) {
    //                            var context =
    //                                {
    //                                    func: [
    //                                        {
    //                                            "name": "修改", "fn": "edit(" +
    //                                        "\'" + c.accountName +
    //                                        "\',\'" + c.userId +
    //                                        "\',\'" + c.password +
    //                                        "\',\'" + c.realName +
    //                                        "\',\'" + c.roleId +
    //                                        "\',\'" + c.email +
    //                                        "\',\'" + c.mobilePhone +
    //                                        "\',\'" + c.qq +
    //                                        "\',\'" + c.postcode +
    //                                        "\',\'" + c.idcard +
    //                                        "\',\'" + c.creatTime +
    //                                        "\',\'" + c.postAdress +
    //                                        "\',\'" + c.headImage +
    //                                        "\',\'" + c.approved +
    //                                        "\',\'" + c.extn + "\')", "type": "primary"
    //                                        },
    //                                        {"name": "删除", "fn": "del(\'" + c.accountName + "\')", "type": "danger"}
    //                                    ]
    //                                };
    //                            var html = template(context);//匹配内容
    //                            return html;
    //                        }
    //                    }
    //
    //                ]


    //            });

    //时间格式化
    //    Date.prototype.Format = function (fmt) { //author: meizz
    //        var o = {
    //            "M+": this.getMonth() + 1,
    //            //月份
    //            "d+": this.getDate(),
    //            //日
    //            "h+": this.getHours(),
    //            //小时
    //            "m+": this.getMinutes(),
    //            //分
    //            "s+": this.getSeconds(),
    //            //秒
    //            "q+": Math.floor((this.getMonth() + 3) / 3),
    //            //季度
    //            "S": this.getMilliseconds() //毫秒
    //        };
    //        if (/(y+)/.test(fmt)) {
    //            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    //        }
    //        for (var k in o) {
    //            if (new RegExp("(" + k + ")").test(fmt)) {
    //                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    //            }
    //        }
    //        return fmt;
    //    };
    //    /**
    //     *编辑方法
    //     **/
    //    function edit(name, position, salary, office, extn) {
    //        console.log(name);
    //        editFlag = true;
    //        {
    //            "name"
    //        :
    //            "删除", "fn"
    //        :
    //            "del(\'" + c.accountName + "\')", "type"
    //        :
    //            "danger"
    //        }
    //        $("#myModalLabel").text("修改");
    //        $("#accountName").val(name).attr("disabled", true);
    //        $("#userId").val(position);
    //        $("#realName").val(salary);
    //        $("#email").val(office);
    //        $("#mobilePhone").val(extn);
    //        $("#qq").val(position);
    //        $("#postcode").val(salary);
    //        $("#idcard").val(office);
    //        $("#creatTime").val(extn);
    //        $("#headImage").val(position);
    //        $("#approved").val(salary);
    //        $("#myModal").modal("show");
    //    }

    //    function ajax(obj) {
    //        var url = "/add.jsp";
    //        if (editFlag) {
    //            url = "/edit.jsp";
    //        }
    //        $.ajax({
    //            url: url,
    //            data: {
    //                "name": obj.name,
    //                "position": obj.position,
    //                "salary": obj.salary,
    //                "office": obj.office,
    //                "extn": obj.extn
    //            }, success: function (data) {
    //                table.ajax.reload();
    //                $("#myModal").modal("hide");
    //                $("#myModalLabel").text("新增");
    //                clear();
    //                console.log("结果" + data);
    //            }
    //        });
    //    }


    /**
     * 删除数据
     * @param name
     */
    //    function del(name) {
    //        $.ajax({
    //            url: "/del.jsp",
    //            data: {
    //                "name": name
    //            }, success: function (data) {
    //                table.ajax.reload();
    //                console.log("删除成功" + data);
    //            }
    //        });
    //    }

</script>


</body>
</html>
