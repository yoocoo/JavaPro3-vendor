<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/7/18
  Time: 9:49
  说明： 生产商 销售业务统计
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
    <title>生产商售货机销售统计</title>

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
    <!-- Select2 -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/select2/dist/css/select2.min.css'/>">
    <!-- bootstrap-progressbar -->
    <%--<link type="text/css" rel="stylesheet"--%>
    <%--href="<c:url value='/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css'/>">--%>
    <!-- Datatables -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css'/>">
    <%--<link type="text/css" rel="stylesheet"--%>
    <%--href="<c:url value='/static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css'/>">--%>
    <%--<link type="text/css" rel="stylesheet"--%>
    <%--href="<c:url value='/static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css'/>">--%>
    <%--<link type="text/css" rel="stylesheet"--%>
    <%--href="<c:url value='/static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css'/>">--%>
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css'/>">
    <!-- bootstrap-daterangepicker -->
    <link rel="stylesheet" href="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.css'/>">
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">
    <%--引入CSS 样式 end --%>
    <script type="text/javascript">
        function getCurDate() {
            var d = new Date();
            var week;
            switch (d.getDay()) {
                case 1:
                    week = "星期一";
                    break;
                case 2:
                    week = "星期二";
                    break;
                case 3:
                    week = "星期三";
                    break;
                case 4:
                    week = "星期四";
                    break;
                case 5:
                    week = "星期五";
                    break;
                case 6:
                    week = "星期六";
                    break;
                default:
                    week = "星期天";
            }
            var years = d.getFullYear();
            var month = add_zero(d.getMonth() + 1);
            var days = add_zero(d.getDate());
//            var hours = add_zero(d.getHours());
//            var minutes = add_zero(d.getMinutes());
//            var seconds=add_zero(d.getSeconds());
//            var ndate = years+"年"+month+"月"+days+"日 "+hours+":"+minutes+":"+seconds+" "+week;
            var ndate = years + "/" + month + "/" + days + " " + week;
            var divT = document.getElementById("logInfo");
            divT.innerHTML = ndate;
            var ndate1 = years + "-" + month + "-" + days;
            var divT1 = document.getElementById("logInfo1");
            divT1.innerHTML = ndate1;

        }
        function add_zero(temp) {
            if (temp < 10) return "0" + temp;
            else return temp;
        }
        setInterval("getCurDate()", 100);
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
                        <h3>
                            <small>销售清单</small>
                        </h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <%--<div class="input-group">--%>
                            <%--<input type="text" class="form-control" placeholder="请搜索">--%>
                            <%--<span class="input-group-btn">--%>
                            <%--<button class="btn btn-default" type="button">开始</button>--%>
                            <%--</span>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>销售清单业务
                                    <small>1.统计 2.打印</small>
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <section class="content invoice">
                                    <!-- title row -->
                                    <div class="row">
                                        <div class="col-xs-12 invoice-header">
                                            <h1>
                                                <i class="fa fa-globe"></i> 销售单
                                                <small id="logInfo" class="pull-right">
                                                </small>
                                            </h1>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- info row -->
                                    <div class="row invoice-info">
                                        <%--<div class="col-sm-4 invoice-col">--%>
                                        <%--系统信息：--%>
                                        <%--<address>--%>
                                        <%--<strong>用户名：</strong>--%>
                                        <%--<br>用户角色：--%>
                                        <%--<br>用户：--%>
                                        <%--<br>用户：--%>
                                        <%--<br>用户：--%>
                                        <%--</address>--%>
                                        <%--</div>--%>
                                        <!-- /.col -->
                                        <div class="col-sm-4 invoice-col">
                                            <address>
                                                <strong>售货机详情：</strong>



                                                    <select id="vendorname" name="vendorName"
                                                            class="col-sm-4 form-control js-example-basic-single"
                                                            style="background: #fff; font-size:12px;
                                                        margin-left:5px;cursor: pointer;
                                                         padding: 5px 10px; border: 1px solid #ccc"
                                                            tabindex="-1"> <i class="fa fa-empire"></i>
                                                        <%--==============8.2号 生产商售货机列表====================--%>
                                                        <c:if test="${userMess.roleId ==6||userMess.roleId ==8||userMess.roleId ==10 }">
                                                            <c:forEach items="${agencyNameList}" var="alist">
                                                                <optgroup label="${alist.agencyName}">
                                                                    <c:forEach items="${sVnameList}" var="slist">
                                                                        <c:if test="${slist.agencyName == alist.agencyName}">
                                                                            <option value="${slist.vendorName}">${slist.vendorName} </option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </optgroup>
                                                            </c:forEach>
                                                        </c:if>
                                                        <%--==================================--%>
                                                        <%--<c:if test="${userMess.roleId ==6||userMess.roleId ==8||userMess.roleId ==10 }">--%>
                                                        <%--<c:forEach items="${sVnameList}" var="slist">--%>
                                                            <%--<option value="${slist.vendorName}">${slist.vendorName} </option>--%>
                                                        <%--</c:forEach>--%>
                                                        <%--</c:if>--%>

                                                        <c:if test="${userMess.roleId ==3||userMess.roleId ==4||userMess.roleId ==5}">
                                                            <c:forEach items="${yVnameList}" var="ylist">
                                                            <option value="${ylist.vendorName}">${ylist.vendorName} </option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </select>

                                                <%--<br>工作时间：一个时间段--%>
                                                <%--<br>投放地址：婺城区--%>
                                            </address>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 invoice-col">
                                            <b>统计时间:</b> <br>
                                            <div id="reportrange" value="" type="text" class="pull-left"
                                                 name="reportrange"
                                                 style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                                                <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                <span></span>
                                                <b class="caret"></b>
                                                <input type="hidden" name="startTime" class="from" id="beginTime"
                                                       value="">
                                                <input type="hidden" name="endTime" class="to" id="endTime" value="">
                                            </div>
                                            <br>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <!-- Table row -->
                                    <div class="row">
                                        <div class="col-xs-12 table">
                                            <table id="list" class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th style="width: 20%">售货机名称</th>
                                                    <th>销售单号</th>
                                                    <th>货道#</th>

                                                    <th>商品编码</th>
                                                    <th>商品详情</th>
                                                    <th>价格</th>

                                                    <th>数量</th>
                                                    <th style="width: 15%">销售时间</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <td>0</td>
                                                <td>0</td>
                                                <td>0</td>

                                                <td>0</td>
                                                <td>0</td>
                                                <td>0</td>

                                                <td>0</td>
                                                <td>0</td>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <div class="row">
                                        <!-- accepted payments column -->
                                        <div class="col-xs-6">
                                            <p class="lead">支付途径:</p>
                                            <img src="/ssm_vendor/static/images/pay0.png" alt="银联">
                                            <img src="/ssm_vendor/static/images/pay2.png" alt="微信支付">
                                            <img src="/ssm_vendor/static/images/pay1.png" alt="支付宝">
                                            <img src="/ssm_vendor/static/images/pay4.png" alt="苹果支付">

                                            <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                                                电子支付是指消费者、商家和金融机构之间使用
                                                安全电子手段把支付信息通过信息网络安全地传送到银行或相应的处理机构，
                                                用来实现货币支付或资金流转的行为。从分发挥电子支付方便快捷等特点。
                                            </p>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-xs-6">
                                            <p class="lead" id="logInfo1"> 查询时间 :</p>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tbody>
                                                    <tr>
                                                        <th style="width:50%">本机总销售数量:</th>
                                                        <td>${allSum}
                                                            <%--2. <% Integer allSum=(Integer)request.getAttribute("allSum"); %>****--%>
                                                            <%--&: <%=allSum%> --%>
                                                            <%--& :out.print(allSum);--%>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <th>本机总收入金额：</th>
                                                        <td>${allMoney}</td>

                                                    </tr>
                                                    <tr>
                                                        <th>时间段内销售数量:</th>
                                                        <td>${timeSum}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>时间段内收入金额:</th>
                                                        <td>${timeMoney}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <!-- this row will not appear when printing -->
                                    <div class="row no-print">
                                        <div class="col-xs-12">
                                            <%--<button class="btn btn-default" onclick="window.print();"><i class="fa fa-print"></i> 打印/下载清单</button>--%>
                                            <button class="btn btn-success pull-right" onclick="window.print();"><i
                                                    class="fa fa-print"></i> 打印/下载清单
                                            </button>
                                            <button class="btn btn-primary pull-right" style="margin-right: 5px;"
                                                    onclick="webNameCount();"
                                            ><i class="fa fa-download"></i> 刷新查询
                                            </button>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

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

