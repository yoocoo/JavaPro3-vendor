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
    <%--====7.31=新增 编辑器===================================--%>
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/extensions/Editor/css/editor.dataTables.min.css'/>">

    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-select/css/select.dataTables.min.css'/>">
    <%--======================================================================--%>
    <!-- PNotify -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/pnotify/dist/pnotify.css'/>">
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/pnotify/dist/pnotify.buttons.css'/>">
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/pnotify/dist/pnotify.nonblock.css'/>">
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
                                       class="table table-striped table-bordered projects " cellspacing="0"
                                       width="100%">
                                    <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th class="text-left">售货机名称</th>
                                        <th class="text-left">绑定运营商</th>

                                        <th class="text-left">通信状态</th>
                                        <th class="text-left">云端状态</th>

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
                                        <th class="text-left">出厂日期</th>
                                        <th class="text-left">停服日期</th>
                                        <%--<th class="text-left">生产商</th>--%>
                                        <%--<th class="text-left">权限操作</th>--%>
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
            <%--售货机模态窗口 暂时不需要了====--%>
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
    <%--固定表头--%>
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
    <%--=====新增 编辑器插件==================================--%>
    <script type="text/javascript"
            src="<c:url value='/static/vendors/extensions/Editor/js/dataTables.editor.min.js'/>"></script>
    <script type="text/javascript"
            src="<c:url value='/static/vendors/datatables.net-select/js/dataTables.select.min.js'/>"></script>
    <%--======================================================================--%>
    <!-- PNotify -->
    <script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.buttons.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.nonblock.js'/>"></script>
    <!-- Custom Theme Scripts -->
    <script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

    <script type="text/javascript">
        var fantoryid = ${userMess.factoryId};
        console.log("打印筛选的参数 生产商id" + fantoryid);
        $(document).ready(function () {
            $('.ui-pnotify').remove();
            //1.1绑定售货机
            editorForPer = new $.fn.dataTable.Editor({
                i18n: {
                    edit: {
                        title: "售货机权限绑定",
                        submit: "提交权限修改"
                    }
                },
                ajax: {
                    url: "<%=request.getContextPath()%>/vendorAction/editVendorPer",// 数据请求地址，生产商角色对运营商指定售货机
                    type: "POST",
                    data: function (params) {
                        //此处为定义查询条件 传给控制器的参数
                        params.vendorId = $("#vendorId").val()
                        params.agencyId = $("#agencyId").val()
                    },
                    dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                    cache: false,  //不用缓存
                    success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                        if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                            $(function () {
                                new PNotify({
                                    title: '成功执行操作',
                                    text: data.msg,
                                    type: 'success',
                                    styling: 'bootstrap3'
                                });
                            });
                        } else {//更新不成功
                            $(function () {
                                new PNotify({
                                    title: '发现错误，请按提示，重新编辑',
                                    text: data.msg,
                                    type: 'error',
                                    styling: 'bootstrap3'
                                });
                            });
                        }
                    },
                    error: function (err) {
                        alert("哎呀呀，系统出现未知错误，请联系系统管理员");
                        window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                    }
                },
                table: "#listS",
                idSrc: 'vendorId',
                display: 'envelope',// 信封展示方式
                fields: [
                    {label: "售货机Id", name: "vendorId", id: "vendorId"},
                    {
                        label: "运营商列表", name: "agencyId", id: "agencyId", type: "select",
                        options: [
                            <c:forEach items="${agencyNameList}" var="alist">
                            {label: "${alist.agencyName}", value: '${alist.agencyId}'},
                            </c:forEach>
                        ]
                    }
                ],

            });
        // 2.1生产商角色：编辑售货机权限信息
            editorForInfo = new $.fn.dataTable.Editor({
                i18n: {
                    edit: {
                        title: "售货机权限信息",
                        submit: "提交权限信息修改"
                    },
                    datetime: {
                        previous: '上',
                        next: '下',
                        months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                        weekdays: ['七', '一', '二', '三', '四', '五', '六']
                    },

                    error: {
                        system: "请联系系统管理员！"
                    },
                },
                ajax: {
                    url: "<%=request.getContextPath()%>/vendorAction/editSVendorInfo",// 数据请求地址，生产商角色对运营商指定售货机
                    type: "POST",
                    data: function (params) {
                        //此处为定义查询条件 传给控制器的参数
                        params.thirdpayKey = $("#thirdpayKey").val()
                        params.thirdpayId = $("#thirdpayId").val()
                        params.expireDate = $("#expireDate").val()
                        params.vendorId = $("#vendorId").val()
                    },
                    dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                    cache: false,  //不用缓存
                    success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                        if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                            $(function () {
                                new PNotify({
                                    title: '成功执行操作',
                                    text: data.msg,
                                    type: 'success',
                                    styling: 'bootstrap3'
                                });
                            });
                        } else {//更新不成功
                            $(function () {
                                new PNotify({
                                    title: '发现错误，请按提示，重新编辑',
                                    text: data.msg,
                                    type: 'error',
                                    styling: 'bootstrap3'
                                });
                            });
                        }
                    },
                    error: function (err) {
                        $(function () {
                            new PNotify({
                                title: '发现错误，请按提示，重新编辑',
                                text: '哎呀呀，系统出现未知错误，请联系系统管理员',
                                type: 'error',
                                styling: 'bootstrap3'
                            });
                        });
//                        window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                    }
                },
                table: "#listS",
                idSrc: 'vendorId',
                display: 'envelope',// 信封展示方式
                fields: [
                    {label: "售货机Id", name: "vendorId", id: "vendorId"},
                    {label: "绑定运营商", name: "agencyName", id: "agencyName"},
                    {label: "售货机名称", name: "vendorName", id: "vendorName"},
                    {label: "审核状态", name: "checked", id: "checked", fieldInfo: '1:代表通过审核 0：代表未合格'},
                    {label: "审核员", name: "checkUser", id: "checkUser"},
//                    {label: "出厂日期", name: "dateOfProduct", id: "dateOfProduct",  type:'datetime',
//                        display: "yyyy / MM / dd"
//                    },
                    {label: "第三方ID", name: "thirdpayId", id: "thirdpayId"},
                    {label: "第三方KEY", name: "thirdpayKey", id: "thirdpayKey"},
//                    {label: "售货机注册时间", name: "registeredTime", id: "registeredTime"},
                    {label: "售货机停服时间", name: "expireDate", id: "expireDate", type: 'datetime',
                        def: function () {
                            return new Date();
                        },//定义一个选择时间的器
//                        display: 'YYYY/M/D',//显示的格式
                        format: 'YYYY-MM-DD hh:mm:ss',//选完时间后，在格式化
                        fieldInfo: '请选择时间'
                    }

                ],
            });
            // 2.2编辑售货机权限信息   某些信息是不能被编辑的
            editorForInfo.on('onInitEdit', function () {
                editorForInfo.disable('vendorId');
                editorForInfo.disable('agencyName');
                editorForInfo.disable('vendorName');
                editorForInfo.disable('checked');
                editorForInfo.disable('checkUser');
//                editorForInfo.disable('dateOfProduct');
            });
            // 1.2授权售货机时候  某些信息是不能被编辑的
            editorForPer.on('onInitEdit', function () {
                editorForInfo.disable('vendorId');
            });
