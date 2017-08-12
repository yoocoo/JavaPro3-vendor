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
    <%--<link type="text/css" rel="stylesheet"--%>
    <%--href="<c:url value='/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css'/>">--%>

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
                                <h2>运营商用户售货机数据表格<br/>
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
                                <input type="hidden" id="agencyid" name="agencyId"
                                       value="${userMess.agencyId}">
                                <%--基于bootstrap 样式的 modal 查看 --%>
                                <table id="datatable-responsive"
                                       class="table table-striped  display table-bordered dt-responsive nowrap jambo_table bulk_action"
                                       cellspacing="0"
                                       width="100%">
                                    <thead>
                                    <tr>
                                        <%--<th></th>--%>
                                        <th class="text-center">ID</th>

                                        <th class="text-left">售货机名称</th>
                                        <th class="text-left">通信状态</th>
                                        <th class="text-left">云端状态</th>


                                        <th class="text-left">?停放地点</th>
                                        <th class="text-left">出厂日期</th>
                                        <th class="text-left">停服日期</th>

                                        <th class="text-left">纸币器</th>
                                        <th class="text-left">硬币器</th>
                                        <th class="text-left">温度</th>
                                        <th class="text-left">信号</th>
                                        <th class="text-left">最大货道数</th>
                                        <th class="text-left">审核状态</th>


                                        <th class="text-left">库存数量</th>
                                        <th class="text-left">总金额</th>
                                        <th class="text-left">总纸币</th>

                                        <th class="text-left">总硬币</th>
                                        <th class="text-left">总非现金</th>
                                        <th class="text-left">总额外收入</th>
                                        <th class="text-left">总销售次数</th>

                                        <th class="text-left">库存状态</th>
                                        <th class="text-left">马达状态</th>


                                        <th class="text-left">最近一次销售</th>


                                        <%--<th class="text-left">生产商</th>--%>
                                        <%--<th class="text-left">运营商详情</th>--%>
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
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js'/>"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="<c:url value='/static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js'/>"></script>--%>
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
<!-- PNotify -->
<script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.js'/>"></script>
<script  type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.buttons.js'/>"></script>
<script  type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.nonblock.js'/>"></script>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

<script type="text/javascript">

    var editor; // use a global for the submit and return data rendering in the examples

    var agencyid = ${userMess.agencyId};
    console.log("打印筛选的参数运营商id" + agencyid);
    $(document).ready(function () {
        $('.ui-pnotify').remove();

        $.extend($.fn.dataTable.Editor.display.envelope.conf, {
            attach: 'head'
        });
        editor = new $.fn.dataTable.Editor({
            ajax: {
                url: "<%=request.getContextPath()%>/vendorAction/editYunList",// 数据请求地址,编辑运营商列表
                type: "POST",
                data: function (params) {
                    //此处为定义查询条件 传给控制器的参数
                    //角色名称
                    params.vendorName = $("#vendorName").val()
                    params.vendorId = $("#vendorId").val()
                },
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,  //不用缓存
                success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                    if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
//                        alert(data.msg);
                        $(function(){
                            new PNotify({
                                title: '成功执行操作',
                                text: data.msg,
                                type: 'success',
                                styling: 'bootstrap3'
                            });
                        });
                        <%--window.location.href = "<%=request.getContextPath()%>/vendorAction/listAllYVendor";//返回运营商售货机管理界面--%>

                    } else {//更新不成功
//                        alert(data.msg);//弹出对话框，提示返回错误信息
                        $(function(){
                            new PNotify({
                                title: '发现错误，请联系系统管理员',
                                text: data.msg,
                                type: 'error',
                                styling: 'bootstrap3'
                            });
                        });
                    }
                }
            },
            table: "#datatable-responsive",
            idSrc: 'vendorId',
            display: 'envelope',
            fields: [
                {label: "编号:", name: "vendorId", id: "vendorId"},
                {label: "地点:", name: "vendorName", id: "vendorName"}
//                {label: "出厂时间:", name: "dateOfProduct", type: "date",
//                    def: function () {
//                        return new Date();
//                    }
//                },
//                {label: "停服时间", name: "expireDate", type: "date",
//                    def: function () {
//                        return new Date();
//                    }
//                }
            ]
            , i18n: {
                create: {
                    button: "新建",
                    title: "新建一条记录",
                    submit: "提交新建"
                },
                edit: {
                    button: "更新",
                    title: "更新该条记录",
                    submit: "提交更新"
                },
                remove: {
                    button: "删除记录",
                    title: "删除此条记录",
                    submit: "提交删除",
                    confirm: {
                        _: "这是法语，你看着办吧，反正是出错了，赶紧找错误吧。Etes-vous sûr de vouloir supprimer %d lignes?",
                        1: "这是法语，你看着办吧，反正是出错了，赶紧找错误吧。Etes-vous sûr de vouloir supprimer 1 ligne?"
                    }
                },
                error: {
                    system: "出现系统错误，请联系系统管理员",
                },
                datetime: {
                    previous: '上',
                    next: '下',
                    months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                    weekdays: ['七', '一', '二', '三', '四', '五', '六']
                }
            }
        });

        // 编辑该条记录
