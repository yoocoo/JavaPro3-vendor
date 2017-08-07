<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/7/2
  Time: 13:53
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
    <title>用户行为日志</title>
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
    <%--====7.31=新增 编辑器===================================--%>
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/extensions/Editor/css/editor.dataTables.min.css'/>">

    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/datatables.net-select/css/select.dataTables.min.css'/>">
    <%--======================================================================--%>
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
                        <h3>Tab主题：仅作测试页面
                            <small> ---------</small>
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
                                <%--<h2>系统用户列表--%>
                                <%--<small>说明：</small>--%>
                                <%--</h2>--%>
                                <%--<div class="fontawesome-icon-list">--%>
                                <%--<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a href="#/ambulance"><i--%>
                                <%--class="fa fa-eye"></i> 审核用户信息</a>--%>
                                <%--</div>--%>
                                <%--<div class="fa-hover col-md-3 col-sm-4 col-xs-12"><a--%>
                                <%--href="<%=request.getContextPath()%>/mvc/userAction/sysuserResSheng"><i--%>
                                <%--class="fa fa-user"></i> 新增一级用户</a>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-expanded="false"><i
                                            class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">设置 1</a></li>
                                            <li><a href="#">设置 2</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <table id="datatable" class=" table table-striped jambo_table bulk_action">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>日志id</th>
                                        <th>登陆者</th>
                                        <th>SessionId</th>
                                        <th>IP4地址</th>
                                        <th>IP6地址</th>
                                        <th>系统名称</th>
                                        <th>系统版本</th>
                                        <th>浏览器名</th>
                                        <th>浏览器版本</th>
                                        <th>访问体</th>
                                        <th>详细</th>
                                        <th>其他</th>
                                        <th>请求方式</th>
                                        <th>登录时间</th>
                                    </tr>
                                    </thead>
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
<%--=====新增 编辑器插件==================================--%>
<script type="text/javascript"
        src="<c:url value='/static/vendors/extensions/Editor/js/dataTables.editor.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/datatables.net-select/js/dataTables.select.min.js'/>"></script>
<%--======================================================================--%>
<script type="text/javascript" src="<c:url value='/static/vendors/jszip/dist/jszip.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/pdfmake.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/vfs_fonts.js'/>"></script>

<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

