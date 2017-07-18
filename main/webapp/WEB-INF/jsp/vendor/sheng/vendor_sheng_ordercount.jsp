<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/7/14
  Time: 9:50
  说明：生产商售货机订单统计
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
    <title>生产商售货机订单统计</title>

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
                        <h3>售货机订单管理列表<%--<small> ---------</small>--%>
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
                                <h2>生产商用户售货机订单表统计报表<br/>
                                    <small> 1.按日期查询。
                                        2.按指定售货机查询。
                                        <br/>
                                    </small>
                                </h2>
                                <p class="text-muted font-13 m-b-30">

                                <div class="fontawesome-icon-list ">
                                    <div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a
                                            href="<%=request.getContextPath()%>/***"><i
                                            class="fa fa-cc-amex"></i> 未知神奇功能</a>
                                    </div>
                                </div>
                                </p>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="row x_title">
                                <div class="col-md-10 pull-right">
                                    <div id="reportrange" value="" type="text" class="pull-left" name="reportrange"
                                         style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                        <span></span>
                                        <b class="caret"></b>
                                        <input type="hidden" name="startTime" class="from" id="beginTime" value="">
                                        <input type="hidden" name="endTime" class="to" id="endTime" value="">
                                    </div>

                                <%--<a href="javascript:"; onclick="begin_end_time_clear();">清除</a>--%>
                                <%--</div>--%>

                                    <select id="vendorname" name="vendorName"
                                            <%--class="select2_single form-control"--%>
                                         style="background: #fff; font-size:13px; margin-left:5px;cursor: pointer; padding: 5px 10px; border: 1px solid #ccc"
                                            tabindex="-1"> <i class="fa fa-empire"></i>
                                        <c:forEach items="${sVnameList}" var="slist">
                                            <option value="${slist.vendorName}">${slist.vendorName} </option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit" id="count" class="btn-sm btn-success" onclick="webNameCount();">
                                        搜索
                                    </button>
                                    </div>
                            </div>
                            <div class="x_content">
                                <input type="hidden" id="factoryid" name="factoryId"
                                       value="${userMess.factoryId}">
                                <table id="list"
                                       class="table table-striped table-bordered projects ">
                                    <thead>
                                    <tr>

                                        <th class="text-center">创建时间</th>
                                        <th class="text-left">订单号</th>
                                        <th class="text-left">售货机名称</th>
                                        <th class="text-left">货道</th>

                                        <th class="text-center">支付时间</th>
                                        <th class="text-center">规定金额</th>
                                        <th class="text-center">支付金额</th>
                                        <th class="text-center">支付渠道</th>

                                        <th class="text-center">支付状态</th>
                                        <th class="text-left">优惠额度</th>
                                        <th class="text-center">操作</th>

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
    <!-- bootstrap-daterangepicker -->
    <script type="text/javascript" src="<c:url value='/static/vendors/moment/min/moment.min.js'/>"></script>
    <%--<script type="text/javascript" src="<c:url value='/static/vendors/bootstrap-daterangepicker/bootstrap-datepicker.zh-CN.js'/>"></script>--%>
    <script type="text/javascript"
            src="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.js'/>"></script>
    <!-- Custom Theme Scripts -->
    <script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>
    <script type="text/javascript">

    </script>
    <script type="text/javascript">
        var fantoryid = ${userMess.factoryId};
        var orderTablename = "order_" + fantoryid;
        console.log("打印 查询条件 ---生产商的订单表 " + orderTablename);
        $(document).ready(function () {
            var tables = $('#list').DataTable({
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
                    url: "<%=request.getContextPath()%>/orderAction/shengOrder",
                    type: "POST",
//dataSrc : "list",//这个参数是自己封装的json里面的key
                    data: {
                        orderTableName: orderTablename,
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
                bStateSave: true,//配置好这个,刷新页面会让页面停留在之前的页码
                stateSave: true,//刷新时是否保存状态
//          autoWidth: true,//自动计算宽度
//            retrieve:true,//检索已存在的Datatables实例(retrieve)
                destroy: true, //Cannot reinitialise DataTable,解决重新加载表格内容问题,销毁Datatables实例(destroy)
                deferRender: true,//延迟渲染 ,当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
                columns: [
                    {
                        data: "createTime",
                        "render": function (data, type, full, meta) {
                            var dataStr = Date.parse(data);
                            return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                        }
                    },
                    {data: "orderId"},
                    {data: "vendorName"},
                    {
                        data: "channel",
                        "render": function (data, type, full, meta) {
                            return '<span class="badge badge-success">#' + data + '</span>'
                        }
                    },

                    {
                        data: "paidTime",
                        "render": function (data, type, full, meta) {
                            var dataStr = Date.parse(data);
//                            2001-01-01 00:00:00
                            var newDate =new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                            if(newDate == '2001-01-01 00:00:00'){
                                return'<span class="badge badge-success">无效时间</span>';
                            }else {
                                return newDate;
                            }
                        }
                    },
                    {data: "price"},
                    {data: "paidMoney"},
                    {
                        data: "paidSource",
                        "render": function (data, type, full, meta) {
                            if (data == 1) {
                                return '<span class="badge badge-danger">现金</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                            } else if (data = 2) {
                                return '<span class="badge badge-success">电子支付</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                            } else {
                                return '<span class="badge badge-success">无效</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                            }
                        }
                    },

                    {
                        data: "status",
                        "render": function (data, type, full, meta) {
                            if (data == 1) {
                                return '<span class="badge badge-danger">支付成功</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                            } else if (data == 0) {
                                return '<span class="badge badge-success">支付失败</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                            } else {
                                return '<span class="badge badge-success">未知状态</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                            }
                        }
                    },
                    {
                        data: "discount",
                        "render": function (data, type, full, meta) {
                            if (data == 0) {
                                return '<span class="label label-info">无优惠</span>'
                            }
                        }
                    },
                    {data: null}

                ],
                columnDefs: [{
                    "targets": 10,//编辑
                    "data": null,//下面这行，添加了编辑按钮和，删除按钮
                    "defaultContent": "<button id='editrow' class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i>查看</button>" +
                    "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>待定</button>"
                }],
                "createdRow": function (row, data, dataIndex) {
                    //每加载完一行的回调函数
                    $('td', row).eq(5).css("color", "green");//获取到具体行具体格的元素
                    $('td', row).eq(6).css("color", "red");//获取到具体行具体格的元素
                    return row;
                }
            });
//========================================日期格式化=============================
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
        });
        $(document).ready(function () {
            //时间插件
            $('#reportrange span').html(moment().subtract('hours', 1).format('YYYY-MM-DD HH:mm:ss') + ' - ' + moment().format('YYYY-MM-DD HH:mm:ss'));
//            $('#reportrange span').html(moment().subtract('hours', 1).format('YYYY-MM-DD ') + ' - ' + moment().format('YYYY-MM-DD '));
            $('#reportrange').daterangepicker(
                {
                    // startDate: moment().startOf('day'),
                    //endDate: moment(),
                    //minDate: '01/01/2012',  //最小时间
                    maxDate: moment(), //最大时间
                    dateLimit: {
                        days: 30
                    }, //起止时间的最大间隔
                    showDropdowns: true,//原代码中的showDropdowns必须为true，否则会默认为当天日期
                    showWeekNumbers: false, //是否显示第几周
//                    timePicker : true, //是否显示小时和分钟
                    timePicker: false, //是否显示小时和分钟
                    timePickerIncrement: 60, //时间的增量，单位为分钟
                    timePicker12Hour: false, //是否使用12小时制来显示时间
                    ranges: {
                        //'最近1小时': [moment().subtract('hours',1), moment()],
                        '今日': [moment().startOf('day'), moment()],
                        '昨日': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
                        '最近7日': [moment().subtract('days', 6), moment()],
                        '最近30日': [moment().subtract('days', 29), moment()]
                    },
                    opens: 'left', //日期选择框的弹出位置
                    buttonClasses: ['btn btn-default'],
                    applyClass: 'btn-small btn-primary blue',
                    cancelClass: 'btn-small',
                    format : 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间
//                    format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 不带时间日期
                    separator: ' to ',
                    locale: {
                        applyLabel: '确定',
                        cancelLabel: '取消',
                        fromLabel: '起始时间',
                        toLabel: '结束时间',
                        customRangeLabel: '自定义',
                        daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                            '七月', '八月', '九月', '十月', '十一月', '十二月'],
                        firstDay: 1
                    }
                },
                function(start, end, label) {//格式化日期显示框,就是给你选中的值 填进去表单里去
                    $('#reportrange span').html(start.format('YYYY-MM-DD HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD HH:mm:ss'));
                    console.log("您 选 择 的 时 间 为: "+ start.format('YYYY-MM-DD HH:mm:ss') + ' to ' + end.format('YYYY-MM-DD HH:mm:ss') + ' (predefined range: ' + label + ')');
                    var startTime = start.format('YYYY-MM-DD HH:mm:ss');
                    var endTime = end.format('YYYY-MM-DD HH:mm:ss');
                    console.log("自定义时间选择器startTime"+startTime);
                    console.log("自定义时间选择器endTime"+ endTime);

//
                    document.getElementById('beginTime').value=startTime;
                    document.getElementById('endTime').value=endTime;
                    console.log("时间选择器中赋值的开始时间"+document.getElementById('beginTime').value);
                    console.log("时间选择器中赋值的开始时间"+ document.getElementById('endTime').value);
                    alert("您选择的时间是为"+ start.format('YYYY-MM-DD HH:mm:ss') + "~" + end.format('YYYY-MM-DD HH:mm:ss') + ' (时间选择类型: ' + label + ')');
                });
            //设置日期菜单被选项 --开始--
            var dateOption;
            if ("${riqi}" == 'day') {
                dateOption = "今日";
            } else if ("${riqi}" == 'yday') {
                dateOption = "昨日";
            } else if ("${riqi}" == 'week') {
                dateOption = "最近7日";
            } else if ("${riqi}" == 'month') {
                dateOption = "最近30日";
            } else if ("${riqi}" == 'year') {
                dateOption = "最近一年";
            } else {
                dateOption = "自定义";
            }
            $(".daterangepicker").find("li").each(function () {
                if ($(this).hasClass("active")) {
                    $(this).removeClass("active");
                }
                if (dateOption == $(this).html()) {
                    $(this).addClass("active");
                }
            });
        });

        function webNameCount() {
            //获取得到要查询  生产商家的 订单表名 传到后台 进行筛查
            var vendorname = $(":selected", "#vendorname").val();
            var fantoryid = ${userMess.factoryId};
            var orderTablename = "order_" + fantoryid;
            var starttime=  document.getElementById('beginTime').value;
            var endtime = document.getElementById('endTime').value;
//            var starttime= $('#beginTime').val(start.format('YYYY-MM-DD'));
//            var endtime =$('#endTime').val(end.format('YYYY-MM-DD'));
//            var starttime =  '2017-02-11 00:00:00'; //测试时间
//            var endtime ='2017-02-11 23:00:00';//测试时间

            alert("能否传递 选中的开始时间："+starttime);
            alert("能否传递 选中的开始时间："+endtime);
            console.log("打印 查询条件 ---生产商的订单表 " + orderTablename);

            $(document).ready(function () {
                var tables = $('#list').DataTable({
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
                        url: "<%=request.getContextPath()%>/orderAction/shengOrderName",
                        type: "POST",
//dataSrc : "list",//这个参数是自己封装的json里面的key
                        data: {
                            orderTableName: orderTablename,
                            vendorName: vendorname,
                            creatTime:starttime,
                            endTime:endtime
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
                    bStateSave: true,//配置好这个,刷新页面会让页面停留在之前的页码
                    stateSave: true,//刷新时是否保存状态
//          autoWidth: true,//自动计算宽度
//            retrieve:true,//检索已存在的Datatables实例(retrieve)
                    destroy: true, //Cannot reinitialise DataTable,解决重新加载表格内容问题,销毁Datatables实例(destroy)
                    deferRender: true,//延迟渲染 ,当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
                    columns: [
                        {
                            data: "createTime",
                            "render": function (data, type, full, meta) {
                                var dataStr = Date.parse(data);
                                return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                            }
                        },
                        {data: "orderId"},
                        {data: "vendorName"},
                        {
                            data: "channel",
                            "render": function (data, type, full, meta) {
                                return '<span class="badge badge-success">#' + data + '</span>'
                            }
                        },

                        {
                            data: "paidTime",
                            "render": function (data, type, full, meta) {
                                var dataStr = Date.parse(data);
//                            2001-01-01 00:00:00
                                var newDate =new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                                if(newDate == '2001-01-01 00:00:00'){
                                    return'<span class="badge badge-success">无效时间</span>';
                                }else {
                                    return newDate;
                                }
                            }
//
//                            "render": function (data, type, full, meta) {
//                                var dataStr = Date.parse(data);
//                                return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
//                            }
                        },
                        {data: "price"},
                        {data: "paidMoney"},
                        {
                            data: "paidSource",
                            "render": function (data, type, full, meta) {
                                if (data == 1) {
                                    return '<span class="badge badge-danger">现金</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                                } else if (data = 2) {
                                    return '<span class="badge badge-success">电子支付</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                                } else {
                                    return '<span class="badge badge-success">无效</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                                }
                            }
                        },

                        {
                            data: "status",
                            "render": function (data, type, full, meta) {
                                if (data == 1) {
                                    return '<span class="badge badge-danger">支付成功</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                                } else if (data == 0) {
                                    return '<span class="badge badge-success">支付失败</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                                } else {
                                    return '<span class="badge badge-success">未知状态</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                                }
                            }
                        },
                        {
                            data: "discount",
                            "render": function (data, type, full, meta) {
                                if (data == 0) {
                                    return '<span class="label label-info">无优惠</span>'
                                }
                            }
                        },
                        {data: null}

                    ],
                    columnDefs: [{
                        "targets": 10,//编辑
                        "data": null,//下面这行，添加了编辑按钮和，删除按钮
                        "defaultContent": "<button id='editrow' class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i>查看</button>" +
                        "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>待定</button>"
                    }],
                    "createdRow": function (row, data, dataIndex) {//行回调
                        //每加载完一行的回调函数
                        $('td', row).eq(5).css("color", "green");//获取到具体行具体格的元素
                        $('td', row).eq(6).css("color", "red");//获取到具体行具体格的元素
                        return row;
                    }
                });
            });
        }

    </script>




</body>
</html>