<!-- Datatables -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js'/>"></script>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-buttons/js/dataTables.buttons.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-buttons/js/buttons.flash.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-buttons/js/buttons.html5.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-buttons/js/buttons.print.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-responsive/js/dataTables.responsive.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-scroller/js/dataTables.scroller.min.js'/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value='/static/vendors/jszip/dist/jszip.min.js'/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/pdfmake.min.js'/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/vfs_fonts.js'/>"></script>--%>
<!-- bootstrap-daterangepicker -->
<script type="text/javascript" src="<c:url value='/static/vendors/moment/min/moment.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.js'/>"></script>
<!-- Select2 -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/select2/dist/js/select2.min.js'/>"></script>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>
<%--===============select2 模糊匹配=======--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".js-example-basic-single").select2();
    });
</script>


<script type="text/javascript">
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
                format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间
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
            function (start, end, label) {//格式化日期显示框,就是给你选中的值 填进去表单里去
                $('#reportrange span').html(start.format('YYYY-MM-DD HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD HH:mm:ss'));
                console.log("您 选 择 的 时 间 为: " + start.format('YYYY-MM-DD HH:mm:ss') + ' to ' + end.format('YYYY-MM-DD HH:mm:ss') + ' (predefined range: ' + label + ')');
                var startTime = start.format('YYYY-MM-DD HH:mm:ss');
                var endTime = end.format('YYYY-MM-DD HH:mm:ss');
                console.log("自定义时间选择器startTime" + startTime);
                console.log("自定义时间选择器endTime" + endTime);

//
                document.getElementById('beginTime').value = startTime;
                document.getElementById('endTime').value = endTime;
                console.log("时间选择器中赋值的开始时间" + document.getElementById('beginTime').value);
                console.log("时间选择器中赋值的开始时间" + document.getElementById('endTime').value);
                alert("您选择的时间是为" + start.format('YYYY-MM-DD HH:mm:ss') + "~" + end.format('YYYY-MM-DD HH:mm:ss') + ' (时间选择类型: ' + label + ')');
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
        var saleTablename = "sale_" + fantoryid;
        var starttime = document.getElementById('beginTime').value;
        var endtime = document.getElementById('endTime').value;
        console.log("打印 查询条件 ---生产商的订单表 " + saleTablename);
        var int = self.setInterval("refresh()", 300000);
        if (starttime == '' || endtime == '') {
            confirm("请选择具体时间，加快查询效率");
        } else {
            $(document).ready(function () {
                var tables = $('#list').DataTable({
                    ajax: {
                        url: "<%=request.getContextPath()%>/saleAction/shengSaleName",
                        type: "POST",
//dataSrc : "list",//这个参数是自己封装的json里面的key
                        data: {
                            saleTableName: saleTablename,
                            vendorName: vendorname,
                            creatTime: starttime,
                            endTime: endtime
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
                        {data: "vendorName"},
                        {data: "saleId"},
                        {
                            data: "channelId",
                            "render": function (data, type, full, meta) {
                                return '<span class="badge badge-success">#' + data + '</span>'
                            }
                        },

                        {
                            data: "goodsCode",
                            "render": function (data, type, full, meta) {
                                if (data == null) {
                                    return '<span class="badge badge-danger">失效了</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                                } else {
                                    return data; //这里是主题  把url变成超链接、把图片路径显示为图片
                                }
                            }
                        },
                        {data: "goodsName"},
                        {
                            data: "price",
                            "render": function (data, type, full, meta) {
                                return '<i class="fa fa-jpy"></i>' + data; //这里是主题  把url变成超链接、把图片路径显示为图片
                            }
                        },

                        {
                            data: "number",
//                    "render": function (data, type, full, meta) {
//                        if (data >= 100) {
//                            return '<span class="badge badge-danger">现金</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
//                        }  else {
//                            return '<span class="badge badge-success">无效</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
//                        }
//                    }
                        },
                        {
                            data: "time",
                            "render": function (data, type, full, meta) {
                                var dataStr = Date.parse(data);
                                return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                            }
                        }


                    ],
//                columnDefs: [{
//                    "targets": 10,//编辑
//                    "data": null,//下面这行，添加了编辑按钮和，删除按钮
//                    "defaultContent": "<button id='editrow' class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i>查看</button>" +
//                    "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>待定</button>"
//                }],
                    "createdRow": function (row, data, dataIndex) {//行回调
//每加载完一行的回调函数
                        $('td', row).eq(0).css("color", "green");//获取到具体行具体格的元素
                        $('td', row).eq(4).css("color", "red");//获取到具体行具体格的元素
                        return row;
                    }
                });
            });
        }
    }
</script>
</body>
</html>