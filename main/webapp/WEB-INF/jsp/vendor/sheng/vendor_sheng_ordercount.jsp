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
                                    <%--<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a--%>
                                    <%--href="<%=request.getContextPath()%>/mvc/userAction/sysuserResXi"><i--%>
                                    <%--class="fa fa-eye"></i>&nbsp;&nbsp;新增系统管理员</a>--%>
                                    <%--</div>--%>
                                    <div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a
                                            href="<%=request.getContextPath()%>/"><i
                                            class="fa fa-cc-amex"></i> 未知功能</a>
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
                                       value="${userMess.factoryId}">
                                <table id="list"
                                       class="table table-striped table-bordered projects ">
                                    <thead>
                                    <tr>

                                        <th class="text-center">创建时间</th>
                                        <th class="text-left">订单号</th>
                                        <%--<th class="text-left">售货机名称</th>--%>
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

    <!-- Custom Theme Scripts -->
    <script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

    <script type="text/javascript">
        //获取得到要查询  生产商家的 订单表名 传到后台 进行筛查

        var fantoryid = ${userMess.factoryId};
        var orderTablename ="order_"+fantoryid;
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
                        orderTableName: orderTablename
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
                deferRender : true,//延迟渲染 ,当处理大数据时，延迟渲染数据，有效提高Datatables处理能力
                columns: [
                    {data: "creatTime",
                        "render": function (data, type, full, meta) {
                            var dataStr = Date.parse(data);
                            return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                        }
                    },
                    {data: "orderId"},
                    {data: "channel",
                        "render": function (data, type, full, meta) {
                            return '<span class="badge badge-success">#' + data + '</span>'
                        }
                    },

                    {data: "paidTime",
                        "render": function (data, type, full, meta) {
                            var dataStr = Date.parse(data);
                            return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                        }
                    },
                    {data: "price"},
                    {data: "paidMoney"},
                    {data: "paidSource",
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

                    {data: "status",
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
                    {data: "discount",
                        "render": function (data, type, full, meta) {
                            if (data == 0) {
                                return '<span class="label label-info">无优惠</span>'
                            }
                        }
                    },
                    {data: null}

                ],
                columnDefs: [{
                    "targets": 9,//编辑
                    "data": null,//下面这行，添加了编辑按钮和，删除按钮
                    "defaultContent": "<button id='editrow' class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i>查看</button>" +
                    "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>待定</button>"
                }],
                "createdRow": function (row, data, dataIndex) {
                    //每加载完一行的回调函数
                    $('td', row).eq(4).css("color", "green");//获取到具体行具体格的元素
                    $('td', row).eq(5).css("color", "red");//获取到具体行具体格的元素
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
        //  =================以下为自定义的删除按钮事件，可以忽略，也可以参考写法===========================
        //================================冻结可疑账户==================================================
        //            $('#listS tbody').on('click', 'button#delrow', function () {
        //                var oTable = $('#listS').dataTable();
        //                var data = oTable.fnGetData($(this).parent().parent());
        //                var datastr = JSON.stringify(data);
        //                var dataObj = JSON.parse(datastr);
        //                console.log("====JsonObj中vendorId :" + dataObj.vendorId);
        //tables.ajax.reload();重新获取数据
        //tables.draw(false);重新刷新页面
        //                if (confirm("是否确认冻结该售货机")) {
        //                    var vendorid = dataObj.vendorId;
        //                    if (dataObj.checked == 0) {
        //                        confirm("该售货机已被冻结，无需重复操作！")
        //                    }
        //                    else {
        //                        console.log("====  确认选择 冻结售货机的vendorid===:" + vendorid);
        //                        $.ajax({
        //                            type: "POST",  //http请求方式为POST
        <%--url: '<%=request.getContextPath()%>/vendorAction/listSVendorRemove',--%>
        //                type:'delete',
        //                type : 'json',
        //                            dataType: 'json',//返回值类型 一般设置为json
        //                    timeout: "3000",
        //                            cache: "false",
        //                            data: {vendorId: vendorid},
        //                            success: function (data) {
        //                                if (data.code == 1) {
        //                                    alert(data.msg);
        //                                    window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
        //                                } else {
        //                                    alert(data.msg);
        //                                    $("#vendor").focus();
        //                                }
        //                            },
        //                            error: function (err) {
        //                                alert("冻结成功");
        //                                window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
        //
        //                            }
        //                        });
        //                    }
        //                }
        //            });
        //        ===========================审核用户信息======================================
        //            $('#listS tbody').on('click', 'button#editrow', function () {
        //                var oTable1 = $('#listS').dataTable();
        //                var data1 = oTable1.fnGetData($(this).parent().parent());
        //                var datastr1 = JSON.stringify(data1);
        //                var dataObj1 = JSON.parse(datastr1);
        //                console.log("====JsonObj中userid :" + dataObj1.vendorId);
        //            var data = tables.rows($(this).parents("tr")).data();
        //            alert("=========" +tables.rows('.selected').data().length +' row(s) selected' );
        //tables.ajax.reload();重新获取数据
        //tables.draw(false);重新刷新页面
        <%--if (confirm("是否确认通过该售货机信息")) {--%>
        <%--var vendorid = dataObj1.vendorId;--%>
        <%--console.log("====  确认选择 冻结该售货机的vendorid===:" + vendorid);--%>
        <%--if (dataObj1.checked == 1) {--%>
        <%--confirm("该售货机已通过审核，无需重复操作！")--%>
        <%--}--%>
        <%--else {--%>
        <%--$.ajax({--%>
        <%--type: "POST",  //http请求方式为POST--%>
        <%--url: '<%=request.getContextPath()%>/vendorAction/listSVendorPass',--%>
        //                type:'delete',
        //                type : 'json',
        //                            dataType: 'json',//返回值类型 一般设置为json
        //                    timeout: "3000",
        //                            cache: "false",
        //                            data: {vendorId: vendorid},
        //                            success: function (data) {
        //                                if (data.code == 1) {
        //                                    alert(data.msg);
        //                                    window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
        //                                } else {
        //                                    alert(data.msg);
        //                                    $("#vendor").focus();
        //                                }
        //                            },
        //                            error: function (err) {
        //                                alert("售货机信息，通过审核");
        //                                window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
        //
        //                            }
        //                        });
        //                    }
        //                }
        //            });
        //        });
    </script>
</body>
</html>