<%--===============编辑器=====================改造开始================================================--%>
<script type="text/javascript">
    var editor; // use a global for the submit and return data rendering in the examples

    $(document).ready(function () {
        editor = new $.fn.dataTable.Editor({
            ajax: {
                url: "<%=request.getContextPath()%>/actionLog/editLogList",// 数据请求地址
                type: "POST",
                data: function (params) {
                    //此处为定义查询条件 传给控制器的参数
                    //角色名称
                    params.broName = $("#name1").val(),
                        params.logId = $("#id1").val(),
                    params.broVersion = $("#name2").val()
                },
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,  //不用缓存
                success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                    if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                        // window.location.href = data.data.nextUrl; //返回到主页
                        alert(data.msg);
                        <%--window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回主页--%>
                    } else {//更新不成功
                        alert(data.msg);//弹出对话框，提示返回错误信息
                        // $("#loginId").focus();
                    }
                }

            },
            table: "#datatable",
            idSrc: 'logId',
            display: 'envelope',
            fields: [
                {label: "编号", name: "logId" ,id:"id1"},
//                {label: "账号", name: "accountName"},
                {label: "浏览器名称", name: "broName",id:"name1"},
                {label: "浏览器版本", name: "broVersion", id:"name2"},
//                {label: "系统名称:", name: "osName"},
//
//                {label: "系统版本", name: "osVersion"},
//                {label: "IP4", name: "ipAddrV4"},
//                {label: "IP6", name: "ipAddrV6"},
//                {label: "详情", name: "description"},
//                {label: "方式:", name: "method"},
//
//                {label: "其他", name: "other"},
//                {label: "请求体", name: "requestBody"},
//                {label: "登录时间", name: "time", type: "datetime"},
//                {label: "会话id", name: "sessionId"}
            ]
            ,   i18n: {
            create: {
                button: "新建",
                    title:  "新建一条记录",
                    submit: "提交新建"
            },
            edit: {
                button: "edit",
                    title:  "更新该条记录",
                    submit: "提交更新"
            },
            remove: {
                button: "删除记录",
                    title:  "删除此条记录",
                    submit: "提交删除",
                    confirm: {
                    _: "这是法语，你看着办吧，反正是出错了，赶紧找错误吧。Etes-vous sûr de vouloir supprimer %d lignes?",
                        1: "这是法语，你看着办吧，反正是出错了，赶紧找错误吧。Etes-vous sûr de vouloir supprimer 1 ligne?"
                }
            },
            error: {
                system: "系统出现错误，请联系系统管理员！"
            },
            datetime: {
                previous: '上',
                    next:     '下',
                    months:   [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ],
                    weekdays: ['七', '一', '二', '三', '四', '五', '六' ]
            }
        }
        });

        $('#datatable').on('click', 'tbody td:not(:first-child)', function (e) {
            editor.bubble(this);
        });

        $('#datatable').DataTable({
            dom: "Bfrtip",
            searching: false,
            processing: true,
            serverSide: true,
            paging: true,
            info: true,
            ordering: false,//是否允许用户排序
            scrollX: true, //列太多，超过显示长度需要滚动条时使用
            destroy: true, //Cannot reinitialise DataTable,解决重新加载表格内容问题,销毁Datatables实例(destroy)

            ajax: {
                url: "<%=request.getContextPath()%>/actionLog/findLogList",// 数据请求地址 编辑
                type: "POST",
                data: function (params) {
                    //此处为定义查询条件 传给控制器的参数
                    //角色名称
                    params.broName = $("#broName").val()
//                        params.broVersion = $("#broVersion").val()
                }
            },
            columns: [
                {
                    data: null,
                    defaultContent: '',
                    className: 'select-checkbox',
                    orderable: false
                },
                {
                 data: null,
                    render: function (data, type, row) {
                        // Combine the first and last names into a single table field
                        return data.id ;
                    },
                    editField: ['logId', 'broName','broVersion']
                },
//                {data: "id"},
                {data: "accountName"},
                {data: "broName"},
                {data: "broVersion"},
                {data: "osName"},

                {data: "osVersion"},
                {data: "ipAddrV4"},
                {data: "ipAddrV6"},
                {data: "description"},
                {data: "method"},

                {data: "other"},
                {data: "requestBody"},
                {data: "time"},
                {data: "sessionId"}

//                {data: "salary", render: $.fn.dataTable.render.number(',', '.', 0, '$')}
            ],
//            order: [1, 'asc'],
            select: {
                style: 'os',
                selector: 'td:first-child'
            },
//            buttons: [
//                {extend: "create", editor: editor},
//                {extend: "edit", editor: editor,},
//                {extend: "remove", editor: editor}
//            ]
            buttons: [
                {extend: "edit",
                    text: '更新资料 <i class="glyphicon glyphicon-pencil"> </i>',
                    className: 'btn bg-olive',
                    editor: editor},
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
        });
    });


</script>
<%--==============编辑器======================改造结束================================================--%>
<script type="text/javascript">

    <%--var myTable;--%>
    <%--$(function () {--%>
        <%--//初始化表格对象--%>
        <%--myTable = $('#datatable').DataTable({--%>
            <%--dom: 'irtlp',--%>
            <%--searching: false,--%>
            <%--processing: true,--%>
            <%--serverSide: true,--%>
            <%--paging: true,--%>
            <%--info: true,--%>
            <%--scrollX: true, //列太多，超过显示长度需要滚动条时使用--%>
            <%--ajax: {--%>
                <%--url: "<%=request.getContextPath()%>/actionLog/findLogList",// 数据请求地址--%>
                <%--type: "POST",--%>
                <%--data: function (params) {--%>
                    <%--//此处为定义查询条件 传给控制器的参数--%>
                    <%--//角色名称--%>
                    <%--params.roleName = $("#theRoleName").val()--%>
                <%--}--%>
            <%--},--%>
            <%--columns: [--%>
                <%--{data: "id"},--%>
                <%--{data: "accountName"},--%>
                <%--{data: "broName"},--%>
                <%--{data: "broVersion"},--%>
                <%--{data: "osName"},--%>

                <%--{data: "osVersion"},--%>
                <%--{data: "ipAddrV4"},--%>
                <%--{data: "ipAddrV6"},--%>
                <%--{data: "description"},--%>
                <%--{data: "method"},--%>
                <%--{data: "other"},--%>
                <%--{data: "requestBody"},--%>
                <%--{data: "time"},--%>
                <%--{data: "sessionId"}--%>
            <%--],--%>
<%--//            columnDefs: [{--%>
<%--//                targets: 3,// <span style="font-family: Arial, Helvetica, sans-serif;">操作例</span>的位置，从0开始数为第几例，--%>
<%--//                data: "id",--%>
<%--//                width: 140,--%>
<%--//                "render": function (data, type, full) {--%>
<%--//                    return "<a id='upd' class='btn btn-info btn-xs'><i class='fa fa-pencil'></i>修改权限</a>"--%>
<%--//                        + "<button class='btn btn-danger btn-xs' onclick='deleteRoleRes(" + data + ")'><i class='fa fa-remove'></i> 删除</button>"--%>
<%--//                }--%>
<%--//            }],--%>

        <%--});--%>
    <%--});--%>