//            =================================================
//售货机列表初始化
            var tables = $('#listS').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: "edit",
                        text: '绑定售货机 <i class="glyphicon glyphicon-pencil"> </i>',
                        className: 'btn bg-green',
                        editor: editorForPer
                    },
                    {
                        extend: "edit",
                        text: '编辑信息 <i class="glyphicon glyphicon-pencil"> </i>',
                        className: 'btn bg-olive',
                        editor: editorForInfo
                    },
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
                select: true,
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
//                responsive: true,//加入一个自适应 测试，加入这个 自己写的模态弹窗编辑会没数据，也许是提取的时候，提取错误
                columns: [
                    {data: "vendorId"},//售货机ID  -0
                    {data: "vendorName"},//售货机名称-1
                    {data: "agencyName", width: "80px", "defaultContent": "<i>待绑定</i>"},//归属运营商ID-20

                    {data: "actived",//是否在线（通信状态）-2
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
                    {data: "cloudSet",//云端状态）-2
                        "render": function (data, type, full, meta) {
                            if (data == 1) {
                                return '<h4 class="green"><i class="fa fa-toggle-on"></i></h4>'
                            } else {
                                return '<h4 class="red"><i class="fa fa-toggle-off"></i></h4>'
                            }
                        }
                    },

                    {data: "totalSaled"},//总出货次数(总销售次数)-3
                    {data: "maxChannelNum",
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
                    {data: "mdbbillAlarmCode",//纸币器状态-13
                        "render": function (data, type, full, meta) {
                            if (data == 1) {
                                return '<h4 class="green"><i class="fa fa-check-circle"></i></h4>'
                            } else {
                                return '<h4 class="red"><i class="fa fa-exclamation-circle"></i></h4>'
                            }
                        }
                    },
                    {data: "mdbchangerAlarmCode",//硬币器状态-14
                        "render": function (data, type, full, meta) {
                            if (data == 1) {
                                return '<h4 class="green"><i class="fa fa-check-circle"></i></h4>'
                            } else {
                                return '<h4 class="red"><i class="fa fa-exclamation-circle"></i></h4>'
                            }
                        }
                    },

                    {data: "temperature",//售货机温度-15
                        "render": function (data, type, full, meta) {
                            if (data < 0) {
                                return '<span class="label label-primary">' + data + ' ℃</span>'
                            } else {
                                return '<span class="label label-danger">' + data + ' ℃</span>'

                            }
                        }
                    },
                    {data: "gprsLevel",//信号强度-16
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
                    {data: "lastSaleTime"//最近一次出货时间-17
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
                    {data: "dateOfProduct",//出厂日期--4
                        "render": function (data, type, full, meta) {
                            var dataStr = Date.parse(data);
                            return new Date(dataStr).Format("yyyy-MM-dd");
//                            return '<input  type="text" id= "pdate" name="dateOfProduct" ' +
//                                ' value='+ '"'+new Date(dataStr).Format("yyyy-MM-dd")+'">';
                        }
                    },
                    {data: "expireDate",//停服日期--5
                        "render": function (data, type, full, meta) {
                            var dataStr = Date.parse(data);
                            return new Date(dataStr).Format("yyyy-MM-dd");
//                        return '<input type="text" id= "odate" name="expireDate" ' +
//                            ' value='+ '"'+ new Date(dataStr).Format("yyyy-MM-dd")+'">';
                        }
                    }
//                {data: "factoryId"},//负责生产商ID-19
//                    {data: null}//操作-19

                ],
                columnDefs: [
                    {
                        "render": function (data, type, row) {
//                        return data + ' /' + row[4].data ;//jquery
                            return data + ' /' + row.maxChannelNum;//api
                        },
                        "targets": 14
                    },
                    {
                        "render": function (data, type, row) {
//                    return data + ' /' + row[4].data ;//jquery
                            return data + ' /' + row.maxChannelNum;//api
                        },
                        "targets": 13
                    }
//                {
//                    "visible": false,
//                    "targets": 4 //售货机最大货道数
//                },
//                    {
//                        "targets": 21,//权限操作(改版)
//                        "data": null,//下面这行，添加了编辑按钮和，删除按钮
//                        "defaultContent": "<button id='editrow'  class='btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i> 授权</button>" +
//                        "<button id='delrow' class='btn btn-danger btn-xs' type='button'><i class='fa fa-trash-o'></i>待去掉</button>" +
//                        "<button id='editinfo' class='btn btn-danger btn-xs' data-toggle='modal' data-target='.bs-example-modal-lg'  type='button'><i class='fa fa-pencil-square-o'></i>编辑</button>"
//                    }
                ],
                responsive: {
                    details: {
                        display: $.fn.dataTable.Responsive.display.modal({
                            header: function (row, type, full, mata) {
                                var data = row.data();
                                console.log("data:" + data);
                                return '售货机详情' + '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> </button>';
                            }
                        }),
                        renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                            tableClass: 'table'
                        })
                    }
                },
                "createdRow": function (row, data, dataIndex) {
                    //每加载完一行的回调函数
//                $('td', row).eq(17).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
//                    $('td', row).eq(19).css("color", "green");//获取到具体行具体格的元素
                    $('td', row).eq(1).css("color", "green");//获取到具体行具体格的元素
                    return row;
                }
            });
            tables.buttons().container().appendTo("#buttons");
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

            //            ==============================测试获得一行数据 start=====================================
            $('#listS tbody').on('click', 'tr', function () {

                var oTable2 = $('#listS').DataTable();
                console.log("测试一正行数据：" + oTable2.row(this).data());
                var sss = oTable2.row(this).data().vendorName;
                console.log("测试一行数据：" + oTable2.row(this).data().vendorName);
            });

        });


    </script>
    // =========================时间编辑==================================================================

    <script type="text/javascript">
//        $(function () {
//            $('input[name="expireDate"]').daterangepicker({
//                    singleDatePicker: true,
//                    showDropdowns: true,
//                    format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间
////                format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 不带时间日期
//                    locale: {
////                    format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间
//
//                        format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 全格式时间
//                        daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
//                        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
//                            '七月', '八月', '九月', '十月', '十一月', '十二月']
//                    }
//                },
//                function (start, end, label) {
//                    var odate = start.format('YYYY-MM-DD HH:mm:ss');
//                    document.getElementById('odate').value = odate;
//                });
//        });
    </script>
</body>
</html>
