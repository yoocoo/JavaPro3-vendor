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
                        <h3>用户系统管理列表<%--<small> ---------</small>--%>
                        </h3>

                    </div>

                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>系统用户数据表格<br/>
                                    <small> 1.对新注册用户，信息审核，审核通过后，可登陆。
                                        2.冻结过期，可疑账户。
                                        <br/>
                                    </small>
                                </h2>
                                <p class="text-muted font-13 m-b-30">

                                <div class="fontawesome-icon-list ">
                                    <div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a
                                            href="<%=request.getContextPath()%>/mvc/userAction/sysuserResXi"><i
                                            class="fa fa-eye"></i>&nbsp;&nbsp;新增系统管理员</a>
                                    </div>
                                    <div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a
                                            href="<%=request.getContextPath()%>/mvc/userAction/sysuserResSheng"><i
                                            class="fa fa-user"></i> 新增一级生产商用户</a>
                                    </div>
                                </div>
                                </p>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>

                            <div class="x_content">
                                <%--<p class="text-muted font-13 m-b-30">--%>
                                <%--&lt;%&ndash;基于 by the Bootstrap CSS framework设计的静态表格 &ndash;%&gt;--%>
                                <%--</p>--%>
                                <div class="title_right">
                                    <div class="col-md-4 col-sm-4 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <input id="fname" name="factoryName" type="text" class="form-control"
                                                   placeholder="按生产商单位模糊匹配">
                                            <span class="input-group-btn "><button id="sButton"
                                                                                   class="btn btn-default  bg-primary"
                                                                                   type="button"
                                                                                   onclick="searchInfo();">开始</button>
                                            </span></div>
                                    </div>
                                </div>

                                <table id="datatable"
                                <%--id="table_id"--%>
                                       class="table table-striped table-bordered jambo_table bulk_action ">
                                    <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th style="width: 15%">单位名称</th>
                                        <%--进行条件筛查的时候，不给隐藏，显示生产商名称--%>
                                        <th class="text-left">账户</th>
                                        <th>密码</th>
                                        <th>真实姓名</th>
                                        <th class="text-center">角色</th>
                                        <%--<th>昵称</th>--%>
                                        <th class="text-left">邮箱</th>
                                        <%--<th>最近一次登录</th>--%>
                                        <%--<th>电话</th>--%>
                                        <th>手机</th>
                                        <th>QQ</th>
                                        <%--<th>邮编</th>--%>
                                        <th style="width: 15%" class="text-left">身份证</th>
                                        <%--<th>次数</th>--%>
                                        <th style="width: 15%">创建时间</th>
                                        <th style="width: 15%">地址</th>
                                        <%--<th>头像地址</th>--%>
                                        <th>状态</th>
                                        <th class="text-center">用户的权限操作</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th style="width: 15%">单位名称</th>
                                        <th class="text-left">账户</th>
                                        <th>密码</th>
                                        <th>真实姓名</th>
                                        <th class="text-center">角色</th>
                                        <%--<th>昵称</th>--%>
                                        <th class="text-left">邮箱</th>
                                        <%--<th>最近一次登录</th>--%>
                                        <%--<th>电话</th>--%>
                                        <th>手机</th>
                                        <th>QQ</th>
                                        <%--<th>邮编</th>--%>
                                        <th style="width: 15%" class="text-left">身份证</th>
                                        <%--<th>次数</th>--%>
                                        <th style="width: 15%">创建时间</th>
                                        <th style="width: 15%">地址</th>
                                        <%--<th>头像地址</th>--%>
                                        <th>状态</th>
                                        <th class="text-center">用户的权限操作</th>
                                    </tr>
                                    </tfoot>
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
        //DataTable
        var tables = $('#datatable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: '复制数据 <i class="glyphicon glyphicon-copy"> </i>',
                    className: 'btn bg-green',
                    key: {
                        key: 'c',
                        altKey: true
                    }
                }, {
                    extend: 'csv',
                    text: '下载CSV <i class="fa fa-cloud-download"> </i>',
                    className: 'btn bg-olive'
                }, {
                    extend: 'excel',
                    text: '下载Excel <i class="fa fa-cloud-download"> </i>',
                    className: 'btn bg-green'
                },
                {
                    extend: 'print',
                    text: '<i class="fa fa-table"> </i> 打印表格',
                    className: 'btn bg-olive'
                }],
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
            ordering: false,//是否允许用户排序
            paging: true,//是否分页