</script>

<%--<script type="text/javascript">--%>
<%--jQuery(function ($) {--%>

<%--//初始化table--%>
<%--var oTable1 = $('#datatable')--%>
<%--.dataTable(--%>
<%--{--%>
<%--"bPaginate": true,//分页工具条显示--%>
<%--//"sPaginationType" : "full_numbers",//分页工具条样式--%>
<%--"bStateSave": true, //是否打开客户端状态记录功能,此功能在ajax刷新纪录的时候不会将个性化设定回复为初始化状态--%>
<%--"bScrollCollapse": true, //当显示的数据不足以支撑表格的默认的高度--%>
<%--"bLengthChange": true, //每页显示的记录数--%>
<%--"bFilter": false, //搜索栏--%>
<%--"bSort": true, //是否支持排序功能--%>
<%--"bInfo": true, //显示表格信息--%>
<%--"bAutoWidth": true, //自适应宽度--%>
<%--//                        "bJQueryUI" : false,//是否开启主题--%>
<%--"bDestroy": true,--%>
<%--"bProcessing": true, //开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好--%>
<%--"bServerSide": true,//服务器处理分页，默认是false，需要服务器处理，必须true--%>
<%--"sAjaxDataProp": "aData",//是服务器分页的标志，必须有--%>
<%--"sAjaxSource": "<%=request.getContextPath()%>/actionLog/findLogList",//通过ajax实现分页的url路径。--%>
<%--"aoColumns": [//初始化要显示的列--%>
<%--{--%>
<%--"mDataProp": "id",//获取列数据，跟服务器返回字段一致--%>
<%--//                                "sClass" : "center",//显示样式--%>
<%--//                                "mRender" : function(data, type, full) {//返回自定义的样式--%>
<%--//                                    return "<label><input type='checkbox' class='ace' /><span class='lbl'></span></label>"--%>
<%--//                                }--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "accountName"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "sessionId"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "ipAddrV4"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "ipAddrV6"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "osName"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "osVersion"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "broName"--%>
<%--}, {--%>
<%--"mDataProp": "broVersion"--%>
<%--}, {--%>
<%--"mDataProp": "requestBody"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "description"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "other"--%>
<%--},--%>
<%--{--%>
<%--"mDataProp": "method"--%>
<%--},--%>

<%--{--%>
<%--"mDataProp": "time",--%>
<%--//                                "mRender" : function(data, type, full) {--%>
<%--//                                    return new Date(data)//处理时间显示--%>
<%--//                                        .toLocaleString();--%>
<%--//                                }--%>
<%--}],--%>
<%--"aoColumnDefs": [{//用来设置列一些特殊列的属性--%>
<%--"bSortable": false,--%>
<%--"aTargets": [0]--%>
<%--//第一列不排序--%>
<%--}, {--%>
<%--"bSortable": false,--%>
<%--"aTargets": [5]--%>
<%--}, {--%>
<%--"bSortable": false,--%>
<%--"aTargets": [6]--%>
<%--}],--%>
<%--//                        "oLanguage" : {//语言设置--%>
<%--//                            "sProcessing" : "处理中...",--%>
<%--//                            "sLengthMenu" : "显示 _MENU_ 项结果",--%>
<%--//                            "sZeroRecords" : "没有匹配结果",--%>
<%--//                            "sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",--%>
<%--//                            "sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",--%>
<%--//                            "sInfoFiltered" : "(由 _MAX_ 项结果过滤)",--%>
<%--//                            "sInfoPostFix" : "",--%>
<%--//                            "sSearch" : "搜索:",--%>
<%--//                            "sUrl" : "",--%>
<%--//                            "sEmptyTable" : "表中数据为空",--%>
<%--//                            "sLoadingRecords" : "载入中...",--%>
<%--//                            "sInfoThousands" : ",",--%>
<%--//                            "oPaginate" : {--%>
<%--//                                "sFirst" : "首页",--%>
<%--//                                "sPrevious" : "上页",--%>
<%--//                                "sNext" : "下页",--%>
<%--//                                "sLast" : "末页"--%>
<%--//                            },--%>
<%--//                            "oAria" : {--%>
<%--//                                "sSortAscending" : ": 以升序排列此列",--%>
<%--//                                "sSortDescending" : ": 以降序排列此列"--%>
<%--//                            }--%>
<%--//                        }--%>
<%--"fnServerData": function (sSource, aoData, fnCallback) {--%>
<%--$.ajax({--%>
<%--"type": 'post',--%>
<%--"url": sSource,--%>
<%--"dataType": "json",--%>
<%--"data": {--%>
<%--aoData: JSON.stringify(aoData)--%>
<%--},--%>

<%--"success": function (resp) {--%>
<%--fnCallback(resp);--%>
<%--}--%>
<%--});--%>
<%--}--%>
<%--});--%>

<%--//全选--%>
<%--//            $('table th input:checkbox').on(--%>
<%--//                'click',--%>
<%--//                function() {--%>
<%--//                    var that = this;--%>
<%--//                    $(this).closest('table').find(--%>
<%--//                        'tr > td:first-child input:checkbox').each(--%>
<%--//                        function() {--%>
<%--//                            this.checked = that.checked;--%>
<%--//                            $(this).closest('tr').toggleClass('selected');--%>
<%--//                        });--%>
<%--//--%>
<%--//                });--%>

<%--});--%>
<%--</script>--%>
<%--<script type="text/javascript">--%>
<%--var logJsonStr = JSON.stringify(${logJson});--%>
<%--//    alert("获得的logJsonStr："+logJsonStr);--%>
<%--var logJsonObj = JSON.parse(logJsonStr);--%>
<%--//    alert("获得的logJsonObj："+logJsonObj);--%>
<%--//    console.log(logJsonObj+"获得的logJsonObj");--%>
<%--//    console.log("获得的logJsonObj.当前页码："+logJsonObj.pageNum);--%>

