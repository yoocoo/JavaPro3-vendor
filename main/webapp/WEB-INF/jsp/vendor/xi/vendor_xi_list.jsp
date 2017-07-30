<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/7/11
  Time: 22:08
  一更时间：2017年07 月28 日
    售货机业务逻辑页面----系统管理员 (审核售货机功能)
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
    <title>系统管理员售货机管理列表</title>

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
    <!-- Switchery -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/switchery/dist/switchery.min.css'/>">
    <!-- bootstrap-progressbar -->
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
    <!-- bootstrap-daterangepicker -->
    <link rel="stylesheet" href="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.css'/>">
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">
    <%--引入CSS 样式 end --%>
    <script type="text/javascript">

        //        function fresh() {
        //            if(document.getElementById('ced').val() ==1){
        //                $('input:checkbox').eq(1).attr("checked",'true');
        ////                var checkedOfAll=$("#ced").attr("checked");
        ////                alert(checkedOfAll);
        ////                $("input[name='checked']").attr("checked", checkedOfAll);
        ////                alert("value:"+document.getElementById('ced').val());
        ////                document.getElementById('ced').checked = true;
        //            }else {
        //                $('input:checkbox').eq(1).attr("checked",'false');
        ////                document.getElementById('ced').checked = false;
        //
        //            }
        //
        //        }

    </script>
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
                                <h2>系统用户售货机数据表格<br/>
                                    <small> 1.对新注册售货机，信息审核，审核通过后，方可使用。
                                        2.冻结过期售货机，冻结损坏售货机使用。
                                        3.系统管理员无特殊情况，不用使用该功能
                                        <br/>
                                    </small>
                                </h2>
                                <p class="text-muted font-13 m-b-30">
                                </p>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <table id="listS"
                                       class="table table-striped table-bordered ">
                                    <thead>
                                    <tr>

                                        <th class="text-center">ID</th>
                                        <th class="text-left">售货机名称</th>
                                        <th class="text-left">通信状态</th>

                                        <th class="text-left">总销售次数</th>
                                        <th class="text-left">最大货道数</th>


                                        <th class="text-left">库存数量</th>
                                        <th class="text-left">总金额</th>
                                        <th class="text-left">总纸币</th>

                                        <th class="text-left">总硬币</th>
                                        <th class="text-left">总非现金</th>
                                        <th class="text-left">总额外收入</th>

                                        <th class="text-left">库存状态</th>
                                        <th class="text-left">马达状态</th>
                                        <th class="text-left">纸币器</th>
                                        <th class="text-left">硬币器</th>

                                        <th class="text-left">温度</th>
                                        <th>信号</th>
                                        <th class="text-left">最近一次销售</th>

                                        <th class="text-left">审核状态</th>
                                        <%--<th class="text-left">生产商</th>--%>
                                        <%--<th class="text-left">运营商详情</th>--%>
                                        <th class="text-left">权限操作</th>
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


        <%--===============================--%>
        <%--查看售货机资料  start====--%>
        <!-- Large modal -->
        <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large--%>
            <%--modal   按钮触发--%>
        <%--</button>--%>

        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">售货机信息卡</h4>
                    </div>
                    <div class="modal-body">
                        <h4><span class="bg-green">售货机详情-----系统管理员角色</span></h4>
                        <div class="x_content">
                            <br/>
                            <%--======================表单================--%>
                            <form class="form-horizontal ">
                                <div class="col-md-6 col-sm-11 col-xs-11">
                                    <div class="x_panel">

                                        <div class="x_title">
                                            <h2>售货机基本信息
                                                <small>-----</small>
                                            </h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="x_content">
                                            <input type="hidden" id="cuser" name="checkUser"
                                                   value="${userMess.accountName}">
                                            <div class="form-group-horizontal">
                                                <div class="col-sm-11">
                                                    <input type="hidden" name="vendorId" id="vendorid"
                                                           class="form-control" value=''>
                                                    <div class="input-group">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn btn-primary">售货机名称</button></span>
                                                        <input type="text" id="vname" name="vendorName"
                                                               class="form-control" value=''>
                                                    </div>
                                                    <div class="input-group"><span class="input-group-btn">
                                              <button type="button" class="btn btn-primary">软件版本号</button></span>
                                                        <input name="softVersion" id="sversion" value='' type="text"
                                                               class="form-control">
                                                    </div>
                                                    <div class="input-group"><span class="input-group-btn"><button
                                                            type="button" class="btn btn-primary">硬件版本号</button></span>
                                                        <input type="text" name="hardwareVersion" id="hversion"
                                                               disabled="disabled" value='' class="form-control">
                                                    </div>
                                                    <div class="input-group"><span class="input-group-btn"><button
                                                            type="button" class="btn btn-primary">出厂 日期</button></span>
                                                        <input name="dateOfProduct" id="dateproduct" disabled="disabled"
                                                               value='' type="text" class="form-control">
                                                    </div>
                                                    <div class="input-group"><span class="input-group-btn"><button
                                                            type="button" class="btn btn-primary">无线 支付</button></span>
                                                        <input type="checkbox" id="payable" name="wirelessPayEnabled" checked
                                                               class="js-switch" value="" />
                                                    </div>
                                                    <div class="input-group"><span class="input-group-btn"><button
                                                            type="button" class="btn btn-primary">机器 型号</button></span>
                                                        <input type="text" id="mNumber" name="modelNumber"
                                                               disabled="disabled" value='' class="form-control">
                                                    </div>
                                                    <div class="input-group"><span class="input-group-btn">
                                              <button type="button" class="btn btn-primary">第三方 id</button></span>
                                                        <input type="text" id="payid" name="thirdpayId"
                                                               disabled="disabled" value='' class="form-control">
                                                    </div>
                                                    <div class="input-group"><span class="input-group-btn"><button
                                                            type="button" class="btn btn-primary">第三方key</button></span>
                                                        <input type="text" id="paykey" name="thirdpayKey"
                                                               disabled="disabled" value='' class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="divider-dashed"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-11 col-xs-11">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>售货机权限信息
                                                <small>----</small>
                                            </h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <div class="form-group-horizontal">
                                                <div class="col-sm-11">
                                                    <div class="input-group "><span class="input-group-btn"><button
                                                            type="button" class="btn btn-danger"> 审 核 员</button></span>
                                                        <input type="text" id="checkuser" name="checkUser" value=""
                                                               disabled="disabled" class="form-control">
                                                    </div>
                                                    <div class="input-group "><span class="input-group-btn"><button
                                                            type="button" class="btn btn-danger">停服时间</button></span>
                                                        <input type="text" name="expireDate" placeholder="" id="odate"
                                                               value="" name="expireDate" class="form-control">
                                                    </div>
                                                    <div class="input-group "><span class="input-group-btn">
                                                    <button type="button" class="btn btn-danger">审核状态</button></span>
                                                    <input type="checkbox" id="ced" name="checked" value="" checked  class="js-switch">
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="divider-dashed"></div>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%--=====================表单 end==================--%>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <%--<button type="button" class="btn btn-primary">审核</button>--%>
                    </div>

                </div>
            </div>
        </div>

        <%--modal end--%>

        <%--=======    查看售货机资料  end   --%>

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
<%--=====================================================================================--%>
<%--信号百分之图--%>
<!-- bootstrap-progressbar -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js'/>"></script>
<%--=================================================================================--%>
<!-- iCheck -->
<script type="text/javascript" src="<c:url value='/static/vendors/iCheck/icheck.min.js'/>"></script>
<!-- bootstrap-daterangepicker -->
<script type="text/javascript" src="<c:url value='/static/vendors/moment/min/moment.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.js'/>"></script>
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
<!-- Switchery -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/switchery/dist/switchery.min.js'/>"></script>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