//            pagingType: "full_numbers",//首页，上一页、中间数字下一页、尾页四个按钮还有页数按钮
            pagingType: "simple_numbers",//上一页、中间数字下一页、四个按钮还有页数按钮
            processing: true,//是否显示处理状态
            scrollX: false,//允许水平滚动
//          scrollY: "200px",
//          scrollCollapse: true,
            searching: false,//是否开始本地搜索
//         'bStateSave': true,//配置好这个,刷新页面会让页面停留在之前的页码
            stateSave: true,//刷新时是否保存状态
            autoWidth: true,//自动计算宽度
//            retrieve:true,//检索已存在的Datatables实例(retrieve)
            destroy: true, //Cannot reinitialise DataTable,解决重新加载表格内容问题,销毁Datatables实例(destroy)
            deferRender: true,//延迟渲染,在数据量较大时，可以提高效率
            columns: [
                {data: "userId"},
                {data: "nickName"},//渲染时候，被隐藏了
                {data: "accountName"},
                {data: "password"},
                {data: "realName", "defaultContent": "<i>未初始化</i>"},
                {
                    data: "roleId",
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<span class="label label-danger">系统管理员</span>'
                        }
                        else if (data == 3) {
                            return '<span class="label label-info">运营商管理员</span>'
                        }
                        else if (data == 4) {
                            return '<span class="label label-info">运营商配货员</span>'
                        }
                        else if (data == 5) {
                            return '<span class="label label-info">运营商仓库员</span>'
                        }
                        else if (data == 6) {
                            return '<span class="label label-primary">生产商管理员</span>'
                        }
                        else if (data == 8) {
                            return '<span class="label label-success">出租商管理员</span>'
                        }
                        else if (data == 10) {
                            return '<span class="label label-default">贸易商管理员</span>'
                        }
                        else {
                            {
                                return '<span class="label label-danger">未设定</span>'
                            }
                        }
                    }
                },
                <%--{data: "nickName"},--%>
                {
                    data: "email",
                    "defaultContent": "<i>未初始化</i>"
                },
                <%--{data: "lastLoginTime"},--%>
                <%--{data: "fixPhone"},--%>
                {
                    data: "mobilePhone",
                    "defaultContent": "<i>未初始化</i>"
                },
                {
                    data: "qq",
                    "defaultContent": "<i>未初始化</i>"
                },
//                {data: "postcode"},
                {
                    data: "idcard",
                    "defaultContent": "<i>未初始化</i>"
                },
                <%--{data: "loginCount"},--%>
                {
                    data: "creatTime",
                    "render": function (data, type, full, meta) {
                        var dataStr = Date.parse(data);
                        return new Date(dataStr).Format("yyyy-MM-dd ");
                    }
                },
                {
                    data: "postAdress",
                    "defaultContent": "<i>未初始化</i>"
                },
