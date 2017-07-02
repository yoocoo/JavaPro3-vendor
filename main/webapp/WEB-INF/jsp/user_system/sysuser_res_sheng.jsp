<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 创建一级用户管理 </title>
    <%--引入CSS 样式 start--%>

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

    <%--=======创建系统管理员开始=======--%>
    <script type="text/javascript">
        function webSysreg() {
//            if ($('#user2').val() == "") {
//                $('#user2').focus();
//                $('#user2').tips({
//                    side: 2,
//                    msg: '用户名不能为空',
//                    bg: '#AE81FF',
//                    time: 3,
//                });
//                return false;
//            }
//            if ($('#user2').val().length < 4 || $('#user2').val().length > 10) {
//                $('#user2').focus();
//                $('#user2').tips({
//                    side: 2,
//                    msg: '用户名位数建议4-10位',
//                    bg: '#AE81FF',
//                    time: 3,
//                });
//                return false;
//            }
//            if ($('#passwd5').val().length < 6) {
//                $('#passwd5').focus();
//                $("#passwd5").tips({
//                    side: 2,
//                    msg: '密码不能小于6位',
//                    bg: '#AE81FF',
//                    time: 3
//                });
//                if ($('#passwd6').val() != $('#passwd5').val()) {
//                    $('#passwd6').focus();
//                    $("#passwd6").tips({
//                        side: 2,
//                        msg: '两次密码不一致',
//                        bg: '#AE81FF',
//                        time: 3
//                    });
//                    return false;
//                }
//            }


            var sqq = /^1[34578]\d{9}$/;
            if (!sqq.test($('#telephone1').val())
                || $('#telephone1').val().length < 11
                || $('#telephone1').val().length > 14
                || $('#telephone1').val() == "") {

                $('#telephone1').focus();
                $("#telephone1").tips({
                    side: 2,
                    msg: '手机号不正确',
                    bg: '#AE81FF',
                    time: 3
                });
                return false;
            }
            var loginname = $("#name").val();
            alert("检查系统管理员name 的值 =  " + loginname);
            var password = $("#password5").val();
            alert("检查系统管理员password 的值 =  " + password);
            var cellnumber = $("#telephone1").val();
            var realname = $("#name2").val();
            alert("检查系统管理员roleid 的值 =  1 ,而不是弹出来的值是 id= 001等");
            alert($(":selected", "#sel5").val());
            var roleid = $(":selected", "#sel5").val();
//        var roleid = $("select option:selected").val();
            var Email = $("#email1").val();
            var QQ = $("#telephone2").val();
            var code = $("#telephone3").val();
            var card = $("#telephone4").val();
            var adress = $("#name3").val();
            $.ajax({
                type: "POST",
                url: '<%=request.getContextPath()%>/userAction/sysuserResXi',
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
                },
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,
                success: function (data) {
                    if (data.code == 1) {
//                    window.location.href = data.data.nextUrl;
                        alert(data.msg);
                        window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回到后台首页
                    } else {
                        alert(data.msg);
                        $("#user").focus();
                    }
                }
            })
            ;
        }
    </script>


    <%--=====创建生产商管理 用户======--%>
    <script type="text/javascript">
        function webRes() {
//            if ($('#user1').val() == "") {
//                $('#user1').focus();
//                $('#user1').tips({
//                    side: 2,
//                    msg: '用户名不能为空',
//                    bg: '#AE81FF',
//                    time: 3,
//                });
//                return false;
//            }
//            if ($('#user1').val().length < 4 || $('#user1').val().length > 10) {
//                $('#user1').focus();
//                $('#user1').tips({
//                    side: 2,
//                    msg: '用户名位数建议4-10位',
//                    bg: '#AE81FF',
//                    time: 3,
//                });
//                return false;
//            }
//            if ($('#passwd3').val().length < 6) {
//                $('#passwd3').focus();
//                $("#passwd3").tips({
//                    side: 2,
//                    msg: '密码不能小于6位',
//                    bg: '#AE81FF',
//                    time: 3
//                });
//                return false;
//            }
//            if ($('#passwd4').val() != $('#passwd3').val()) {
//                $('#passwd4').focus();
//                $("#passwd4").tips({
//                    side: 2,
//                    msg: '两次密码不一致',
//                    bg: '#AE81FF',
//                    time: 3
//                });
//                return false;
//            }


            var sqq = /^1[34578]\d{9}$/;
            if (!sqq.test($('#telephone5').val())
                || $('#telephone5').val().length < 11
                || $('#telephone5').val().length > 14
                || $('#telephone5').val() == "") {

                $('#telephone5').focus();
                $("#telephone5").tips({
                    side: 2,
                    msg: '手机号不正确',
                    bg: '#AE81FF',
                    time: 3
                });
                return false;
            }
            var loginname = $("#name4").val();
            var password = $("#password3").val();
            var cellnumber = $("#telephone5").val();
            var realname = $("#name5").val();

//        var roleid = $("select option:selected").val();
            //        alert($(":selected","#sel").attr("id"));
            alert("生产商 贸易商 管理员roleid=  6 和10 ");
            alert($(":selected", "#sel1").val());
//        alert($("select option:selected").attr("id"));//弹出Id的值
//        alert($("select option:selected").val());//弹出  存入数据库的值
//        var roleid = $(":selected","#sel").val();
//        var roleid = $("#roleid").val();
//  测试用
            var roleid = $(":selected", "#sel1").val();

            var Email = $("#email2").val();
            var QQ = $("#telephone6").val();
            var code = $("#telephone7").val();
            var card = $("#telephone8").val();
            var adress = $("#name6").val();
            //        ==========================生产商信息=========================

            var factoryname = $("#name7").val();
            alert($(":selected", "#sel2").val());
            var factorytype = $(":selected", "#sel2").val()
//        var factorytype = $("select option:selected").val();
//        var factorylogopath = $("#factorylogopath").val();
            var sfeereturnrate = $("#telephone9").val();
            var qrreturnrate = $("#telephone10").val();
            var receiveaccount = $("#telephone11").val();
            var openbankname = $("#name8").val();
            var openaccountname = $("#name9").val();
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/userAction/sysuserResSheng",
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
                    factoryName: factoryname,
                    factoryType: factorytype,
//                factoryLogoPath: factorylogopath,
                    sfeeReturnRate: sfeereturnrate,
                    qrReturnRate: qrreturnrate,
                    receiveAccount: receiveaccount,
                    openBankName: openbankname,
                    openAccountName: openaccountname
                },
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,
                success: function (data) {
                    if (data.code == 1) {
//                    window.location.href = data.data.nextUrl;
                        alert(data.msg);
                        window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回到后台首页
                    } else {
                        alert(data.msg);
                        $("#user").focus();
                        $("#factory").focus();
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
                        <h3>新增用户</h3>
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
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>系统管理员
                                    <small>系统管理员职责：1. 2. 3.</small>
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
                                <p> 1：系统用户概述：是本系统最高统治者&nbsp; 2：系统用户职责：管理该系统的所有用户 <br>
                                    3：系统用户权限：拥有该系统最高权限&nbsp; 4：系统用户工作范围：覆盖全系统。
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
                                              <small>系统管理员拥有的权限</small>
                                          </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-3">
                                                    <span class="step_no">3</span>
                                                    <span class="step_descr">
                                              步骤 3<br/>
                                              <small>系统管理员基本信息（一）</small>
                                          </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-4">
                                                    <span class="step_no">4</span>
                                                    <span class="step_descr">
                                              步骤 4<br/>
                                              <small>系统管理员基本信息（二）</small>
                                          </span>
                                                </a>
                                            </li>
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
                                            <p>1．4　系统会员服务协议以及各个频道单项服务条款和公告可由百度公司定时更新，并予以公示。您在使用相关服务时,应关注并遵守其所适用的相关条款。
                                            </p>
                                        </div>
                                        <div id="step-2">
                                            <h2 class="StepTitle">步骤 2 详情</h2>
                                            <p>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                1.创建系统管理员用户
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                2.创建生产商管理员用户
                                            </p>
                                            <br/>
                                            <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                3.系统版本升级、维护
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                4.用户的增删改查
                                            </p>
                                            <br/>
                                            <p>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                5. 权限菜单的管理
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                6.对所有用户监控权限，对可疑账号进行冻结封号处理。
                                            </p>
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
                                                           class="form-control col-md-7 col-xs-12" required="required">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label for="password6"
                                                       class="control-label col-md-3 col-sm-3 col-xs-12">确认密码*</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="password6" type="password" name="password"
                                                           placeholder="请输入小于6位密码" data-validate-linked="password"
                                                           class="form-control col-md-7 col-xs-12" required="required">
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
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name2">真实姓名
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name2" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="4" data-validate-words="4"
                                                           name="accountName" placeholder="建议不超过四个字" required="required"
                                                           type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">角色*</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="sel5" name="roleId" class="form-control">
                                                        <option value="1" id="00"> 系统管理员A</option>
                                                        <option value="1" id="001"> 系统管理员B</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="step-4">
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email1">用户邮箱
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="email1" name="email" placeholder=""
                                                           required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone2">QQ号码 <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone2" name="qq" placeholder=""
                                                           required="required" data-validate-length-range="1,15"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone3">邮政编码 <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone3" name="postcode" placeholder=""
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
                                                        class="required">*</span>
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" id="name3" required name="postAdress"
                                                           placeholder=""
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    <button type="reset" class="btn btn-primary"> 取消</button>
                                                    <button id="reg" type="button" class="btn btn-success"
                                                            onClick="webSysreg();">提交
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                                <!-- End SmartWizard Content -->
                                <h2>生产商管理员
                                    <small>生产商管理员职责：1. 2. 3.</small>
                                </h2>
                                <p> 1：生产商用户概述：系统的一级用户组织管理者&nbsp; 2：生产商用户职责：管理所属二级运营商账户<br>
                                    3：生产商用户权限：拥有该系统一级用户的权限&nbsp; 4：生产商用户工作范围：覆盖系统一级用户所有权限范围。
                                </p>
                                <!-- Tabs -->
                                <form class="form-horizontal form-label-left">
                                    <div id="wizard_verticle" class="form_wizard wizard_verticle">
                                        <ul class="list-unstyled wizard_steps">
                                            <li>
                                                <a href="#step-11">
                                                    <span class="step_no"> 1</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-22">
                                                    <span class="step_no"> 2</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-33">
                                                    <span class="step_no"> 3</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-44">
                                                    <span class="step_no"> 4</span>
                                                </a>
                                            </li>
                                        </ul>

                                        <div id="step-11">
                                            <h2 class="StepTitle">步骤 1详情</h2>


                                            <span class="section">用户协议</span>
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
                                            <p>1．4　系统会员服务协议以及各个频道单项服务条款和公告可由本公司定时更新，并予以公示。您在使用相关服务时,应关注并遵守其所适用的相关条款。
                                            </p>


                                        </div>
                                        <div id="step-22">
                                            <h2 class="StepTitle">步骤 2详情</h2>
                                            <span class="section">权限范围</span>
                                            <p>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                1.创建生产商管理员用户，属于系统的一级管理员用户
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                2.生产商管理员用户可以创建自己所属的运营商账户
                                            </p>
                                            <br/>
                                            <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                3.所属管辖范围内运营商账户增删改查，以及新增的运营商账户信息审核
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                4.所属管辖范围内所有的售货机数据信息的管理
                                            </p>
                                            <br/>
                                            <p>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                5.对所属管辖范围内二级用户拥有监控权限，对可疑二级用户账号进行冻结封号处理
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                            </p>
                                            <br/>
                                            <br/>
                                            <br/>
                                            <br/>
                                        </div>
                                        <div id="step-33">
                                            <h2 class="StepTitle">步骤 3详情</h2>
                                            <span class="section">用户信息</span>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name4">账户名
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name4" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="3,10" name="accountName"
                                                           placeholder="" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label for="password3" class="control-label col-md-3">账户密码*</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="password3" type="password" name="password"
                                                           placeholder="请输入小于6位密码" data-validate-length-range="3,6"
                                                           class="form-control col-md-7 col-xs-12" required="required">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label for="password4"
                                                       class="control-label col-md-3 col-sm-3 col-xs-12">确认密码*</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="password4" type="password" name="password"
                                                           placeholder="请输入小于6位密码" data-validate-linked="password"
                                                           class="form-control col-md-7 col-xs-12" required="required">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone5">联系电话<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone5" name="mobilePhone"
                                                           placeholder="请输入正确的电话号码" required="required"
                                                           data-validate-length-range="11,11"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name5">真实姓名
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name5" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="4" data-validate-words="4"
                                                           name="accountName" placeholder="建议不超过四个字" required="required"
                                                           type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">角色*</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="sel1" name="roleId" class="form-control">
                                                        <option value="8">出租商管理员</option>
                                                        <option value="6">生产商管理员</option>
                                                        <option value="10"> 贸易商管理员</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email2">用户邮箱
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="email2" name="email" placeholder=""
                                                           required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone6">QQ号码 <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone6" name="qq" placeholder=""
                                                           required="required" data-validate-length-range="1,15"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone7">邮政编码 <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone7" name="postcode" placeholder=""
                                                           required="required" data-validate-length-range="1,6"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone8">身份证号码<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone8" name="idcard"
                                                           placeholder="二代身份证号"
                                                           required="required" data-validate-length-range="18,18"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="name6">通信地址<span
                                                        class="required">*</span>
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" id="name6" required name="postAdress"
                                                           placeholder=""
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="step-44">
                                            <h2 class="StepTitle">步骤 4详情</h2>
                                            <span class="section">生产商信息</span>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name7">生产商名称
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name7" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="4" data-validate-words="4"
                                                           name="factoryName" placeholder="建议不超过四个字" required="required"
                                                           type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">生产商类型*</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="sel2" name="factoryType" class="form-control">
                                                        <option value="生产商" id="0">生产商</option>
                                                        <option value="贸易商" id="1">贸易商</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone9">服务费返回率 <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone9" name="sfeeReturnRate"
                                                           placeholder="请输入有效小数位"
                                                           required="required" data-validate-length-range="0,6"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone10">非现金返回率 <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone10" name="qrReturnRate"
                                                           placeholder="请输入有效小数位"
                                                           required="required" data-validate-length-range="0,6"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                       for="telephone11">开户账号 <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="telephone11" name="receiveAccount"
                                                           placeholder=""
                                                           required="required" data-validate-length-range="10,25"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name8">开户行
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name8" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="4,10"
                                                           name="openBankName" placeholder="输入银行全称" required="required"
                                                           type="text">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name9">开户名
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name9" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="2,4"
                                                           name="openAccountName" placeholder="输入持卡人姓名"
                                                           required="required"
                                                           type="text">
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    <button type="reset" class="btn btn-primary"> 取消</button>
                                                    <button id="reg1" type="button" class="btn btn-success"
                                                            onClick="webRes();">提交注册
                                                    </button>
                                                </div>
                                            </div>

                                        </div>

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
<script type="text/javascript" src="<c:url value='/static/vendors/validator/validator.js'/>"></script>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>


</body>
</html>