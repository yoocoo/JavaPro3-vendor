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
    <%--引入CSS 样式 end --%>
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">

    <!--    ==============修改个人头像版本 模块开始============================-->
    <script type="text/javascript">
        //   ============ 修改个人头像 start==========
        //    var path = $("#path").val();
        function upLoadFile() {
            var loginId1 = $("#loginId1").val();
            fileName = document.getElementById('changeHeadPic').value;
            alert("打印新上传的地址" + fileName);
            alert("打印修改谁的头像地址" + loginId1);
            // var path = $("#headImage").val();
            $.ajaxFileUpload({
                url: "<%=request.getContextPath()%>/userAction/uploadHeadPic",//请求修改个人头像接口地址
                data: {
                    //                headImage: path,
                    accountName: loginId1
                },
                secureuri: false,//是否需要安全协议，一般设置为false
                fileElementId: 'changeHeadPic',//文件上传域Id
                dataType: 'json',//返回值类型 一般设置为json
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function (data) {
                    alert(data.msg);
                    alert("修改后，请重新登录");
//                location.reload() //点击按钮刷新页面
//先根据返回的code确定文件是否上传成功
//文件上传失败，直接弹出错误提示，根据错误进行相应的事物处理（关闭Loading窗口，弹出提示对话框）
//文件上传成功后，继续实现loading窗口，接着执行上传表单信息等事物
                }
            });
        }
        function onConfirm() {
            upLoadFile();
        }
        function onCancel(e) {
        }
        //显示个人修改头像窗口
        function changeImageInfo() {
            $('#my-prompt').modal({
                relateTarge: this,
//            onConfirm: function () {
//                upLoadFile();
//            },
//            onCancel: function (e) {
//            }
            });
        }
    </script>
    <!--========================修改个人头像模块结束===============================-->
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;"><a href="index.html" class="site_title"><i
                        class="fa fa-paw"></i> <span>Gentelella Alela!</span></a></div>
                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic"><img src="${userPath}" alt="。。。" title="点击头像" onClick="changeImageInfo"
                                                  class="img-circle profile_img">修改头像
                    </div>
                    <%--=修改个人头像 模态窗口  start====--%>
                    <div class="modal hide modal" id="my-prompt" aria-labelledby="myModal-prompt">
                        <div class="modal-dialog " tabindex="-1">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModal-prompt">修改个人头像</h4>
                                </div>
                                <%--modal-header end--%>
                                <div class="modal-body ">
                                    <form class="form-horizontal "
                                          enctype="multipart/form-data"
                                          accept-charset="utf-8"
                                    <%--action=""--%>
                                    <%--method="post"--%>
                                    >
                                        <input type="hidden" id="loginId1" name="accountName"
                                               value="${userInfo.accountName}">
                                        <div class="modal-prompt-input span5">
                                            <div class="control-group ">
                                                <label class="control-label">上传头像</label>
                                                <ul class="thumbnails">
                                                    <li class="span2"><a> <img
                                                            src="/ssm_vendor/static/images/avatar-0.jpg" alt=""> </a>
                                                        <div class="actions"><a title="编辑" href="#"><i
                                                                class="icon-pencil"></i></a> <a
                                                                class="lightbox_trigger" title="图片预览"
                                                                href="${userPath} "><i
                                                                class="icon-search"></i></a></div>
                                                </ul>
                                                <div class="controls span3 ">
                                                    <input type="file" name="file" id="changeHeadPic" size="28"/>
                                                    <%--<input type="text" id="path" name="headImage" value="${file}">--%>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <%--modal-body end--%>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" onclick="onCancel();"
                                            data-dismiss="modal">返回
                                    </button>
                                    <button type="button" class="btn btn-success" onclick="onConfirm();"
                                            data-dismiss="modal">上传
                                    </button>
                                </div>
                                <%--modal-footer--%>
                            </div>
                            <%--modal-content end --%>
                        </div>
                        <%--moadal-dialog end--%>
                    </div>
                    <%--modal end--%>
                    <%--=======    修改个人头像模块窗口  end   --%>
                    <%--查看个人资料  start====--%>
                    <div class="modal hide modal" id="my-prompt1" aria-labelledby="myModal-prompt1">
                        <div class="modal-dialog " tabindex="-1">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModal-prompt1">${userInfo.accountName}--个人资料 </h4>
                                </div>
                                <%--modal-header end--%>
                                <div id="web_update">
                                    <div class="modal-body ">
                                        <form id="formId" class="form-horizontal">
                                            <%--<input type="hidden" id="loginId" name="accountName" value="${userInfo.accountName}">--%>
                                            <div class="control-group">
                                                <label class="control-label">用户密码 :</label>
                                                <div class="controls"><span>${userMess.password}</span></div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">真实姓名 :</label>
                                                <div class="controls"> ${userMess.realName} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">电子邮箱 ：</label>
                                                <div class="controls">${userMess.email} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">移动电话 ：</label>
                                                <div class="controls">${userMess.mobilePhone} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">邮政编码 ：</label>
                                                <div class="controls">${userMess.postcode} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">角色ID ：</label>
                                                <div class="controls">${userMess.roleId} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">生产商ID ：</label>
                                                <div class="controls">${userMess.factoryId} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">运营商ID ：</label>
                                                <div class="controls">${userMess.agencyId} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">QQ号码 ： </label>
                                                <div class="controls">${userMess.qq} </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">身份证号 ：</label>
                                                <div class="controls">${userMess.idcard} </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label">家庭住址 ：</label>
                                                <div class="controls">${userMess.postAdress} </div>
                                            </div>
                                        </form>
                                    </div>
                                    <%--modal-body end--%>
                                    <div class="modal-footer">
                                        <button type="reset" class="btn btn-danger" data-dismiss="modal">返回</button>
                                    </div>
                                    <%--modal-footer--%>
                                </div>
                                <%--modal-content end --%>
                            </div>
                            <%--moadal-dialog end--%>
                        </div>
                        <%--modal end--%>
                    </div>
                    <%--=======    查看个人资料  end   --%>
                    <div class="profile_info"><span>欢迎回来</span>
                        <h2>${userInfo.accountName}</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <h3>菜单栏</h3>
                        <ul class="nav side-menu">
                            <c:forEach items="${tree}" var="Menu">
                                <li id="lm${Menu.id }"><a><i class="${Menu.iconCls}"></i> ${Menu.text} <span
                                        class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <c:forEach items="${Menu.children}" var="sub">
                                            <li id="z${sub.id}"><a href="${sub.attributes.url}"><i
                                                    class="${sub.iconCls}"></i>${sub.text }</a></li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="menu_section">
                        <h3>首页菜单</h3>
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i> 首页 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="index.html">首页一</a></li>
                                    <li><a href="index2.html">首页二</a></li>
                                    <li><a href="index3.html">首页三</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-windows"></i> 错误页 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="page_403.html">403 Error</a></li>
                                    <li><a href="page_404.html">404 Error</a></li>
                                    <li><a href="page_500.html">500 Error</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-sitemap"></i> 多级别菜单 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="#level1_1">Level One</a>
                                    <li><a>第二层1<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li class="sub_menu"><a href="level2.html">第三层1</a></li>
                                            <li><a href="#level2_1">第三层2</a></li>
                                            <li><a href="#level2_2">第三层3</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#level1_2">第二层2</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> 首层菜单 <span
                                    class="label label-success pull-right">Coming Soon</span></a></li>
                        </ul>
                    </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer 菜单底部的开关开始  buttons -->
                <div class="sidebar-footer hidden-small"><a data-toggle="tooltip" data-placement="top" title="设置"> <span
                        class="glyphicon glyphicon-cog" aria-hidden="true"></span> </a> <a data-toggle="tooltip"
                                                                                           data-placement="top"
                                                                                           title="全屏"> <span
                        class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span> </a> <a data-toggle="tooltip"
                                                                                                  data-placement="top"
                                                                                                  title="锁定"> <span
                        class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> </a> <a data-toggle="tooltip"
                                                                                                 data-placement="top"
                                                                                                 title="退出登录"
                                                                                                 href="<%=request.getContextPath()%>/mvc/login">
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span> </a></div>
                <!-- /menu footer buttons 结束 -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle"><a id="menu_toggle"><i class="fa fa-bars"></i></a></div>
                    <ul class="nav navbar-nav navbar-right">
                        <li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                                        aria-expanded="false"> <img src="${userPath}" alt="">${userInfo.accountName}
                            <span class=" fa fa-angle-down"></span> </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a data-toggle="modal" data-target="#my-prompt1" href="#"> 个人资料</a></li>
                                <li><a href="javascript:;"> <span class="badge bg-red pull-right">50%</span>
                                    <span>设置</span> </a></li>
                                <li><a href="/ssm_vendor/static/view/yoocoo.html">文档总结</a></li>
                                <li><a href="javascript:alert('预留功能，待开发')">换肤/a></li>
                                <li><a href="<%=request.getContextPath()%>/mvc/login"><i
                                        class="fa fa-sign-out pull-right"></i> 退出登录</a></li>
                            </ul>
                        </li>
                        <li role="presentation" class="dropdown"><a href="javascript:alert('预留功能，待开发')"
                                                                    class="dropdown-toggle info-number"
                                                                    data-toggle="dropdown" aria-expanded="false"> <i
                                class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span> </a>
                            <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                <li><a> <span class="image"><img src="images/img.jpg" alt="Profile Image"/></span>
                                    <span> <span>John Smith</span> <span class="time">3 mins ago</span> </span> <span
                                            class="message"> Film festivals used to be do-or-die moments for movie makers. They were where... </span>
                                </a></li>
                                <li>
                                    <div class="text-center"><a> <strong>See All Alerts</strong> <i
                                            class="fa fa-angle-right"></i> </a></div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

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
                                <h2>菜单管理列表
                                    <small>说明：1，RABC思想 2，分角色分菜单 3，</small>
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
                                <table id="datatable-buttons" class="table table-striped table-bordered">
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
                                        <th><input type="checkbox" id="check-all1" class="flat"></th>
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
                                        <th><input type="checkbox" id="check-all2" class="flat"></th>
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
                                        <th><input type="checkbox" id="check-all3" class="flat"></th>
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

        <!-- footer content -->
        <footer>
            <div class="pull-right"> ZJNU - Bootstrap Admin
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
<script type="text/javascript">
    <%--var listJsonStr = JSON.stringify(${roleMenuList});--%>
    <%--alert("获得的listJsonStr：" + listJsonStr);--%>
    <%--var jsonObj = JSON.parse(listJsonStr);--%>
    <%--alert("获得的jsonObj：" + jsonObj);--%>
</script>
</body>
</html>