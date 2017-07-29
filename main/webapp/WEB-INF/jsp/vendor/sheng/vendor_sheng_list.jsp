<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/7/10
  Time: 18:55
  售货机业务逻辑页面
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
    <title>生产商售货机列表</title>

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
    <%--<link type="text/css" rel="stylesheet"--%>
    <%--href="<c:url value='/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css'/>">--%>
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
                                <h2>生产商用户售货机数据表格<br/>
                                    <small> 1.对新注册售货机，信息审核，审核通过后，方可使用。
                                        2.冻结过期售货机，冻结损坏售货机使用。
                                        <br/>
                                    </small>
                                </h2>
                                <p class="text-muted font-13 m-b-30">

                                <div class="fontawesome-icon-list ">
                                    <div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a
                                            href="<%=request.getContextPath()%>/mvc/vendorAction/shengRegVendor"><i
                                            class="fa fa-cc-amex"></i> 注册售货机</a>
                                    </div>
                                </div>
                                </p>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <input type="hidden" id="factoryid" name="factoryId"
                                       value="${userMess.factoryId}">
                                <table id="listS"
                                       class="table table-striped table-bordered projects ">
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

            <%--===============================--%>
            <%--查看售货机资料  start====--%>
            <!-- Large modal -->
            <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button>--%>

            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel1">售货机信息卡</h4>
                        </div>
                        <div class="modal-body">
                            <h4>详情</h4>

                            <div class="x_content">
                                <br/>
                                <form class="form-horizontal form-label-left input_mask">
                                    <input type="hidden" name="vendorId" id="vendorid" value="">//售货机编辑条件
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">售货机名称</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="vname" name="vendorName"
                                                   disabled="disabled" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">机器型号</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="mNumber" name="modelNumber" value=""
                                                   class="form-control" disabled="disabled" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">审核管理员 </label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="checkuser" name="checkUser" value=""
                                                   class="form-control" disabled="disabled" placeholder=" ">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">软件版本</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="sversion" name="softVersion" value=""
                                                   class="form-control" disabled="disabled" placeholder=" ">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">硬件版本</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="hversion" name="hardwareVersion" value=""
                                                   class="form-control" disabled="disabled" placeholder=" ">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">服务停止时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" name="expireDate"
                                                   placeholder="" id="odate" name="expireDate"
                                            <%--value=""--%>
                                                   class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">第三方支付KEY</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="key" name="thirdpayKey" value=""
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">运营商详情</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="aname" name="agencyName" value=""
                                                   class="form-control" placeholder="">
                                        </div>
                                    </div>


                                    <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-md-3 col-sm-3 col-xs-12"></label>--%>
                                    <%--<div class="col-md-9 col-sm-9 col-xs-12">--%>
                                    <%--<input type="text" class="form-control" placeholder="Default Input">--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-md-3 col-sm-3 col-xs-12">Disabled Input </label>--%>
                                    <%--<div class="col-md-9 col-sm-9 col-xs-12">--%>
                                    <%--<input type="text" class="form-control" disabled="disabled" placeholder="Disabled Input">--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                    <%--<label class="control-label col-md-3 col-sm-3 col-xs-12">Read-Only Input</label>--%>
                                    <%--<div class="col-md-9 col-sm-9 col-xs-12">--%>
                                    <%--<input type="text" class="form-control" readonly="readonly" placeholder="Read-Only Input">--%>
                                    <%--</div>--%>
                                    <%--</div>--%>

                                    <div class="ln_solid"></div>


                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary">提交</button>
                        </div>

                    </div>
                </div>
            </div>
            <%--modal end--%>

            <%--=======    查看售货机资料  end   --%>
            <!-- footer content -->
            <footer>
                <div class="pull-right"> ZJNU ---- ${userMess.factoryId}
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

    <!-- Custom Theme Scripts -->
    <script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

    <script type="text/javascript">
        var fantoryid = ${userMess.factoryId};
        console.log("打印筛选的参数 生产商id" + fantoryid);
        $(document).ready(function () {
            var tables = $('#listS').DataTable({
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
                    url: "<%=request.getContextPath()%>/vendorAction/listAllSVendor",
                    type: "POST",
//dataSrc : "list",//这个参数是自己封装的json里面的key
                    data: {
                        factoryId: fantoryid
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
                //deferRender : true,//延迟渲染 ,当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
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
                        "defaultContent": "<button id='editrow'  class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i> 授权</button>" +
                        "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>待去掉</button>" +
                        "<button id='editinfo' class='btn btn-danger btn-xs' data-toggle='modal' data-target='.bs-example-modal-lg'  type='button'><i class='fa fa-pencil-square-o'></i>编辑</button>"
                    }],
                "createdRow": function (row, data, dataIndex) {
                    //每加载完一行的回调函数
//                $('td', row).eq(17).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
//                    $('td', row).eq(19).css("color", "green");//获取到具体行具体格的元素
                    $('td', row).eq(1).css("color", "green");//获取到具体行具体格的元素
                    return row;
                }
            });
//            ============编辑弹窗======================================================
            $('#listS tbody').on('click', 'button#editinfo', function () {

                //获取数据
                var data = tables.row($(this).parents('tr')).data();
                console.log("获取data 纯对象" + JSON.stringify(data));
                console.log("获取data 字符串数组" + data);

                var data1 = tables.row($(this).parents('tr')).data();
                var data3 = data1.vendorName;
                console.log("获取data3 字符串？" + data3);
                var data2 = JSON.stringify(data1.vendorName);
                console.log("获取data2 字符串？" + data2);



                var vendorid = $('#vendorid').val(data.vendorId);//取对象
                var vname = $('#vname').val(data.vendorName);
                var mNumber = $('#mNumber').val(data.modelNumber);

                var checkuser = $('#checkuser').val(data.checkUser);
                var sversion = $('#sversion').val(data.softVersion);
                var hversion = $('#hversion').val(data.hardwareVersion);

                var key = $('#key').val(data.thirdpayKey);
                var aname = $('#aname').val(data.agencyName);
//                var odate1 = $('#odate').val(data.expireDate);
//                var odate2 = Date.parse(odate1);
//                var odate=Date(odate2).Format("yyyy-MM-dd hh:mm:ss");


            });
            //========================================对数据中表格进行日期格式化=============================
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
            //  =================以下为自定义的删除按钮事件，可以忽略，也可以参考写法===========================
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
                                    alert("测试获取数据");

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

            //            ==============================测试获得一行数据 start=====================================
            $('#listS tbody').on('click', 'tr', function () {

                var oTable2 = $('#listS').DataTable();
                console.log("测试一正行数据：" + oTable2.row(this).data());
                var sss = oTable2.row(this).data().vendorName;

                console.log("测试一行数据：" + oTable2.row(this).data().vendorName);
                console.log("测试一行数据sssss：" + ssss);
            });
            //            =============================测试获得一行数据  end======================================

            //        ===========================审核用户信息======================================
            $('#listS tbody').on('click', 'button#editrow', function () {
                var oTable1 = $('#listS').dataTable();
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
        })
        ;


    </script>
    // =========================时间编辑==================================================================

    <script type="text/javascript">
        $(function () {
            $('input[name="expireDate"]').daterangepicker({
                    singleDatePicker: true,
                    showDropdowns: true,
                    format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间
//                format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 不带时间日期
                    locale: {
//                    format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间

                        format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 全格式时间
                        daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                            '七月', '八月', '九月', '十月', '十一月', '十二月']
                    }
                },
                function (start, end, label) {
                    var odate = start.format('YYYY-MM-DD HH:mm:ss');
                    document.getElementById('odate').value = odate;
                });
        });
    </script>
</body>
</html>
