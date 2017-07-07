<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/6/30
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>修改个人资料</title>
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
</head>
<script type="text/javascript">


    //   ========== 修改个人资料 start========
    function webUpdate() {
        if (onChangeInfo()) {
            var loginId = $("#loginId").val();
            var username = $("#name5").val();
            var pwd = $("#password3").val();
            var Email = $("#email2").val();
//        var roleid = $("#roleid").val();
            var phone = $("#telephone5").val();
            var code = $("#telephone7").val();
            var QQ = $("#telephone6").val();
            var card = $("#telephone8").val();
            var adress = $("#name6").val();
            $.ajax({   //使用jquery下面的ajax开启网络请求
                type: "POST",  //http请求方式为POST
                url: '<%=request.getContextPath()%>/userAction/update',   //请求修改个人资料的接口的地址
                data: {
                    password: pwd,
                    realName: username,
                    email: Email,
                    mobilePhone: phone,
                    postcode: code,
                    qq: QQ,
                    idcard: card,
                    postAdress: adress,
                    accountName: loginId
                },  // 存放数据服务接口字段为下面的字段，为别对应 修改的用户密码，真实姓名，邮箱，移动电话，邮编，qq号码，身份证号，家庭地址，指定的用户名
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,  //不用缓存
                success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                    if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                        // window.location.href = data.data.nextUrl; //返回到主页
                        alert(data.msg);
                        window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回主页
                    } else {//更新不成功
                        alert(data.msg);//弹出对话框，提示返回错误信息
                        // $("#loginId").focus();
                    }
                }
            });
        }
    }
    function onChangeInfo() {
//            判断修改的个人资料是否符合条件
//        if ($('#name5').val().length < 2 || $('#name5').val().length > 4 || $('#name5').val() == "") {
//            $('#name5').focus();
//            $('#name5').tips({
//                side: 2,
//                msg: "用户真实姓名必须为2-4个字符",
//                bg: '#B22222',
//                time: 3
//            });
//            return false;
//        }
        if ($('#password3').val().length < 6 ) {
            $('#password3').focus();
            $("#password3").tips({
                side: 2,
                msg: '密码不能小于6位',
                bg: '#B22222',
                time: 3
            });
            return false;
        }
        if ($('#password3').val().length >10 ) {
            $('#password3').focus();
            $("#password3").tips({
                side: 2,
                msg: '密码不能大于10位',
                bg: '#B22222',
                time: 3
            });
            return false;
        }
        if ($('#password4').val() != $('#password3').val()) {
            $('#password4').focus();
            $("#password4").tips({
                side: 2,
                msg: '两次密码不一致',
                bg: '#B22222',
                time: 3
            });
            return false;
        }
//          判断新修改的手机号 是否符合手机号码规则
        var sqq = /^1[34578]\d{9}$/;
        if (!sqq.test($('#telephone5').val())
            || $('#telephone5').val().length < 11
            || $('#telephone5').val().length > 14
            || $('#telephone5').val() == "") {

            $('#telephone5').focus();
            $("#telephone5").tips({
                side: 2,
                msg: '手机号不正确',
                bg: '#B22222',
                time: 3
            });
            return false;
        }
        if ($('#telephone8').val().length !== 18) {
            $('#telephone8').focus();
            $("#telephone8").tips({
                side: 2,
                msg: '请输入正确的18位二代身份号',
                bg: '#B22222',
                time: 3
            });
            return false;
        }
        return true;
    }