<script type="text/javascript">


    $(document).ready(function () {
        var tables = $('#listS').DataTable({
            dom: 'Bfrtip',//来显示TableTools按钮
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
                url: "<%=request.getContextPath()%>/vendorAction/listAllXVendor",
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
            searching: true,//是否开始本地搜索
//         'bStateSave': true,//配置好这个,刷新页面会让页面停留在之前的页码
            stateSave: true,//刷新时是否保存状态
//          autoWidth: true,//自动计算宽度
//            retrieve:true,//检索已存在的Datatables实例(retrieve)
            destroy: true, //Cannot reinitialise DataTable,解决重新加载表格内容问题,销毁Datatables实例(destroy)
            //deferRender : true,//延迟渲染
            columns: [
                {data: "vendorId"},//售货机ID  -0
                {data: "vendorName"},//售货机名称-1
                {
                    data: "actived",//是否在线（通信状态）-2
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<h4 class="green"><i class="fa fa-power-off"></i></h4>'
//                            return '<i class="fa fa-smile-o bg-green"></i>'
                        } else {
                            return '<h4 class="red"><i class="fa fa-power-off"></i></h4>'
//                            return '<i class="fa fa-frown-o bg-red"></i>'
                        }
                    }
                },

                {data: "totalSaled"},//总出货次数(总销售次数)-3
                {
                    data: "maxChannelNum",
                    "render": function (data, type, full, mata) {
                        return '<span class="label label-info">' + data + '</span>'
                    }
                },//售货机最大货道-4

                {data: "sum", "defaultContent": "<i>待初始化</i>"},//库存数量（其实是：库存量 字段：sum(stockNumber)）-5
                {data: "totalMoney"},//总金额-6
                {data: "totalBill"},//总纸币-7

                {data: "totalCoin"},//总硬币-8
                {data: "totalCashless"},//总非现金-9
                {data: "totalExtraIncome"},//总额外收入-10

                {data: "countNum"},//库存状态 -11
                {data: "countStatus"},//马达状态（其实是：马达状态motorstatus ==0/总motorstatus）-12
                {
                    data: "mdbbillAlarmCode",//纸币器状态-13
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<h4 class="green"><i class="fa fa-check-circle"></i></h4>'
                        } else {
                            return '<h4 class="red"><i class="fa fa-exclamation-circle"></i></h4>'
                        }
                    }
                },
                {
                    data: "mdbchangerAlarmCode",//硬币器状态-14
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<h4 class="green"><i class="fa fa-check-circle"></i></h4>'
                        } else {
                            return '<h4 class="red"><i class="fa fa-exclamation-circle"></i></h4>'
                        }
                    }
                },

                {
                    data: "temperature",//售货机温度-15
                    "render": function (data, type, full, meta) {
                        if (data < 0) {
                            return '<span class="label label-primary">' + data + ' ℃</span>'
                        } else {
                            return '<span class="label label-danger">' + data + ' ℃</span>'

                        }
                    }
                },
                {
                    data: "gprsLevel",//信号强度-16
                    class: "project_progress",
//                    width: "200px",
                    "render": function (data, type, full, meta) {
                        return '<div class="progress progress_sm ">' +
                            '<div class="progress-bar bg-green"' +
                            ' role="progressbar" ' + 'style="width: ' + data + '%;"' +
                            'data-transitiongoal=' + '"' + data +
                            '"></div> </div> <small>' + data + '% </small>'
                    }
                },
                {
                    data: "lastSaleTime"//最近一次出货时间-17
                    ,
                    "render": function (data, type, full, meta) {
                        var dataStr = Date.parse(data);
                        return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },

                {
                    data: "checked",//是否通过审核-18
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<span class="badge badge-danger bg-green">通过</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                        } else {
                            return '<span class="badge badge-success bg-red">停用</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                        }

                    }
                },
