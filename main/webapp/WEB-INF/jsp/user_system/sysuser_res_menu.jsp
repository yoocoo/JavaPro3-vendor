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
    <title>数据表格测试</title>
    <%--引入CSS 样式 start--%>
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
                        <h3>Tab主题：权限菜单管理表格
                            <small> ----1,2,3-----</small>
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
                                <h2>菜单管理列表</h2>
                                <small>----说明：<br>
                                    1，RABC(基于角色的访问控制)思想:权限不直接赋予给用户，而是角色，用户在拥有某个角色
                                    <br>
                                    2，在逻辑中，只有管理员角色才能分配权限。<br>
                                    3，目前RABC分四层：RABC0、RABC1、RABC2、RABC3 ，目前该系统达到了简易的RABC2层次，后期可继续完善。<br>
                                </small>
                                </h2>
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
                                <p class="text-muted font-13 m-b-30"> 菜单列表管理功能：1.查看菜单信息 2. 编辑菜单信息（待增加） 3.清除菜单 </p>
                                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap">
                                    <thead>
                                    <tr>
                                        <th>菜单ID</th>
                                        <th>菜单描述</th>
                                        <th>菜单地址</th>
                                        <th>父级ID</th>
                                        <th>菜单顺序</th>
                                        <th>菜单图标</th>
                                        <th>菜单类型</th>
                                        <th>操作</th>
                                        <%--<th>操作</th>--%>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <c:forEach items="${listMenuJson}" var="item">
                                        <td><c:out value="${item.menuId}"/></td>
                                        <td><c:out value="${item.menuName}"/></td>
                                        <td><c:out value="${item.menuUrl}"/></td>
                                        <td><c:out value="${item.parentId}"/></td>
                                        <td><c:out value="${item.menuOrder}"/></td>
                                        <td><i class=" <c:out value="${item.menuIcon}"/> "></i></td>
                                        <td><c:out value="${item.menuType}"/></td>
                                        <td onclick='goEdit(<c:out value="${item.menuId}"/>)'>编辑</td>
                                            <%--<td onclick='doDelete(<c:out value="${item.menuId}"/>)'>删除</td>--%>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>菜单关联表---响应式表格
                                    <small>--------</small>
                                </h2>
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
                                <p class="text-muted font-13 m-b-30">
                                    响应是DataTables的扩展，它通过从表中动态插入和删除列来优化不同屏幕大小的表格来解决该问题。 </p>
                                <table id="datatable-responsive"
                                       class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"
                                       width="100%">
                                    <thead>
                                    <tr>
                                        <th>ID值</th>
                                        <th>角色ID值</th>
                                        <th>菜单ID值</th>
                                        <th>操作</th>
                                        <%--<th>操作</th>--%>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <c:forEach items="${listRoleInMenuJson}" var="list">
                                        <td><c:out value="${list.id}"/></td>
                                        <td><c:out value="${list.roleId}"/></td>
                                        <td><c:out value="${list.menuId}"/></td>
                                        <td onclick='goEdit1(<c:out value="${list.id}"/>)'>查看</td>
                                            <%--<td onclick='doDelete1(<c:out value="${list.id}"/>)'>删除</td>--%>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>基于Bootstrap CSS framework
                                    <small>-----</small>
                                </h2>
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
                                <p class="text-muted font-13 m-b-30"> 基于 by the Bootstrap CSS framework设计的静态表格 </p>
                                <table id="datatable-fixed-header"
                                       class="table table-striped table-bordered"
                                       data-toggle="table"
                                       data-url="<%=request.getContextPath()%>/userAction/listAllUser"
                                       data-click-to-select="true"
                                       data-search="true"
                                       data-method="post"
                                       data-side-pagination="server"
                                       data-query-params-type="limit"
                                       data-content-type="application/x-www-form-urlencoded"
                                       data-pagination="true"
                                       data-page-size="5"
                                       data-page-list="[5,10]"
                                       data-height="200"
                                       data-toolbar="#toolbar"
                                       data-single-select="true"
                                >
                                    <thead>
                                    <tr>

                                        <th data-field="userId">ID</th>
                                        <%--<th data-field="nextUrl" data-align="center">下一</th>--%>
                                        <th data-field="accountName">账户名</th>
                                        <%--<th data-field="password" data-align="center">密码</th>--%>
                                        <th data-field="realName">姓名</th>
                                        <th data-field="roleId">角色</th>
                                        <%--<th data-field="nickName" data-align="center">昵称</th>--%>
                                        <th data-field="email">电子邮箱</th>
                                        <%--<th data-field="lastLoginTime" data-align="center">最近一次登录</th>--%>
                                        <%--<th data-field="fixPhone" data-align="center">电话</th>--%>
                                        <th data-field="mobilePhone">手机</th>
                                        <th data-field="qq">QQ</th>
                                        <th data-field="postcode">邮编</th>
                                        <th data-field="idcard">身份证</th>
                                        <%--<th data-field="loginCount" data-align="center">次数</th>--%>
                                        <th data-field="postAdress">地址</th>
                                        <th data-field="creatTime">创建时间</th>
                                        <%--<th data-field="headImage" data-align="center">头像地址</th>--%>
                                        <th data-field="approved">是否删除</th>
                                        <td data-field="action" data-align="center" data-formatter="formatAction">操作
                                        </td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>王娇</td>
                                        <td>大中国</td>
                                        <td>18770077797</td>
                                        <td>3434644411</td>
                                        <td>343008316@qq.com</td>
                                        <td>admin1</td>
                                        <td>123456</td>
                                        <td>系统管理员</td>
                                        <td>2011/04/25</td>
                                        <td>/static/images/1.jpg</td>
                                        <td>1</td>
                                        <td>1</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>静态表格模板
                                    <small>Users</small>
                                </h2>
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
                                <p class="text-muted font-13 m-b-30"> 这是一个静态表格的例子，为了方便查看例子，和设计样式。
                                    <code>$().DataTable();</code></p>
                                <table id="datatable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>姓名</th>
                                        <th>地址</th>
                                        <th>办公室</th>
                                        <th>年龄</th>
                                        <th>开始日期</th>
                                        <th>薪水</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1王娇</td>
                                        <td>上海虹桥</td>
                                        <td>销售部</td>
                                        <td>99</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>2王娇</td>
                                        <td>上海虹桥</td>
                                        <td>销售部</td>
                                        <td>99</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>3王娇</td>
                                        <td>上海虹桥</td>
                                        <td>销售部</td>
                                        <td>99</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>4王娇</td>
                                        <td>上海虹桥</td>
                                        <td>销售部</td>
                                        <td>99</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>带复选框表格样式设计</h2>
                                <small>11111111111</small>
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
                                <p class="text-muted font-13 m-b-30"> （多选）带复选框表格样式设计，注意是静态表格 </p>
                                <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
                                    <thead>
                                    <tr>
                                        <th>
                                        <th><input type="checkbox" class="flat"></th>
                                        </th>
                                        <th>姓名</th>
                                        <th>通信地址</th>
                                        <th>邮箱</th>
                                        <th>电话</th>
                                        <th>日期</th>
                                        <th>金钱</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                        <th><input type="checkbox"  class="flat"></th>
                                        </td>
                                        <td>王娇</td>
                                        <td>大中国</td>
                                        <td>353@qq.com</td>
                                        <td>1870077797</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <th><input type="checkbox"
                                                   <%--id="check-all" --%>
                                                   class="flat"></th>
                                        </td>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                        <td>2011/07/25</td>
                                        <td>$170,750</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>可选中内容表格
                                    <small>-----</small>
                                </h2>
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
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <p class="text-muted font-13 m-b-30">
                                                KeyTable在任何表格上提供Excel像单元导航。可以将事件（焦点，模糊，动作等）分配给单个单元格，列，行或所有单元格。 </p>
                                            <table id="datatable-keytable" class="table table-striped table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Position</th>
                                                    <th>Office</th>
                                                    <th>Age</th>
                                                    <th>Start date</th>
                                                    <th>Salary</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>System Architect</td>
                                                    <td>Edinburgh</td>
                                                    <td>61</td>
                                                    <td>2011/04/25</td>
                                                    <td>$320,800</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->
<%--===========================================--%>
        <!-- footer content -->
        <footer>
            <div class="pull-right"> ZJNU - Bootstrap Admin -功夫不负有心人
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
<script type="text/javascript" src="<c:url value='/static/vendors/jszip/dist/jszip.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/pdfmake.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pdfmake/build/vfs_fonts.js'/>"></script>

<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>
</body>
</html>