//        $('#datatable-responsive').on( 'click', 'a.editor_edit', function (e) {
//            e.preventDefault();
//            editor
//                .title( '更新该售货机资料' )
//                .buttons( { "label": "更新提交", "fn": function () { editor.submit() } } )
//                .edit( $(this).closest('tr') );
//        } );


//        var tables = $('#datatable-responsive').DataTable({
        $('#datatable-responsive').DataTable({
            dom: 'Bfrtip',
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
            deferRender: true,//延迟渲染，当数据库中数据多时，可以提高效率
//            responsive: true,//测试使用 响应式布局，对 数据提取的影响，也可以在class中（类中） 添加dt-responsive 进行响应式初始化

            columns: [
//                {data: null,
//                    defaultContent: '',
//                    className: 'select-checkbox',
//                    orderable: false
//                },
                {data: "vendorId"},//售货机ID  -0
                {data: "vendorName"},//售货机名称-1
                {data: "actived",//是否在线（通信状态）-2
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<h4 class="green"><i class="fa fa-power-off"></i></h4>'
                        } else {
                            return '<h4 class="red"><i class="fa fa-power-off"></i></h4>'
                        }
                    }
                },
                {data: "cloudSet",//是否在线（通信状态）-2
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<h4 class="green"><i class="fa fa-toggle-on"></i></h4>'
                        } else {
                            return '<h4 class="red"><i class="fa fa-toggle-off"></i></h4>'
                        }
                    }
                },
//=======新增===input 表单======
                {
                    data: "agencyName",//归属运营商(实际为停放地点)--3
                    width: "80px",
                    "defaultContent": "<i>还没有设置</i>"
//                    "render": function (data, type, full, mata) {
//                        return '<input type="text" id= "aName" name="agencyName" value=" ' + data + '">';
//                    }
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
                },

                {
                    data: "mdbbillAlarmCode",//纸币器状态-6
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<h4 class="green"><i class="fa fa-check-circle"></i></h4>'
                        } else {
                            return '<h4 class="red"><i class="fa fa-exclamation-circle"></i></h4>'
                        }
                    }
                },
                {
                    data: "mdbchangerAlarmCode",//硬币器状态-7
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<h4 class="green"><i class="fa fa-check-circle"></i></h4>'
                        } else {
                            return '<h4 class="red"><i class="fa fa-exclamation-circle"></i></h4>'
                        }
                    }
                },
                {
                    data: "temperature",//售货机温度-8
                    "render": function (data, type, full, meta) {
                        if (data < 0) {
                            return '<span class="label label-primary">' + data + ' ℃</span>'
                        } else {
                            return '<span class="label label-danger">' + data + ' ℃</span>'

                        }
                    }
                },
                {
                    data: "gprsLevel",//信号强度-9
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
                    data: "maxChannelNum",//最大货道数目 -10
                    "render": function (data, type, full, mata) {
                        return '<span class="label label-info">' + data + '</span>'
                    }
                },
                {
                    data: "checked",//是否通过审核-11
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<span class="badge badge-danger bg-green">通过</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                        } else {
                            return '<span class="badge badge-success bg-red">停用</span>'; //这里是主题  把url变成超链接、把图片路径显示为图片
                        }

                    }
                },

                {data: "sum", "defaultContent": "<i>待初始化</i>"},//库存数量（其实是：库存量 字段：sum(stockNumber)）-12
                {data: "totalMoney"},//总金额-13
                {data: "totalBill"},//总纸币-14

                {data: "totalCoin"},//总硬币-15
                {data: "totalCashless"},//总非现金-16
                {data: "totalExtraIncome"},//总额外收入-17
                {data: "totalSaled"},//总出货次数(总销售次数)-18

                {data: "countNum"},//库存状态 -19
                {data: "countStatus"},//马达状态（其实是：马达状态motorstatus ==0/总motorstatus）-20
                {
                    data: "lastSaleTime"//最近一次出货时间-21
                    ,
                    "render": function (data, type, full, meta) {
                        var dataStr = Date.parse(data);
                        return new Date(dataStr).Format("yyyy-MM-dd hh:mm:ss");
                    }
                }