</script>
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
                        <h3> 更新资料
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
                                <h2>${userInfo.accountName}个人信息卡
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <%--<li class="dropdown">--%>
                                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"--%>
                                    <%--aria-expanded="false"><i class="fa fa-wrench"></i></a>--%>
                                    <%--<ul class="dropdown-menu" role="menu">--%>
                                    <%--<li><a href="#">设置 1</a>--%>
                                    <%--</li>--%>
                                    <%--<li><a href="#">设置 2</a>--%>
                                    <%--</li>--%>
                                    <%--</ul>--%>
                                    <%--</li>--%>
                                    <%--<li><a class="close-link"><i class="fa fa-close"></i></a>--%>
                                    <%--</li>--%>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <%--x_title end--%>
                            <div class="x_content">
                                <form
                                        enctype="multipart/form-data"
                                        id="formId"
                                        action=""
                                        accept-charset="utf-8"
                                        method="post"
                                        class="form-horizontal form-label-left">
                                    <input type="hidden" id="loginId" name="accountName"
                                           value="${userInfo.accountName}">
                                    <%--<div class="item form-group">--%>
                                    <%--<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name4">账户名--%>
                                    <%--<span class="required">*</span>--%>
                                    <%--</label>--%>
                                    <%--<div class="col-md-6 col-sm-6 col-xs-12">--%>
                                    <%--<input id="name4" class="form-control col-md-7 col-xs-12"--%>
                                    <%--data-validate-length-range="3,10" name="accountName"--%>
                                    <%--placeholder="" required="required" type="text" value="${userMess.password}">--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <div class="item form-group">
                                        <label for="password3" class="control-label col-md-3">账户密码*</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input id="password3" type="password" name="password"
                                                   placeholder="请输入小于6位密码" data-validate-length-range="3,6"
                                                   class="form-control col-md-7 col-xs-12" required="required"
                                                   value="${userMess.password}">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label for="password4"
                                               class="control-label col-md-3 col-sm-3 col-xs-12">确认密码*</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input id="password4" type="password" name="password"
                                                   placeholder="请输入小于6位密码" data-validate-linked="password"
                                                   value="${userMess.password}"
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
                                                   class="form-control col-md-7 col-xs-12"
                                                   value="${userMess.mobilePhone}">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name5">真实姓名
                                            <%--<span class="required">*</span>--%>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input id="name5" class="form-control col-md-7 col-xs-12"
                                            <%--data-validate-length-range="4" data-validate-words="4"--%>
                                                   name="realName" placeholder="建议不超过四个字"
                                            <%--required="required"--%>
                                                   type="text" value="${userMess.realName}">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email2">用户邮箱
                                            <%--<span class="required">*</span>--%>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="email" id="email2" name="email" placeholder=""
                                            <%--required="required" --%>
                                                   class="form-control col-md-7 col-xs-12"
                                                   value="${userMess.email}">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                               for="telephone6">QQ号码 <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="telephone6" name="qq" placeholder=""
                                                   required="required" data-validate-length-range="1,15"
                                                   class="form-control col-md-7 col-xs-12" value="${userMess.qq}">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                               for="telephone7">邮政编码
                                            <%--<span class="required">*</span>--%>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="telephone7" name="postcode" placeholder=""
                                            <%--required="required" data-validate-length-range="1,6"--%>
                                                   class="form-control col-md-7 col-xs-12" value="${userMess.postcode}">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                               for="telephone8">身份证号码
                                            <%--<span class="required">*</span>--%>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="telephone8" name="idcard"
                                                   placeholder="二代身份证号"
                                            <%--required="required" --%>
                                                   data-validate-length-range="18,18"
                                                   class="form-control col-md-7 col-xs-12" value="${userMess.idcard}">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                               for="name6">通信地址<span
                                        <%--class="required"--%>
                                        ></span>
                                        </label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" id="name6"
                                            <%--required--%>
                                                   name="postAdress"
                                                   placeholder=""
                                                   class="form-control col-md-7 col-xs-12"
                                                   value="${userMess.postAdress}">
                                        </div>
                                    </div>
                                    <div class="item form-group">
                                        <div class="col-md-6 col-md-offset-3">
                                            <button type="reset" class="btn btn-primary"> 重置</button>
                                            <button id="update" type="button" class="btn btn-success"
                                                    onClick="webUpdate();">提交更新
                                            </button>

                                            <a class="btn btn-primary submit"
                                               href="<%=request.getContextPath()%>/mvc/home">返回</a>

                                        </div>
                                    </div>


                                </form>
                            </div>
                            <%--x_content end--%>
                        </div>

                        <%--x_panel end--%>
                    </div>
                    <%--col-md-12 col-sm-12 col-xs-12 end--%>
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
</body>
</html>
