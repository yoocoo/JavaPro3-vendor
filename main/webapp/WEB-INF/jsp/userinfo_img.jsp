<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/7/12
  Time: 15:29
  说明： 修改个人头像功能，不在使用模态弹窗，避免出现，index 值得冲突
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>修改个人头像</title>
    <link rel="shortcut icon" href="<c:url value='/static/img/favicon.ico'/>"/>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/bootstrap/dist/css/bootstrap.min.css'/>">
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/font-awesome/css/font-awesome.min.css'/>">
    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/nprogress/nprogress.css'/>">
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">
    <%--引入CSS 样式 end --%>
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
        //        function onCancel(e) {
        //        }
        //显示个人修改头像窗口
        //        function changeImageInfo() {
        //            $('#my-prompt').modal({
        //                relateTarge: this,
        //            onConfirm: function () {
        //                upLoadFile();
        //            },
        //            onCancel: function (e) {
        //            }
        //            });
        //        }
    </script>
    <!--========================修改个人头像模块结束===============================-->
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
                        <h3> 更新个人头像
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
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">

                            <div class="x_title">
                                <h2>${userInfo.accountName}头像资料卡片
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <%--x_title end--%>
                            <div class="x_content">
                                <div class="row">
                                    <p>头像上传与修改</p>
                                    <%--<div class="col-md-55">--%>
                                        <%--<form class="form-horizontal "--%>
                                              <%--enctype="multipart/form-data"--%>
                                              <%--accept-charset="utf-8">--%>
                                            <div class="thumbnail">
                                                <div class="image view view-first">
                                                    <%--<input type="hidden" id="loginId1" name="accountName"--%>
                                                           <%--value="${userInfo.accountName}">--%>
                                                    <img style="width: 100%; height: 100%;  display: block;"
                                                         src="${userPath}" alt="image"/>
                                                    <div class="mask">
                                                        <p>头像编辑</p>
                                                        <div class="tools tools-bottom">
                                                            <a href="#"><i class="fa fa-link"></i></a>
                                                            <a href="#"><i class="fa fa-pencil"></i></a>
                                                            <a href="#"><i class="fa fa-times"></i></a>
                                                        </div>

                                                    </div>
                                                    <%--<button id="update" type="button" class="btn btn-info btn-xs"--%>
                                                            <%--onClick="onConfirm();">提交更新--%>
                                                    <%--</button>--%>
                                                </div>
                                            </div>
                                            <%--<input type="file" name="file" id="changeHeadPic" size="28"/>--%>
                                            <div class="caption">
                                                <p>头像范围--生产商机器商标</p>

                                                <%--<div class="btn-group">--%>
                                                    <%--<a class="btn" title="插入图片" id="pictureBtn"><i class="fa fa-picture-o"></i></a>--%>
                                                    <%--<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" name="file" id="changeHeadPic1" size="28"/>--%>

                                                <%--</div>--%>
                                            </div>

                                    <%--</form>--%>
                                <%--</div>--%>


                            </div>
                        </div>
                        <%--x_content end--%>
                    </div>

                    <%--x_panel end--%>
                </div>
                <%--col-md-12 col-sm-12 col-xs-12 end--%>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>头像上传二版<small>-----</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <form class="form-horizontal "
                                      enctype="multipart/form-data"
                                      accept-charset="utf-8">

                                <div id="alerts"></div>

                                <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
                                    <div class="btn-group">
                                        <a class="btn" title="插入图片" id="pictureBtn1"><i class="fa fa-picture-o"></i></a>
                                        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" name="file" id="changeHeadPic" size="28"/>
                                        <input type="hidden" id="loginId1" name="accountName"
                                               value="${userInfo.accountName}">
                                    </div>

                                    <div class="btn-group">
                                        <a class="btn" data-edit="undo" title="撤销 (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                                        <a class="btn" data-edit="redo" title="返回 (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                                    </div>


                                <div id="editor-one" class="editor-wrapper">
                                </div>
                                    <textarea name="descr" id="descr" style="display:none;"></textarea>
                                <br />
                                <div class="ln_solid"></div>
                                    <button id="update" type="button" class="btn btn-info btn-xs"
                                            onClick="onConfirm();">提交更新
                                    </button>
                            </div>
                                </form>
                        </div>
                    </div>
            </div>
            <!-- row end -->
        </div>
    </div>
    <!-- /page content -->
    <!-- footer content -->
    <footer>
        <div class="pull-right">
            ZJNU- Bootstrap Admin
        </div>
        <div class="clearfix"></div>
    </footer>
    <!-- /footer content -->
</div>
</div>

<%--</div>--%>

<!-- jQuery -->
<script type="text/javascript" src="<c:url value='/static/vendors/jquery/dist/jquery.min.js'/>"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="<c:url value='/static/vendors/bootstrap/dist/js/bootstrap.min.js'/>"></script>
<!-- FastClick -->
<script type="text/javascript" src="<c:url value='/static/vendors/fastclick/lib/fastclick.js'/>"></script>
<!-- NProgress -->
<script type="text/javascript" src="<c:url value='/static/vendors/nprogress/nprogress.js'/>"></script>
<!-- jQuery Smart Wizard -->
<%--比较有利用价值的系统后台模板的表单验证--%>
<script type="text/javascript"
        src="<c:url value='/static/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js'/>"></script>
<!-- validator -->
<%--<script type="text/javascript" src="<c:url value='/static/vendors/validator/validator.js'/>"></script>--%>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>
<%--判断消息提示脚本引用-公共引用 锁定焦点提示--%>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.tips.js'/>"></script>
<%--文件上传和下载 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ajaxfileupload.js'/>"></script>
</body>
</html>