//                {data: "factoryId"},//负责生产商ID-19
//                {data: "agencyId", width: "80px", "defaultContent": "<i>还没有设置</i>"},//归属运营商ID-20
//                {data: null}//操作-22
            ],
            columnDefs: [
                {
                    "render": function (data, type, row) {
//                        return data + ' /' + row[4].data ;//jquery
                        return data + ' /' + row.maxChannelNum;//api
                    },
                    "targets": 20
                },
                {
                    "render": function (data, type, row) {
//                    return data + ' /' + row[4].data ;//jquery
                        return data + ' /' + row.maxChannelNum;//api
                    },
                    "targets": 21
                }
//                {
//                    "visible": false,
//                    "targets": 7
//                },隐藏某列
//                {
//                    "targets": 22,//编辑
//                    "data": null,//下面这行，添加了编辑按钮和，删除按钮
//                    className: "center",
//                    defaultContent: '<a href="" class="editor_edit">编辑</a> / <a href="" class="editor_remove">查看</a>'
//                    "defaultContent": "<button id='editrow' class='editor_edit btn btn-info btn-xs' type='button'><i class='fa fa-pencil'></i> 编辑</button>"
//                    +
//                    "<button id='skanrow' class='btn btn-info btn-xs' type='button'><i class='fa fa-search-plus'></i>查看</button>"
//                }
            ],
            select: true,
            order: [12, 'asc'],//加上去好像没用
            buttons: [
                {
                    extend: "edit",
                    text: '更新资料 <i class="glyphicon glyphicon-pencil"> </i>',
                    className: 'btn bg-olive',
                    editor: editor
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
//            responsive: {
//                details: true
//            },//在这种情况下，最终用户不能直接访问隐藏的数据。不建议使用
            responsive: {// 内联 用户交互控制 --如果存在隐藏列，则控件将显示在表的第一列中
                details: {
                    details: true,
                    type: 'column',
                    display: $.fn.dataTable.Responsive.display.modal({
                        header: function (row, type, full, mata) {
                            var data = row.data();
                            console.log("data:" + data);//打印的对象
                            return '售货机详情--' + data.vendorName + '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> </button>';
                        }
                    }),
                    renderer: $.fn.dataTable.Responsive.renderer.tableAll({
//                            tableClass: 'table'
                        tableClass: 'ui table'
                    })
                }
            },
            "createdRow": function (row, data, dataIndex) {
                //每加载完一行的回调函数
//                $('td', row).eq(19).css('font-weight', "bold").css("color", "green");//获取到具体行具体格的元素
                $('td', row).eq(1).css("color", "green");//获取到具体行具体格的元素
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
        //========================================日期格式化=============================

    });
</script>

</body>
</html>