//                {data: "factoryId"},//负责生产商ID-19
//                {data: "agencyId", width: "80px", "defaultContent": "<i>还没有设置</i>"},//归属运营商ID-20
                {data: null}//操作-19

            ],
            columnDefs: [
                {
                    "render": function (data, type, row) {
//                        return data + ' /' + row[4].data ;//jquery
                        return data + ' /' + row.maxChannelNum;//api
                    },
                    "targets": 12
                },
                {
                    "render": function (data, type, row) {
//                    return data + ' /' + row[4].data ;//jquery
                        return data + ' /' + row.maxChannelNum;//api
                    },
                    "targets": 11
                },
//                {
//                    "visible": false,
//                    "targets": 4 //售货机最大货道数
//                },
                {
                    "targets": 19,//权限操作
                    "data": null,//下面这行，添加了编辑按钮和，删除按钮
                    "defaultContent": "<button id='editrow' class='btn btn-info btn-xs bg-green' type='button'><i class='fa fa-pencil'></i> 审核</button>" +
                    "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>冻结</button>" +
                    "<button id='editinfo' class='btn btn-danger btn-xs' data-toggle='modal' data-target='.bs-example-modal-lg'  type='button'><i class='fa fa-pencil-square-o'></i>查看</button>"

                }],
            "createdRow": function (row, data, dataIndex) {
                //每加载完一行的回调函数
//                $('td', row).eq(20).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
                $('td', row).eq(1).css("color", "green");//获取到具体行具体格的元素
                return row;
            }
        });
        //=====7.29使用接口版本=======编辑弹窗======================================================
        $('#listS tbody').on('click', 'button#editinfo', function () {

            //获取数据
            var data = tables.row($(this).parents('tr')).data();

            var vendorid = $('#vendorid').val(data.vendorId);
            var vname = $('#vname').val(data.vendorName).attr({disabled: true, style: "color:green"});

            var sversion = $('#sversion').val(data.softVersion).attr("disabled", true);
            var hversion = $('#hversion').val(data.hardwareVersion);

            var dateproduct = $('#dateproduct').val(data.dateOfProduct);
//            var payable = $('#payable').val(data.wirelessPayEnabled);

//            var mNumber = $('#mNumber').val(data.modelNumber);
            var payid = $('#payid').val(data.thirdpayId);
            var paykey = $('#paykey').val(data.thirdpayKey);

//            ===============权限信息============================================================
            var checkuser = $('#checkuser').val(data.checkUser);
            var odate = $('#odate').val(data.expireDate);
//            var ced =$('#ced').val(data.checked);

//            =================测试========================
            var cpay = data.wirelessPayEnabled;
            var cced = data.checked;
            console.log("cpay的值 数字:" + cpay);
            console.log("cced的值 数字:" + cced);
            var cNumber = data.modelNumber;

            var vid = data.vendorId;
            if (cpay == 1) {
                if($('#payable').val(data.wirelessPayEnabled)[0].checked){
                  //不做任何事情
                }else{
                    $('#payable').val(data.wirelessPayEnabled).trigger('click').attr('checked',"checked") ;
                }
            } else if(cpay == 0) {//关掉开关
                if($('#payable').val(data.wirelessPayEnabled)[0].checked){
                    $('#payable').val(data.wirelessPayEnabled).trigger('click').attr('checked',"checked") ;
                }else{
                    //不做任何事情
                }
            }
            if (cced == 1) {
                if($('#ced').val(data.checked)[0].checked){
            //不做任何事情
        }else {$('#ced').val(data.checked).trigger('click').attr('checked',"checked") ;
                }

            } else if(cced == 0){//关闭开关
                if($('#ced').val(data.checked)[0].checked){
                    $('#ced').val(data.checked).trigger('click').attr('checked',"checked") ;
                }else{
                    //不做任何事情
                }
            }
            var mNumber = $('#mNumber').val(cNumber);


        });
//        ============================日期格式化=======================================================================
        Date.prototype.Format = function (fmt) { //author: meizz


//            document.getElementById('dd').value = cpay;
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
        $('#listS tbody').on('click', 'button#delrow', function () {
            var oTable = $('#listS').dataTable();
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

        $('#listS tbody').on('click', 'button#editrow', function () {
            var cuser = $("#cuser").val();
            console.log("user:"+cuser);
            var oTable1 = $('#listS').dataTable();//返回jquery
            var data1 = oTable1.fnGetData($(this).parent().parent());
            var datastr1 = JSON.stringify(data1);
            var dataObj1 = JSON.parse(datastr1);
            console.log("====JsonObj中userid :" + dataObj1.vendorId);
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
                        data: {vendorId: vendorid, checkUser: cuser},
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