<%--var pageNum = logJsonObj.pageNum;//获取当前页码--%>
<%--//    alert("1获得的当前页码："+pageNum);--%>
<%--var pageSize = logJsonObj.pageSize;//获取页面长度--%>
<%--//    alert("2获取页面长度："+pageSize);--%>
<%--var totalNum = logJsonObj.totalNum;//获取总的页码--%>
<%--//    alert("3获取页面长度："+totalNum);--%>
<%--//开始加载列表数据--%>

<%--if (logJsonObj.code == 1) {//获取数据成功--%>
<%--$('#datatable').dataTable({--%>
<%--"bProcessing": false,//显示取数据时，那个等待的提示--%>
<%--"bServerSide": true,//指定通过服务端分页--%>
<%--"sAjaxSource": "<%=request.getContextPath()%>/actionLog/findLogList",--%>
<%--"fnServerData": retreviewData //获取数据处理函数--%>

<%--});//加载数据表格--%>

<%--function retreviewData(sSource111, aaData111, fnCallback111) {--%>
<%--url:sSource111;--%>
<%--data:{--%>
<%--&lt;%&ndash;"aaData111", JSON.stringify(${logJson.data})&ndash;%&gt;--%>
<%--"aaData111", ${logJson}--%>
<%--}--%>
<%--;--%>
<%--type :"POST";--%>
<%--dataType : "json";--%>
<%--asyn : false;--%>


<%--success: function result() {--%>
<%--fnCallback111(result);--%>

<%--}--%>
<%--;--%>
<%--}--%>
<%--}--%>
<%--</script>--%>

</body>
</html>

