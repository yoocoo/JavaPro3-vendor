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
    <title>运营商商品管理</title>
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

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>商品运营管理
                            <small>---</small>
                        </h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="请输入关键字">
                                <span class="input-group-btn">
                      <button class="btn btn-default" type="button">开始</button>
                    </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>商品管理</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <p>1.归属于运营商商品系统管理 2.由运营商管理员运维 3.图片上传建议 200*200 像素 png 或者jpg 格式</p>
                                <input type="hidden" id="aId" name="agencyId" value="${userMess.agencyId}">

                                <!-- start project list -->
                                <table id="datatable" class="table table-striped projects">
                                    <thead>
                                    <tr>
                                        <th style="width: 1%">#</th>
                                        <th>序列</th>
                                        <th>分组</th>

                                        <th style="width:10%">分组编码</th>
                                        <th>分组详情</th>
                                        <th>商品编码</th>
                                        <th>商品详情</th>
                                        <th style="width: 20%">商品图标</th>
                                        <th>单位</th>
                                        <th>价格</th>
                                        <th style="width:8%">绑定运营编号</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%--<tr>--%>
                                    <%--<td>#</td>--%>
                                    <%--<td>--%>
                                    <%--<a>Pesamakini Backend UI</a>--%>
                                    <%--<br />--%>
                                    <%--<small>Created 01.01.2015</small>--%>
                                    <%--</td>--%>
                                    <%--<td>--%>
                                    <%--<ul class="list-inline">--%>
                                    <%--<li>--%>
                                    <%--<img src="images/user.png" class="avatar" alt="Avatar">--%>
                                    <%--</li>--%>
                                    <%--<li>--%>
                                    <%--<img src="images/user.png" class="avatar" alt="Avatar">--%>
                                    <%--</li>--%>
                                    <%--<li>--%>
                                    <%--<img src="images/user.png" class="avatar" alt="Avatar">--%>
                                    <%--</li>--%>
                                    <%--<li>--%>
                                    <%--<img src="images/user.png" class="avatar" alt="Avatar">--%>
                                    <%--</li>--%>
                                    <%--</ul>--%>
                                    <%--</td>--%>
                                    <%--<td class="project_progress">--%>
                                    <%--<div class="progress progress_sm">--%>
                                    <%--<div class="progress-bar bg-green" role="progressbar" data-transitiongoal="77"></div>--%>
                                    <%--</div>--%>
                                    <%--<small>77% Complete</small>--%>
                                    <%--</td>--%>
                                    <%--<td>--%>
                                    <%--<button type="button" class="btn btn-success btn-xs">Success</button>--%>
                                    <%--</td>--%>
                                    <%--<td>--%>
                                    <%--<a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>--%>
                                    <%--<a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>--%>
                                    <%--<a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>--%>
                                    <%--</td>--%>
                                    <%--</tr>--%>
                                    </tbody>
                                </table>
                                <!-- end project list -->

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
        //修改商品分组
        editorForGroup = new $.fn.dataTable.Editor({
            i18n: {
                edit: {
                    title: "修改分组信息",
                    submit: "提交修改分组信息"
                }
            },
            ajax: {
                url: "<%=request.getContextPath()%>/groupsAction/editGroupList",// 数据请求地址
                type: "POST",
//                data:function(data){
//                    var result={};
//                    for(var i in data.data){
//                        var result=data.data[i];
//                        result.DT_RowId=i;
//                        result.action=data.action;
//                        console.log("打印数据："+result);
//                    }
//                    return result;
//                },
                data: function (params) {
                    //此处为定义查询条件 传给控制器的参数
                        params.groupCode = $("#groupCode").val(),
                        params.agencyId = $("#agencyId").val(),
                        params.groupName = $("#groupName").val(),
                    params.groupId = $("#id").val()
                },
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,  //不用缓存
                success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                    if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                        // window.location.href = data.data.nextUrl; //返回到主页
//                        window.location.reload();
                        alert(data.msg);
                    } else {//更新不成功
                        alert(data.msg);//弹出对话框，提示返回错误信息
                    }
                },
                error: function (err) {
                    alert("哎呀呀，我要改好这个错误！！数据已经更新啦");
                    window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                }},
            table: "#datatable",
            idSrc: 'groupId',
            display: 'envelope',
            fields: [

                {label: "分组", name: "groupId", id: "id"},
                {label: "分组编码", name: "groupCode", id: "groupCode"},
                {label: "运营商编码", name: "agencyId", id: "agencyId"},
                {
                    label: "分组详情", name: "groupName", id: "groupName"
//                    ,type: "radio",
//                    options: ['饮料类', '食品类', '化妆品', '文具类', '消费品']
                }],

        });
        //增加商品分组
        editorForCreateGroup = new $.fn.dataTable.Editor({
            i18n: {
                edit: {
                    title: "增加分组信息",
                    submit: "提交分组信息"
                }
            },
            ajax: "",
            table: "#datatable",
            fields: [

                {label: "分组", name: "groupId", id: "groupId"},
                {label: "分组编码", name: "groupCode", id: "groupCode"},
                {label: "运营商编码", name: "agencyId", id: "agencyId"},
                {
                    label: "分组详情", name: "groupName", id: "groupName"
//                    ,
//                    type: "radio",
//                    options: ['饮料类', '食品类', '化妆品', '文具类', '消费品']
                }]

        });

        //增加商品
        editorForCreateGoods = new $.fn.dataTable.Editor({
            i18n: {
                edit: {
                    title: "增加商品信息",
                    submit: "提交商品信息"
                }
            },
            ajax: "",
            table: "#datatable",
            fields: [
                {label: "序列", name: "goodsId", id: "goodsId"},
                {label: "分组编码", name: "groupCode", id: "groupCode"},
                {label: "商品编码", name: "goodsCode", id: "goodsCode"},

                {label: "商品详情", name: "goodsName", id: "goodsName"},
                {label: "商品图标", name: "goodsImg", id: "goodsImg"},
                {label: "单位", name: "goodsUnit", id: "goodsUnit"},

                {label: "价格", name: "price", id: "price"}
            ]
        });
