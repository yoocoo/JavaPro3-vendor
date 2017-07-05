<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/6/29
  Time: 9:43
  说明： 该页面，包括左侧菜单，和 头像  以及头像的模态弹窗的头像上传
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;"><a href="<%=request.getContextPath()%>/mvc/home" class="site_title"><i
                class="fa fa-paw"></i> <span>智能售货机后台</span></a></div>
        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic"><img src="${userPath}" alt="哎呀，缺失啦" title="点击头像，修改图像"
                                          onClick="changeImageInfo" data-toggle="modal" data-target=".bs-image"
                                          class="img-circle profile_img">
            </div>
            <div class="profile_info"><span>欢迎回来</span>
                <h2>${userInfo.accountName}</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->
        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <%--<div class="profile_pic"><img src="${userPath}" alt="哎呀，缺失啦" title="点击头像，修改图像"--%>
                                          <%--class="img-circle profile_img">--%>
            <%--</div>--%>
            <div class="profile_info"><span></span>
                <h2>待更新</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->
        <%--=修改个人头像 模态窗口  start====--%>
        <div class="modal fade bs-image" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel2">修改头像</h4>
                    </div>
                    <%--modal-header end--%>
                    <div class="modal-body">
                        <form class="form-horizontal "
                              enctype="multipart/form-data"
                              accept-charset="utf-8"
                        >
                            <input type="hidden" id="loginId1" name="accountName"
                                   value="${userInfo.accountName}">


                                    <label class="control-label">上传头像</label>
                                    <%--<ul class="thumbnails">--%>
                                        <%--<li class="span2"><a> <img--%>
                                                <%--src="/ssm_vendor/static/images/avatar-0.jpg" alt=""> </a>--%>
                                            <%--<div class="actions"><a title="编辑" href="#"><i--%>
                                                    <%--class="icon-pencil"></i></a> <a--%>
                                                    <%--class="lightbox_trigger" title="图片预览"--%>
                                                    <%--href="${userPath} "><i--%>
                                                    <%--class="icon-search"></i></a></div>--%>
                                    <%--</ul>--%>

                                        <input type="file" name="file" id="changeHeadPic" size="28"/>
                                        <%--<input type="text" id="path" name="headImage" value="${file}">--%>



                        </form>
                    </div>
                    <%--modal-body end--%>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="onCancel();">返回</button>
                        <button type="button" class="btn btn-primary" onclick="onConfirm();" >上传</button>
                    </div>
                    <%--modal-footer--%>
                </div>
                <%--modal-content end --%>
            </div>
            <%--moadal-dialog end--%>
        </div>
        <%--modal end--%>
        <%--=======    修改个人头像模块窗口  end   --%>


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
            <%--<div class="menu_section">--%>
                <%--<h3>测试菜单</h3>--%>
                <%--<ul class="nav side-menu">--%>
                    <%--<li><a><i class="fa fa-home"></i> 首页 <span class="fa fa-chevron-down"></span></a>--%>
                        <%--<ul class="nav child_menu">--%>
                            <%--<li><a href="index.html">首页一</a></li>--%>
                            <%--<li><a href="index2.html">首页二</a></li>--%>
                            <%--<li><a href="index3.html">首页三</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li><a><i class="fa fa-windows"></i> 错误页 <span class="fa fa-chevron-down"></span></a>--%>
                        <%--<ul class="nav child_menu">--%>
                            <%--<li><a href="page_403.html">403 Error</a></li>--%>
                            <%--<li><a href="page_404.html">404 Error</a></li>--%>
                            <%--<li><a href="page_500.html">500 Error</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li><a><i class="fa fa-sitemap"></i> 多级别菜单 <span class="fa fa-chevron-down"></span></a>--%>
                        <%--<ul class="nav child_menu">--%>
                            <%--<li><a href="#level1_1">Level One</a>--%>
                            <%--<li><a>第二层1<span class="fa fa-chevron-down"></span></a>--%>
                                <%--<ul class="nav child_menu">--%>
                                    <%--<li class="sub_menu"><a href="level2.html">第三层1</a></li>--%>
                                    <%--<li><a href="#level2_1">第三层2</a></li>--%>
                                    <%--<li><a href="#level2_2">第三层3</a></li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                            <%--<li><a href="#level1_2">第二层2</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> 首层菜单 <span--%>
                            <%--class="label label-success pull-right">Coming Soon</span></a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>

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
<%--文件上传和下载 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ajaxfileupload.js'/>"></script>
</body>
</html>
