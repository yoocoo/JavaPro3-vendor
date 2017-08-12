<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/7/24
  Time: 14:19
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
    <title>售货机未确认故障统计</title>
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
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">
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
                            <small>未故障清单</small>
                        </h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>未确认故障清单业务
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
                                                <i class="fa fa-globe"></i> 故障清单
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
                                        <%--<div class="col-sm-4 invoice-col">--%>
                                        <%--<address>--%>
                                        <%--<strong>售货机详情：</strong>--%>


                                        <%--<select id="vendorname" name="vendorName"--%>
                                        <%--class="col-sm-4 form-control js-example-basic-single"--%>
                                        <%--style="background: #fff; font-size:12px;--%>
                                        <%--margin-left:5px;cursor: pointer;--%>
                                        <%--padding: 5px 10px; border: 1px solid #ccc"--%>
                                        <%--tabindex="-1"> <i class="fa fa-empire"></i>--%>
                                        <%--<c:if test="${userMess.roleId ==6||userMess.roleId ==8||userMess.roleId ==10 }">--%>

                                        <%--<c:forEach items="${sVnameList}" var="slist">--%>
                                        <%--<option value="${slist.vendorName}">${slist.vendorName} </option>--%>
                                        <%--</c:forEach>--%>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${userMess.roleId ==3||userMess.roleId ==4||userMess.roleId ==5}">--%>
                                        <%--<c:forEach items="${yVnameList}" var="ylist">--%>
                                        <%--<option value="${ylist.vendorName}">${ylist.vendorName} </option>--%>
                                        <%--</c:forEach>--%>
                                        <%--</c:if>--%>
                                        <%--</select>--%>

                                        <%--&lt;%&ndash;<br>工作时间：一个时间段&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<br>投放地址：婺城区&ndash;%&gt;--%>
                                        <%--</address>--%>
                                        <%--</div>--%>
                                        <!-- /.col -->
                                        <%--<div class="col-sm-4 invoice-col">--%>
                                        <%--<b>统计时间:</b> <br>--%>
                                        <%--<div id="reportrange" value="" type="text" class="pull-left"--%>
                                        <%--name="reportrange"--%>
                                        <%--style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">--%>
                                        <%--<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>--%>
                                        <%--<span></span>--%>
                                        <%--<b class="caret"></b>--%>
                                        <%--<input type="hidden" name="startTime" class="from" id="beginTime"--%>
                                        <%--value="">--%>
                                        <%--<input type="hidden" name="endTime" class="to" id="endTime" value="">--%>
                                        <%--</div>--%>
                                        <%--<br>--%>
                                        <%--</div>--%>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->

                                    <!-- Table row -->
                                    <div class="row">
                                        <div class="col-xs-12 table">
                                            <input type="hidden" id="ackuser" name="ackUser"
                                                   value="${userMess.accountName}">
                                            <table id="list" class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th>故障编号</th>
                                                    <th style="width: 15%">报警时间</th>
                                                    <th style="width: 10%">售货机名称</th>

                                                    <th style="width: 40%">故障详情描述</th>
                                                    <th class="text-center">售货机权限操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
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
                                                用来实现货币支付或资金流转的行为。发挥电子支付方便快捷等特点。
                                            </p>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-xs-6">
                                            <p class="lead" id="logInfo1"> 查询时间 :</p>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tbody>
                                                    <tr>
                                                        <th style="width:50%">啊啊啊:</th>
                                                        <td>￥00.00</td>

                                                    </tr>
                                                    <tr>
                                                        <th>时间段故障次数：</th>
                                                        <td>￥00.00</td>
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
                                            <%--<button class="btn btn-primary pull-right" style="margin-right: 5px;"--%>
                                            <%--onclick="webNameCount();"--%>
                                            <%--><i class="fa fa-download"></i> 刷新查询--%>
                                            <%--</button>--%>
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
<!-- PNotify -->
<script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.js'/>"></script>
<script  type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.buttons.js'/>"></script>
<script  type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.nonblock.js'/>"></script>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>


<script type="text/javascript">
    var fantoryid = ${userMess.factoryId};
    console.log("id："+fantoryid);
    var alarmTablename = "alarm_" + fantoryid;
    console.log("name："+alarmTablename);
    $(document).ready(function () {
        $('.ui-pnotify').remove();
        var tables = $('#list').DataTable({
            ajax: {
                url: "<%=request.getContextPath()%>/alarmAction/NoAlarmName",
                type: "POST",
                //dataSrc : "list",//这个参数是自己封装的json里面的key
                data: {
                    alarmTableName: alarmTablename,
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
                {data: "alarmId"},
                {
                    data: "occurTime",
                    "render": function (data, type, full, meta) {
                        var dataStr = Date.parse(data);
                        return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {data: "vendorName"},
                {data: "description"},
                {data: null}
            ],
            columnDefs: [{
                "targets": 4,//编辑
                "data": null,//下面这行，添加了编辑按钮和，删除按钮
                "defaultContent": "<button id='editrow' class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i>确认</button>" +
                "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>待定</button>"
            }],
            "createdRow": function (row, data, dataIndex) {//行回调
//每加载完一行的回调函数
                $('td', row).eq(3).css("color", "red");//获取到具体行具体格的元素
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
        //================================确认 故障==================================================
        $('#list tbody').on('click', 'button#editrow', function () {
            var oTable = $('#list').dataTable();
            var data = oTable.fnGetData($(this).parent().parent());
            var datastr = JSON.stringify(data);
            var dataObj = JSON.parse(datastr);
            //tables.ajax.reload();重新获取数据
            //tables.draw(false);重新刷新页面

            if (confirm("是否确认该故障？")) {
                var alarmid = dataObj.alarmId;
                var ackuser =$("#ackuser").val();

                console.log("确认人员"+ackuser);
                $.ajax({
                    type: "POST",  //http请求方式为POST
                    url: '<%=request.getContextPath()%>/alarmAction/ackedAlarmName',
                    dataType: 'json',//返回值类型 一般设置为json
                    cache: "false",
                    data: {
                        alarmTableName: alarmTablename,
                        ackUser: ackuser,
                        alarmId: alarmid
                    },
                    success: function (data) {
                        if (data.code == 1) {
                            alert(data.msg);
                            window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                        } else {
                            alert(data.msg);
                            $("#alarm").focus();
                        }
                    },
                    error: function (err) {
                        alert("确认成功??");
                        window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)

                    }
                });
            }
        });

    });
</script>
</body>
</html>