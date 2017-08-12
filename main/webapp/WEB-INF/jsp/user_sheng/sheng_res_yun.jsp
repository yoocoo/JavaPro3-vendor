<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/6/30
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>新建二级用户</title>
    <%--引入CSS 样式 start--%>
    <link rel="shortcut icon" href="<c:url value='/static/img/favicon.ico'/>"/>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/bootstrap/dist/css/bootstrap.min.css'/>">
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/font-awesome/css/font-awesome.min.css'/>">
    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/nprogress/nprogress.css'/>">
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
    <%--=======创建运营商 开始=======--%>
    <script type="text/javascript">
        function webReg() {
            if ($('#name').val() == "") {
                $('#name').focus();
                $('#name').tips({
                    side: 2,
                    msg: '用户名不能为空',
                    bg: '#B22222',
                    time: 3,
                });
                return false;
            }
            if ($('#name').val().length < 6 || $('#name').val().length > 10) {
                $('#name').focus();
                $('#name').tips({
                    side: 2,
                    msg: '用户名位数建议6-10位',
                    bg: '#B22222',
                    time: 3,
                });
                return false;
            }
            if ($('#password5').val().length < 6) {
                $('#password5').focus();
                $("#password5").tips({
                    side: 2,
                    msg: '密码不能小于6位',
                    bg: '#B22222',
                    time: 3
                });
                return false;
            }
            if ($('#password6').val() != $('#password5').val()) {
                $('#password6').focus();
                $("#password6").tips({
                    side: 2,
                    msg: '两次密码不一致',
                    bg: '#B22222',
                    time: 3
                });
                return false;
            }


            var sqq = /^1[34578]\d{9}$/;
            if (!sqq.test($('#telephone1').val())
                || $('#telephone1').val().length < 11
                || $('#telephone1').val().length > 14
                || $('#telephone1').val() == "") {

                $('#telephone1').focus();
                $("#telephone1").tips({
                    side: 2,
                    msg: '手机号不正确',
                    bg: '#B22222',
                    time: 3
                });
                return false;
            }
            if ($('#telephone4').val().length !== 18) {
                $('#telephone4').focus();
                $("#telephone4").tips({
                    side: 2,
                    msg: '请输入正确的18位二代身份号',
                    bg: '#B22222',
                    time: 3
                });
                return false;
            }
            var loginname = $("#name").val();
            var password = $("#password5").val();
            var cellnumber = $("#telephone1").val();
            var realname = $("#name2").val();
//            alert("检查运营商管理员roleid 的值 =  3 ,而不是弹出来的值是 id= 2");
//            alert($(":selected", "#sel5").val());
            var roleid = $(":selected", "#sel5").val();
//        var roleid = $("select option:selected").val();
            var Email = $("#email1").val();
            var QQ = $("#telephone2").val();
            var code = $("#telephone3").val();
            var card = $("#telephone4").val();
            var adress = $("#name3").val();

//        =========================
            var agencyname = $("#name4").val();

            var factoryid = $("#factoryid").val();
//            alert("打印要提交 归属的生产商用户的id值" + factoryid);
            $.ajax({
                type: "POST",
                url: '<%=request.getContextPath()%>/userAction/sysuserResYun',
                data: {
                    accountName: loginname,
                    password: password,
                    mobilePhone: cellnumber,
                    roleId: roleid,
                    realName: realname,
                    email: Email,
                    qq: QQ,
                    postcode: code,
                    idcard: card,
                    postAdress: adress,
                    agencyName: agencyname,
                    factoryId: factoryid
                },
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,
                success: function (data) {
                    if (data.code == 1) {
//                    window.location.href = data.data.nextUrl;
//                        alert(data.msg);
                        $(function () {
                            new PNotify({
                                title: '成功执行操作',
                                text: data.msg,
                                type: 'success',
                                styling: 'bootstrap3'
                            });
                        });
                        window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回到后台首页
                    } else {
//                        alert(data.msg);
                        $(function () {
                            new PNotify({
                                title: '发现错误，请根据提示重新操作',
                                text: data.msg,
                                type: 'error',
                                styling: 'bootstrap3'
                            });
                        });
                        $("#user").focus();
                        $("#agency").focus();
                    }
                }
            })
            ;
        }
    </script>
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
                        <h3>新增二级用户</h3>
                    </div>
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="请输入内容">
                                <span class="input-group-btn">
                              <button class="btn btn-default" type="button">开始</button>
                          </span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>运营商管理员
                                        <small>运营商管理员职责：1. 2. 3.</small>
                                    </h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                               aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">设置 1</a>
                                                </li>
                                                <li><a href="#">设置 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <!-- Smart Wizard -->
                                    <p> 1：运营商管理员用户概述：是本系统的二级用户&nbsp; 2：运营商管理员用户职责：管理所属的售货机数据，账户 <br>
                                        3：运营商管理员用户权限：拥有该系统二级权限&nbsp; 4：运营商管理员用户工作范围：覆盖二级用户。
                                    </p>
                                    <form name="regform" id="sysresUser" action=""
                                          accept-charset="utf-8"
                                          method="post"
                                          class="form-horizontal form-label-left">
                                        <div id="wizard" class="form_wizard wizard_horizontal">

                                            <ul class="wizard_steps">
                                                <li>
                                                    <a href="#step-1">
                                                        <span class="step_no">1</span>
                                                        <span class="step_descr">
                                              步骤 1<br/>
                                              <small>用户协议</small>
                                          </span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#step-2">
                                                        <span class="step_no">2</span>
                                                        <span class="step_descr">
                                              步骤 2<br/>
                                              <small>运营商管理员拥有的权限</small>
                                          </span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#step-3">
                                                        <span class="step_no">3</span>
                                                        <span class="step_descr">
                                              步骤 3<br/>
                                              <small>运营商管理员基本信息</small>
                                          </span>
                                                    </a>
                                                </li>
                                                <%--<li>--%>
                                                <%--<a href="#step-4">--%>
                                                <%--<span class="step_no">4</span>--%>
                                                <%--<span class="step_descr">--%>
                                                <%--步骤 4<br/>--%>
                                                <%--<small>运营商管理员基本信息</small>--%>
                                                <%--</span>--%>
                                                <%--</a>--%>
                                                <%--</li>--%>
                                            </ul>

                                            <div id="step-1">
                                                <h2 class="StepTitle">步骤 1 详情</h2>
                                                <p>
                                                    <strong> 特别提示：</strong>
                                                    您在使用该系统提供的各项服务之前，请您务必审慎阅读、充分理解本协议各条款内容，特别是以粗体标注的部分，包括但不限于免除或者限制责任的条款。如您不同意本服务协议及/或随时对其的修改，您可以主动停止使用该系统提供的服务；您一旦使用系统服务，即视为您已了解并完全同意本服务协议各项内容，包括系统对服务协议随时所做的任何修改，并成为该系统用户。
                                                    <br>一、总则
                                                </p>
                                                <p>
                                                    1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"提交"按钮即表示用户与该公司达成协议，完全接受本协议项下的全部条款。
                                                </p>
                                                <p>
                                                    1．2　用户注册成功后，本公司将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。
                                                </p>
                                                <p>
                                                    1．3　用户一经注册本公司帐号，除非子频道要求单独开通权限，用户有权利用该帐号使用本系统各个频道的单项服务，当用户使用各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及百度在该单项服务中发出的各类公告的同意。
                                                </p>
                                                <p>
                                                    1．4　系统会员服务协议以及各个频道单项服务条款和公告可由百度公司定时更新，并予以公示。您在使用相关服务时,应关注并遵守其所适用的相关条款。
                                                </p>
                                            </div>
                                            <div id="step-2">
                                                <h2 class="StepTitle">步骤 2 详情</h2>
                                                <p>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    1.创建运营商仓库员账户
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    2.创建运营商配货员账户
                                                </p>
                                                <br/>
                                                <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    3.对所属范围内售货机管理
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    4.运营商所属用户的增删改查
                                                </p>
                                                <br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                            </div>
                                            <div id="step-3">
                                                <%--==========开始填写系统管理员的基本信息==========--%>

                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">账户名
                                                        <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="name" class="form-control col-md-7 col-xs-12"
                                                               data-validate-length-range="3,10" name="accountName"
                                                               placeholder="" required="required" type="text">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label for="password5" class="control-label col-md-3">账户密码*</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="password5" type="password" name="password"
                                                               placeholder="请输入小于6位密码" data-validate-length-range="3,6"
                                                               class="form-control col-md-7 col-xs-12"
                                                               required="required">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label for="password6"
                                                           class="control-label col-md-3 col-sm-3 col-xs-12">确认密码*</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="password6" type="password" name="password"
                                                               placeholder="请输入小于6位密码" data-validate-linked="password"
                                                               class="form-control col-md-7 col-xs-12"
                                                               required="required">
                                                    </div>
                                                </div>

                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="telephone1">联系电话<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="telephone1" name="mobilePhone"
                                                               placeholder="请输入正确的电话号码" required="required"
                                                               data-validate-length-range="11,11"
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="name2">真实姓名
                                                        <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="name2" class="form-control col-md-7 col-xs-12"
                                                               data-validate-length-range="4" data-validate-words="4"
                                                               name="accountName" placeholder="建议不超过四个字"
                                                               required="required"
                                                               type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">角色*</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <select id="sel5" name="roleId" class="form-control">

                                                            <option value="3">运营商管理员</option>
                                                            <option value="3">运营商操作员</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="email1">用户邮箱
                                                        <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="email1" name="email" placeholder=""
                                                               required="required"
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="telephone2">QQ号码 <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="telephone2" name="qq" placeholder=""
                                                               required="required" data-validate-length-range="1,15"
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="telephone3">邮政编码 <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="telephone3" name="postcode"
                                                               placeholder=""
                                                               required="required" data-validate-length-range="1,6"
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="telephone4">身份证号码<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="telephone4" name="idcard"
                                                               placeholder="二代身份证号"
                                                               required="required" data-validate-length-range="18,18"
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="name3">通信地址<span
                                                            class="required"></span>
                                                    </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="text" id="name3" required name="postAdress"
                                                               placeholder=""
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                           for="name4">运营商单位名称
                                                        <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input id="name4" class="form-control col-md-7 col-xs-12"
                                                               data-validate-length-range="3,10" name="agencyName"
                                                               placeholder="" required="required" type="text">
                                                    </div>
                                                </div>
                                                <%--<div class="item form-group">--%>
                                                <%--<label class="control-label col-md-3 col-sm-3 col-xs-12">归属的生产商ID--%>
                                                <%--<span class="required">*</span>--%>
                                                <%--</label>--%>
                                                <%--<div class="col-md-6 col-sm-6 col-xs-12">--%>
                                                <input class="form-control col-md-7 col-xs-12"
                                                       name="factoryId" readonly="readonly"
                                                       id="factoryid"
                                                       placeholder="" required="required" type="hidden"
                                                       value="${userMess.factoryId}">
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <div class="item form-group">
                                                    <div class="col-md-6 col-md-offset-3">
                                                        <button type="reset" class="btn btn-primary"> 取消</button>
                                                        <button id="reg" type="button" class="btn btn-success"
                                                                onClick="webReg();">提交注册
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div id="step-4"></div>--%>
                                        </div>
                                    </form>
                                    <!-- End SmartWizard Content -->
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /page content end-->
        </div>
        <!-- footer content -->
        <footer>
            <div class="pull-right">
                ZJNU
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
<!-- jQuery Smart Wizard -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js'/>"></script>
<!-- validator -->
<%--<script type="text/javascript" src="<c:url value='/static/vendors/validator/validator.js'/>"></script>--%>
<!-- PNotify -->
<script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.buttons.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.nonblock.js'/>"></script>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

<%--判断消息提示脚本引用-公共引用 锁定焦点提示--%>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.tips.js'/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.ui-pnotify').remove();
    });
</script>
</body>
</html>
