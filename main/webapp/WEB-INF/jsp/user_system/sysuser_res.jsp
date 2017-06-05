<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/5/21
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <title>系统用户sysuser-res</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式--%>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>

</head>
<%--=====创建生产商管理 用户======--%>
<script type="text/javascript">
    function webRes() {
        if ($('#user1').val() == "") {
            $('#user1').focus();
            $('#user1').tips({
                side: 2,
                msg: '用户名不能为空',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#user1').val().length < 4 || $('#user1').val().length > 10) {
            $('#user1').focus();
            $('#user1').tips({
                side: 2,
                msg: '用户名位数建议4-10位',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#passwd3').val().length < 6) {
            $('#passwd3').focus();
            $("#passwd3").tips({
                side: 2,
                msg: '密码不能小于6位',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        if ($('#passwd4').val() != $('#passwd3').val()) {
            $('#passwd4').focus();
            $("#passwd4").tips({
                side: 2,
                msg: '两次密码不一致',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }


        var sqq = /^1[34578]\d{9}$/;
        if (!sqq.test($('#cellnumber1').val())
            || $('#cellnumber1').val().length < 11
            || $('#cellnumber1').val().length > 14
            || $('#cellnumber1').val() == "") {

            $('#cellnumber1').focus();
            $("#cellnumber1").tips({
                side: 2,
                msg: '手机号不正确',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        var loginname = $("#user1").val();
        var password = $("#passwd3").val();
        var cellnumber = $("#cellnumber1").val();
        var realname = $("#realname1").val();
        var roleid = $("select option:selected").val();
        //        alert($(":selected","#sel").attr("id"));
        alert("生产商 贸易商 管理员roleid=  6 和10 ");
        alert($(":selected", "#sel").val());
//        alert($("select option:selected").attr("id"));//弹出Id的值
//        alert($("select option:selected").val());//弹出  存入数据库的值
//        var roleid = $(":selected","#sel").val();
//        var roleid = $("#roleid").val();
//  测试用
        var roleid = $(":selected", "#sel1").val();

        var Email = $("#Email1").val();
        var QQ = $("#QQ1").val();
        var code = $("#code1").val();
        var card = $("#card1").val();
        var adress = $("#adress1").val();
        //        ==========================生产商信息=========================

        var factoryname = $("#factoryname").val();

        alert($(":selected", "#sel2").val());
        var factorytype = $(":selected", "#sel2").val()
//        var factorytype = $("select option:selected").val();

//        var cashtablename= $("#cashtablename").val();
//        var ordertablename= $("#ordertablename").val();
//        var saletablename= $("#saletablename").val();
//        var alarmtablename= $("#alarmtablename").val();
        var factorylogopath = $("#factorylogopath").val();
        var sfeereturnrate = $("#sfeereturnrate").val();
        var qrreturnrate = $("#qrreturnrate").val();
        alert($(":selected", "#sel3").val());
        var receiveaccount = $(":selected", "#sel3").val();
//        var receiveaccount = $("select option:selected").val();
        var openbankname = $("#openbankname").val();
        var openaccountname = $("#openaccountname").val();
        var factoryname = $("#factoryname").val();
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
//                cashTableName:cashtablename,
//                orderTableName: ordertablename,
//                saleTableName:saletablename,
//                alarmTableName:alarmtablename,
                factoryLogoPath: factorylogopath,
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
<%--=======创建系统管理员开始=======--%>
<script type="text/javascript">
    function webSysreg() {
        if ($('#user2').val() == "") {
            $('#user2').focus();
            $('#user2').tips({
                side: 2,
                msg: '用户名不能为空',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#user2').val().length < 4 || $('#user2').val().length > 10) {
            $('#user2').focus();
            $('#user2').tips({
                side: 2,
                msg: '用户名位数建议4-10位',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#passwd5').val().length < 6) {
            $('#passwd5').focus();
            $("#passwd5").tips({
                side: 2,
                msg: '密码不能小于6位',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        if ($('#passwd6').val() != $('#passwd5').val()) {
            $('#passwd6').focus();
            $("#passwd6").tips({
                side: 2,
                msg: '两次密码不一致',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }


        var sqq = /^1[34578]\d{9}$/;
        if (!sqq.test($('#cellnumber2').val())
            || $('#cellnumber2').val().length < 11
            || $('#cellnumber2').val().length > 14
            || $('#cellnumber2').val() == "") {

            $('#cellnumber2').focus();
            $("#cellnumber2").tips({
                side: 2,
                msg: '手机号不正确',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        var loginname = $("#user2").val();
        var password = $("#passwd5").val();
        var cellnumber = $("#cellnumber2").val();
        var realname = $("#realname2").val();
        alert("检查系统管理员roleid 的值 =  1 ,而不是弹出来的值是 id= 001等");
        alert($(":selected", "#sel5").val());
        var roleid = $(":selected", "#sel5").val();
//        var roleid = $("select option:selected").val();
        var Email = $("#Email2").val();
        var QQ = $("#QQ2").val();
        var code = $("#code2").val();
        var card = $("#card2").val();
        var adress = $("#adress2").val();
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

<%--=======创建运营商 开始=======--%>
<script type="text/javascript">
    function webReg() {
        if ($('#user').val() == "") {
            $('#user').focus();
            $('#user').tips({
                side: 2,
                msg: '用户名不能为空',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#user').val().length < 4 || $('#user').val().length > 10) {
            $('#user').focus();
            $('#user').tips({
                side: 2,
                msg: '用户名位数建议4-10位',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#passwd').val().length < 6) {
            $('#passwd').focus();
            $("#passwd").tips({
                side: 2,
                msg: '密码不能小于6位',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        if ($('#passwd2').val() != $('#passwd').val()) {
            $('#passwd2').focus();
            $("#passwd2").tips({
                side: 2,
                msg: '两次密码不一致',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }


        var sqq = /^1[34578]\d{9}$/;
        if (!sqq.test($('#cellnumber').val())
            || $('#cellnumber').val().length < 11
            || $('#cellnumber').val().length > 14
            || $('#cellnumber').val() == "") {

            $('#cellnumber').focus();
            $("#cellnumber").tips({
                side: 2,
                msg: '手机号不正确',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        var loginname = $("#user").val();
        var password = $("#passwd").val();
        var cellnumber = $("#cellnumber").val();
        var realname = $("#realname").val();
        alert("检查运营商管理员roleid 的值 =  3 ,而不是弹出来的值是 id= 2");
        alert($(":selected", "#sel").val());
        var roleid = $(":selected", "#sel").val();
//        var roleid = $("select option:selected").val();
        var Email = $("#Email").val();
        var QQ = $("#QQ").val();
        var code = $("#code").val();
        var card = $("#card").val();
        var adress = $("#adress").val();

//        =========================
        var agencyname = $("#agencyname").val();

//        var agencyid = $("#agencyid").val();
//        alert(agencyid);
        $.ajax({
            type: "POST",
            url: '<%=request.getContextPath()%>/userAction/sysuserRes',
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
                agencyId: agencyid
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
                    $("#agency").focus();
                }
            }
        })
        ;
    }
</script>
<body>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_body/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="../index_body/index_siderbar.jsp" %>
<%--页面功能箱子--%>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来" class="tip-bottom"><i
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/userAction/sysuserRes"
                                                 class="current">一级用户管理</a>
        </div>
        <div class="container-fluid">
            <hr>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="widget-box">
                <div class="widget-title">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab1">运营商管理用户</a></li>
                        <li><a data-toggle="tab" href="#tab2">生产商管理用户</a></li>
                        <li><a data-toggle="tab" href="#tab3">系统管理用户</a></li>

                    </ul>
                </div>
                <div class="widget-content tab-content">
                    <%--==========================tab 5.29  加长版本===========================================--%>
                    <div id="tab1" class="tab-pane active">
                        <%--<div class="alert alert-error alert-block">--%>
                        <%--<a class="close" data-miss="alert" href="">×</a>--%>
                        <%--<h4 class="alert-heading">新建运营商用户</h4>--%>
                        <%--1运营商角色概述：************** 2：运营商职责：********* 3：运营商权限：********** 4 运营商工作范围：***********--%>
                        <%--</div>--%>
                        <div class="alert alert-error">
                            <button class="close" data-dismiss="alert">×</button>
                            <strong>新建运营商用户： </strong> 1运营商角色概述：************** 2：运营商职责：********* 3：运营商权限：********** 4
                            运营商工作范围：***********
                        </div>
                        <div id="web_reg">
                            <form name="regform" id="regUser" class="form-horizontal"
                                  action=""
                                  accept-charset="utf-8"
                                  method="post">
                                <%--<input type="hidden" id="agencyid" name="agencyId" value="${agencyInfo.agencyId}">--%>
                                <div class="control-group success ">
                                    <label class="control-label span4">账户名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="user" name="accountName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;建立生产商管理用户，账户名唯一，可唯一识别身份</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">用户密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请输入小于6位密码，并保管好密码</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">确认密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd2" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请输入小于6位密码，同上，并保管好密码</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">联系电话:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="cellnumber" name="mobilePhone"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的电话号码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;正确的联系的方式，方便及时通知信息</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">真实姓名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="realname" name="realName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写真实姓名，建议不超过四个字</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label">角色类型</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel" name="roleId" placeholder="请选择角色种类"
                                                    aria-describedby="basic-addon1">
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="2"> 系统操作员</option>--%>
                                                <option value="3" id="2">运营商管理员</option>
                                                <%--<option value="4">运营商配货员</option>--%>
                                                <option value="5">运营商仓库员</option>
                                                <%--<option value="6" id="3">生产商管理员</option>--%>
                                                <%--<option value="7">生产商操作员</option>--%>
                                                <%--<option value="8" id="4">出租商管理员</option>--%>
                                                <%--<option value="9">出租商操作员</option>--%>
                                                <%--<option value="10" id="5"> 贸易商管理员</option>--%>
                                            </select>
                                        </div>
                                        <span class="help-inline">*1运营商管理员：负责管理运营商组织<br/> *2.运营商仓库员：负责管理商品</span>

                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">用户邮箱:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="Email" name="email"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效邮箱，方便找回密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;填写邮箱，可有效管理账户密码，方便找回密码</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">QQ账号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="QQ" name="qq"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效QQ号码，方便联系">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;QQ号码，方便信息交流，建议填写</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">邮政编码:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="code" name="postcode"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6位有效邮编">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;邮政编码 如：100100</span>

                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">身份证号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="card" name="idcard"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写有效身份证号信息</span>
                                    </div>
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">家庭住址:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="adress" name="postAdress"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;用户地址，建议不超过50个字，方便收寄货品</span>
                                    </div>
                                </div>
                                <%--<div class="alert alert-error alert-block">--%>
                                <%--<a class="close" data-miss="alert" href="#">×</a>--%>
                                <%--<h4 class="alert-heading">运营商单位描述声明：</h4>--%>
                                <%--运营商：**************--%>
                                <%--</div>--%>
                                <div class="alert alert-error">
                                    <button class="close" data-dismiss="alert">×</button>
                                    <strong>运营商单位描述声明： </strong> 运营商：**************
                                </div>
                                <div class="control-group success">
                                    <label class="control-label span4">运营商单位名称:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="agencyname" name="agencyName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;运营商单位名称，是为了更详细描述运营信息</span>
                                    </div>
                                </div>
                                <label class="control-label center"></label>
                                <div class="controls">
                                    <%--<button type="reset" class="btn btn-danger" >重置</button>--%>
                                    <input type="button" class="btn btn-success" id="reg" onclick="webReg();"
                                           value="提交创建"/>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%--=========================tab1======5.30======双列版=======================================================--%>
                    <%--<div id="tab3" class="tab-pane active">--%>
                    <%--<p> 新建系统管理员组织</p>--%>
                    <%--<div id="web_sysreg">--%>
                    <%--<form name="regform" id="regUser"--%>
                    <%--action=""--%>
                    <%--accept-charset="utf-8"--%>
                    <%--method="post">--%>
                    <%--<p> 系统用户信息</p>--%>
                    <%--<div class=" controls controls-row">--%>
                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                    <%--<label class="span1 m-wrap">∗账户名:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="user" name="accountName"--%>
                    <%--data-original-title="请输入6-10位有效数字或字母">--%>
                    <%--</div>--%>
                    <%--<label class="span1 m-wrap">∗联系电话:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="cellnumber" name="mobilePhone"--%>
                    <%--data-original-title="请输入正确的电话号码">--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="control-group info">--%>
                    <%--<div class=" controls controls-row">--%>
                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                    <%--<label class="span1 m-wrap">∗用户密码:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="password" placeholder="" id="passwd" name="password"--%>
                    <%--data-original-title="请输入小于6位密码">--%>
                    <%--</div>--%>
                    <%--<label class="span1 m-wrap">∗确认密码:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="password" placeholder="" id="passwd2" name="password"--%>
                    <%--data-original-title="请输入小于6位密码">--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class=" controls controls-row">--%>
                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                    <%--<label class="span1 m-wrap">∗真实姓名:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="realname" name="realName"--%>
                    <%--data-original-title="请输入6-10位有效数字或字母">--%>
                    <%--</div>--%>
                    <%--<label class="span1 m-wrap">用户邮箱:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="Email" name="email"--%>
                    <%--data-original-title="请输入有效邮箱，方便找回密码">--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class=" controls controls-row">--%>
                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                    <%--<label class="span1 m-wrap">∗QQ账号:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="QQ3" name="qq"--%>
                    <%--data-original-title="请输入有效QQ号码，方便联系">--%>
                    <%--</div>--%>
                    <%--<label class="span1 m-wrap">∗邮政编码:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="code" name="postcode"--%>
                    <%--data-original-title="请输入6位有效邮编">--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class=" controls controls-row">--%>
                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                    <%--<label class="span1 m-wrap">∗身份证号:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="card" name="idcard"--%>
                    <%--data-original-title="请输入正确的18位身份证信息">--%>
                    <%--</div>--%>
                    <%--<label class="span1 m-wrap">∗家庭住址:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="adress" name="postAdress"--%>
                    <%--data-original-title="请输入正确的18位身份证信息">--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class=" controls controls-row">--%>
                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                    <%--<label class="span1 m-wrap">∗单位名称:</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<input type="text" placeholder="" id="agencyname" name="agencyName"--%>
                    <%--data-original-title="请输入有效信息">--%>
                    <%--</div>--%>
                    <%--<label class="span1 m-wrap">∗角色类型</label>--%>
                    <%--<div class="span5 m-wrap">--%>
                    <%--<div class="form-group span4 m-wrap ">--%>
                    <%--<select class="form-control" id="sel" name="roleId" placeholder="请选择角色种类"--%>
                    <%--aria-describedby="basic-addon1">--%>
                    <%--<option value="3">运营商管理员</option>--%>
                    <%--&lt;%&ndash;<option value="4" >运营商配货员</option>&ndash;%&gt;--%>
                    <%--<option value="5">运营商仓库员</option>--%>
                    <%--</select>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<label class="control-label center"></label>--%>
                    <%--<div class="controls">--%>
                    <%--&lt;%&ndash;<button type="reset" class="btn btn-danger" >重置</button>&ndash;%&gt;--%>
                    <%--<input type="button" class="btn btn-success" id="reg" onclick="webReg();"--%>
                    <%--value="提交创建"/>--%>
                    <%--</div>--%>
                    <%--</form>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--=======================================5.30===============tab1======================================================================--%>

                    <div id="tab2" class="tab-pane">
                        <%--<div class="alert alert-error alert-block">--%>
                        <%--<a class="close" data-miss="alert" href="">×</a>--%>
                        <%--<h4 class="alert-heading">新建生产商用户</h4>--%>
                        <%--1生产商角色概述：************** 2：生产商职责：********* 3：生产商权限：********** 4 ：生产商工作范围：***********--%>
                        <%--</div>--%>
                        <div class="alert alert-error">
                            <button class="close" data-dismiss="alert">×</button>
                            <strong>新建生产商用户 </strong> 1生产商角色概述：************** 2：生产商职责：********* 3：生产商权限：********** 4
                            ：生产商工作范围：***********
                        </div>
                        <div id="web_res">
                            <form name="resform" id="resUser" class="form-horizontal"
                                  action=""
                                  accept-charset="utf-8"
                                  method="post">

                                <div class="control-group info ">
                                    <label class="control-label span4">账户名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="user1" name="accountName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;建立生产商管理用户，账户名唯一，可唯一识别身份</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">用户密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd3" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请输入小于6位密码，并保管好密码</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">确认密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd4" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请输入小于6位密码，同上，并保管好密码</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">联系电话:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="cellnumber1" name="mobilePhone"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的电话号码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;正确的联系的方式，方便及时通知信息</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">真实姓名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="realname1" name="realName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请填写真实姓名">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写真实姓名，建议不超过四个字</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label">角色类型</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel1" name="roleId" placeholder="请选择角色种类"
                                                    aria-describedby="basic-addon1">
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="2"> 系统操作员</option>--%>
                                                <%--<option value="3" id="2">运营商管理员</option>--%>
                                                <%--<option value="4">运营商配货员</option>--%>
                                                <%--<option value="5">运营商仓库员</option>--%>

                                                <%--<option value="7">生产商操作员</option>--%>
                                                <option value="8">出租商管理员</option>
                                                <option value="6">生产商管理员</option>
                                                <%--<option value="9">出租商操作员</option>--%>
                                                <option value="10"> 贸易商管理员</option>
                                            </select>
                                        </div>
                                        <span class="help-inline">*1生产商管理员：负责管理生产商组织<br/> *2.出租商管理员：负责管理出租商组织 <br/> *3.贸易商管理员：负责负责管理贸易商组织，非生产商<br/></span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">用户邮箱:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="Email1" name="email"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效邮箱，方便找回密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;填写邮箱，可有效管理账户密码，方便找回密码</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">QQ账号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="QQ1" name="qq"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效QQ号码，方便联系">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;QQ号码，方便信息交流，建议填写</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">邮政编码:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="code1" name="postcode"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6位有效邮编">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;邮政编码 如：3897790</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">身份证号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="card1" name="idcard"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写有效身份证号信息</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">家庭住址:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="adress1" name="postAdress"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;用户地址，建议不超过50个字，方便收寄货品</span>
                                    </div>
                                </div>
                                <%--=============================5.30填入生产商表内容============================--%>
                                <div class="alert alert-error">
                                    <button class="close" data-dismiss="alert">×</button>
                                    <strong>生产商信息表 </strong> 1生产商角色概述：************** 2：生产商职责：*********
                                    3：生产商权限：********** 4 ：生产商工作范围：***********
                                </div>
                                <%--<div class="alert alert-error alert-block">--%>
                                <%--<a class="close" data-miss="alert" href="">×</a>--%>
                                <%--<h4 class="alert-heading">生产商信息表</h4>--%>
                                <%--1生产商角色概述：************** 2：生产商职责：********* 3：生产商权限：********** 4 ：生产商工作范围：*********** --%>
                                <%--</div>--%>
                                <div class="control-group info">
                                    <label class="control-label span4">生产商名称:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="factoryname" name="factoryName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;生产商角色直接填写名称，贸易商角色请填写上一级生产商的名称，方便管理</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label">生产商类型</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel2" name="factoryType"
                                                    placeholder="请选择生产商类型" aria-describedby="basic-addon1">
                                                <option value="生产商" id="0">生产商</option>
                                                <option value="贸易商" id="1">贸易商</option>
                                            </select>
                                        </div>
                                        <span class="help-inline">*如果您是专门的生产商，请选择生产商。<br>如果您是贸易商，不负责生产，请选择贸易商</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">&emsp;&emsp;&emsp;&emsp;&emsp;生产商logo路径:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="factorylogopath" name="factoryLogoPath"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输路径/static/images/****.jpg...">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;体现公司形象的logo，提升公司文化素养</span>
                                    </div>
                                </div>
                                <div class="control-group info ">
                                    <label class="control-label span4">服务费返回率:</label>
                                    <div class="controls">
                                        <div class="input-append">
                                            <input type="text" placeholder="" id="sfeereturnrate" name="sfeeReturnRate"
                                                   data-title=""
                                                   class="span3 tip"
                                                   data-original-title="请输入小数位">
                                            <span class="add-on">百分率</span></div>
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写小数位，如：0.10,0.20等有效位数</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">非现金返回率:</label>
                                    <div class="controls">
                                        <div class="input-append">
                                            <input type="text" placeholder="" id="qrreturnrate" name="qrReturnRate"
                                                   data-title=""
                                                   class="span3 tip"
                                                   data-original-title="请输入小数位">
                                            <span class="add-on">百分率</span></div>
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写小数位，如：0.10,0.20等有效位数</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label">接受公司账号</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel3" name="receiveAccount"
                                                    placeholder="是,否" aria-describedby="basic-addon1">
                                                <option value="接受">接受</option>
                                                <option value="不接受">不接受</option>
                                            </select>
                                        </div>
                                        <span class="help-inline">*建议选择接受公司账号，方便收集款项</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">开户行:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="openbankname" name="openBankName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效银行">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;*选填请选择正确国内银行，填写全称，如中国建设银行，方便后期核实</span>
                                    </div>
                                </div>
                                <div class="control-group info">
                                    <label class="control-label span4">开户名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="openaccountname" name="openAccountName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效银行卡信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;*选填银行卡有效帮助您收取定向款，也方便您收款</span>
                                    </div>
                                </div>
                                <label class="control-label center"></label>
                                <div class="controls">
                                    <%--<button type="reset" class="btn btn-danger" >重置</button>--%>
                                    <input type="button" class="btn btn-success" id="reg" onclick="webRes();"
                                           value="提交创建生产商用户"/>

                                </div>
                            </form>

                        </div>
                    </div>
                    <div id="tab3" class="tab-pane">
                        <div class="alert alert-error">
                            <button class="close" data-dismiss="alert">×</button>
                            <strong>新建系统用户 </strong> 1：系统用户概述：************** 2：系统用户职责：********* 3：系统用户权限：********** 4
                            ：系统用户工作范围：***********
                        </div>
                        <%--<div class="alert alert-error alert-block">--%>
                        <%--<a class="close" data-miss="alert" href="">×</a>--%>
                        <%--<h4 class="alert-heading">新建系统用户</h4>--%>
                        <%--1：系统用户概述：************** 2：系统用户职责：********* 3：系统用户权限：********** 4 ：系统用户工作范围：*********** </div>--%>
                        <div id="web_sysreg">
                            <form name="regform" id="sysresUser" class="form-horizontal"
                                  action=""
                                  accept-charset="utf-8"
                                  method="post">
                                <div class="control-group warning ">
                                    <label class="control-label span4">账户名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="user2" name="accountName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;建立系统管理用户，账户名唯一，可唯一识别身份</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">用户密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd5" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请输入小于6位密码，并保管好密码</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">确认密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd6" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请输入小于6位密码，同上，并保管好密码</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">联系电话:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="cellnumber2" name="mobilePhone"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的电话号码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;正确的联系的方式，方便及时通知信息</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">真实姓名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="realname2" name="realName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写真实姓名，建议不超过四个字</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label">角色类型</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel5" name="roleId" placeholder="请选择角色种类"
                                                    aria-describedby="basic-addon1">
                                                <option value="1" id="00"> 系统管理员A</option>
                                                <option value="1" id="001"> 系统管理员B</option>
                                                <%--<option value="2"> 系统操作员</option>--%>
                                                <%--<option value="3" id="2">运营商管理员</option>--%>
                                                <%--<option value="4">运营商配货员</option>--%>
                                                <%--<option value="5">运营商仓库员</option>--%>
                                                <%--<option value="6" id="3">生产商管理员</option>--%>
                                                <%--<option value="7">生产商操作员</option>--%>
                                                <%--<option value="8" id="4">出租商管理员</option>--%>
                                                <%--<option value="9">出租商操作员</option>--%>
                                                <%--<option value="10" id="5"> 贸易商管理员</option>--%>
                                            </select>
                                        </div>
                                        <span class="help-inline">*1系统管理员管理员A：负责整个系统维护和管理<br/> *2.系统管理员管理员A：辅助管理整个系统</span>

                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">用户邮箱:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="Email2" name="email"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效邮箱，方便找回密码">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;填写邮箱，可有效管理账户密码，方便找回密码</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">QQ账号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="QQ2" name="qq"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效QQ号码，方便联系">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;QQ号码，方便信息交流，建议填写</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">邮政编码:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="code2" name="postcode"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6位有效邮编">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;邮政编码 如：100100</span>

                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">身份证号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="card2" name="idcard"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;请填写有效身份证号信息</span>
                                    </div>
                                </div>
                                <div class="control-group warning">
                                    <label class="control-label span4">家庭住址:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="adress2" name="postAdress"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                        <span class="help-inline">&emsp;&emsp;&emsp;&emsp;&emsp;用户地址，建议不超过50个字，方便收寄货品</span>
                                    </div>
                                </div>

                                <label class="control-label center"></label>
                                <div class="controls">
                                    <%--<button type="reset" class="btn btn-danger" >重置</button>--%>
                                    <input type="button" class="btn btn-success" id="reg" onclick="webSysreg();"
                                           value="申请创建系统用户"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
            <!-- span12-->
        </div>

    </div>

</div>
</div>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>
<!--end-javascript-part-->
</body>

</html>