//修改商品信息
        editorForGoods = new $.fn.dataTable.Editor({
            ajax: {
                url: "<%=request.getContextPath()%>/groupsAction/editGoodsList",// 数据请求地址
                type: "POST",
                data: function (params) {
                    //此处为定义查询条件 传给控制器的参数
//                        params.groupId = $("#groupId").val(),
                        params.groupCode = $("#groupCode").val(),
                        params.groupName = $("#groupName").val(),

                        params.goodsCode = $("#goodsCode").val(),
                        params.goodsName = $("#goodsName").val(),
                        params.goodsImg = $("#goodsImg").val(),

                        params.goodsUnit = $("#goodsUnit").val(),
                        params.price = $("#price").val(),
                    params.goodsId = $("#goodsId").val()
                },
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,  //不用缓存
                success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                    if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                        // window.location.href = data.data.nextUrl; //返回到主页
                        window.location.reload();
                        alert(data.msg);
                    } else {//更新不成功
                        alert(data.msg);//弹出对话框，提示返回错误信息
                    }
                },
                error: function (err) {
                    alert("哎呀呀，我要改好这个错误！！数据已经更新啦");
                    window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
                }},
            table: "#datatable",
            idSrc: 'goodsId',
            display: 'envelope',
            fields: [
                {label: "序列", name: "goodsId", id: "goodsId"},
                {label: "分组编码", name: "groupCode", id: "groupCode"},
                {label: "商品编码", name: "goodsCode", id: "goodsCode"},

                {label: "商品详情", name: "goodsName", id: "goodsName"},
                {label: "商品图标", name: "goodsImg", id: "goodsImg"},
                {label: "单位", name: "goodsUnit", id: "goodsUnit"},

                {label: "价格", name: "price", id: "price"}
            ]
            , i18n: {
                create: {
                    button: "新建",
                    title: "新建一条记录",
                    submit: "提交新建"
                },
                edit: {
                    button: "edit",
                    title: "更新商品信息",
                    submit: "提交更新商品信息"
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
                    system: "请联系系统管理员！"
                },
                datetime: {
                    previous: '上',
                    next: '下',
                    months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                    weekdays: ['七', '一', '二', '三', '四', '五', '六']
                }
            }
        });
        // 更新商品信息 disable goodsId
        editorForGoods.on('onInitEdit', function () {
            editorForGoods.disable('goodsId');
            editorForGoods.disable('groupCode');
        });
        // 更新分组信息 disable agencyId  groupId
        editorForGroup.on('onInitEdit', function () {
            editorForGroup.disable('agencyId');
            editorForGroup.disable('groupId');
        });
        $('#datatable').on('click', 'tbody td:not(:first-child)', function (e) {
            editor.bubble(this);
        });
        var aId = ${userMess.agencyId};
        console.log("打印运营商id:::" + aId);
        var table = $('#datatable').DataTable({
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
                url: "<%=request.getContextPath()%>/groupsAction/listYgoodsList",// 数据请求地址  运营商列表
                type: "POST",
                data:{agencyId:aId}
//                data: function (params) {
                    //此处为定义查询条件 传给控制器的参数
                    //角色名称
//                    params.agencyId = $("#aId").val()
//                    params.goodsId = $("#goodsId").val(),
//                        params.groupId = $("#groupId").val(),
//                        params.groupCode = $("#groupCode").val(),
//                        params.groupName = $("#groupName").val(),
//
//                        params.goodsCode = $("#goodsCode").val(),
//                        params.goodsName = $("#goodsName").val(),
//                        params.goodsImg = $("#goodsImg").val(),
//
//                        params.goodsUnit = $("#goodsUnit").val(),
//                        params.price = $("#price").val()
//                }
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
                        return data.goodsId;
                    },
                    editField: ['goodsId', 'groupCode', 'groupName', 'goodsCode', 'goodsName', 'goodsImg', 'goodsUnit', 'price']
                },
                {
                    data: "groupId",
                    "render": function (data, type, full, meta) {
                        return '<a>第' + data + '分组</a>'
                    }
                },
                {
                    data: "groupCode",
                    "render": function (data, type, full, meta) {
                        return '<a>第' + data + '分组</a><br/>统计时间： 2017年08月06日</small>';
                    }
                },
                {data: "groupName"},

                {data: "goodsCode"},
                {data: "goodsName"},
                {
                    data: "goodsImg",
                    "render": function (data, type, full, meta) {
                        return '<ul class="list-inline"><li><img src="/ssm_vendor/static/headImg/' + data + '" class="avatar" alt="Avatar"> </li> <li></ul>';
                    }
                },

                {data: "goodsUnit"},
                {data: "price"},
                {data: "agencyId"}
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
                {
                    extend: "create",
                    text: '增加商品 <i class="glyphicon glyphicon-pencil"> </i>',
                    className: 'btn bg-olive',
                    editor: editorForCreateGoods
                },
                {
                    extend: "create",
                    text: '增加分组 <i class="glyphicon glyphicon-pencil"> </i>',
                    className: 'btn bg-green',
                    editor: editorForCreateGroup
                },
                {
                    extend: "edit",
                    text: '编辑商品 <i class="glyphicon glyphicon-pencil"> </i>',
                    className: 'btn bg-olive',
                    editor: editorForGoods
                },
                {
                    extend: 'edit',
                    text: '编辑分组 <i class="glyphicon glyphicon-copy"> </i>',
                    className: 'btn bg-green',
                    editor: editorForGroup
                },
//                {
//                    extend: 'remove',
//                    text: '删掉分组 <i class="fa fa-cloud-download"> </i>',
//                    className: 'btn bg-olive',
//                    editor: editorForRemoveGroup
//                },
//                {
//                    extend: 'remove',
//                    text: '删掉商品 <i class="fa fa-cloud-download"> </i>',
//                    className: 'btn bg-green',
//                    editor: editorForRemoveGoods
//                },
                {
                    extend: 'excel',
                    text: '下载Excel <i class="fa fa-cloud-download"> </i>',
                    className: 'btn bg-olive'
                },
                {
                    extend: 'print',
                    text: '<i class="fa fa-table"> </i> 打印表格',
                    className: 'btn bg-green'
                }]
        });
        table.buttons().container().appendTo("#buttons")
    })
    ;


</script>
<%--==============编辑器======================改造结束================================================--%>
<script type="text/javascript">

</script>


</body>
</html>

