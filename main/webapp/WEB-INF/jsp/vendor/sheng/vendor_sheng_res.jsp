<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/7/14
  更新时间： 2017 年 07 月 25 日
  Time: 9:24
  说明： 生产商注册 售货机业务页面
  To change this template use File | Settings | File Templates.
--%>
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

    <title> 生产商注册售货机 </title>
    <%--引入CSS 样式 start--%>
    <link rel="shortcut icon" href="<c:url value='/static/img/favicon.ico'/>"/>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/bootstrap/dist/css/bootstrap.min.css'/>">
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/font-awesome/css/font-awesome.min.css'/>">
    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/nprogress/nprogress.css'/>">
    <!-- Switchery -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/switchery/dist/switchery.min.css'/>">
    <!-- bootstrap-daterangepicker -->
    <link rel="stylesheet" href="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.css'/>">
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
<<%--=======创建系统管理员开始=======--%>
<script type="text/javascript">
    function webShengreg() {
        if ($('#name1').val() == "") {
            $('#name1').focus();
            $('#name1').tips({
                side: 2,
                msg: '售货机名称不能为空',
                bg: '#B22222',
                time: 3,
            });
            return false;
        }
        if ($('#key').val() == "") {
            $('#key').focus();
            $('#key').tips({
                side: 2,
                msg: '售货机名称不能为空',
                bg: '#B22222',
                time: 3,
            });
            return false;
        }
        if ($('#maxChannel').val() < 10 || $('#maxChannel').val() > 150) {
            $('#maxChannel').focus();
            $('#maxChannel').tips({
                side: 2,
                msg: '货道数量太少或超出最大货道数，请注意',
                bg: '#B22222',
                time: 3,
            });
            return false;
        }
        if ($('#password').val().length < 6) {
            $('#password').focus();
            $("#password").tips({
                side: 2,
                msg: '密码不能小于6位',
                bg: '#B22222',
                time: 3
            });
        }
        if ($('#password').val().length > 8) {
            $('#password').focus();
            $("#password").tips({
                side: 2,
                msg: '密码不能大于8位',
                bg: '#B22222',
                time: 3
            });
            return false;
        }


        var name1 = $("#name1").val();
        var password = $("#password").val();
        var factoryid = $("#factoryid").val();
        var timea = $("#timea").val();
        var timeb = $("#timeb").val();

        alert("expiredate:" + timea);
//        var expiredate = document.getElementById('time1').value;
//        var dateofproduct = document.getElementById('time2').value;


//        alert("expiredate:" + expiredate);
        alert("dateofproduct:" + timeb);

        var softversion = $("#softversion").val();
        var hardwareversion = $("#hardwareversion").val();
        var maxChannel = $("#maxChannel").val();
        var modelnumber = $("#modelnumber").val();

        var kid = $("#kid").val();
        var key = $("#key").val();
//        var dateofproduct = $("#dateofproduct").val();
        var abled = $("input[type=checkbox]:checked").val();//获取被选中按钮的值
        var cloudset = $(":selected", "#sel5").val();
//        var cloudset = $("#cloudset:checked").val();//获取被选中按钮的值

//        var cloudset = $(":selected", "#cloudset").val();
        console.log("云端："+cloudset);


        $.ajax({
            type: "POST",
            url: '<%=request.getContextPath()%>/vendorAction/RegVendor',
            data: {
                vendorName: name1,
                commPassword: password,
                factoryId: factoryid,

                expireDate: timea,
                softVersion: softversion,
                hardwareVersion: hardwareversion,

                maxChannelNum: maxChannel,
                modelNumber: modelnumber,

                thirdpayId: kid,
                thirdpayKey: key,

                wirelessPayEnabled: abled,
                dateOfProduct: timeb,
                cloudSet:cloudset

            },
            dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code == 1) {
//                    alert(data.msg);
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
//                    alert(data.msg);
                    $(function () {
                        new PNotify({
                            title: '发现错误，请根据提示重新操作',
                            text: data.msg,
                            type: 'error',
                            styling: 'bootstrap3'
                        });
                    });
                    $("#vendor").focus();
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
                        <h3>新增售货机</h3>
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
                                <h2>生产商管理员
                                    <%--<small>系统管理员职责：1. 2. 3.</small>--%>
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>

                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <!-- Smart Wizard -->
                                <p>
                                    　　1、产品功能适配性好，与被测被控对象功能几乎完全匹配，具有一定的扩展性但不以扩展为主要目的，因而产品性价比很高;
                                    　　2、装置小型化是主要体现之一，体现为紧凑型设计，结构设计没有标准可参考，要充分考虑对外接口及安装空间合理利用;
                                    　　3、可靠性要求高，在电气功能满足可靠性设计基础上，要仔细考虑散热设计、电磁兼容设计、防尘防水设计、抗震动设计等可靠性设计内容;
                                    　　4、超低功耗无风扇设计为主流。由于装置小型化后，散热能力有限，且嵌入式系统MTBF（平均无故障工作时间）要求也很高，特别在无人值守类应用，超低功耗无风扇设计成为必须。
                                </p>
                                <form name="regform" id="vendorreg" action=""
                                      accept-charset="utf-8"
                                      method="POST"
                                      class="form-horizontal form-label-left">
                                    <div id="wizard" class="form_wizard wizard_horizontal">

                                        <ul class="wizard_steps">
                                            <%--<li>--%>
                                            <%--<a href="#step-1">--%>
                                            <%--<span class="step_no">1</span>--%>
                                            <%--<span class="step_descr">--%>
                                            <%--步骤 1<br/>--%>
                                            <%--<small>用户协议</small>--%>
                                            <%--</span>--%>
                                            <%--</a>--%>
                                            <%--</li>--%>
                                            <li>
                                                <a href="#step-2">
                                                    <span class="step_no">1</span>
                                                    <span class="step_descr">
                                              步骤 1<br/>
                                              <small>售货机相关条率</small>
                                          </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-3">
                                                    <span class="step_no">2</span>
                                                    <span class="step_descr">
                                              步骤 2<br/>
                                              <small>售货机基本信息</small>
                                          </span>
                                                </a>
                                            </li>
                                            <%--<li>--%>
                                            <%--<a href="#step-4">--%>
                                            <%--<span class="step_no">3</span>--%>
                                            <%--<span class="step_descr">--%>
                                            <%--步骤 3<br/>--%>
                                            <%--<small>系统管理员基本信息（二）</small>--%>
                                            <%--</span>--%>
                                            <%--</a>--%>
                                            <%--</li>--%>
                                        </ul>

                                        <%--<div id="step-1">--%>
                                        <%--<h2 class="StepTitle">步骤 1 详情</h2>--%>
                                        <%--<p>--%>
                                        <%--<strong> 特别提示：</strong>--%>
                                        <%--您在使用该系统提供的各项服务之前，请您务必审慎阅读、充分理解本协议各条款内容，特别是以粗体标注的部分，包括但不限于免除或者限制责任的条款。如您不同意本服务协议及/或随时对其的修改，您可以主动停止使用该系统提供的服务；您一旦使用系统服务，即视为您已了解并完全同意本服务协议各项内容，包括系统对服务协议随时所做的任何修改，并成为该系统用户。--%>
                                        <%--<br>一、总则--%>
                                        <%--</p>--%>
                                        <%--<p>--%>
                                        <%--1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"提交"按钮即表示用户与该公司达成协议，完全接受本协议项下的全部条款。--%>
                                        <%--</p>--%>
                                        <%--<p>--%>
                                        <%--1．2　用户注册成功后，本公司将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。--%>
                                        <%--</p>--%>
                                        <%--<p>--%>
                                        <%--1．3　用户一经注册本公司帐号，除非子频道要求单独开通权限，用户有权利用该帐号使用本系统各个频道的单项服务，当用户使用各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及百度在该单项服务中发出的各类公告的同意。--%>
                                        <%--</p>--%>
                                        <%--<p>1．4　系统会员服务协议以及各个频道单项服务条款和公告可由百度公司定时更新，并予以公示。您在使用相关服务时,应关注并遵守其所适用的相关条款。--%>
                                        <%--</p>--%>
                                        <%--</div>--%>
                                        <div id="step-2">
                                            <h2 class="StepTitle">步骤 1 详情</h2>
                                            <p>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                1.  信息安全产品包括VPN、无线审计、入侵检测系统、UTM、防病毒过滤、内容审计系统等安全应用领域。
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                2.针对环保、能源监测项目推出的能源监测端系统、环境监测端系统、智能电力控制系统。
                                            </p>
                                            <br/>
                                            <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                3.针对物联网网关项目推出的多协议数据转换和采集终端、交互式数字控制平台、移动语音视频终端、智能物流柜专用控制器。
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                4. 针对工业控制推出的4U工业服务器、壁挂式控制终端、工业平板电脑
                                            </p>
                                            <br/>
                                            <p>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                5. 智慧零售系统包括智慧厨房、智能商铺、智慧药房、信息惠民终端等
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                6.可靠安全的智能系统及云运维平台，提供多种应用，全方位自主满足用户各种需求。
                                            </p>
                                            <br/>
                                            <br/>
                                            <br/>
                                            <br/>
                                        </div>
                                        <div id="step-3">
                                            <%--==========开始填写售货机的基本信息==========--%>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name1">售货机名称
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name1" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="3,10" name="vendorName"
                                                           placeholder="请严格输入售货机名称" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label for="password"
                                                       class="control-label col-md-3 col-sm-3 col-xs-12">售货机通讯密码</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="password" type="text" name="commPassword"
                                                           placeholder="请输入6-10位密码" data-validate-linked="password"
                                                           class="form-control col-md-7 col-xs-12"
                                                    <%--required="required"--%>
                                                    >
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3">出厂生产商ID*</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="factoryid" type="text" name="factoryId"
                                                           placeholder="" value="${userMess.factoryId}"
                                                           disabled="disabled"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">服务停止时间</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" name="expireDate"
                                                           placeholder="" id="timea"
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>


                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                >软件版本号<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="softversion" name="softVersion"
                                                           placeholder=""
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">硬件版本号
                                                    <span class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="hardwareversion" class="form-control col-md-7 col-xs-12"
                                                           data-validate-length-range="4" data-validate-words="4"
                                                           name="hardwareVersion" placeholder=""
                                                           type="text">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">货道数
                                                    <span class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="maxChannel" name="maxChannelNum"
                                                           placeholder=""
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                >机器型号 <span class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="modelnumber" name="modelNumber"
                                                           placeholder=""
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">第三方账户Id<span
                                                            class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="kid" name="thirdpayId" placeholder=""
                                                               class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">第三方账户Key<span
                                                        class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="key" name="thirdpayKey" placeholder=""
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">是否开启无线支付</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="">
                                                        <label>
                                                            <input type="checkbox" id="abled" name="wirelessPayEnabled"
                                                                   class="js-switch" value="1" checked/> 无线支付
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                                <div class="item form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">是否开启云端商城模式</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <select id="sel5" name="cloudSet" class="form-control">
                                                            <option value="1" id="00"> 开启云端商城模式</option>
                                                            <option value="0" id="001"> 无云端商城</option>
                                                        </select>
                                                </div>
                                                </div>
                                            <%--<div class="item form-group">--%>
                                            <%--<label--%>
                                            <%--class="control-label col-md-3 col-sm-3 col-xs-12">出厂日期</label>--%>
                                            <%--<div  id="reportrange2"   value="" type="text" class="pull-left" name="reportrange"--%>
                                            <%--style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">--%>
                                            <%--<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>--%>
                                            <%--<span></span>--%>
                                            <%--<b class="caret"></b>--%>
                                            <%--<input type="hidden" name="dateOfProduct" class="from" id="inputSuccess2Status4" value="">--%>
                                            <%--<input type="hidden" name="endTime" class="to" id="endTime1" value="">--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">出厂日期</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" name="dateOfProduct" id="timeb"
                                                           placeholder=""
                                                           class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    <button type="reset" class="btn btn-primary"> 取消</button>
                                                    <button id="reg" type="button" class="btn btn-success"
                                                            onClick="webShengreg();">提交
                                                    </button>
                                                </div>
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
<%--比较有利用价值的系统后台模板的表单验证--%>
<script type="text/javascript"
        src="<c:url value='/static/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js'/>"></script>
<!-- validator -->
<%--<script type="text/javascript" src="<c:url value='/static/vendors/validator/validator.js'/>"></script>--%>
<!-- bootstrap-daterangepicker -->
<script type="text/javascript" src="<c:url value='/static/vendors/moment/min/moment.min.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.js'/>"></script>
<!-- Switchery -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/switchery/dist/switchery.min.js'/>"></script>
<!-- PNotify -->
<script type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.js'/>"></script>
<script  type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.buttons.js'/>"></script>
<script  type="text/javascript" src="<c:url value='/static/vendors/pnotify/dist/pnotify.nonblock.js'/>"></script>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>
<%--判断消息提示脚本引用-公共引用 锁定焦点提示--%>
<%--<script type="text/javascript" src="<c:url value='/static/js/common/jquery.tips.js'/>"></script>--%>
<script type="text/javascript">
    $(function () {
        $('input[name="expireDate"]').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
//                format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间
                format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 不带时间日期  显示的日期格式  没有用处
                locale: {
//                    format: 'YYYY-MM-DD ', //控件中from和to

                    format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间 可以保证数据库不会出错
                    daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                        '七月', '八月', '九月', '十月', '十一月', '十二月']
                }
            },
            function (start, end, label) {
                var time1 = start.format('YYYY-MM-DD HH:mm:ss');
                document.getElementById('timea').value = time1;
            });
    });
</script>
<script type="text/javascript">
    $(function () {
        $('input[name="dateOfProduct"]').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
//                format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间
                format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 不带时间日期  显格式示日期  没有用处
                locale: {
                    format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式 全格式时间,这样可以保证数据库不会出错

//                    format: 'YYYY-MM-DD ', //控件中from和to 显示的日期格式 全格式时间
                    daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                        '七月', '八月', '九月', '十月', '十一月', '十二月']
                }
            },
            function (start, end, label) {
                var time2 = start.format('YYYY-MM-DD HH:mm:ss');
                document.getElementById('timeb').value = time2;
            });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.ui-pnotify').remove();
    });
</script>
</body>
</html>