//                {data: "headImage"},
                {
                    data: "approved",
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return ' <h4 class="green"><i class="fa fa-thumbs-up"></i></h4>'
                        } else if (data == 0) {
                            return ' <h4 class="red"><i class="fa fa-thumbs-down"></i></h4>'
                        }
                    }
                },
                {data: null}
            ],
            columnDefs: [
//                {
//                    "visible": false,
//                    "targets": 1//隐藏列
//                },
                {
                    "targets": 13,//编辑
                    "data": null,//下面这行，添加了编辑按钮和，删除按钮
                    "defaultContent": "<i>未初始化</i>",
                    "render": function (data, type, row) {
                        if (row.approved == 1) {
                            return ' <button id="editrow" class="btn btn-info btn-xs"  disabled type="button"><i class="fa fa-pencil"></i> 审核</button>' +
                                '<button id="delrow" class="btn btn-danger btn-xs" type="button"><i class="fa fa-trash-o"></i>冻结</button>';
                        } else if (row.approved == 0) {

                            return ' <button id="editrow" class="btn btn-info btn-xs" type="button"><i class="fa fa-pencil"></i> 审核</button>' +
                                '<button id="delrow" class="btn btn-danger btn-xs" disabled type="button"><i class="fa fa-trash-o"></i>冻结</button>';
                        }
                    }
                }
            ],
            "createdRow": function (row, data, dataIndex) {
                //每加载完一行的回调函数
                $('td', row).eq(10).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
                return row;
            }
        });
    });
    // // Apply the search
    //自定义搜索
    $('.dsearch').on('keyup click', function () {
        var tsval = $(".dsearch").val();
        tables.search(tsval, false, false).draw();
    });

    //        ============================日期格式化=======================================================================
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
    //    －－－－－－－－－－－//以下为自定义的删除按钮事件，可以忽略，也可以参考写法－－－－－－－－－－－－－－－－
    //================================冻结可疑账户==================================================
    $('#datatable tbody').on('click', 'button#delrow', function () {
        var oTable = $('#datatable').dataTable();
        var data = oTable.fnGetData($(this).parent().parent());
        var datastr = JSON.stringify(data);
        var dataObj = JSON.parse(datastr);
        console.log("====JsonObj中userid :" + dataObj.userId);
        //tables.ajax.reload();重新获取数据
        //tables.draw(false);重新刷新页面
        if (confirm("是否确认冻结该账户")) {
            var userid = dataObj.userId;
            if (userid == 1) {
                confirm("超级系统管理员 不可冻结，无效操作！")
            }
            else if (dataObj.approved == 0) {
                confirm("该用户已被冻结，无需重复操作！")
            }
            else {
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
        }
    });
    //        ===========================审核用户信息======================================
    $('#datatable tbody').on('click', 'button#editrow', function () {
        var oTable1 = $('#datatable').dataTable();
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
            if (dataObj1.approved == 1) {
                confirm("该用户已通过审核，无需重复操作！")
            }
            else {
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
                        alert("用户信息，通过审核");
                        window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)

                    }
                });
            }
        }
    });

    //===================================按生产商单位条件查询=======================================================
    function searchInfo() {
        var fname = $("#fname").val();
        $(document).ready(function () {
            //DataTable
            var tables = $('#datatable').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        text: '复制数据 <i class="glyphicon glyphicon-copy"> </i>',
                        className: 'btn bg-green',
                        key: {
                            key: 'c',
                            altKey: true
                        }
                    }, {
                        extend: 'csv',
                        text: '下载CSV <i class="fa fa-cloud-download"> </i>',
                        className: 'btn bg-olive'
                    }, {
                        extend: 'excel',
                        text: '下载Excel <i class="fa fa-cloud-download"> </i>',
                        className: 'btn bg-green'
                    },
                    {
                        extend: 'print',
                        text: '<i class="fa fa-table"> </i> 打印表格',
                        className: 'btn bg-olive'
                    }],
                ajax: {
                    url: "<%=request.getContextPath()%>/userAction/listShengUser",
                    type: "POST",
//dataSrc : "list",//这个参数是自己封装的json里面的key
                    data: {
                        factoryName: fname
//args1: "我是固定传参的值，在服务器接收参数[args1]"
                    }
                },
                serverSide: true,//开启服务器模式:启用服务器分页
                lengthChange: false,//是否允许用户改变表格每页显示的记录数
                ordering: false,//是否允许用户排序
                paging: true,//是否分页
//            pagingType: "full_numbers",//首页，上一页、中间数字下一页、尾页四个按钮还有页数按钮
                pagingType: "simple_numbers",//上一页、中间数字下一页、四个按钮还有页数按钮
                processing: true,//是否显示处理状态
                scrollX: false,//允许水平滚动
//          scrollY: "200px",
//          scrollCollapse: true,
                searching: false,//是否开始本地搜索
//         'bStateSave': true,//配置好这个,刷新页面会让页面停留在之前的页码
                stateSave: true,//刷新时是否保存状态
                autoWidth: true,//自动计算宽度
//            retrieve:true,//检索已存在的Datatables实例(retrieve)
                destroy: true, //Cannot reinitialise DataTable,解决重新加载表格内容问题,销毁Datatables实例(destroy)
                deferRender: true,//延迟渲染,在数据量较大时，可以提高效率
                columns: [
                    {data: "userId"},
                    {data: "factoryName"},//渲染时候，被隐藏了
                    {data: "accountName"},
                    {data: "password"},
                    {data: "realName", "defaultContent": "<i>未初始化</i>"},
                    {
                        data: "roleId",
                        "render": function (data, type, full, meta) {
                            if (data == 1) {
                                return '<span class="label label-danger">系统管理员</span>'
                            }
                            else if (data == 3) {
                                return '<span class="label label-info">运营商管理员</span>'
                            }
                            else if (data == 4) {
                                return '<span class="label label-info">运营商配货员</span>'
                            }
                            else if (data == 5) {
                                return '<span class="label label-info">运营商仓库员</span>'
                            }
                            else if (data == 6) {
                                return '<span class="label label-primary">生产商管理员</span>'
                            }
                            else if (data == 8) {
                                return '<span class="label label-success">出租商管理员</span>'
                            }
                            else if (data == 10) {
                                return '<span class="label label-default">贸易商管理员</span>'
                            }
                            else {
                                {
                                    return '<span class="label label-danger">未设定</span>'
                                }
                            }
                        }
                    },
                    <%--{data: "nickName"},--%>
                    {
                        data: "email",
                        "defaultContent": "<i>未初始化</i>"
                    },
                    <%--{data: "lastLoginTime"},--%>
                    <%--{data: "fixPhone"},--%>
                    {
                        data: "mobilePhone",
                        "defaultContent": "<i>未初始化</i>"
                    },
                    {
                        data: "qq",
                        "defaultContent": "<i>未初始化</i>"
                    },
//                {data: "postcode"},
                    {
                        data: "idcard",
                        "defaultContent": "<i>未初始化</i>"
                    },
                    <%--{data: "loginCount"},--%>
                    {
                        data: "creatTime",
                        "render": function (data, type, full, meta) {
                            var dataStr = Date.parse(data);
                            return new Date(dataStr).Format("yyyy-MM-dd ");
                        }
                    },
                    {
                        data: "postAdress",
                        "defaultContent": "<i>未初始化</i>"
                    },
//                {data: "headImage"},
                    {
                        data: "approved",
                        "render": function (data, type, full, meta) {
                            if (data == 1) {
                                return ' <h4 class="green"><i class="fa fa-thumbs-up"></i></h4>'
                            } else if (data == 0) {
                                return ' <h4 class="red"><i class="fa fa-thumbs-down"></i></h4>'
                            }
                        }
                    },
                    {data: null}
                ],
                columnDefs: [
                    {
                        "targets": 13,//编辑
                        "data": null,//下面这行，添加了编辑按钮和，删除按钮
                        "defaultContent": "<i>未初始化</i>",
                        "render": function (data, type, row) {
                            if (row.approved == 1) {
                                return ' <button id="editrow" class="btn btn-info btn-xs"  disabled type="button"><i class="fa fa-pencil"></i> 审核</button>' +
                                    '<button id="delrow" class="btn btn-danger btn-xs" type="button"><i class="fa fa-trash-o"></i>冻结</button>';
                            } else if (row.approved == 0) {

                                return ' <button id="editrow" class="btn btn-info btn-xs" type="button"><i class="fa fa-pencil"></i> 审核</button>' +
                                    '<button id="delrow" class="btn btn-danger btn-xs" disabled type="button"><i class="fa fa-trash-o"></i>冻结</button>';
                            }
                        }
                    }
                ],
                "createdRow": function (row, data, dataIndex) {
                    //每加载完一行的回调函数
                    $('td', row).eq(1).css("color", "green");//获取到具体行具体格的元素
                    return row;
                }
            });
        });


    }

</script>


</body>
</html>
