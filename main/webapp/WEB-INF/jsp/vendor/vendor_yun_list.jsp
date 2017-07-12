
<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/7/12
  Time: 18:55
   运营商管理员----售货机业务逻辑页面
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
    <title>运营商售货机列表</title>

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
    <!-- bootstrap-progressbar -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css'/>">
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
                        <h3>售货机管理列表<%--<small> ---------</small>--%>
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>运营商用户售货机数据表格<br/>
                                    <small> 1.对新注册售货机，信息审核，审核通过后，方可使用。
                                        2.冻结过期售货机，冻结损坏售货机使用。
                                        <br/>
                                    </small>
                                </h2>
                                <p class="text-muted font-13 m-b-30">

                                <div class="fontawesome-icon-list ">
                                    <%--<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a--%>
                                    <%--href="<%=request.getContextPath()%>/mvc/userAction/sysuserResXi"><i--%>
                                    <%--class="fa fa-eye"></i>&nbsp;&nbsp;新增系统管理员</a>--%>
                                    <%--</div>--%>
                                    <div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a
                                            href="<%=request.getContextPath()%>/mvc/vendorAction/shengRegVendor"><i
                                            class="fa fa-cc-amex"></i> 注册售货机</a>
                                    </div>
                                </div>
                                </p>
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
                                <input type="hidden" id="factoryid" name="factoryId"
                                       value="${userMess.agencyId}">
                                <table id="datatable-buttons"
                                       class="table table-striped table-bordered ">
                                    <thead>
                                    <tr>

                                        <th class="text-center">ID</th>
                                        <th class="text-left">售货机名称</th>
                                        <th class="text-left">销售次数</th>

                                        <th class="text-left">库存量</th>
                                        <th class="text-center">总金额</th>
                                        <th class="text-center">总纸币</th>

                                        <th class="text-center">总硬币</th>
                                        <th class="text-center">总非现金</th>
                                        <th class="text-left">总额外收入</th>

                                        <th class="text-left">电机状态</th>
                                        <th class="text-left">纸币器</th>
                                        <th class="text-left">硬币器</th>

                                        <th class="text-left">温度</th>
                                        <th>信号</th>
                                        <th class="text-left">最近销售</th>

                                        <th class="text-left">审核状态</th>
                                        <th class="text-left">生产商</th>
                                        <th class="text-left">运营商描述</th>
                                        <th class="text-center">售货机权限操作</th>
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
            <div class="pull-right"> ZJNU ---- ${userMess.agencyId}
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
<%--=====================================================================================--%>
<%--信号百分之图--%>
<!-- bootstrap-progressbar -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js'/>"></script>
<%--=================================================================================--%>
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
    var agencyid = ${userMess.agencyId};
    console.log("打印筛选的参数运营商id" + agencyid);
    $(document).ready(function () {
        var tables = $('#datatable-buttons').DataTable({
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
                url: "<%=request.getContextPath()%>/vendorAction/listAllYVendor",
                type: "POST",
//dataSrc : "list",//这个参数是自己封装的json里面的key
                data: {
                    agencyId: agencyid
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
            searching: true,//是否开始本地搜索
//         'bStateSave': true,//配置好这个,刷新页面会让页面停留在之前的页码
            stateSave: true,//刷新时是否保存状态
//          autoWidth: true,//自动计算宽度
//            retrieve:true,//检索已存在的Datatables实例(retrieve)
            destroy: true, //Cannot reinitialise DataTable,解决重新加载表格内容问题,销毁Datatables实例(destroy)
            //deferRender : true,//延迟渲染
            columns: [
                {data: "vendorId"},
                {data: "vendorName"},
                {data: "totalSaled"},

                {data: "currentSaled"},
                {data: "totalMoney"},
                {data: "totalBill"},

                {data: "totalCoin"},
                {data: "totalCashless"},
                {data: "totalExtraIncome"},

                {data: "boardTemperature"},
                {data: "mdbbillAlarmCode"},
                {data: "mdbchangerAlarmCode"},

                {data: "temperature"},
                {data: "gprsLevel"},
                {data: "lastSaleTime"},

                {data: "checked"},
                {data: "factoryId"},
                {data: "agencyName"},
                {data: null}

            ],
            columnDefs: [{
                "targets": 18,//编辑
                "data": null,//下面这行，添加了编辑按钮和，删除按钮
                "defaultContent": "<button id='editrow' class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i> 审核</button>" +
                "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>冻结</button>"
            }],
            "createdRow": function (row, data, dataIndex) {
                //每加载完一行的回调函数
                $('td', row).eq(17).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
                $('td', row).eq(1).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
//                data[0].replace(/[\$,]/g, '') * 1 <=50
                if(data[13]<=50){
                    console.log("=========信号强度============"+ data[13]);
                    $('td', row).eq(13).css('font-weight', "bold").css("color", "red");//获取到具体行具体格的元素
                }
                // $('td', data).eq(13).css('data-transitiongoal',"");
                // $('td', row).eq(13).css('class', "col-md-2 progress-bar progress-bar-success ").css("data-transitiongoal", $('td', data).eq(13));//获取到具体行具体格的元素
//                class=" col-md-2 progress progress-bar progress-bar-success"
                return row;
            }
        });
//    －－－－－－－－－－－//以下为自定义的删除按钮事件，可以忽略，也可以参考写法－－－－－－－－－－－－－－－－
//================================冻结可疑账户==================================================
        $('#datatable-buttons tbody').on('click', 'button#delrow', function () {
            var oTable = $('#datatable-buttons').dataTable();
            var data = oTable.fnGetData($(this).parent().parent());
            var datastr = JSON.stringify(data);
            var dataObj = JSON.parse(datastr);
            console.log("====JsonObj中vendorId :" + dataObj.vendorId);
            //tables.ajax.reload();重新获取数据
            //tables.draw(false);重新刷新页面
            if (confirm("是否确认冻结该售货机")) {
                var vendorid = dataObj.vendorId;
                if (dataObj.checked == 0) {
                    confirm("该售货机已被冻结，无需重复操作！")
                }
                else {
                    console.log("====  确认选择 冻结售货机的vendorid===:" + vendorid);
                    $.ajax({
                        type: "POST",  //http请求方式为POST
                        url: '<%=request.getContextPath()%>/vendorAction/listSVendorRemove',
//                type:'delete',
//                type : 'json',
                        dataType: 'json',//返回值类型 一般设置为json
//                    timeout: "3000",
                        cache: "false",
                        data: {vendorId: vendorid},
                        success: function (data) {
                            if (data.code == 1) {
                                alert(data.msg);
                                window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                            } else {
                                alert(data.msg);
                                $("#vendor").focus();
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
        $('#datatable-buttons tbody').on('click', 'button#editrow', function () {
            var oTable1 = $('#datatable-buttons').dataTable();
            var data1 = oTable1.fnGetData($(this).parent().parent());
            var datastr1 = JSON.stringify(data1);
            var dataObj1 = JSON.parse(datastr1);
            console.log("====JsonObj中vendorid :" + dataObj1.vendorId);
//            var data = tables.rows($(this).parents("tr")).data();
//            alert("=========" +tables.rows('.selected').data().length +' row(s) selected' );
            //tables.ajax.reload();重新获取数据
            //tables.draw(false);重新刷新页面
            if (confirm("是否确认通过该售货机信息")) {
                var vendorid = dataObj1.vendorId;
                console.log("====  确认选择 冻结该售货机的vendorid===:" + vendorid);
                if (dataObj1.checked == 1) {
                    confirm("该售货机已通过审核，无需重复操作！")
                }
                else {
                    $.ajax({
                        type: "POST",  //http请求方式为POST
                        url: '<%=request.getContextPath()%>/vendorAction/listSVendorPass',
//                type:'delete',
//                type : 'json',
                        dataType: 'json',//返回值类型 一般设置为json
//                    timeout: "3000",
                        cache: "false",
                        data: {vendorId: vendorid},
                        success: function (data) {
                            if (data.code == 1) {
                                alert(data.msg);
                                window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                            } else {
                                alert(data.msg);
                                $("#vendor").focus();
                            }
                        },
                        error: function (err) {
                            alert("售货机信息，通过审核");
                            window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)

                        }
                    });
                }
            }
        });
    });
</script>
</body>
</html>
